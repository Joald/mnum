function [x,n] = Jacobi(A, b, tol=1e-8, nmax=1e6)
  n = 0;
  xn = zeros(columns(A), 1);
  Q = diag(diag(A));
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