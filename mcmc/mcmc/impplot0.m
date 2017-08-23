gset origin 0.1,0.02
gset size 0.85,0.5
	iranges ;
	  if ( style == 1 ) 
		 gplot y u 1:2 t 'P*(x)' w lines 1 1 , xphi u 1:2 t 'phi(x)' w l 5 5  ;
	  else
		 gplot y u 1:2 t 'P*(x)' w lines 1 1 , xQ u 1:2 t 'Q*(x)' w l 4 4, xphi u 1:2 t 'phi(x)' w l 5 5;
	  endif
