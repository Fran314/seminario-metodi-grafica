f0 = rand(4,1)

f = f0

function y = rn1 (x)
  if x <= 1/4
    y = x * (-(1/2) + (1/2) * x + (13/18) * x^2);
  elseif x <= 3/4
    y = (1/36) - (5/6) * x + (11/6) * x ^2 - (19/18) * x^3;
  else
    y = -(13 / 18) * (1 - x)^3;
  endif
endfunction

function y = r1 (x)
  if x <= 1/4
    y = x * ((1/2) + (1/2) * x + (13/18) * x^2);
  elseif x <= 3/4
    y = (1/12) - (1/2) * x + (9/2) * x ^2 - (19/6) * x^3;
  else
    y = 1 - (1-x)^2 * ((19/6) - (13/6) * x);
  endif
endfunction

function y = r0 (x)
  if x <= 1/4
    y = 1 - x^2 * (1 + (13/6) * x);
  elseif x <= 3/4
    y = (11/12) + x - 5*x^2 + (19/6) * x^3;
  else
    y = (1 -x) * ((13/18) - (35/18) * x +(13/18)*x ^ 2);
  endif
endfunction

function y = r2 (x)
  if x <= 1/4
    y = - (13/18) * x^3;
  elseif x <= 3/4
    y = - (1/36) + (1/3) * x - (4/3) * x^2 + (19/18) * x^3;
  else
    y = (1-x) * ((13/18) - (35/18) * x + (13/18) * x^2);
  endif
endfunction

m = 3

for k=0:3
  f = four_point_ex4_step(f, k);
endfor

fm = rn1(m/16) * f0(3 + 1) + r0(m/16) * f0(0 + 1) + r1(m/16) * f0(1 + 1) + r2(m/16) * f0(2 + 1)


abs_err = (f(m + 1) - fm)
rel_err = abs_err / f(m+1)
