close all;

% constants determined by trial and error with random input

constants = [
   1.311147070430053 ;
   4.350407178956268 ;
   0.915131672126108 ;
   2.146269580129458 ;
   0.109790922908117 ;
   5.732603832633724 ];

% initial conditions are relatively predictable for values < 0.1

u0 = [0.005; 0.005; 0.005; ]

% get a function handler w/ constants partially applied
func = BZ( constants );

% set step sizes and timespan

t0 = 0;
tf = 2500;
n =  10000;
h = (tf - t0)/n;

methods = {@EulerMethod, @BackEM, @Trapezoid, @RK4, @A4};
names = {'Euler', 'Backward Euler', 'Trapezoid', 'Runge-Kutta 4', 'Adams-Bashforth/Moulton PECE' };

for method_iter=1:5
    [ us, ts ] = methods{method_iter}( func, u0, 0, n, h );
    colors = {'r', 'g', 'b' };
    subplot( 5, 1, method_iter );
    hold on;
    for i=1:3
        plot( ts, us( i, :), colors{i} );
    end
    legend( 'X(t)', 'Y(t)', 'Z(t)' );
    title( names{method_iter} );
    hold off;
end