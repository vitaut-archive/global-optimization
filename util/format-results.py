#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
import os, re, sys, yaml
import pandas as pd
from util import AMPL

repo_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

def load_index(*args):
  index = {}
  for dirname in args:
    index.update(yaml.load(open(os.path.join(repo_dir, dirname, 'index.yaml'))))
  for k, v in index.iteritems():
    # Convert values such as 1e-8 to float since YAML doesn't do it.
    v['best_obj'] = float(v['best_obj'])
  return index

index = load_index('cute', 'jdp', 'nlmodels')

def model_name(result):
  "Extracts the model name from a benchmark result."
  return os.path.splitext(os.path.split(result['model'])[1])[0]

def printed_model_name(result):
  "Returns model name with '*' if it is a maximization problem."
  name = model_name(result)
  if result['obj_kind'] == 'maximize':
    name += '*'
  return name

def max_con_violation(result):
  m = re.search(r'Maximum constraint violation (.+)', result['solve_message'])
  return m.group(1) if m else '-'

def num_func_evals(result):
  m = re.search(r'(\d+) function (and constraint )?evaluations',
                result['solve_message'])
  return int(m.group(1)) if m else 0

def check_obj(result, obj_tolerance):
  obj = result['obj']
  best_obj = index[model_name(result)]['best_obj']
  rel_error = abs(obj - best_obj) / (1 + abs(best_obj))
  solve_result = result['solve_result']
  solved = False
  if rel_error <= obj_tolerance:
    if solve_result.startswith('solved'):
      solved = True
    elif solve_result == 'limit' or solve_result == 'failure':
      # LGO returns solve_result = 'failure' on SIGINT so check if
      # max constraint violation is within tolerance.
      max_viol = max_con_violation(result)
      if max_viol == '-' or float(max_viol) <= 1e-8:
        solved = True
  return (solved, rel_error)

# Read the log and get the number of variables and constraints
# for each problem.
def read_log(filename):
  results = yaml.load(file(filename, 'r'))
  for result in results:
    print(result['model'])
    if not result['solve_message']:
      result['solve_message'] = ''
    # Convert values such as 1e-8 to float since YAML doesn't do it.
    result['obj'] = float(result['obj'])
    ampl_filename = os.path.join(repo_dir, result['model'])
    dirname, filename = os.path.split(ampl_filename)
    with AMPL(dirname) as ampl:
      ampl.eval('model {};'.format(ampl_filename))
      result['num_vars'] = ampl.eval_expr('_snvars')
      result['num_cons'] = ampl.eval_expr('_sncons')
      objname = ampl.eval_expr('_objname[1]')
      result['obj_kind'] = ampl.eval('show {};'.format(objname))[0][1].split()[0]
  return results

def write_header(file, authors, legend, columns):
  file.write(authors)
  file.write('\n\n')
  file.write('Legend\n')
  for c in columns:
    if legend[c]:
      file.write('{}  {}\n'.format(c , legend[c]))
  file.write('\n')

columns = ['MN', 'NV', 'NC', 'OV', 'OS', 'CV', 'FE', 'RT', ' ']

def write_results(file, results, obj_tolerance):
  df = pd.DataFrame({
    # Model Name
    'MN': [printed_model_name(r) for r in results],
    # Number of variables
    'NV': [r['num_vars'] for r in results],
    # Number of constraints
    'NC': [r['num_cons'] for r in results],
    # Best known objective value
    'OV': [index[model_name(r)]['best_obj'] for r in results],
    # Objective value returned by the solver
    'OS': [r['obj'] for r in results],
    # Maximal constraint violation
    'CV': [max_con_violation(r) for r in results],
    # Number of function evaluations
    'FE': [num_func_evals(r) for r in results],
    # Solver runtime
    'RT': [r['time'] for r in results],
    ' ':  [' ' if check_obj(r, obj_tolerance)[0] else '?' for r in results]
    }, columns=columns)
  for col in ['OV', 'OS']:
    df[col] = df[col].map('{:g}'.format)
  file.write(df.to_string())
  file.write('\n')

def write_summary(file, results, obj_tolerance):
  file.write('\nSummary of results\n')
  file.write('Number of test problems: {}\n'.format(len(results)))
  opmode = results[0]['solver_options']['opmode']
  total_time = 0
  normalized_func_evals = 0
  num_solved = 0
  total_rel_error = 0
  for r in results:
    total_time += r['time']
    if r['solver_options']['opmode'] != opmode:
      raise Exception('Inconsistent opmode')
    nvars = r['num_vars']
    ncons = r['num_cons']
    modc = (nvars + ncons) * (nvars + ncons + 1) / 2 + (nvars + ncons) + 1
    normalized_func_evals += num_func_evals(r) / modc
    solved, rel_error = check_obj(r, obj_tolerance)
    if solved:
        total_rel_error += rel_error
        num_solved += 1
  file.write('LGO operational mode: {}\n'.format(opmode))
  file.write('Relative error tolerance for successful solution: {}\n'.format(obj_tolerance))
  file.write('Number of successful solutions: {} of {}\n'.format(num_solved, len(results)))
  avg_rel_error = '{:.2}'.format(total_rel_error / num_solved) if num_solved != 0 else '-'
  file.write('Average relative error of solutions found: {}\n'.format(avg_rel_error))
  file.write('Average normalized number of function evaluations (FE/modc): {}\n'.
             format(normalized_func_evals / len(results)))
  file.write('where modc is the estimated model complexity\n')
  file.write('modc = (nvars + ncons) * (nvars + ncons + 1) / 2 + (nvars + ncons) + 1\n')
  file.write('Total LGO solver runtime (seconds): {:.2f}\n'.format(total_time))

legend = {
  'MN': 'Model Name',
  'NV': 'Number of variables',
  'NC': 'Number of constraints',
  'OV': 'Known optimal value (or best known objective value)',
  'OS': 'Numerical optimal value returned by the solver',
  'OV': 'Known optimal value (or best known objective value)',
  'CV': 'Maximal constraint violation',
  'FE': 'Number of model function and constraint evaluations',
  'RT': 'Solver runtime (complete execution time including input '
        'and license verification time)',
  ' ' : None
  }

for log_filename in sys.argv[1:]:
  print(log_filename)
  results = read_log(log_filename)
  output_filename = os.path.splitext(log_filename)[0] + '.txt'
  obj_tolerance = 0.0001
  with open(output_filename, 'w') as f:
    write_header(f, 'János D. Pintér and Victor Zverovich', legend, columns)
    write_results(f, results, obj_tolerance)
    write_summary(f, results, obj_tolerance)