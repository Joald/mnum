function [x,n] = GaussSeidel(A, b, tol=1e-8, nmax=1e6)
  n = 0;
  xn = zeros(rows(A), 1);
  Q = tril(A);
  Z = Q - A;
  while n < nmax
    xprev = xn;
    xn = Q \ (Z * xn + b);
    n += 1;
    if norm(xn-xprev) <= tol
      break;
    endif
  endwhile
  x = xn;
endfunction
  