function [sigma] = inversegamma ( N , a ) 
				# inversegamma ( N , a )
				# creates a sample from 1/s^N exp( - a/(s^2) )

  beta = dgamma ( 0.5*(N-3.0) , a ) ;
  sigma = sqrt ( 1.0 / beta ) ; 

endfunction
