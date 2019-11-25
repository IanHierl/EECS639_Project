function [ ys, ts ] = EulerMethod( f, y_0, t_0, n, h )
ys = zeros( n+1 );
ys( 1 ) = y_0;
ts = zeros( n+1 );
ts = t_0;
for k = 2:n+1
    ys( k ) = ys( k - 1 ) + h*f( ts( k - 1 ), ys( k - 1 ) );
    ts( k ) = ts( k - 1 ) + h;
end
end