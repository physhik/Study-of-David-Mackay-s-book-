function showdatafit(mu,sigma)

				# shows the data and the current
				# gaussian distbn
  global odata x xmin xmax x
  arrows = 1 ; 
  
  preparedatawindow
  if ( arrows )
    height0 =  gaussian(0,sigma) ;
    height1 =  gaussian(sigma,sigma) ;
    command = sprintf ( "gset arrow 1 from %f,0 to %f,%f nohead ls 3 ",mu,mu,height0 ) ;
    eval(command) ; 
    command = sprintf ( "gset arrow 2 from %f,%f to %f,%f nohead ls 3 ",mu-sigma,height1,mu+sigma,height1 ) ;
    eval(command) ; 
#    gset arrow 1 from mu,0 to mu,height0 ls 3 nohead
#    gset arrow 2 from mu-sigma,height1 to mu+sigma,height1 ls 3 nohead
  endif
  gau = [ x ; gaussian( (x-mu) , sigma ) ]' ; 
  gplot odata w p 5 3 , gau w l  3 
  if ( arrows )
    gset noarrow 1
    gset noarrow 2
  endif
  unsetdata

endfunction
