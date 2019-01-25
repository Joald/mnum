function [x, steps] = NewtonMethod(f, x0, tol=1e-8, limit=100000)
  diff = @(y) (f(y + tol) - f(y)) / tol;
  x = x0;
  steps = 0;
  while abs(f(x)) > tol
    x -= f(x) / diff(x);
    steps += 1;
    if steps > limit
      break;
    endif
  endwhile
  
endfunction
