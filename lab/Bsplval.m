function v = Bsplval(z, c, a, b)
% przedział [a,b]
% z - wektor punktów
% c - współczynniki
  n_knots = length(c) - 2;
  N = n_knots + 6;

  dist = (b - a) / (n_knots - 1);
  start = a - 3 * dist;
  finish = b + 3 * dist;
  t = linspace(start, finish, N)';
  v = zeros(length(z), 1);
  for l = 1 : length(z)
    x = z(l);
    knew = floor((x - start) / dist + 1) - (x == b)
    k = findInterval(x, t)
    d = zeros(3,1);
    for i = k - 3 : k
      d(i) = c(i);
    endfor
    for j = 1 : 3 % albo 2
      for i = (k - 3 + j): k
        alpha = (x - t(i)) / (t(i + 3 + 1 - j) - t(i));
        d_prev(i) = (1 - alpha) * d(i - 1) + alpha * d(i);
      endfor
      d = d_prev;
    endfor
    v(l) = d(k);
  endfor
endfunction

function k = findInterval(z,t)
  n = length(t);
  k = 0;
  for i = 1 : (n - 1)
    k = i;
    if t(i) <= z && t(i+1) > z
      break;
    endif
  endfor
endfunction

