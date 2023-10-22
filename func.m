function retval = func (step, dd)
  steps = 10;

  % Control polygon
  f0 = [0; 0; 0; 2; 3; 1; -2; -1; 0; 0; 0];
  f = f0;

  figure(1)
  plot(f, 'o-')
  title("f^0")

  for k=0:steps - 1
    f = step(f, k);

    if (k < 4)
      figure(k+2)
      plot(f, 'o-')
      title(sprintf("f^%d", k+1))
    endif
  endfor

  figure(5)
  plot(f)
  title("f")

  figure(6)
  plot(diff(f))
  title("f'")

  if dd
    figure(7)
    plot(diff(diff(f)))
    title("f''")
  endif
endfunction
