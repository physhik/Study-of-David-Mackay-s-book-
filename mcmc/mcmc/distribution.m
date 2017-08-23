# distribution.m
 x = [ -5:0.2:5 ]' ;
 y = [ x , pstar( x ) ] ; 
 gset xrange [-5:5] ; gset yrange [0:3.1] ;
 gset key
 gplot y u 1:2 t 'P*(x)' w imp 1 1 ;
 
