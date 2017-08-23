# this shows only the P and the samples thus far.
iranges ;
if ( r >= 1 ) 
	command = sprintf ("gset title \"%d samples\"", r);
    	eval (command);
endif

gplot y u 1:2 t 'P*(x)' w l 1 1,  xQs u 1:5 t 'points' w p 5 3;
