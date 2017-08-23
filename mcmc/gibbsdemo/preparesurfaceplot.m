gset view 60,30
gset contour surface
gset surface
gset autos z
global zz ;
gset linestyle 8  lt 8 lw 0.5
				# the "ls" modifier added to mymesh did not work
gset noclabel

zz = mymesh(x,s',z,0,8) ;

#ans = input "ready for contour plot from file?" ;
				# write contopur plot to file as 2d plot
#gset term table
#gset out 'contourfile'
#replot
#gset out
#gset term X

				# gplot 'contourfile'


