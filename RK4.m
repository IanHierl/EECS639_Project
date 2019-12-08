function [ ys, ts ] = RungeKutta4( f, y_0, t_0, n, h )
% f     - function handler, y' = f( t, y )
% y_0   - initial value
% t_0   - initial time
% n     - number of steps
% h     - step size

deg = length( y_0 );
ys = zeros( deg, n + 1 );
ts = linspace( t_0, t_0 + h*n, n + 1 );
ys( :, 1 ) = y_0;

for k=1:n
    k1 = f( ts( k ), ys( :, k ) );
    k2 = f( ts( k ) + h/2, ys( :, k ) + ( ( k1 * h ) / 2 ) );
    k3 = f( ts( k ) + h/2, ys( :, k ) + ( ( k2 * h ) / 2 ) );
    k4 = f( ts( k + 1 ), ys( :, k ) + k3 * h );
    ys( :, k + 1 ) = ys( :, k ) + ( h / 6 ) * ( k1 + 2*k2 + 2*k3 + k4 );
end
end

