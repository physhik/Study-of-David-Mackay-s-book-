if ( doplot )
  	system("~/bin/cleantmpoctave") ;

  gset multiplot
  showdatafit2(pc,mu,sigma,C)
  gset nomultiplot
  if ( pausing ) 
    ans = input "ready? (0 - skip to end; 1 - stop pausing)" ;
    if ( ans == 0 )
      doplot = 0 ;
      pausing = 0 ; 
    endif
    if ( ans == 1 )
      pausing = 0 ;
    endif
  endif
endif
