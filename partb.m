% Set step sizes and bounds
t0 = 0;
tf = 50;
h = 0.01;

n = floor( (tf-t0)/h );
u0 = [0.2;0.0];
ts = linspace(t0, t0+h*n, n+1);

methods = {@EulerMethod, @BackEM, @Trapezoid, @RK4, @A4};
names = {'Euler', 'Backward Euler', 'Trapezoid', 'Runge-Kutta 4', 'Adams-Bashforth/Moulton PECE', 'Exact Solution' };
f = @(t)(cos(8*t)/5);
xs_true = f(ts);

% Plot and calculate for each solver
for i=1:5
    subplot(6,1,i);
    if( i == 6 )
        xs = f(ts);
    else
        [xs,~] = methods{i}(@Spring,u0,t0,n,h);
    end
    plot(ts, xs(1,:));
    title( names{i} );
end