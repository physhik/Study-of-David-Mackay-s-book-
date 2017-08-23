function y = gaussian(x,s)
  safe = 0 ;
  if (!safe) 
    y = exp(-x.^2 ./ (2*s.^2)) ./s;
  else
    si=size(x);
    for  i=1:si(1)
      for j=1:si(2)
	if ( ( x(i,j)/s )  < 5 ) 
	  y(i,j) = exp(-x(i,j)^2 / (2*s^2)) /s;
				#
	else
	  y(i,j) = 1e-25 ;
	endif
      endfor
    endfor
  endif

endfunction
