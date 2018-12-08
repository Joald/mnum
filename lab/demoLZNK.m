a = 1;
b = -5;
c = 2;

for m = [10, 20, 100, 1000 ,10000]
  x = [0 : 10 / (m - 1) : 10]';
  A = ones(m, 3);
  A(:, 1) = x .* x;
  A(:, 2) = x;
  epsmax = 1 / 100;
  y = a * x .* x + b * x + c + rand(m,1) * epsmax / 2 - epsmax;
  [xD, R, B] = Householder(A, y);
  printf("m=%d\n  a = %g\n  b = %g\n  c = %g\n", m, xD(1), xD(2), xD(3));
  for i = 3 : -1 : 1
    v = B(i:m, i);
    hhmul = @(z) z - 2 * dot(v, z) * v;
    for j = i : 3
      R(i:m, j) = hhmul(R(i:m, j));
    endfor
  endfor
  printf("  The error is %g\n\n", norm(A - R) / norm(A));
endfor


