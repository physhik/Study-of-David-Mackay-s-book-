global xmin
gset ls 1  lt 8 lw 0.1
gset ls 2  lt 2 lw 0.1
gset ls 3  lt 3 lw 0.1
gset ls 4  lt 4 lw 0.1
gset ls 5  lt 5 lw 0.1
gset border 15 ls 1
gset size 0.70126,1
gset origin 0.253,0.0
gset xtics nomirror
labelpos = xmin-0.07 ;
command = sprintf ("gset label 1 \"Data\" at %f,-3 right", labelpos ) ; eval(command) ; 
command = sprintf ("gset label 2 \"Current\" at %f,2.36 right", labelpos ) ; eval(command) ; 
command = sprintf ("gset label 3 \"hypothesis\" at %f,1.3 right", labelpos ) ; eval(command) ; 

gset tics out
gset nologs y
gset yrange [-4.1:10]
command = sprintf ( "gset xrange [%f:%f]" , xmin , xmax ) ;
eval(command) ; 
gset noytics
gset xzeroaxis ls 1
gset nokey
gset noparametric


