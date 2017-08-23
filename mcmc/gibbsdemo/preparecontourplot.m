gset origin 0,0.1
gset size 1.2,1.1
gset border 15 ls 1
gset xtics
gset ytics
gset autos xy
if ( logsy )
  gset logscale y ;
else
  gset nologscale y ;
endif
gset xlabel 'mu'
gset ylabel 'sigma'
gset xlabel ''
gset ylabel ''
gset noclip points
gset nokey
				# ranges
command = sprintf ( "gset xrange [%f:%f]" , xmin , xmax ) ;
eval(command) ; 
command = sprintf ( "gset yrange [%f:%f]" , smin , smax ) ;
eval(command) ; 
				# 
preparecontourview

gset noztics 
gset zrange [-1:-0.1]
gset clip one # clip out the surface
gset surface
gset parametric

				# this stopped working about Thu 19/2/04 on debian machines so I added: < morepreparecontour.m >
				# end additions Thu 19/2/04 These additions prevent the POINTS from being plotted
				# so I transferred them into SINGLEDEMO


#ans = input "ready for contour plot from file?" ;
				# write contopur plot to file as 2d plot
#gset term table
#gset out 'contourfile'
#replot
#gset out
#gset term X

				# gplot 'contourfile'







