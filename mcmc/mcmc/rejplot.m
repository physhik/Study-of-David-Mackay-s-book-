rejranges ;
if ( r >= 1 ) 
	command = sprintf ("gset title \"%d samples, %d accepted\"", r,a);
    	eval (command);
endif
if ( rej>= 1 && a >= 1 ) 
	gplot y u 1:2 t 'P*(x)' w l 1 1, xQ u 1:2 t 'cQ*(x)' w l 4 4, xQa u 1:3 t '' w p 5 3, xQr u 1:3 t 'rejected' w p 3 4 , xQa u 1:7 t 'accepted' w p 5 3;
elseif ( rej >= 1 ) # no accepts
	gplot y u 1:2 t 'P*(x)' w l 1 1, xQ u 1:2 t 'cQ*(x)' w l 4 4, xQr u 1:3 t 'rejected' w p 3 4 ;

elseif ( a >= 1 ) 
	gplot y u 1:2 t 'P*(x)' w l 1 1, xQ u 1:2 t 'cQ*(x)' w l 4 4, xQa u 1:3 t '' w p 5 3, xQa u 1:7 t 'accepted' w p 5 3;

else
	print "starting rejplot..." ;
endif
