# loads in  wsu  ws1 ws03 ws3 and plots them
load -force ws1033
	gset key
	gset autos xy
	gset yrange [0.78:1.2];
gset title;
gset clip one;
gset logs x;
gset xrange [20:2000];
	 gplot wsu u 1:5 t 'uniform' w l 5 7 , ws1 u 1:5 t 'r=1' w l 6 7 , ws03 u 1:5 t 'r=1/3' w l 7 7 , ws3 u 1:5 t 'r=3' w l 8 7 ;
