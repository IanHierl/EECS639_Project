function [ ys, ts ] = EulerMethod( f, y_0, t_0, n, h )
deg = length( y_0 );
ys = zeros( deg, n+1 );
ys( :, 1 ) = y_0;
ts = linspace( t_0, t_0 + h*n, n + 1 );

for k = 2:n+1
    ys( :, k ) = ys( :, k - 1 ) + h*f( ts( k - 1 ), ys( :, k - 1 ) );
end
end
