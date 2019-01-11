function c = Bsplnat(y)
  A = gallery('tridiag', length(y) + 2, 1 / 6, 2 / 3, 1 / 6);
  A(1, 1 : 3) = A(end, end - 2 : end) = [1, -2, 1];
  c = A \ [0; y; 0];
endfunction
