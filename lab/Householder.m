function [x, R, B] = Householder (A, y)
  n = columns(A);
  m = rows(A);
  B = zeros(m,n);
  R = A;
  for i = 1 : n
    v = R(i:m, i);
    if v(1) < 0 
      v(1) -= norm(v);
    else
      v(1) += norm(v);
    endif
    v /= norm(v);
    B(i:m, i) = v;
    hhmul = @(z) z - 2 * dot(v, z) * v;
    for j = i : n
      R(i:m, j) = hhmul(R(i:m, j));
    endfor
    y(i:m) = hhmul(y(i:m));
  endfor
  x = R \ y;
endfunction
