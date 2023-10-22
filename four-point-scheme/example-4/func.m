%%% 2-point scheme

steps = 10;
visual = 'o-';

% Control polygon
f0 = [0; 0; 0; 2; 3; 1; -2; -1; 0; 0; 0];

f = f0;
for k=0:steps - 1
  f = step(f, k);
endfor

figure(1)
plot(f)
title("function")

figure(2)
plot(diff(f), '.')
title("derivative")

figure(3)
plot(diff(diff(f)), '.')
title("second derivative")
