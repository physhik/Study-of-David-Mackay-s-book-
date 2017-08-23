function Q =  Qnorm( x , mu , sigma , h ) 
# a normal density with peak height h ;
	Q = h * exp( - (x.-mu).**2 ./ ( 2.0 * sigma**2 )) ; 
endfunction 
