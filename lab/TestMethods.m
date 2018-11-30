function x = TestMethods(A, b, xstar) 
  [x, its] = Jacobi(A, b);
  printf("    Jacobi found using %d iterations a solution", its);
  err = norm(x - xstar) / norm(xstar);
  printf(" with error %g\n", err);
  
  [x, its] = GaussSeidel(A, b);
  printf("    GaussSeidel found using %d iterations a solution", its);
  err = norm(x - xstar) / norm(xstar);
  printf(" with error %g\n", err);
  
  [x, ~, ~, its] = pcg(A, b, 1e-8, 100);
  printf("    Conjugate gradients found using %d iterations a solution", its);
  err = norm(x - xstar) / norm(xstar);
  printf(" with error %g\n", err);
endfunction
