# density.m
standard; 
 gplot y u 1:2 t 'P*(x)' w lines 1 1 ;
input "ready?" ; 
 gplot y u 1:2 t 'P*(x)' w lines 1 1 , xphi u 1:2 t 'phi(x)' w l 5 5 ;
