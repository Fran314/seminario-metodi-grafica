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
  if (i < 2^(k-1))
    res = 1 / (2 * i + 1);
  else
    res = 1 / (2 * i + 1 - 2^(k+1));
  endif
endfunction

function res = a(k, i)
  if (k == 0)
    res = 1/2;
  else
    res = 1/2 + delta(k, i) / 4;
  endif
endfunction

function res = b(k, i)
  if (k == 0)
    res = 1/2;
  else
    res = 1/2 - delta(k, i) / 4;
  endif
endfunction
