function [b] = sgamma ( a ) 
				# sgamma ( a )
				# creates a sample b from b^a exp( - b )
				# unfortunatelly I think the sgamma routine in ranlib
				# uses b^{a-1} exp(-b) as its definition. 
  seedcounter = randn() ; 
  n = 1 ;
  
  command = sprintf("/home/mackay/ansi/ranlib.C/test/tst %d %f %f" , n , a+1, seedcounter ); 
  b = system(command) ; # this is the string
  b = sscanf( b , "%f" , "C" ); # convert string to float 

endfunction
