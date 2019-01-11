function c = interpNewton(x, y)
  c = y;
  for i = 1 : rows(y)
    c(i) = y(i);
    for j = rows(y) : -1 : i + 1
      y(j) = (y(j) - y(j - 1)) / (x(j) - x(j - i));
    endfor
  endfor
endfunction
