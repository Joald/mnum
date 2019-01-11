function v = Bsplval(z, c, a, b)
  dist = (b - a) / (length(c) - 3);
  start = a - 3 * dist;
  t = linspace(start, b + 3 * dist, length(c) + 4)';
  v = [];
  for x = z'
    k = floor((x - start) / dist + 1) - (x == b);
    d(k - 3 : k) = c(k - 3 : k);
    for j = 2 : -1 : 0
      for i = k : -1 : k - j
        alpha = (x - t(i)) / (t(i + j + 1) - t(i));
        d(i) = (1 - alpha) * d(i - 1) + alpha * d(i);
      endfor
    endfor
    v = [v; d(k)];
  endfor
endfunction
