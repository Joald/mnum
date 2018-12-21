n = 11
D = diag(horzcat(1 : 10, [100]));
B = rand(n);
[Q,R] = qr(B);
#A = Q * D * Q';
A = B * D / B;
[lambda, v, k] = PowerMethod(A, rand(n, 1))
