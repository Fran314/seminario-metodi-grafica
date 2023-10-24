function retval = polygon (step, pp, tp, tt)
  % Control polygon
  fx0 = [0; 1; 1; 0.4; 0];
  fy0 = [0; 0; 1; 0.5; 1];

  fx = fx0;
  fy = fy0;

  figure(1)
  plot([fx; fx(1)], [fy; fy(1)], 'o-')
  axis equal
  axis off
  tt && title("f^0");
  saveas(gcf, sprintf("p_%d_%s_%d.svg", pp, tp, 0))

  for k=0:3
    fx = step(fx, k);
    fy = step(fy, k);

    figure(k+2)
    plot([fx; fx(1)], [fy; fy(1)], 'o-')
    axis equal
    axis off
    tt && title(sprintf('f^%d', k+1));
    saveas(gcf, sprintf("p_%d_%s_%d.svg", pp, tp, k+1))
  endfor

  for k=4:10
    fx = step(fx, k);
    fy = step(fy, k);
  endfor

  figure(6)
  plot([fx; fx(1)], [fy; fy(1)])
  axis equal
  axis off
  tt && title("f");
  saveas(gcf, sprintf("p_%d_%s_%s.svg", pp, tp, "f"))
endfunction
