function [ ys, ts ] = BackEM( f, y_0, t_0, n, h )
% f      - function handler, y' = f( t, y )
% y_0    - initial value
% t_o    - initial input
% n      - number of steps to take
% h      - step size
% y_k+1 = y_k + h*f( t_k+1, y_k+1 );

    function r = g( t, y_0 )
        r = @( y ) ( y_0 + h * f( y, t ) );
    end

ys = zeros( n + 1 );
ts = zeros( n + 1 );
ys( 1 ) = y_0;
ts( 1 ) = t_0;

for k=2:n+1
    ts( k ) = ts( k - 1 ) + h;
    ys( k ) = ys( k - 1 );
    ys( k ) = FixedPoint( g( ts( k ), ys( k - 1 ) ), ys( k ), 32 );
end

end