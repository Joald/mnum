# LZNK: ||Az-b||_2
# A = pierwsze m kolumn macierzy Vandermonde'a
# x = linspace(0, 1, n); # wektor poziomy
# A = fliplr(vander(x))(:,:m);
# b = x 
# z = [0;1;0;...;0] (m liczb)
# Prawdziwy błąd to ||Az-b||/||b||=0;
# Nasz błąd to ||Az*-b||/||b||
# mamy też ||z*-z||/||z||
# dla n=100, m=2,10,20,100
# 
# Metody:
# 1. z1 = A\b
# 2. [Q,R] = qr(A), z2=R(1:m,:) \ ((Q' * b)(1:m));
# 3. układ równań normalnych
#    x^TA^TAx=||Ax||_2^2 czyli A^TA jest nieujemnie określona,
#    a jeśli dla każdych i,j elementy na tych pozycjach w wektorze vandermonda są różne 
#    to macierz jest pełnego rzędu więc dodatnio określona i możemy zrobić choleskiego
#    L = chol(A'*A, 'lower');
#    z3 = L'\(L\(A'b));
#
n = 100;
for m = [2, 10, 20, 100]
    printf("m=%d\n", m);
    x = linspace(0, 1, n);
    A = fliplr(vander(x))(:,1:m);
    b = x';
    z = zeros(m);
    z(2) = 1;
    e1 = @(ztilde) norm(A*ztilde-b) / norm(b);
    e2 = @(ztilde) norm(z-ztilde) ;
    z1 = A\b;
    [Q, R] = qr(A);
    z2 = R(1:m, :) \ ((Q' * b)(1:m));
# this doesn't work bc floating point errors make the matrix non positive definite
#    L = chol(A' * A, 'lower');
#    z3 = L' \ (L \ (A' * b));
    [L, U, P] = lu(A' * A);
    z3 = U \ (L \ (P * A' * b));
    for zp = [z1, z2, z3]
        disp("Wektor:");
        disp(zp);
        printf("||Az*-b||/||b|| = %g\n", e1(zp));
        printf("||z*-z||/||z|| = %g\n", e2(zp));
    endfor
endfor
    
#macierz vandermonde'a jest źle uwarunkowana.


