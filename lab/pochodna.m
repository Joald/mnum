errs = [0];
for k = 1 : 70
  arg = 2*pi
  h = 0.5^k;
  d = @(f, x) (f(x+h)-f(x))/h;
  prim = d(@(x) cos(x), arg);
  err = abs(prim + sin(arg)); # cos'x=-sin x
  errs = horzcat(errs, [err]);
  printf("h=%g, cos'(1)=%g, err=%g\n", h, prim, err);
endfor  
semilogy(errs);