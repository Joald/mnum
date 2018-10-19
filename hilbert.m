n = 20;
H = hilb(n);
xstar = ones(n,1);
b = H * xstar; 
x1 = H \ b;
x2 = inv(H) * b;
r = @(x) norm(b - H * x) / norm(b);
e = @(x) norm(x - xstar) / norm(xstar);

disp("gauss")
disp(r(x1))
disp(e(x1))
disp("inverse")
disp(r(x2))
disp(e(x2))