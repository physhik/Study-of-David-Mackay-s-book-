############################## parameters to do with parameter-logging
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

gset term  X
gset autos y
gset autos z
gset ztics
if ( logsy )
  gset logscale y ;
else
  gset nologscale y ;
endif
				# initial conditions
mu = 0.1 ;
sigma = 1.0 ;
				# data
xbar = 1.0 ;
v = 0.2 ; # mean square residual between xbar and {x}
N = 5 ;  # number of points
L = 30 ; # number of loops

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

gset view 60,30
gset xlabel 'mu'
gset ylabel 'sigma'
gset xlabel ''
gset ylabel ''
gset noclip points
gset size 1.2,1.32
				# ranges
xmin = 0 ; xmax = 2.0 ; dx = 0.05 ; 
command = sprintf ( "gset xrange [%f:%f]" , xmin , xmax ) ;
eval(command) ; 
smin = 0.18 ; smax = 1.8 ; dls = 0.1 ; 
command = sprintf ( "gset yrange [%f:%f]" , smin , smax ) ;
eval(command) ; 

x = xmin:dx:xmax ;
ls = log(smin) : dls: log(smax) ;
s = exp(ls)';
d = ( ones(size(s)) * (N.*((x-xbar).**2.+v))) ./ ( (2.0*(s.**2))* ones(size(x)) );
				# decide whether to plot the likelihood or
				# the posterior. (Depends whether we go logscale y)
if ( logsy )
  exponent  = N;
else
  exponent = N+1; # plus 1 because of prior factor.
endif
  
so = s.**(exponent) * ones(size(x)) ; 
z =  exp(-d)./(so) ; 

				# ans = input "ready for surface plot?" ;
gset contour surface
global zz ;
zz = mymesh(x,s',z,0,8) ;

ans = input "ready for contour plot?" ;
gset noztics
gset contour base
gset nosurface
gset view 15,0
replot

#ans = input "ready for contour plot from file?" ;
				# write contopur plot to file as 2d plot
#gset term table
#gset out 'contourfile'
#replot
#gset out
#gset term X

				# gplot 'contourfile'

see = 0.1123456 ; 
rand("seed",see);
randn("seed",see);
global doplot = 1 ; 
gset clip one
gset surface # tried removing this on lewis but it did not work
gset zrange [-0.49:-0.47]


gibbs( mu, sigma , L , xbar , v , N  ) ; 

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
gsplot  zz w l 1,  wlt u 1:2:3 w p 1 4, wl u 1:2:3 w p 3 3
				# replot    wlt u 1:2:3 w p 7 4, wl u 1:2:3 w p 3 3
				# gplot    wlt u 1:2 w p 7 4, wl u 1:2 w p 3 3
				# gplot   wlt u 1:2 w l 1, wlt u 1:2 w p 7 4, wl u 1:2 w p 3 3

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


   
