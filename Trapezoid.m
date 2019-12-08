function [ ys, ts ] = Trapezoid( f, y_0, t_0, n, h )

  function r = g( t, y_0, t_0 )
    r = @( y ) ( y_0 + h * ( f( t_0, y_0 ) + f( t, y ) ) ./ 2 );
  end

deg = length( y_0 );
ys = zeros( deg, n + 1 );
ts = linspace( t_0, t_0 + h*n, n + 1 );
ys( :, 1 ) = y_0;

for k=2:n + 1
  ys( :, k ) = FixedPoint( g( ts( k ), ys( :, k - 1 ), ts( k - 1 ) ), ys( :, k - 1 ), 32 );
end
end
