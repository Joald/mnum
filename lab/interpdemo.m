f = @(x) cos(3 * x);
fint = [-2 * pi, pi];
f_x = @(n) linspace(fint(1), fint(2), n)';
g = @abs;
gint = [-10, 10];
g_x = @(n) linspace(gint(1), gint(2), n)';

cheby = @(a, b) @(n) (a + b) / 2 + cos((pi / 2) * (2 * (0 : n - 1)' + 1) / n) * (b - a) / 2;

f_cheby = cheby(fint(1), fint(2));
g_cheby = cheby(gint(1), gint(2));
printf("a)\n");

finterv = f_x(1000);
finterp = @(knots) Horner(interpNewton(knots, f(knots)), knots, finterv);

subplot(2, 3, 1); # First plot of f
plot(
  finterv, f(finterv), 'g', 
  finterv, finterp(f_x(4)), 'b',
  finterv, finterp(f_x(16)), 'r'
);

subplot(2, 3, 2); # Second plot of f
plot(
  finterv, f(finterv), 'g', 
  finterv, finterp(f_cheby(4)), 'b',
  finterv, finterp(f_cheby(16)), 'r'
);

subplot(2, 3, 3); # Third plot of f
fbsplv = @(knots) Bsplval(finterv, Bsplnat(f(knots)), fint(1), fint(2));

plot(
  finterv, f(finterv), 'g', 
  finterv, fbsplv(f_x(4)), 'b',
  finterv, fbsplv(f_x(16)), 'r'
);

ginterv = g_x(1000);
ginterp = @(knots) Horner(interpNewton(knots, g(knots)), knots, ginterv);

subplot(2, 3, 4); # First plot of g
plot(
  ginterv, g(ginterv), 'g', 
  ginterv, ginterp(g_x(4)), 'b',
  ginterv, ginterp(g_x(16)), 'r'
);

subplot(2, 3, 5); # Second plot of g
plot(
  ginterv, g(ginterv), 'g', 
  ginterv, ginterp(g_cheby(4)), 'b',
  ginterv, ginterp(g_cheby(16)), 'r'
);

subplot(2, 3, 6); # Third plot of g
gbsplv = @(knots) Bsplval(ginterv, Bsplnat(g(knots)), gint(1), gint(2));

plot(
  ginterv, g(ginterv), 'g', 
  ginterv, gbsplv(g_x(4)), 'b',
  ginterv, gbsplv(g_x(16)), 'r'
);

printf("b)\n");
for n = [4, 16, 64]
  printf("n=%d\n", n);
  ferr = @(finterped) max(finterped - f(finterv));
  printf("  f:\n\tpoly_equid_err=%g\n\tpoly_cheby_err=%g\n\tbspl_equid_err=%g\n",
    ferr(finterp(f_x(n))),
    ferr(finterp(f_cheby(n))),
    ferr(fbsplv(f_x(n)))
  );
  gerr = @(ginterped) max(ginterped - g(ginterv));
  printf("  g:\n\tpoly_equid_err=%g\n\tpoly_cheby_err=%g\n\tbspl_equid_err=%g\n",
    gerr(ginterp(g_x(n))),
    gerr(ginterp(g_cheby(n))),
    gerr(gbsplv(g_x(n)))
  );
endfor
