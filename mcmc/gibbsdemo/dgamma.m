function [b] = dgamma ( N , a ) 
				# dgamma ( N , a )
				# creates a sample from b^N exp( - a b )

  beta = sgamma ( N ) ;
  b =  beta / a ; 

endfunction
