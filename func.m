function retval = func (step, pp, tp, tt)
  % Control polygon
  f0 = [0; 0; 0; 2; 3; 1; -2; -1; 0; 0; 0];

  f = f0;

  figure(1)
  plot(f, 'o-')
  axis off
  tt && title("f^0");
  saveas(gcf, sprintf("f_%d_%s_%d.svg", pp, tp, 0))

  for k=0:3
    f = step(f, k);

    figure(k+2)
    plot(f, 'o-')
    axis off
    tt && title(sprintf("f^%d", k+1));
  saveas(gcf, sprintf("f_%d_%s_%d.svg", pp, tp, k+1))
  endfor

  for k=4:10
    f = step(f, k);
  endfor

  figure(5)
  plot(f)
  axis off
  tt && title("f");
  saveas(gcf, sprintf("f_%d_%s_%s.svg", pp, tp, "f"))

  figure(6)
  plot(diff(f))
  axis off
  tt && title("f'");
  saveas(gcf, sprintf("f_%d_%s_%s.svg", pp, tp, "df"))

  figure(7)
  plot(diff(diff(f)))
  axis off
  tt && title("f''");
  saveas(gcf, sprintf("f_%d_%s_%s.svg", pp, tp, "ddf"))
endfunction
