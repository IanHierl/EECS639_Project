n = 100;
h = 0.5;

[ ts, xs ] = EulerMethod( @Spring, [ 0.2, 0.0 ], 0, n, h )

hold on
plt = plot(  xs( 1, : ), ts );
saveas( plt, 'myfigure.pdf' );
hold off
