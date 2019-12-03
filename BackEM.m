function [ ys, ts ] = BackEM( f, y_0, t_0, n, h )
% f      - function handler, y' = f( t, y )
% y_0    - initial value
% t_o    - initial input
% n      - number of steps to take
% h      - step size
% y_k+1 = y_k + h*f( t_k+1, y_k+1 );

    function r = g( t, y_0 )
        r = @( y ) ( y_0 + h * f( t, y ) );
    end

ys = zeros( 1, n + 1 );
ts = linspace( t_0, t_0 + h*n, n + 1 );
ys( 1 ) = y_0;

for k=2:n+1
    ys( k ) = FixedPoint( g( ts( k ), ys( k - 1 ) ), ys( k - 1 ), 32 );
end

end