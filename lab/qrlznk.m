A = [1,5;2,6;3,7;4,8];
b = ones(4, 1);
x = A\b
r = @(x) norm(b - A * x) / norm(b);
disp(x);
disp("r =");
disp(r(x));

[Q,R] = qr(A);# liczy całą macierz Q zamiast używać Householdera !!!
qr_error = norm(A - Q * R)
q_orth_error = norm(Q*transpose(Q) - eye(4))
