function fn = step (f)
  n = size(f, 1);
  fn = zeros(2*n - 1, 1);

  for i=0:n-1
    fn((2*i) +1) = f((i) +1);
  endfor

  for i=0:n-1
    fn((2*i + 1) +1) = f((i) +1) * (1/2) + f(mod(i+1, n) +1) * (1/2);
  endfor
endfunction
