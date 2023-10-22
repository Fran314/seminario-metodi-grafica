function fn = four_point_ex3_step (f, k)
  n = size(f, 1);
  fn = zeros(2*n - 1, 1);

  for i=0:n-1
    fn((2*i) +1) = f((i) +1);
  endfor

  for i=0:n-1
    l = mod(i, 2^k);

    % Case k = 0
    if (k == 0)
      fn((2*i + 1) +1) = ...
        [f(mod(i-1,n) +1); f(mod(i+0, n) +1); f(mod(i+1, n) +1); f(mod(i+2, n) +1)]' * ...
        [-1/16; 9/16; 9/16; -1/16];

       continue
    endif

    % Case k = 1
    if (k == 1)
      if(l == 0)
        % NOTE: this is not actually using 5 points because one of the weights is
        % zero. Read Theorem 4 and the prelude to understand why
        fn((2*i + 1) +1) = ...
          [f(mod(i-2,n) +1); f(mod(i-1, n) +1); f(mod(i, n) +1); f(mod(i+1, n) +1); f(mod(i+2, n) +1)]' * ...
          [-33/512; 0; 390/512; 120/512; 35/512];
      else
        % NOTE: this is not actually using 5 points because one of the weights is
        % zero. Read Theorem 4 and the prelude to understand why
        fn((2*i + 1) +1) = ...
          [f(mod(i-1,n) +1); f(mod(i, n) +1); f(mod(i+1, n) +1); f(mod(i+2, n) +1); f(mod(i+3, n) +1)]' * ...
          [35/512; 120/512; 390/512; 0; -33/512];
      endif

      continue
    endif

    % Case k >= 2
    if (l == 0)
      fn((2*i + 1) +1) = ...
        [f(mod(i+0,n) +1); f(mod(i+1, n) +1); f(mod(i+2, n) +1); f(mod(i+3, n) +1)]' * ...
        bki(k, l);
    elseif(l == 2^k - 1)
      fn((2*i + 1) +1) = ...
        [f(mod(i-2,n) +1); f(mod(i-1, n) +1); f(mod(i+0, n) +1); f(mod(i+1, n) +1)]' * ...
        bki(k, l);
    else
      fn((2*i + 1) +1) = ...
        [f(mod(i-1,n) +1); f(mod(i+0, n) +1); f(mod(i+1, n) +1); f(mod(i+2, n) +1)]' * ...
        bki(k, l);
    endif
  endfor
endfunction

function res = bki(k, i)
  if (i == 0)
    res = [ (5/16)  * (113 - 65 * 2^k + 6 * 4^k) / (100 - 60 * 2^k + 6 * 4^k); ...
            (15/16) * ( 87 - 55 * 2^k + 6 * 4^k) / (100 - 60 * 2^k + 6 * 4^k); ...
            (-5/16) * ( 61 - 45 * 2^k + 6 * 4^k) / (100 - 60 * 2^k + 6 * 4^k); ...
            (1/16)  * ( 35 - 35 * 2^k + 6 * 4^k) / (100 - 60 * 2^k + 6 * 4^k) ];
  elseif (i == 2^k - 1)
    res = [ (1/16)  * ( 35 - 35 * 2^k + 6 * 4^k) / (100 - 60 * 2^k + 6 * 4^k); ...
            (-5/16) * ( 61 - 45 * 2^k + 6 * 4^k) / (100 - 60 * 2^k + 6 * 4^k); ...
            (15/16) * ( 87 - 55 * 2^k + 6 * 4^k) / (100 - 60 * 2^k + 6 * 4^k); ...
            (5/16)  * (113 - 65 * 2^k + 6 * 4^k) / (100 - 60 * 2^k + 6 * 4^k) ];
  else
    res = [ (-1/16) * (5 * (7 + 8*i) * (7 + 8*i - 2^(k+3)) + 35 + 3*4^(k+2)) / (5 * (4 + 8*i) * (4 + 8*i - 2^(k+3)) + 80 + 3*4^(k+2)); ...
            (9/16)  * (5 * (5 + 8*i) * (5 + 8*i - 2^(k+3)) + 75 + 3*4^(k+2)) / (5 * (4 + 8*i) * (4 + 8*i - 2^(k+3)) + 80 + 3*4^(k+2)); ...
            (9/16)  * (5 * (3 + 8*i) * (3 + 8*i - 2^(k+3)) + 75 + 3*4^(k+2)) / (5 * (4 + 8*i) * (4 + 8*i - 2^(k+3)) + 80 + 3*4^(k+2)); ...
            (-1/16) * (5 * (1 + 8*i) * (1 + 8*i - 2^(k+3)) + 35 + 3*4^(k+2)) / (5 * (4 + 8*i) * (4 + 8*i - 2^(k+3)) + 80 + 3*4^(k+2)) ];
  endif
endfunction
