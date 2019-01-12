j = 1
for i = [5,9,17,33,65]
    #chebyshev na [a;b]:
    # x(i) = (a + b) / 2 + (b - a) / 2 * cos((2*i-1)/2*n * pi) for i in range(1, n)
    n = do_interpol(@sin, linspace(-pi, 2 * pi, i), linspace(-pi, 1 * pi, 2000), j)
    j += 1
endfor
