function retval = polygon (step)
  steps = 4;

  % Control polygon
  fx0 = [0; 1; 1; 0.4; 0];
  fy0 = [0; 0; 1; 0.5; 1];

  fx = fx0;
  fy = fy0;

  figure(1)
  plot([fx; fx(1)], [fy; fy(1)], 'o-')
  axis equal
  title("f^0")

  for k=0:steps - 1
    fx = step(fx, k);
    fy = step(fy, k);

    figure(k+2)
    plot([fx; fx(1)], [fy; fy(1)], 'o-')
    axis equal
    title(sprintf('f^%d', k+1))
  endfor
endfunction
