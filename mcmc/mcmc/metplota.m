metranges ;
if ( r >= 1 ) 
	command = sprintf ("gset title \"%d samples\"", r-1);
    	eval (command);
endif

x1 = [xt,botline; xt,topline];
x2 = [xprop,botline; xprop,topline];
p1p2 = [ xt , pt ] ;
if ( r >= 2 ) 
gplot y u 1:2 t 'P*(x)' w l 1 1, xQ u 1:2 t "Q*(x';x_t)" w l 4 4, xQs u 1:5 t '' w p 5 3 , x1 t '' w l 7 2, p1p2 t '' w p 3 6  ;
else
gplot y u 1:2 t 'P*(x)' w l 1 1, xQ u 1:2 t "Q*(x';x_t)" w l 4 4, x1 t '' w l 7 2, p1p2 t '' w p 3 6 ;
endif
if ( pausing ) 
	input("drawing sample... ");
endif
# show new sample, but not its P* yet
if ( r >= 2 ) 
gplot y u 1:2 t 'P*(x)' w l 1 1, xQ u 1:2 t "Q*(x';x_t)" w l 4 4 , xQs u 1:5 t '' w p 5 3, x1 t '' w l 7 2, x2 t '' w l 2 6, p1p2 t '' w p 3 6;
else
gplot y u 1:2 t 'P*(x)' w l 1 1, xQ u 1:2 t "Q*(x';x_t)" w l 4 4, x1 t '' w l 7 2, x2 t '' w l 2 6, p1p2 t '' w p 3 6 ;
endif

# command = sprintf ("gset arrow 1 from %6f,%6f to %6f,%6f",xprop,topline,xprop,botline);
# eval (command);
# arrowset=1;
if ( pausing ) 
  input "evaluating P*(x')" ; 
endif

p1p2 = [ xt , pt ; xprop , pprop ] ;
if ( r >= 2 ) 
gplot y u 1:2 t 'P*(x)' w l 1 1, xQ u 1:2 t "Q*(x';x_t)" w l 4 4 , xQs u 1:5 t '' w p 5 3, x1 t '' w l 7 2, x2 t '' w l 2, p1p2 t '' w p 3 6;
else
gplot y u 1:2 t 'P*(x)' w l 1 1, xQ u 1:2 t "Q*(x';x_t)" w l 4 4, p1p2 t '' w p 7 6 , x1 t '' w l 7 2, x2 t '' w l 2, p1p2 t '' w p 3 6;
endif

if ( pausing )
	input("considering...");
endif

