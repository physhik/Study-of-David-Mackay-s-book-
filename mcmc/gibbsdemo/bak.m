      preparecontourplot
				# was: 
				# gsplot  zz w l 1,  wlt u 1:2:3 w p 7 4, wl u 1:2:3 w p 3 3
      
morepreparecontour
gsplot   zz w l 1
repreparecontour
gsplot  wlt u 1:2:3 w p 7 4, wl u 1:2:3 w p 3 3
				# added this Thu 19/2/04 because it stopped working on debian

				# replot    wlt u 1:2:3 w p 7 4, wl u 1:2:3 w p 3 3
				# gplot    wlt u 1:2 w p 7 4, wl u 1:2 w p 3 3
				# gplot   wlt u 1:2 w l 1, wlt u 1:2 w p 7 4, wl u 1:2 w p 3 3

