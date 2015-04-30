var a;
var b;
var c;
var d;
var e;
var f;
var g;
var h;

subject to

cons1:  -e*g - 2*d*h = 0;
cons2:  9*e + 4*b = 0;
cons3:  -4*c*h - 2*e*f - 3*d*g = 0;
cons4:  -7*c + 9*a - 8*f = 0;
cons5:  -4*d*f - 5*c*g - 6*h - 3*e = 0;
cons6:  -5*d - 6*c*f - 7*g + 9*b = 0;
cons7:  9*d + 6*a - 5*b = 0;
cons8:  9*c - 7*a + 8 = 0;

solve;
display a, b, c, d, e, f, g, h;

# TITLE : small system from constructive Galois theory, called s9_1

# ROOT COUNTS :

# total degree : 16

# 2-homogeneous Bezout number : 10
#    with partition : {e d b c a }{g h f }

# mixed volume : 10

# REFERENCES :

# Raphael Nauheim:
#  "Systems of Algebraic Equations with Bad Reduction",
# Universitaet Heidelberg, Interdisziplinaeres Zentrum
# fuer wissenschaftliches Rechnen, Preprint 95-46, Dezember 1995.

# There are four real and six complex conjugated solutions.

# THE SOLUTIONS :

# 10 8
# ===========================================================
# solution 1 :
# t :  1.00000000000000E+00   0.00000000000000E+00
# m : 1
# the solution for t :
#  e :  1.51053285357998E+00   1.80139017713210E+00
#  g :  2.33683608531618E+00   1.53846965064388E-01
#  d : -3.21601607265565E+00   5.81267061547841E-01
#  h :  3.68839339468626E-01   7.57261884400351E-01
#  b : -3.39869892055495E+00  -4.05312789854722E+00
#  c :  6.60269451071902E-01  -3.30517224679012E+00
#  f :  1.66301111489823E+00  -1.88866985530864E+00
#  a :  1.99177500852102E+00  -4.24950717444445E+00
# == err :  6.233E-15 = rco :  1.184E-02 = res :  1.899E-14 ==
# solution 2 :
# t :  1.00000000000000E+00   0.00000000000000E+00
# m : 1
# the solution for t :
#  e : -6.87611772125171E-01  -1.06910588403688E-50
#  g :  2.02970578781795E+00   1.87093529706454E-50
#  d :  6.61372486000091E-01   1.33638235504610E-50
#  h :  1.05511615859238E+00   5.34552942018439E-51
#  b :  1.54712648728164E+00   1.87093529706454E-50
#  c : -6.57722954873121E-01  -2.67276471009220E-51
#  f :  9.09872597215360E-01  -2.33866912133067E-51
#  a :  2.97213343734559E-01  -4.00914706513829E-51
# == err :  4.818E-15 = rco :  2.538E-02 = res :  1.776E-15 ==
# solution 3 :
# t :  1.00000000000000E+00   0.00000000000000E+00
# m : 1
# the solution for t :
#  e :  1.51053285357998E+00  -1.80139017713210E+00
#  g :  2.33683608531618E+00  -1.53846965064389E-01
#  d : -3.21601607265565E+00  -5.81267061547840E-01
#  h :  3.68839339468626E-01  -7.57261884400351E-01
#  b : -3.39869892055495E+00   4.05312789854722E+00
#  c :  6.60269451071902E-01   3.30517224679012E+00
#  f :  1.66301111489823E+00   1.88866985530864E+00
#  a :  1.99177500852102E+00   4.24950717444445E+00
# == err :  5.760E-15 = rco :  1.184E-02 = res :  1.432E-14 ==
# solution 4 :
# t :  1.00000000000000E+00   0.00000000000000E+00
# m : 1
# the solution for t :
#  e :  1.16422080143523E-01  -1.92195753383132E-01
#  g :  2.63662396247879E-01   5.56482066322579E-02
#  d :  1.57730288928362E-01   6.27553637263924E-01
#  h :  2.53243613191786E-02   3.93434985858779E-02
#  b : -2.61949680322927E-01   4.32440445112047E-01
#  c : -1.24268975951462E+00  -4.51860436457511E-01
#  f :  5.75605851705934E-01  -2.58205963690006E-01
#  a : -4.54886833661648E-01  -5.80963418302514E-01
# == err :  4.814E-15 = rco :  3.274E-03 = res :  9.037E-16 ==
# solution 5 :
# t :  1.00000000000000E+00   0.00000000000000E+00
# m : 1
# the solution for t :
#  e : -1.91397791595386E-01  -3.73380916671669E-60
#  g :  2.37577797622942E-02  -1.28349690105886E-60
#  d :  1.14629961437537E+00   1.24460305557223E-59
#  h :  1.98341974588837E-03  -4.66726145839586E-61
#  b :  4.30645031089619E-01   8.71222138900560E-60
#  c : -1.94711665958355E+00  -8.71222138900560E-60
#  f :  1.73076194523685E-01  -3.42265840282363E-60
#  a : -1.36057856232171E+00  -1.12014275001501E-59
# == err :  1.950E-15 = rco :  2.785E-03 = res :  3.553E-15 ==
# solution 6 :
# t :  1.00000000000000E+00   0.00000000000000E+00
# m : 1
# the solution for t :
#  e : -4.15425076903867E-01  -7.96941863871104E-01
#  g :  1.49599564821986E+00   1.08183777510683E+00
#  d : -4.34678314642327E-01   3.77392003632451E-01
#  h :  1.09268365680768E+00  -9.39664948170555E-01
#  b :  9.34706423033702E-01   1.79311919370998E+00
#  c :  2.24064048678632E-01   7.21916213907501E-01
#  f :  1.41375088495922E+00   4.12523550804286E-01
#  a :  1.43093949115824E+00   9.28177989309645E-01
# == err :  4.605E-15 = rco :  2.242E-02 = res :  1.986E-15 ==
# solution 7 :
# t :  1.00000000000000E+00   0.00000000000000E+00
# m : 1
# the solution for t :
#  e : -4.15425076903867E-01   7.96941863871104E-01
#  g :  1.49599564821986E+00  -1.08183777510683E+00
#  d : -4.34678314642327E-01  -3.77392003632451E-01
#  h :  1.09268365680768E+00   9.39664948170555E-01
#  b :  9.34706423033702E-01  -1.79311919370998E+00
#  c :  2.24064048678632E-01  -7.21916213907501E-01
#  f :  1.41375088495922E+00  -4.12523550804286E-01
#  a :  1.43093949115824E+00  -9.28177989309644E-01
# == err :  5.569E-15 = rco :  2.242E-02 = res :  2.512E-15 ==
# solution 8 :
# t :  1.00000000000000E+00   0.00000000000000E+00
# m : 1
# the solution for t :
#  e :  2.19606992938435E-01  -5.09789411562385E-56
#  g :  1.05762750111393E-01   5.60768352718623E-56
#  d : -1.80601046493377E-01   2.44698917549945E-55
#  h :  6.43026160917456E-02   2.80384176359312E-56
#  b : -4.94115734111479E-01   1.22349458774972E-55
#  c : -9.98447866015167E-01  -2.14111552856202E-55
#  f :  7.15172647991333E-01  -1.12153670543725E-55
#  a : -1.40861542019500E-01  -2.85482070474935E-55
# == err :  5.974E-16 = rco :  2.837E-03 = res :  8.882E-16 ==
# solution 9 :
# t :  1.00000000000000E+00   0.00000000000000E+00
# m : 1
# the solution for t :
#  e : -2.66666666666667E+00   2.45980994751297E-60
#  g :  1.71423733988431E-17  -2.60728974609933E-58
#  d :  1.71423733988431E-17  -2.94321567845557E-60
#  h :  1.33333333333333E+00   6.56554882968095E-58
#  b :  6.00000000000000E+00  -5.53457238190418E-60
#  c :  3.00000000000000E+00  -7.96545955566226E-59
#  f :  3.00000000000000E+00   7.96545955566226E-59
#  a :  5.00000000000000E+00  -1.97320133903454E-61
# == err :  3.536E-15 = rco :  1.716E-02 = res :  2.057E-16 ==
# solution 10 :
# t :  1.00000000000000E+00   0.00000000000000E+00
# m : 1
# the solution for t :
#  e :  1.16422080143523E-01   1.92195753383132E-01
#  g :  2.63662396247879E-01  -5.56482066322579E-02
#  d :  1.57730288928362E-01  -6.27553637263924E-01
#  h :  2.53243613191786E-02  -3.93434985858779E-02
#  b : -2.61949680322927E-01  -4.32440445112047E-01
#  c : -1.24268975951462E+00   4.51860436457511E-01
#  f :  5.75605851705934E-01   2.58205963690006E-01
#  a : -4.54886833661648E-01   5.80963418302514E-01
# == err :  4.767E-15 = rco :  3.274E-03 = res :  1.831E-15 ==
