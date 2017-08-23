# this shows  the P and the samples thus far, and a line erected
# at the current sample.
iranges ;
# telegraph pole
tele1 = [ xt , 0.0 ; xt , pt ] ;
if ( r>= 2 ) 
  pcommand = sprintf ("gplot y u 1:2 t 'P*(x)' w l 1 1,  xQs u 1:5 t '' w p 5 3 , tele1 t 'x(t)' w l 7 7" ) ;
else
  pcommand = sprintf ("gplot y u 1:2 t 'P*(x)' w l 1 1, tele1 t 'x(t)' w l 7 7" ) ;
endif

if (printing) 
	gset title '' ;
	# same but omit the points along the bottom
  pscommand = sprintf ("gplot y u 1:2 t 'P*(x)' w l 1 1, tele1 t 'x(t)' w l 7 7" ) ;
	printingoption
endif
# now back to X

if ( r >= 1 ) 
	tcommand = sprintf ("gset title \"%d samples\"", r);
    	eval (tcommand);
endif
eval (pcommand);

if ( pausing )
 input "sample uniformly...";
endif

tele2 = [ xt , u ] ;

 if ( r>= 2 ) 
  pcommand = sprintf ("gplot y u 1:2 t 'P*(x)' w l 1 1,  xQs u 1:5 t '' w p 5 3 , tele1 t 'x(t)' w l 7 7 , tele2 t ''  w linesp 3 3") ;
 else
  pcommand = sprintf ("gplot y u 1:2 t 'P*(x)' w l 1 1,  tele1 t 'x(t)' w l 7 7 , tele2 t ''  w linesp 3 3") ;
 endif

 if (printing) 
	gset title '' ;
	pscommand = sprintf ("gplot y u 1:2 t 'P*(x)' w l 1 1,  tele1 t 'x(t)' w l 7 7 , tele2 t ''  w linesp 4 4") ;
	printingoption
 endif
# now back to X

if ( r >= 1 ) # reuse the title command
    	eval (tcommand);
endif
eval (pcommand);

if ( 0 ) # show the perturbed centre point (what is this all about?)
 if ( pausing )
  input "perturb uniformly l/r...";
 endif
 tele2 = [ xt , u ; xprop , u ] ;
# this is just a replot! - but replot does not work
 if ( r>= 2 ) 
  gplot y u 1:2 t 'P*(x)' w l 1 1,  xQs u 1:5 t '' w p 5 3 , tele1 t 'x(t)' w l 7 7 , tele2 t ''  w linesp 3 3 ;
 else
  gplot y u 1:2 t 'P*(x)' w l 1 1,  tele1 t 'x(t)' w l 7 7 , tele2 t ''  w linesp 3 3 ;
 endif
endif

if ( pausing )
input "define interval of width w";
endif
# call slplotb now
