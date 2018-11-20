n = 10000;
#H = hilb(n);
H = rand(n);
xstar = ones(n,1);
b = H * xstar; 
x1 = H \ b;
x2 = inv(H) * b;
r = @(x) norm(b - H * x) / norm(b);
e = @(x) norm(x - xstar) / norm(xstar);

printf("n =%f\n", n)

disp("gauss")
disp(r(x1))
disp(e(x1))
disp("inverse")
disp(r(x2))
disp(e(x2))

#x3 = invhilb(n) * b; 
# Analytic inverse gives much worse outputs than numerical
#disp("analytic inverse")
#disp(r(x3))
#disp(e(x3))