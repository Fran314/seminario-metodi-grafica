function fn = four_point_ex4_step (f, k)
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
        ([-1; 9; 9; -1] / 16);

       continue
    endif

    % Case k = 1
    if (k == 1)
      if(l == 0)
        % NOTE: this is not actually using 5 points because one of the weights is
        % zero. Read Theorem 4 and the prelude to understand why
        fn((2*i + 1) +1) = ...
          [f(mod(i-2,n) +1); f(mod(i-1, n) +1); f(mod(i, n) +1); f(mod(i+1, n) +1); f(mod(i+2, n) +1)]' * ...
          ([-41; 0; 462; 104; 51] / 576);
      else
        % NOTE: this is not actually using 5 points because one of the weights is
        % zero. Read Theorem 4 and the prelude to understand why
        fn((2*i + 1) +1) = ...
          [f(mod(i-1,n) +1); f(mod(i, n) +1); f(mod(i+1, n) +1); f(mod(i+2, n) +1); f(mod(i+3, n) +1)]' * ...
          ([51; 104; 462; 0; -41] / 576);
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
    if (k == 2)
      res = [253; 471; -61; -7] / 656;
    elseif (k == 3)
      res = [99; 393; -163; 39] / 368;
    else
      res = [5; 15; -5; 1] / 16;
    endif

  elseif (i == 2^k - 1)
    if (k == 2)
      res = [-7; -61; 471; 253] / 656;
    elseif (k == 3)
      res = [39; -163; 393; 99] / 368;
    else
      res = [1; -5; 15; 5] / 16;
    endif

  % See (22a)
  elseif(i == 2^(k-2))
    res = [-57; 417; 321; -25] / 656;
  elseif(i == 3*2^(k-2) - 1)
    res = [-25; 321; 417; -57] / 656;

  % See (22b)
  elseif(i == 2^(k-2) - 1 && k >= 3)
    res = [-7; 159; 255; -39] / 368;
  elseif(i == 3*2^(k-2) && k >= 3)
    res = [-39; 255; 159; -7] / 368;

  else
    res = [-1; 9; 9; -1] / 16;
  endif
endfunction
