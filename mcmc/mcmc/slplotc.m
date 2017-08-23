iranges ;
if ( r >= 2 ) 
  pcommand = sprintf ("gplot y u 1:2 t 'P*(x)' w l 1 1,  xQs u 1:5 t '' w p 5 3 , tele1 t 'x(t)' w l 7 7 , tele2 t '' w linesp 3 3 , tele3 t 'interval' w linesp 4 2 , tele4 t '' w p 5 6") ;
else
  pcommand = sprintf ("gplot y u 1:2 t 'P*(x)' w l 1 1, tele1 t 'x(t)' w l 7 7 , tele2 t '' w linesp 3 3 , tele3 t 'interval' w linesp 4 2 , tele4 t '' w p 5 6") ;
endif

#######################

 if (printing) 
	gset title '' ;
	pscommand = sprintf ("gplot y u 1:2 t 'P*(x)' w l 1 1,  tele1 t 'x(t)' w l 7 7 , tele2 t '' w linesp 4 4 , tele3 t 'interval' w linesp 1 1 , tele4 t '' w p 5 6") ;
	printingoption
 endif
# now back to X

if ( r >= 1 ) # reuse the title command
    	eval (tcommand);
endif
eval (pcommand);
