global logscale 
gset xrange [-5:5] ; 
if ( logscale ) 
	gset yrange [0:3.1] ;
else
	gset yrange [1e-4:3.1];
endif
gset key
