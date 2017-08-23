metranges ;
if ( r >= 1 ) 
	command = sprintf ("gset title \"%d samples\"", r);
    	eval (command);
endif

if(rejected)
#	command = sprintf ("gset title \"%d samples, move rejected\"", r);
# if (arrowset)
#	gset noarrow 1
# endif
else
#	command = sprintf ("gset title \"%d samples, move accepted\"", r);
endif
# eval (command);
x1 = [xt,botline; xt,topline];
p1p2 = [ xt , pt ] ;
gplot y u 1:2 t 'P*(x)' w l 1 1, xQs u 1:5 t '' w p 5 3 , x1 t '' w l 7 2, p1p2 t '' w p 3 6 ;
# gplot y u 1:2 t 'P*(x)' w l 1 1, xQ u 1:2 t 'Q*(x)' w l 4 4 , xQs u 1:5 t '' w p 5 3 , x1 t '' w l 7 2, p1p2 t '' w p 3 6 ;
if (rejected==0)
#	if (arrowset)
#		gset noarrow 1
#	endif
	if ( pausing && chatty )
		 input("move accepted");
	endif
else
	if ( pausing && chatty )
		 input("move rejected");
	endif
endif
