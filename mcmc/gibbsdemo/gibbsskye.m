function [mu,sigma] = gibbs ( mu, sigma , L , xbar , v , N ) 
				# gibbs ( w , L )
				# runs gibbs sampling for mu,sigma
				#                       for a number of loops L
				#
				# the posterior distribution is
				# P(m,s|{x}) = P(m,s) *
				# \frac{1}{s^N} e^{-N( (xbar-m)^2+v )/(2*s*s)}
				# where v = 1/N sum (x-xbar)^2
				# and P(m,s) = 1/s (improper)

  global wl ;      # weight vector w logged into this matrix
  global wlt ;  # logs w along trajectories 
  global wltlog ;  # whether to log
  global ltt ; # log trajectory count time
  global verbose ; 
  global T   logtime ;
  global zz ;
  global doplot ; 

  gset noclip points
  sN = sqrt(N) ; 
				# log initial condn
  if ( 1 )
    wl(logtime,:) = [mu,sigma,-0.5,T] ; 
    logtime ++ ;
  endif
  if ( wltlog ) 
    wlt( ltt,: ) = [ mu , sigma , -0.5,ltt ] ;
    ltt ++ ;
  endif
  for l = 1:L                  # loop L times
    if ( doplot ) 
      gsplot  zz w l 1,  wlt u 1:2:3 w p 8 4, wl u 1:2:3 w p 3 3, wlt u 1:2:3 w l 7 7
      ans = input "ready?" ;
      if ( ans == 0 )
	doplot = 0 ;
      endif
    endif
				# sample step 1    
    mu = xbar + randn ( ) * sigma / sN ; # sample mu from gaussian
    if ( wltlog ) 
      wlt( ltt,: ) = [ mu , sigma ,-0.5, ltt ] ;
      ltt ++ ;
    endif
    if ( doplot ) 
      gsplot  zz w l 1,  wlt u 1:2:3 w p 8 4, wl u 1:2:3 w p 3 3, wlt u 1:2:3 w l 7 7
      ans = input "ready? (0 to skip to the end)" ;
      if ( ans == 0 )
	doplot = 0 ;
      endif
    endif
				# sample step 2
    sigma = inversegamma ( N+1 , 0.5*N*(( mu-xbar)**2 + v) ) ; # sample from inverse gamma
    if ( wltlog ) 
      wlt( ltt,: ) = [ mu , sigma , -0.5, ltt ] ;
      ltt ++ ;
    endif
				# keep log of w 
    T ++ ;
    if ( 1 )
      wl(logtime,:) = [mu,sigma,-0.5,T] ; 
      logtime ++ ;
    endif
    if ( verbose ) 
      [mu, sigma]
    endif	

  endfor

endfunction

