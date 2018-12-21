function [lambda, v, k] = PowerMethod(A, x0, tol = 1e-12, kmax=10000)
  k = 0;
  xn = x0;
  lambda = 1e200;
  while k < kmax
    k += 1;
    xprev = xn;
    yn = A * xn;
    xn = yn / norm(yn);
    lambda2 = yn' * xprev;
    if abs(lambda2 - lambda) <= tol
      lambda = lambda2;
      break;
    endif
    lambda = lambda2;
    printf("err = %g\n", abs(lambda - 100) / 100)
  endwhile
  v = xn;
endfunction
