function showdatafit2(pc,mu,sigma,C)

				# shows the data and the current
				# gaussian distbn
  global odata1 odata2 odata3 odata4 odata5 odata x xmin xmax x pausing
  global T showavgafter avgmgau
  arrows = 1 ;

#  odata1
#  odata2
  preparedatawindow2
  if ( arrows )
    arrownum = 1 ;
    colnum = 2 ;
    for c = 1:C
      height0 =  gaussian(0,sigma(c)) ;
      height1 =  gaussian(sigma(c),sigma(c)) ;
      command = sprintf ( "gset arrow %d from %f,0 to %f,%f nohead ls %d ",arrownum,mu(c),mu(c),height0,colnum ) ;
      eval(command) ;
      arrownum ++ ;
      command = sprintf ( "gset arrow %d from %f,%f to %f,%f nohead ls %d ",arrownum,mu(c)-sigma(c),height1,mu(c)+sigma(c),height1,colnum ) ;
      arrownum ++ ;
      eval(command) ;
      colnum ++;
    endfor
  endif
  if(pausing>1)
    disp "    # plot2" ;
  endif

  command = sprintf ( "gplot " ) ; 
  colnum=5;pointnum=2;
  for c=1:C
    if(pausing>1)
      disp "    # plot c" ;
    endif
    gau = gaussian( (x-mu(c)) , sigma(c) )' ;
#    gau
    command = sprintf ( "%s odata%d w p %d %d , gau%d w l %d," , command , c ,pointnum,colnum,c,pointnum);
    colnum++; pointnum++;
    if ( c== 1 )
      sumgau = gau * pc(c) ;
    else
      com = sprintf( "sumgau =  sumgau + gau * pc(c) ;"  ) ;
      eval(com);
    endif
    if(pausing>1)
      disp "    # plot c'" ;
      size(x')
      size(gau)
    endif
    com  = sprintf("gau%d = [x',gau] ;",c) ;
    eval(com);
#    sumgau
    if(pausing>1)
      disp "    # plot c''" ;
    endif
  endfor

  if(pausing>1)
    disp "    # plot 5" ;
  endif

				# mixture of gaussians
  mgau = [ x' , sumgau*C ] ;
  numberofsamples = T+1 - showavgafter ;
  if ( numberofsamples == 1 )
    avgmgau = mgau ;
  elseif ( numberofsamples > 1 )
    avgmgau = (  (numberofsamples-1) * avgmgau + mgau ) / numberofsamples ;
    command = sprintf ( "%s avgmgau w l 4," ,command ) ; 
  endif
  
				# show original data and total density
  command = sprintf ( "%s  odata w p 5 3 ,  mgau w l  7" ,command ) ; 
#  gplot odata w p 5 3 , gau w l  3
  eval(command) ; 
  if(pausing>1)
    disp "    # plot 7" ;
  endif
  if ( arrows )
    while ( arrownum > 1 ) 
      arrownum -- ;
      command = sprintf ("gset noarrow %d",arrownum) ;
      eval(command) ; 
    endwhile
  endif
  unsetdata

endfunction

