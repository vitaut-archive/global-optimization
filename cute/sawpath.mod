# AMPL Model by Hande Y. Benson
#
# Copyright (C) 2001 Princeton University
# All Rights Reserved
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby
# granted, provided that the above copyright notice appear in all
# copies and that the copyright notice and this
# permission notice appear in all supporting documentation.                     

#   Source:
#   Francois Grondin (francois.grondin@qc.forintek.ca)
#   Forintek Canada Corp, 319, rue Franquet, Quebec, G1P 4R4, CANADA

#   SIF input: Nick Gould, Dec 1997.

#   classification QOR2-AN-583-774

param n := 195;
param R := 2500;

param x{0..n};
param y{0..n};

param dx := x[15]-x[0];
param dy := y[15]-y[0];
param m_0:= dy/dx;

param m := 4;

var a{0..m};
var p{0..n};
var pprime{0..n};
var pprime2{0..n};

minimize f:
	sum {j in 0..n} (p[j]-y[j])^2;
subject to cons1{j in 0..n}:
	sum {i in 0..m} (a[i]*x[j]^i)-p[j] = 0;
subject to cons2{j in 0..n}:
	sum {i in 1..m} (a[i]*i*x[j]^(i-1))-pprime[j] = 0;
subject to cons3{j in 0..n}:
	sum {i in 2..m} (a[i]*i*(i-1)*x[j]^(i-2))-pprime2[j] = 0;
subject to cons4{j in 0..n}:
	R^2*pprime2[j]^2-(1+pprime[j]^2)^3 <= 0;
subject to cons5:
	p[0] = y[0];
subject to cons6:
	pprime[0] = m_0;
data;

param :
		x		y:=
0		0.0		3.556					
1		2.54		3.56346				
2		5.08		3.57091		
3		7.62001		3.57837				
4		10.1612		3.59371				
5		12.7012		3.60213		
6		15.2412		3.61055				
7		17.7812		3.61898				
8		20.3212		3.6274					
9		22.8612		3.63582				
10		25.4012		3.6423
11		27.9412		3.65073
12		30.4812		3.6653
13		33.0212		3.67381
14		35.5612		3.68233
15		38.1012		3.69084
16		40.6411		3.50637
17		43.1811		3.51498
18		45.7231		2.77481
19		48.2631		2.78376
20		50.8031		2.79272
21		53.3431		2.80168					
22		55.8839		2.78529
23		58.4239		2.79415
24		60.965		2.47602
25		63.505		2.48617				
26		66.045		2.48369
27		68.585		2.49377
28		71.125		2.27635				
29		73.665		2.28521				
30		76.205		2.26744		
31		78.745		2.27605				
32		81.285		2.28465				
33		83.825		2.29325		
34		86.365		2.4907					
35		88.905		2.49921				
36		91.445		2.50773				
37		93.985		2.51624				
38		96.525		2.53381
39		99.065		2.54241
40		101.605		2.74855
41		104.145		2.75716
42		106.685		2.76576
43		109.225		2.77437
44		111.766		2.60758
45		114.306		2.6161		
46		116.847		2.26008
47		119.387		2.2686		
48		121.927		2.28695
49		124.467		2.29556					
50		127.008		1.47808
51		129.548		1.4854		
52		132.09		1.1101		
53		134.63		1.1188					
54		137.17		1.12749
55		139.71		1.13619
56		142.251		0.978377		
57		144.791		0.987075		
58		147.33		0.82203		
59		149.87		0.829676		
60		152.41		0.837322		
61		154.95		0.844885
62		157.49		0.852781		
63		160.03		0.86051				
64		162.571		0.538377		
65		165.111		0.546996		
66		167.651		0.600516
67		170.191		0.609224
68		172.731		0.789128
69		175.271		0.798084
70		177.811		1.00996
71		180.351		1.01883
72		182.891		1.03712
73		185.431		1.04591
74		187.972		0.720837
75		190.512		0.699625
76		193.052		0.708414
77		195.592		0.717203				
78		198.133		0.609086
79		200.673		0.617627
80		203.213		0.199369
81		205.753		0.207992		
82		208.293		0.225288
83		210.833		0.233831
84		213.374		-0.172432
85		215.914		-0.163889
86		218.456		-0.34889
87		220.996		-0.341233
88		223.536		-0.333576
89		226.076		-0.32592
90		228.616		-0.522016
91		231.156		-0.514426
92		233.696		-0.506837
93		236.236		-0.499248
94		238.776		-0.491658
95		241.316		-0.484069
96		243.856		-0.47648
97		246.396		-0.46889
98		248.936		-0.462453
99		251.476		-0.455008
100		254.016		-0.447563
101		256.556		-0.440118
102		259.095		0.055237
103		261.635		0.063873
104		264.176		0.062826
105		266.716		0.070575				
106		269.256		-0.275144
107		271.797		-0.275842
108		274.337		-0.268089
109		276.877		-0.260335
110		279.417		-0.118406
111		281.957		-0.110665
112		284.497		-0.102923
113		287.037		-0.095181
114		289.577		0.103362
115		292.117		0.111028		
116		294.657		0.131239		
117		297.197		0.138981
118		299.736		0.27243				
119		302.276		0.280024		
120		304.815		0.421614		
121		307.355		0.429144		
122		309.895		0.436674		
123		312.435		0.444203		
124		314.976		0.484027
125		317.516		0.491804
126		320.056		0.515482		
127		322.598		0.571256		
128		325.138		0.580224		
129		327.678		0.589193		
130		330.215		1.11182		
131		332.755		1.12071		
132		335.295		1.34551		
133		337.835		1.35448					
134		340.375		1.38382				
135		342.915		1.39287				
136		345.454		1.77298				
137		347.994		1.78202				
138		350.534		2.00633				
139		353.074		2.01544				
140		355.615		2.41293				
141		358.155		2.42093				
142		360.695		2.39029		
143		363.235		2.39823				
144		365.773		2.89123				
145		368.313		2.89911		
146		370.853		3.33714				
147		373.393		3.34509				
148		375.933		3.40441				
149		378.473		3.41248				
150		381.012		3.70271				
151		383.552		3.71094				
152		386.09		4.15353		
153		388.632		4.12735		
154		391.17		4.56011				
155		393.71		4.56923				
156		396.25		4.77252				
157		398.79		4.78163				
158		401.329		4.89149		
159		403.869		4.89935		
160		406.41		4.96478		
161		408.95		4.97272					
162		411.49		5.16767				
163		414.03		5.17553				
164		416.57		5.38577				
165		419.11		5.39364				
166		421.65		5.40151				
167		424.19		5.40937				
168		426.729		5.28358				
169		429.269		5.29136				
170		431.81		5.14203		
171		434.35		5.14865				
172		436.891		4.80067				
173		439.431		4.80729		
174		441.972		4.86169				
175		444.512		4.86947				
176		447.052		4.56159				
177		449.592		4.56937				
178		452.134		3.78824				
179		454.674		3.79602				
180		457.214		3.8038				
181		459.754		3.81158		
182		462.295		3.66534				
183		464.835		3.67306				
184		467.375		3.67665				
185		469.915		3.6845					
186		472.455		3.6904				
187		474.995		3.69832		
188		477.535		3.70624		
189		480.075		3.71416					
190		482.616		3.50154				
191		485.156		3.50963				
192		487.696		3.51772  
193		490.236 	3.52581  
194		492.776 	3.5339   
195		495.316 	3.54199;

solve;
display f;
#display p, pprime, pprime2, a;
