function ret = metropolis ( pausing , xmin , xmax , mu, sigma , R , plotting ) 
# plotting = 1 causes graph to be shown at end only
# plotting = 2 shows the whole lot
# mu is initial condition
# sigma is proposal width
defheight = -0.25 ; inc=0.05;
high = 2.0 ;
topline=3; botline =0.1;
global logscale = 0 ; 
global showestimate ;
range =  xmax - xmin ;
gxmax = 5 ; gxmin = - 5 ; 
grange = gxmax - gxmin ;
standard;
gset clip one;
xQs=[]; r=0; rej=0; a=0 ; # number accepted
if ( plotting >= 1 )
	if ( plotting >= 2 )
	else
		printf ( "generating %d now\n" , R ) ;
	endif
endif
if ( plotting ) # explicit loop 
sumphi = 0.0 ; 
xt=mu ; pt=pstar(xt); oldx=mu; height=defheight;

# the loop

for r=1:R 
	xQ=[x,Qnorm(x,xt,sigma,high)] ;
#	draw sample
	xprop = randn * sigma + xt ;
	pprop = pstar(xprop) ; 
  if ( ( plotting > 1 ) && ( r<50 || ( r < 60 && (floor(r/10)*10==r) ) || (floor(r/20)*20==r) ))
	metplota ;
  endif
	if ( (pprop > pt) || ( rand < (pprop/pt))) # accept
		a++ ; 
		rejected=0;
		oldx=xt ;
		xt = xprop ; pt = pprop ;
		height = defheight ;
	else
		rejected=1;
		rej++ ; height = height + inc ; 
	endif
	ph = phi(xt) ; 
	sumphi = ph + sumphi ;  
	xQs(r,:) = [ xt , ph , r , a , height , sumphi/r ] ; 

	if ( (plotting > 1) && (r < 50) ) 
		chatty = 1 ;
	else
		chatty = 0 ;
	endif
  if ( ( plotting > 1 ) && ( r<50 || ( r < 60 && (floor(r/10)*10==r) ) || (floor(r/20)*20==r) ))
	metplot ;
  endif
endfor
endif
if ( plotting == 1 ) 
		metplot ;
endif
if ( showestimate >= 1 ) 
	if ( plotting >= 1 ) 	
		input "see estimate" ;
	endif
	if ( plotting >= 1 ) 
		gset autos xy;
		gplot xQs u 3:6 t 'estimate' w l 7 7 ; 
	endif 
	if ( plotting == 2 ) 
	input "see x,y again" ;
		metplot ;
	endif
endif
 ret = xQs ;
endfunction
