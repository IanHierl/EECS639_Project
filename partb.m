n = 1000;
h = 0.01;

[ xs, ts ] = RungeKutta4( @Spring, [ 0.2; 0.0 ], 0, n, h )

plot( xs( 1, : ), ts );
hold on;
f = @ ( t ) ( cos(8*t)/5 );

xs_true = f( ts );

plot( xs_true, ts, 'r*' );

saveas( gcf, 'myfigure.pdf' );
hold off
