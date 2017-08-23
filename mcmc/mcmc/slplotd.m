# d is same as slplot except that the points are shown with their vertical coord
iranges ;

if ( r >= 1 ) 
  pcommand = sprintf (" gplot y u 1:2 t 'P*(x)' w l 1 1,  xQs u 1:7 t '' w p 5 3") ;
else
  pcommand = sprintf (" gplot y u 1:2 t 'P*(x)' w l 1 1" ) ; 
endif


 if (printing) 
	gset title '' ;
  pscommand = sprintf (" gplot y u 1:2 t 'P*(x)' w l 1 1" ) ; 
	printingoption
 endif
# now back to X

if ( r >= 1 ) 
	tcommand = sprintf ("gset title \"%d samples\"", r);
    	eval (tcommand);
endif
eval (pcommand);
