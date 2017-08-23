function p = pstar ( x ) 
#  a desired density
global func
	if ( func == 0 ) 
	 	p  = exp ( 0.4*((x.-0.4).**2) - (0.08*(x.**4)) ) ; 
	else
		p = exp( 1.15*sin(6.0*x) - 0.3*((x.-0.65).**2) - (0.01*(x.**4)) );
endif
endfunction