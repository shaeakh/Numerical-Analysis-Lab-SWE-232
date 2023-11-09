function RootFindingMethod03 = Newton_Raphson()

  function [y, dy] = f(x)
      y = x.^3 - 3*x - 5;
      dy = 3*x.^2 - 3;
  end


  x0 = 2;
  tol = 1e-6;

  Roots = [];
  Slope = [];
  iterations = 0;

  while true
      [y, dy] = f(x0);
      x1 = x0 - y / dy;
      Roots = [Roots; x1];
      Slope = [Slope; [x0, y, dy]];

      if abs(x1 - x0) < tol
          break;
      end

      x0 = x1;
      iterations = iterations + 1;
  end

  fprintf('%d iterations need: %f\n', iterations, Roots(end));


  x = 0:0.1:05;
  [y, dy] = f(x);

  figure;
  plot(x, y);
  hold on;
  plot(Roots, f(Roots), 'ro');
  for i = 1:length(Roots)
      x_tangent = Roots(i) - 1:0.01:Roots(i) + 1;
      y_tangent = Slope(i, 2) + Slope(i, 3) * (x_tangent - Roots(i));
      plot(x_tangent, y_tangent, 'g--');
  end
  xlabel('x');
  ylabel('functions value');
  title('Newton-Raphson Method');
  legend('f(x)', 'Roots', 'Tangent Lines');
  grid on;

endfunction
