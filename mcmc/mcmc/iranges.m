if ( logscale ) 
	gset yrange [1e-4:3.1];
else
	gset yrange [-0.2:3.1];
endif
gset xrange [-5:5] ;
global specialprinting ;
gset key
if(specialprinting)
  gset xrange [-4:4] ;
  gset nokey
  gset yrange [-0.2:1.75];
endif
