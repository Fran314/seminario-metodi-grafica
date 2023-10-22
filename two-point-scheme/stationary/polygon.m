%%% 2-point scheme

steps = 4;
visual = 'o-';

% Control polygon
fx0 = [0; 1; 1; 0.4; 0];
fy0 = [0; 0; 1; 0.5; 1];

fx = fx0;
fy = fy0;

for k=0:steps - 1
  fx = step(fx);
  fy = step(fy);
endfor

plot([fx; fx(1)], [fy; fy(1)], visual)
axis equal
