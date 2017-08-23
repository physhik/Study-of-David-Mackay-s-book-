function [pc,mu,sigma] = gibbs3 (pc, mu, sigma , L , hyperalpha,hyperbeta,hyperbeta2 , Littleloop ) 
				# gibbs ( w , L )
				# runs gibbs sampling for mu,sigma
				# - multiple clusters
				# with data in TWO dimensions

  global  data ; # data should be two wide and N high. mu is also two wide
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
  D = sizemu(2) ; # number of dimensions - should be 2

  for l = 1:L                  # loop L times
    datac = [] ; Nc=[];
    Nc=zeros(1,C);
    
    if(pausing)	
      disp "		# step 0: assign all data points" ;
    endif
    for n =1:N
      for c=1:C
	likec(c) = 1.0 ; 
	for d=1:D
	  likec(c) *= gaussian( (data(n,d)-mu(c,d)),sigma(c,d) ) ;
	endfor
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
      com = sprintf ( "data%d(Nc(c),:) = data(n,:) ;" , c ) ;
      eval(com) ; 
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
	com = sprintf ( "cdata = data%d(1:Nc(c),:);" , c ) ;
	eval(com) ; 
	xbarc(c) = sum(cdata) /Nc(c); # sum over columns
	SSc(c) = sum ( (cdata-xbarc(c)).**2) ; # need ones*xbar here?
	vc(c) = SSc(c) ./ Nc(c);
				# create a plottable object - already done
      else
				# no points assigned
	command = sprintf( "data%d = [-10 -10]' ;",c ) ; eval(command);
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
	betaN  = Nc(c)/sigma(c).**2 ; # 1xD vector
	lambda = betaN ./ ( hyperalpha + betaN ) ;
	postsigma = 1.0 ./ sqrt( hyperalpha + betaN ) ;
??	mu(c) = lambda .* xbarc(c) + randn ( ) * postsigma ; # sample mu from gaussian
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



