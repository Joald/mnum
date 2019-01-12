function v = Horner (c, x, z)
  n = rows(x);
  v = ones(rows(z), 1) * c(n);
  for i = n - 1 : -1 : 1
    v = v .* (z - x(i)) + c(i);
  endfor
endfunction
