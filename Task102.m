function RootFindingMethod01 = bisection ()

function y = f(x)
    y = x.^3 - 2*x.^2- 4 ;
end

  a = 0;
  b = 3;
  tol = 1e-5;
  Roots = [];

while (b - a) / 2 > tol
    c = (a + b) / 2;
    Roots = [Roots; c];
    if f(c) == 0
        break;
    elseif f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end

  fprintf('%d iterations needed: %f\n', Roots(end));

  x = 0:0.1:10;
  y = f(x);

  figure;
  plot(x, y);
  hold on;
  plot(c, f(c), 'or');
  xlabel('x');
  ylabel('function values');
  title('Bisection Method');
  set(gca, 'xAxisLocation', 'origin');
  legend('function values ', 'Roots');
  grid on;



endfunction
