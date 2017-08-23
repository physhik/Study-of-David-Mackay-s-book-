				# New in Thu 21/2/02
				# multiplot!
gset multiplot
###############################
gset origin 0.1,0.02
gset size 0.85,0.5
iranges ;
	  if ( style == 1 ) 
	    gplot y u 1:2 t 'P*(x)' w lines 1 1 , xphi u 1:2 t 'phi(x)' w l 5 5 , xQs u 1:3 t '' w p 3 3 ;
	  else
	    gplot y u 1:2 t 'P*(x)' w lines 1 1 , xphi u 1:2 t 'phi(x)' w l 5 5 , xQs u 1:3 t '' w p 3 3, xQ u 1:2 t 'Q*(x)' w l 4 4 ;
	  endif
####################
	  iranges ;
gset origin 0.1,0.6
gset size 0.85,0.34
gset label 111 'number of samples' at screen 0.95,0.6275 right
	  if ( style == 1 ) 
		if ( r >= 1 ) 
			command = sprintf ("gset title \"%d uniform samples\"", r);
		    	eval (command);
		endif
	  else
		if ( r >= 1 ) 
			command = sprintf ("gset title \"%d samples\"", r);
		    	eval (command);
		endif
	  endif
				# No TITLE
	  gset title ""

	  command = sprintf("gset xrange [0:%d]", R ) ;  eval (command);
	  command = sprintf("gset yrange [0:]" ) ;  eval (command);
gset noxzeroaxis
gplot  ws u 1:5 t 'estimate of <phi>' w l 7 7 
gset xzeroaxis
###############################
gset nomultiplot

gset nolabel 111

#		 gplot y u 1:2 t 'P*(x)' w lines 1 1 , xphi u 1:2 t 'phi(x)' w l 5 5 , xQs u 1:3 t '' w p 3 3 , ws u 2:5 t 'estimate' w l 7 7 ;
	

#		 gplot y u 1:2 t 'P*(x)' w lines 1 1 , xphi u 1:2 t 'phi(x)' w l 5 5 , xQs u 1:3 t '' w p 3 3, xQ u 1:2 t 'Q*(x)' w l 4 4, ws u 2:5 t 'estimate' w l 7 7 ;
