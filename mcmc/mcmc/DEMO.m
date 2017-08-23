# usage 
# DEMO
# runs a sequence of monte carlo
global logscale = 0 ;
global showestimate = 0 ;
global zeropoint = 1.5e-4 ;
global func = 0 ;
global spacing = 0.1 ; 
global specialprinting =0; # for redoing slice pics
				# added Tue 1/4/03 for book printing
if(specialprinting )
  spacing = 0.03333333 ;
endif
state = 0 ; State = 28 ;
global printing = 0 ; 
global printrun = 0 ; # file numbers
R100 = 50 ; 
R1000 = 2000 ;
seed = 0.1243 ;
if(specialprinting )
  seed = 0.1245 ;
  func =1 ;
  printing = 1 ;
  state = 11 ;
endif
  randn("seed",seed) ; # fix the randomizer
  rand("seed",seed);
  load -force wsubak ;
while (1)
 printf ("next state = %d, func = %d\n" , state+1 , func ) ; 
 ans = mymenu("Monte Carlo demonstrations",
 "a probability density",
 "a probability distribution",
 "uniform sampling",
 "importance sampling",
 "see estimates from importance sampling again",
 "importance sampling (load R=2000)",
 "rejection sampling",
 "invalid rejection sampling",
 "rejection sampling (load R=2000)",
 "metropolis algorithm",
 "metropolis algorithm (pauseless)",
 "slice sampling (10)",
 "slice sampling (50, pauseless)",
 "switch P* function 0/1",
 "switch log scale 0/1",
 "slice sampling (100)",
 "keyboard",
 "quit",
 "toggle printing status",
 "refresh randomizer",
 "reset randomizer",
 "importance sampling (R=2000)",
 "big rejection sampling"
 ) ;
 if ( ans == 0 ) 
	state ++ ; 
	if ( state > State )  # cycle through options
		state = 1 ; 
	endif
 else
	state = ans ;
 endif

# purge_tmp_files ;
	initgnu();			# set up graphics
	if ( logscale ) 
		gset logscale y
	endif
 counter = 0 ; 
# purge_tmp_files ;
  gset origin 0.1,0.1
  gset size 0.85,0.8
  if (specialprinting) 
    gset size 0.35,0.35
    gset border 0
    gset noxtics
    gset noytics
  endif
	system("~/bin/cleantmpoctave") ;
  
 if(++counter && state==counter)
# 1	the problem
	printf "a probability density\n";
	density() ; 
 elseif(++counter && state==counter)
# 2	the discrete problem
	printf "a probability distribution\n";
	distribution();
 elseif(++counter && state==counter)
#	uniform importance sampling
	printf "uniform sampling\n";
	wsu = importance(1,-5,5,0,1,R100,2);
 elseif(++counter && state==counter)
# 4	weighted importance sampling
	printf "importance sampling\n";
  substate = 1 ; 
  while (1)
	counter = 0 ; 
	if(++counter && substate==counter)
		ws1 = importance(2,-5,5,0,1,R100,2);
	elseif (++counter && substate==counter)
		ws03 = importance(2,-5,5,0,1.0/3.0,R100,2);
	elseif ( ++counter && substate==counter)
		ws3 = importance(2,-15,15,0,3.0,R100,2);
	else
	  break;
	endif
	ans = mymenu("importance sampling",
			"r=1","r=1/3","r=3","quit");
	if ( ans == 0 ) 
		substate ++ ;
	else
		substate = ans ;
	endif
  endwhile
	

 elseif(++counter && state==counter)
#	answers again
	printf	"see estimates from importance sampling again\n";
	gset key
	gset autos xy
	 gplot wsu u 1:5 t 'uniform' w l 5 7 , ws1 u 1:5 t 'r=1' w l 6 7 , ws03 u 1:5 t 'r=1/3' w l 7 7 , ws3 u 1:5 t 'r=3' w l 8 7 ;



 elseif(++counter && state==counter)
#	importance sampling "done before"
	printf	"importance sampling (load R=2000)\n";
	isload;
 elseif(++counter && state==counter)
#	rejection sampling
	printf "rejection sampling\n";
	rs3 = rejection(2,-15,15,0,3,R100,2);
 elseif(++counter && state==counter)
	printf "invalid rejection sampling\n";
	rs1 = rejection(2,-5,5,0,1,R100,2);
 elseif(++counter && state==counter)
#	rejection sampling, done it before
	printf "rejection sampling, large R, load results\n";
	rsload;

 elseif(++counter && state==counter)
#	metropolis
	printf "metropolis algorithm\n";
	metropolis(1,-15,15,0,1.5,5,2);

 elseif(++counter && state==counter)
#	metropolis, faster 
	printf "metropolis algorithm (pauseless)\n";  
	metropolis(0,-15,15,0,1.5,25,2);

 elseif(++counter && state==counter)
# slow slice sampling 
	printf "slice sampling (5)\n" ;
	slice(1,-15,15,-0.9,1.5,5,2); ; 
 elseif(++counter && state==counter)
# pauseless slice sampling
	printf "slice sampling (25)\n" ;
	slice(0,-15,15,-0.9,1.5,25,2); ; 
 elseif(++counter && state==counter)
#  function 2
	func = 1 - func ; # flips
	printf ("func = %d\n" , func ) ; 
 elseif(++counter && state==counter)
# log scale
	logscale = 1 - logscale ; # flips
	printf ("logscale = %d\n" , logscale ) ; 


 elseif(++counter && state==counter)
# pauseless slice sampling
	printf "slice sampling (100)\n" ;
	slice(0,-15,15,-0.9,1.5,100,2); ; 
#
 elseif(++counter && state==counter)
#
	keyboard;
 elseif(++counter && state==counter)
	break; # quit
 elseif(++counter && state==counter)
	# toggle printing
	printing = 1 - printing ; 
	printing  # show new value 
	 plotsetup ; 
 elseif(++counter && state==counter)
	u = rand ;
  randn("seed",u) ; # refresh the randomizer
  rand("seed",u);

 elseif(++counter && state==counter)

  randn("seed",0.1243) ; # fix the randomizer
  rand("seed",0.1243);


 elseif(++counter && state==counter)
#	weighted importance sampling
	printf "importance sampling (R=2000)\n";
  substate = 1 ; 
  while (1)
	counter = 0 ; 
	if(++counter && substate==counter)
		ws1 = importance(2,-5,5,0,1,R1000,1);
	elseif (++counter && substate==counter)
		ws03 = importance(2,-5,5,0,1.0/3.0,R1000,1);
	elseif ( ++counter && substate==counter)
		ws3 = importance(2,-15,15,0,3.0,R1000,1);
	else
	  break;
	endif
	ans = mymenu("importance sampling",
			"r=1","r=1/3","r=3","quit");
	if ( ans == 0 ) 
		substate ++ ;
	else
		substate = ans ;
	endif
  endwhile
# save -float-binary ws1033 wsu  ws1 ws03 ws3

 elseif(++counter && state==counter)
#	rejection sampling, lots
	printf "huge R rejection sampling\n";
	rs3N = rejection(2,-15,15,0,3,8000,1);
	keyboard;
# save -float-binary rs3N rs3N
# 2061 accepted



 else
	break ;
 endif
endwhile

#############################################################
