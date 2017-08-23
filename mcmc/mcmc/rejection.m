# rejection.m
function ret = rejection ( style , xmin , xmax , mu, sigma , R , plotting ) 
# plotting = 1 causes graph to be shown at end only
# plotting = 2 shows the whole lot
height = -0.1 ;
high = 4.0 ;
global logscale = 0 ; 
global showestimate ;
range =  xmax - xmin ;
gxmax = 5 ; gxmin = - 5 ; 
grange = gxmax - gxmin ;
standard;
xQ=[x,Qnorm(x,mu,sigma,high)] ;
gset clip one;
xQr=[];xQa=[]; ws=[]; r=0; rej=0; a=0 ; # number accepted
if ( plotting >= 1 )
	rejplot0 ; 
	if ( plotting >= 2 )
		input "press return" ;
	else
		printf ( "generating %d now\n" , R ) ;
	endif
endif
if ( plotting ) # explicit loop 
sumphi = 0.0 ; sumw = 0.0 ; 
for r=1:R 
	x = xmax + 109.0 ;
  while (( x > xmax ) || (x < xmin ) ) 
#	draw sample
	x = randn * sigma + mu ;
	q = Qnorm(x,mu,sigma,high) ; 
	u = rand * q ;
  endwhile
  w = pstar(x) ; 
  if ( u > w ) 
	rej++ ;
	xQr(rej,:) = [ x , phi(x) , u , rej , w ] ; 
	
  else 
	ph = phi(x) ; a++ ; sumphi = ph + sumphi ;  
	xQa(a,:) = [ x , ph , u , a , w , sumphi/a , height , r ] ; 
  endif

  if ( ( plotting > 1 ) && ( r<10 || ( r < 60 && (floor(r/10)*10==r) ) || (floor(r/20)*20==r) ))
	rejplot ;
  endif
endfor
endif
if ( plotting == 1 ) 
		rejplot ;
endif
if ( showestimate >= 1 ) 
 if ( plotting >= 1 ) 	
	 input "see estimate" ;
 endif
 if ( plotting >= 1 ) 
	gset autos xy;
	gplot xQa u 4:6 t 'estimate' w l 7 7 ; 
 endif 
 if ( plotting == 2 ) 
 input "see x,y again" ;
		rejplot ;
 endif
endif
 ret = xQa ;
endfunction
