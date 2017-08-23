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

				# just to ensure the globals are cleared:
T=0; wl=[]; wlt=[]; ltt = 1 ; logtime=1;
				# was :
				# data
xbar = 1.0 ;
v = 0.2 ; # mean square residual between xbar and {x}
N = 5 ;  # number of points
				# NOW
				# find sufficient stats 
global  odata 
sdata = size(data) ;
offset = ones(sdata) * -0.31 ;
odata = [data;offset]' ;
N = sdata(2);
xbar = mean(data) ;
SS = sum ( (data-xbar).**2) ;
v = SS / N ;

if ( arrows ) 
  arr = 1 ; 
  h = sqrt(v) ; # draw sigma_N value
  command = sprintf ( "gset arrow %d from 2,%f,0 to 1,%f,0" , arr, h,h ) ;
  eval(command) ;
  arr ++ ;
  h = sqrt(v*N/(N-1)) ; # draw sigma_N value
  command = sprintf ( "gset arrow %d from 2,%f,0 to 1,%f,0" , arr, h,h ) ;
  eval(command) ;
endif
    
gset cntrp levels 7
doprint = 0 ;  # only set this to 1 with great care: writes ps


				# printf ("--------------------------------\n") ; 
printf ("--- Gibbs sampling demo --------\n") ; 
printf ("Here is the joint posterior density\n") ;

global xmin xmax smin smax
x = xmin:dx:xmax ;
ls = log(smin) : dls: log(smax) ;
s = exp(ls)';
				# here we find the joint posterior of everything
d = ( ones(size(s)) * (N.*((x-xbar).**2.+v )  + hyperbeta2 )) ./ ( (2.0*(s.**2))* ones(size(x)) ) +  ( ones(size(s)) * ( 0.5.*hyperalpha.*x.**2 )) ;
				# decide whether to plot the likelihood or
				# the posterior. (Depends whether we go logscale y)
if ( logsy )
  exponent  = N +  hyperbeta;
else
  exponent = N+1 +  hyperbeta ; # plus 1 because of prior factor.
endif
  
so = s.**(exponent) * ones(size(x)) ; 
z =  exp(-d)./(so) ; 

gset multiplot
preparecontourplot
preparesurfaceplot
				# surfaceplot
zz = mymesh(x,s',z,0,8) ;
showdata
gset nomultiplot

ans = input "ready for contour plot?" ;
gset multiplot
preparecontourplot
				# zz = mymesh(x,s',z,0,8) ;
      morepreparecontour
gsplot  zz w l 1
				# contourplot

showdata
gset nomultiplot

see = 0.1123456 ; 
rand("seed",see);
randn("seed",see);
gset term  X
global doplot = 1 ;
doplot=1;

ans = input "ready for gibbs?" ;

if ( (hyperalpha<=0) && (hyperbeta<=0) && (hyperbeta2<=0))
  hypers = 0
else
  hypers = 1
endif
[mu,sigma] = gibbs( mu, sigma , L , xbar , v , hyperalpha, hyperbeta,hyperbeta2, N , hypers ) ; 

				# ans = input "ready for Gibbs results?" ;
if (doprint )
  gset size 0.336,0.357 ;  # 0.54,0.73
else 
#  gset size  0.54,0.73 ;
endif
gset nokey
if ( doprint == 1 ) 
  gset term post ;  
  gset output "gs.ps"
endif
      gset multiplot
      gibbsplotnoline
      showdatafit(mu,sigma)
      gset nomultiplot
if ( doprint == 1 ) 
	gset term X
endif

				# ans = input "ready?" ;

				# gset view 0,0
				# gset cntrparam levels incremental 0.0025,0.0025,0.05
				# gset parametric
				# command = sprintf ("gsplot  exp(-(%.2f*((x-%.2f)**2+%.2f))/(2*y**2))/(y)**(%.2f)" , N , xbar , v , N  ) ;
#printf ( "%s\n" , command ) ;
#eval(command);


   
