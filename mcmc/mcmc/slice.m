function ret = slice ( pausing , xmin , xmax , mu, sigma , R , plotting ) 
# plotting = 1 causes graph to be shown at end only
# plotting = 2 shows the whole lot
# pausing = 1 causes a pause at every sensible juncture.
# mu is initial condition
# sigma is width
# modified dec 98 to include printing to file.
global printing ; 
global printitn = 0 ; # file numbers
global printrun  ; # file numbers
defheight = -0.1 ;
high = 2.0 ;
topline=1.6; botline =0.1;
range =  xmax - xmin ;
standard;
gset clip one;
xQs=[]; r=0; rej=0; a=0 ; # number accepted
if ( plotting == 1 )
		printf ( "generating %d now\n" , R ) ;
 
  gset nokey ;
  gset border 1
  gset noytics
  gset tics    out
  gset xtics  nomirror  
  gset noyzeroaxis

endif

  sumphi = 0.0 ; 
  xt=mu ; pt=pstar(xt); oldx=mu; height=defheight;
  for r=1:R 
	printrun ++ ; printitn = 0 ; 
# 	step 1: perturb the current point.
#	draw height and perturb 
	u  = rand * pt ; 
	xprop = (rand - 0.5) * sigma + xt ;
	xleft = xprop - 0.5*sigma ;
	xright = xprop + 0.5*sigma ;
	pleft = pstar(xleft) ; 
	pright = pstar(xright) ; 
  	if ( ( plotting > 1 ) )
	   slplota ; # show the erected line
	   tele3 = [ xleft , u ; xright , u ] ; plips =2 ;
	   slplotb ; # show the left and right extension
if ( pausing )
	   input "initial interval." ;
endif
  	endif
	while ( (pleft > u) || (pright > u) )
		if ( pleft > u )
			xleft = xleft - sigma ;
			pleft = pstar(xleft) ; 
			if ( plotting > 1 )
				plips ++ ; tele3(plips,:)=[xleft,u];
			endif
		endif
		if  ( pright > u )
			xright = xright + sigma ;
			pright = pstar(xright) ; 
			if ( plotting > 1 )
				plips ++ ; tele3(plips,:)=[xright,u];
			endif
		endif
	  	if ( ( plotting > 1 ) )
	   	   slplotb ; # show the left and right extension
if(pausing)
			printf "expanded interval\n" ; 
endif
  		endif
	endwhile
if ( pausing )
	input "now sample from this interval..." ;
endif
# ok, having got a valid external line we sample from it
	pprop = 0.0 ;
	while ( pprop < u )
		xnew = xleft + rand * ( xright - xleft ) ;
		pprop = pstar ( xnew ); 
		tele4 = [xnew,u] ; 
		if ( pprop < u ) 
			# modify interval
			if ( xnew < xt ) 
				xleft = xnew ;
			else 
				xright = xnew ;
			endif
		endif
	  	if ( ( plotting > 1 ) )
	   	   slplotc ; # show the point , and old interval
		   if ( pprop < u ) 
			tele3 = [ xleft , u ; xright , u ] ; plips =2 ;
if ( pausing )
			input "outside required area" ;
endif
	   	   	slplotc ; # show the point and new interval
if ( pausing )
			input "new interval" ; 
endif
		   else
if ( pausing )
			input "done!" ; 	
endif
		   endif			 
  		endif
	endwhile
	xt = xnew ; pt = pprop ;

	ph = phi(xt) ; 
	sumphi = ph + sumphi ;  
	xQs(r,:) = [ xt , ph , r , a , height , sumphi/r , u ] ; 

endfor

if ( 0 )  #####################   what is all this?
	if ( plotting == 1 ) 
			slplot ;
	endif
	if ( plotting >= 1 ) 	
		input "see estimate" ;
	endif
	if ( plotting >= 1 ) 
		gset autos xy;
		gplot xQs u 3:6 t 'estimate' w l 7 7 ; 
	endif 
endif
# if ( plotting == 2 ) 
if ( plotting  ) 
input "summary..." ;
		slplotd ;
endif
 ret = xQs ;
endfunction
