n = 1000;
h = 0.01;
u0 = [0.2;0.0];
t0 = 0;
ts = linspace(t0, t0+h*n, n+1);

methods = {@EulerMethod, @BackEM, @Trapezoid, @RK4, @A4};
figs = zeros(5,1);
figs(1) = figure('Name', 'Euler');
figs(2) = figure('Name', 'Backward Euler');
figs(3) = figure('Name', 'Trapezoid');
figs(4) = figure('Name', 'Runge-Kutta4');
figs(5) = figure('Name', 'Adams-Bashforth/Moulton PECE');

f = @(t)(cos(8*t)/5);
xs_true = f(ts);

for i=1:5
    figure(figs(i));
    [xs,~] = methods{i}(@Spring,u0,t0,n,h);
    hold on;
    plot(xs(1,:),ts);
    plot(xs_true, ts, 'r.');
    %saveas(gcf, 'myfigure.pdf');
    hold off;
end


