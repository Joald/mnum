# Qx_k=(Q-A)x_{k-1}+b
# Jacobiego Q=D
# gałszeidl Q=L+D, Q-A=U

for n = [10, 20, 50, 100, 500, 1000]
  
  printf("n = %d\n", n);
  
  
  printf("  Random matrix:\n");
  A = rand(n) + eye(n) * n;
  xstar = rand(n, 1);
  b = A * xstar;
  
  TestMethods(A, b, xstar);
  
  printf("  tridiagonal matrix 1 2 1:\n");
  
  A = spdiags([ones(n, 1), 2 * ones(n, 1), ones(n, 1)], [-1, 0, 1], n, n);
  b = A * xstar;
  
  TestMethods(A, b, xstar);
  
  
  if n <= 20 # this matrix is THAT bad
    printf("  Hilbert matrix:\n");
  
    A = hilb(n);
    b = A * xstar;
    TestMethods(A, b, xstar);
  endif
  
endfor