############################## parameters to do with parameter-logging
#
				# gibbsdemo updated Thu 1/3/01 to make multiplot
#
global dT = 1;
global T = 0 ;
global dT0 = 1 ; 
global T0 = 0 ; 
global logtime = 1  ;
global wl = [] ;      # weight vector w logged into this matrix
global wlt = [] ;     # logs w along trajectories 
global wltlog =  1 ;  # whether to log
global ltt = 1 ;      # log trajectory count time


global autos = 0 ; 
global verbose = 0  ;
global logsy = 1 ; #  whether to show sigma on a log scale
global arrows = 0 ; #  whether to show sigma_N and sigma_N-1

global  odata  offsetc data  x xmin xmax dx

				# just to ensure the globals are cleared:
T=0; wl=[]; wlt=[]; ltt = 1 ;

offsetc=[-1 -2 -3 -4 -5 -6 ];
sdata = size(data) ;

gset cntrp levels 7
printf ("--- Gibbs sampling demo --------\n") ; 
printf ("--- if there's no plot, check whether multiplot is active --------\n") ; 

x = xmin:dx:xmax ;

see = 0.1123456 ; 
rand("seed",see);
randn("seed",see);
gset term  X
global doplot = 1 ; 

if ( (hyperalpha<=0) && (hyperbeta<=0) && (hyperbeta2<=0))
  hypers = 0
  disp "WARNING - recommend using non-zero hyperparameters!"
else
  hypers = 1
endif
 # prior probablity over classes
sizemu=size(mu) ; 
C = sizemu(1) ; # number of classes
offset = ones(sdata) * (-1-C) ;
odata = [data;offset]' ;
gset multiplot
showdata2
gset nomultiplot

ans = input "ready for gibbs?" ;


pc = ones(sizemu)./C ;
				# littleloop is the last arg (3 worked fine)
[pc,mu,sigma] = gibbs2( pc, mu, sigma , L , hyperalpha, hyperbeta,hyperbeta2, 1 ) ; 

				# ans = input "ready for Gibbs results?" ;



   
