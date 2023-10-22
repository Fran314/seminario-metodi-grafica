function fn = step (f, k)
  n = size(f, 1);
  fn = zeros(2*n - 1, 1);

  for i=0:n-1
    fn((2*i) +1) = f((i) +1);
  endfor

  for i=0:n-1
    fn((2*i + 1) +1) = f((i) +1) * a(k, mod(i, 2^k)) + f(mod(i+1, n) +1) * b(k, mod(i, 2^k));
  endfor
endfunction

function res = delta(k, i)
  res = (2*i + 1 - 2^k) / (3 * (2*i + 1)^2 - 6*(2*i + 1) * (2^k) + 1);
endfunction

function res = a(k, i)
  res = 1/2 + 3*delta(k, i) / 2;
endfunction

function res = b(k, i)
  res = 1/2 - 3*delta(k, i) / 2;
endfunction
