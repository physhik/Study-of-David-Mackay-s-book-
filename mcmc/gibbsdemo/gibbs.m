function [mu,sigma] = gibbs ( mu, sigma , L , xbar , v , hyperalpha,hyperbeta,hyperbeta2, N , hypers ) 
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
  global doplot  logsy xmin xmax smin smax x ;
  pausing = 1 ;


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
      gset multiplot
      if ( pausing )
	gibbsplot
      endif
      showdatafit(mu,sigma)
      gset nomultiplot
      if ( pausing ) 
	ans = input "ready? (0 - skip to end; 1 - stop pausing)" ;
	if ( ans == 0 )
	  doplot = 0 ;
	endif
	if ( ans == 1 )
	  pausing = 0 ;
	endif
      endif
    endif
				# sample step 1    : update mu given sigma
    if ( !hypers )  
      mu = xbar + randn ( ) * sigma / sN ; # sample mu from gaussian
    else
      betaN = N/sigma.**2 ;
      lambda = betaN / ( hyperalpha + betaN ) ;
      postsigma = 1.0 / sqrt( hyperalpha + betaN ) ;
      mu = lambda * xbar + randn ( ) * postsigma ; # sample mu from gaussian
    end
    if ( wltlog ) 
      wlt( ltt,: ) = [ mu , sigma ,-0.5, ltt ] ;
      ltt ++ ;
    endif
    if ( doplot ) 
      gset multiplot
      if ( pausing )
	gibbsplot
      endif
      showdatafit(mu,sigma)
      gset nomultiplot
      if ( pausing ) 
	ans = input "ready? (0 - skip to end; 1 - stop pausing)" ;
	if ( ans == 0 )
	  doplot = 0 ;
	endif
	if ( ans == 1 )
	  pausing = 0 ;
	endif
      endif
    endif
    if ( !hypers )  
				# sample step 2
      sigma = inversegamma ( N+1 , 0.5*N*(( mu-xbar)**2 + v) ) ; # sample from inverse gamma
    else
      sigma = inversegamma ( N+1+hyperbeta , 0.5*(N*(( mu-xbar)**2 + v) +hyperbeta2 ) ) ; # sample from inverse gamma
    endif
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

