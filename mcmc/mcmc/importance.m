# importance.m
function ret = importance ( style , xmin , xmax , mu, sigma , R , plotting ) 
# plotting = 1 causes graph to be shown at end only
# plotting = 2 shows the whole lot
height = -0.1 ;
high = 1.0 ;
global logscale = 0 ; 
global showestimate ;
range =  xmax - xmin ;
gxmax = 5 ; gxmin = - 5 ; 
grange = gxmax - gxmin ;
standard;
if ( style == 1 ) 
	xQ=[x,Quni(x,high)] ;
elseif ( style == 2 ) 
	xQ=[x,Qnorm(x,mu,sigma,2.0)] ;
endif
gset clip one;
# gset noclip points;
xQs=[]; ws=[]; r=0;
if ( plotting >= 1 )
				# modified Thu 21/2/02
	impplot0 ; 
	if ( plotting >= 2 )
		input "press return" ;
	else
		printf ( "generating %d now\n" , R ) ;
	endif
endif
if ( plotting ) # explicit loop 
sumwphi = 0.0 ; sumw = 0.0 ; 
for r=1:R 
	x = xmax + 109.0 ;
  while (( x > xmax ) || (x < xmin ) ) 
#	draw sample
	if ( style == 1 ) 
		x = rand * range + xmin ; 
		q = high ; 
	elseif ( style == 2 ) 
		x = randn * sigma + mu ;
		q = Qnorm(x,mu,sigma,high) ; 
	else
		print "unsupported style!\n" ; 
	endif
  endwhile
	weight = pstar(x) / q ; 
  xQs(r,:) = [ x , phi(x) , height , r , weight , weight * phi(x)  ] ; 
	sumwphi = xQs(r,6) + sumwphi ; 
	sumw    = xQs(r,5) + sumw    ;
	ws(r,:) = [ r , ((r/R)*grange)+gxmin , weight , xQs(r,6) , sumwphi / sumw , sumwphi , sumw ] ;

	if ( ( plotting > 1 ) && ( r<5 || ( r < 60 && (floor(r/10)*10==r) ) || (floor(r/20)*20==r) ))
		impplot ;
	endif
endfor
else # NOT WRITTEN
	if ( style == 1 ) 
		x = rand(R,1) * range + xmin ;
		q = high * ones(size(x)) ; 
	elseif ( style == 2 ) 
		x = randn * sigma + mu ;
		q = Qnorm(x,mu,sigma,high) ; 
	endif
endif
if ( plotting == 1 ) 
		impplot ;
endif
if ( showestimate >= 1 ) 
 if ( plotting >= 1 ) 	
	input "see estimate" ;
 endif
 if ( plotting >= 1 ) 
	gset autos xy;
	gplot ws u 1:5 t 'estimate' w l 7 7 ; 
 endif 
 if ( plotting == 2 ) 
 input "see x,y again" ;
		impplot ;
 endif
endif
 ret = ws ;
endfunction
