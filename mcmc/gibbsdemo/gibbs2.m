function [pc,mu,sigma] = gibbs2 (pc, mu, sigma , L , hyperalpha,hyperbeta,hyperbeta2 , Littleloop ) 
				# gibbs ( w , L )
				# runs gibbs sampling for mu,sigma
				#                       for a number of loops L
				#
				# the posterior distribution is
				# P(m,s|{x}) = P(m,s) *
				# \frac{1}{s^N} e^{-N( (xbar-m)^2+v )/(2*s*s)}
				# where v = 1/N sum (x-xbar)^2
				# and P(m,s) = 1/s (improper)

  global odata1 odata2 odata3 odata4 odata5 data
  global wl ;      # weight vector w logged into this matrix
  global wlt ;  # logs w along trajectories 
  global wltlog ;  # whether to log
  global ltt ; # log trajectory count time
  global verbose ; 
  global T   logtime ;
  global zz ;
  global doplot  logsy xmin xmax smin smax data offsetc ;
  global pausing = 1 ; 

  sda = size(data) ;
  N=sda(2);  
  gset noclip points
				# log initial condn
  sizemu = size(mu) ;
  C = sizemu(1) ; # number of classes
  D = sizemu(2) ; # number of dimensions
  if ( 0 ) 
    if ( 1 )
      wl(logtime,:) = [pc',mu',sigma',-0.5,T] ; 
      logtime ++ ;
    endif
    if ( wltlog ) 
      wlt( ltt,: ) = [ pc', mu' , sigma' , -0.5,ltt ] ;
      ltt ++ ;
    endif
  endif

  for l = 1:L                  # loop L times
    datac = [] ; Nc=[];
    Nc=zeros(1,C);
    
    if(pausing)	
      disp "		# step 0: assign all data points" ;
    endif
    for n =1:N
      for c=1:C
	likec(c) = gaussian( (data(n)-mu(c)),sigma(c) ) ;
	postc(c) = pc(c) * likec(c) ;
	if ( c == 1 ) 
	  cum(c) = postc(c) ;
	else
	  cum(c) = cum(c-1) + postc(c) ;
	end
      endfor
      sump = cum(C) ;
				# assign class c using random number
      u = sump * rand;
      c=1;
      if ( u < cum(c) )
	answer = c ;
      else
	for c=2:C
	  if ( (u < cum(c)) && ( u>cum(c-1) ) )
	    answer = c ;
	  endif
	endfor
      endif
      class(n) = answer ;
      c=answer;
#      [u,sump,likec(1),likec(2),cum(1),c,u/sump]
      Nc(c) = Nc(c) + 1 ;
      datac(c,Nc(c)) = data(n) ;
    endfor
#				    mu 
#    sigma
#    Nc

    if ( pausing )
      disp "         # assignments complete"
    endif
    for c=1:C
#      [c Nc(c)];
      if ( Nc(c) > 0 ) 
	xbarc(c) = sum(datac(c,1:Nc(c))) /Nc(c);
	SSc(c) = sum ( (datac(c,1:Nc(c))-xbarc(c)).**2) ;
	vc(c) = SSc(c) / Nc(c);
#      datac(c,:) ;
				# create a plottable object
	command = sprintf( "odata%d = [datac(c,1:Nc(c));offsetc(c)*ones(1,Nc(c))]' ; ",c ) ;
	eval(command);
      else
				# no points assigned
	command = sprintf( "odata%d = [-10;-10]' ;",c ) ; eval(command);
      endif	
    endfor
    if(pausing) 
      disp "         # sufficient stats computed"
    endif
#    odata1
#    odata2
#    disp "plotting"
    DOMIXPLOT
    if(pausing)
      disp "    # sample step 1    : update mu and sigma" ;
    endif
    for c=1:C
      for littleloop = 1:Littleloop
	if(pausing>1)
	  disp "    # sample step 1    : update mu" ;
	endif
	betaN = Nc(c)/sigma(c).**2 ;
	lambda = betaN / ( hyperalpha + betaN ) ;
	postsigma = 1.0 / sqrt( hyperalpha + betaN ) ;
	mu(c) = lambda * xbarc(c) + randn ( ) * postsigma ; # sample mu from gaussian
	if(pausing>1)
	  disp "    # sample step 1    : update sigma" ;
	endif
				# step 2
	arg1 = Nc(c)+1+hyperbeta ;
#      mu
#      xbarc
#      Nc
	arg2 =  0.5*(Nc(c)*(( mu(c)-xbarc(c))**2 + vc(c)) +hyperbeta2 ) ;
	sigma(c) = inversegamma ( arg1 , arg2 ) ; # sample from inverse gamma
      endfor
    endfor

    if(pausing>1)
      disp "    # plot1" ;
    endif

    DOMIXPLOT
    if(pausing>1)
      disp "    # plotdone" ;
    endif

    T ++ ;

    if(pausing)
      disp "next iteration"
    endif
  endfor

endfunction



