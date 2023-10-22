function fn = two_point_stationary_step (f, k)
  % NB: questa funzione non ha bisogno di k, ma lo inseriamo comunque nell'input
  % per compatibilità con le altre funzioni step
  n = size(f, 1);
  fn = zeros(2*n - 1, 1);

  for i=0:n-1
    fn((2*i) +1) = f((i) +1);
  endfor

  for i=0:n-1
    fn((2*i + 1) +1) = f((i) +1) * (1/2) + f(mod(i+1, n) +1) * (1/2);
  endfor
endfunction
