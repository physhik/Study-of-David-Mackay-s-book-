global data xmin xmax smin smax x  hyperbeta2 hyperbeta hyperalpha  
twoclumps = [ -0.01 -0.27 0.1 0.31  0.706   1.07 1.37 1.16  1.2 1.25 1.3 1.33 1.65 ] ;
threeclumps = [ -0.01 -0.27 0.1 0.31  0.48 0.5 0.51 0.52 0.53 0.54 0.55 0.706   1.07 1.37 1.16  1.2 1.25 1.3 1.33 1.65 2.0 2.2 ] ;
global showavgafter=10;
global avgmgau ;

more off

state=0 ; State = 10 ;

while (1)
 printf ("next state = %d\n" , state+1 ) ; 
 ans = mymenu("Monte Carlo demonstrations",
	      "single-gaussian inference; gibbs sampling",
	      "single-gaussian inference; priors on",
	      "single-gaussian inference; silly data N=13",
	      "two-gaussian mixture model",
	      "three-gaussian mixture model",
	      "three-gaussian mixture model N=20",
 "keyboard",
 "quit"
	      );
  if ( ans == 0 ) 
	state ++ ; 
	if ( state > State )  # cycle through options
		state = 1 ; 
	endif
 else
	state = ans ;
 endif
# purge_tmp_files ;
 	system("~/bin/cleantmpoctave") ;

   xmin = -0.5 ; xmax = 2.5 ; dx = 0.05 ; 
   smin = 0.18 ; smax = 1.8 ; dls = 0.1 ; 
   L = 30 ; # number of loops default
 counter = 0 ; 
 if(++counter && state==counter)
	      				# run the one-gaussian show first
				# initial conditions
   mu = 0.1 ;
   sigma = 1.0 ;
   data = [ 0.3 1.02 0.77 1.31 1.6 ] ;
				# hyperparamters
   hyperbeta = 0.0 ; hyperalpha=0.0 ; hyperbeta2=0.0;  # improper
				# mean xbar = 1 and S^2 = 1.0
   SINGLEDEMO
 elseif(++counter && state==counter)
				# 2	 same with priors active
   hyperbeta = 3.0 ; hyperalpha=3.0 ; hyperbeta2=3.0;  
   L = 50 ; # number of loops
   SINGLEDEMO
 elseif(++counter && state==counter)
				# 2	 same with priors active
   data = twoclumps;
   hyperbeta = 0.03 ; hyperalpha=0.03 ; hyperbeta2=0.03 ; 
   SINGLEDEMO

 elseif(++counter && state==counter)
				# 3 mixture model
   mu = [ 1.1 ; 1.4 ] ;
   sigma = [ 0.9 ; 1.0 ] ;
   hyperbeta = 0.03 ; hyperalpha=0.03 ; hyperbeta2=0.03 ; 
   L = 1300 ; # number of loops
   data = twoclumps;
   MIXTUREDEMO

 elseif(++counter && state==counter)
				# 3 mixture model
   mu = [ 0.1 ; 0.2 ; 0.3 ] ;
   sigma = [ 0.9 ; 1.0 ; 1.1 ] ;
   hyperbeta = 0.03 ; hyperalpha=0.03 ; hyperbeta2=0.03 ; 
   L = 1300 ; # number of loops
   data = twoclumps;
   MIXTUREDEMO

 elseif(++counter && state==counter)
				# 3 mixture model
   mu = [ 0.1 ; 0.2 ; 0.3 ] ;
   sigma = [ 0.9 ; 1.0 ; 1.1 ] ;
   hyperbeta = 0.03 ; hyperalpha=0.03 ; hyperbeta2=0.03 ; 
   L = 1300 ; # number of loops
   data = threeclumps;
   MIXTUREDEMO

 elseif(++counter && state==counter)
#
	keyboard;
 elseif(++counter && state==counter)
	break; # quit
 else
	break ;
 endif
endwhile



