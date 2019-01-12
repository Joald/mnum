# interpolacja wielomianowa
function n = do_interpol(f, x, z, sp=1)
  #z = linspace(-pi, 2 * pi, 1000);
  p = polyfit(x, f(x), length(x) - 1);
# x - węzły interpolacji
# y - wartości w węzłach
# x, y - długość n
# trzeci argument trzeba wpisać n-1
# p - współczynniki wielomianu w bazie standardowej


  w = polyval(p, z);
# p - retval of polyfit
# z - punkty
# w - wartości w pktach
  subplot(5, 1, sp)
  plot(z, f(z), 'r', z, w, 'b');

  n = norm(f(z) - w, inf);
endfunction

