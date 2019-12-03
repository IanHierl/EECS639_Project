% might want to change the n argument to there being a t_max and use
% linspace to generate them all at once?

[ ys1, ts1 ] = EulerMethod( @f1, 1, 0, 10, .5 );
[ ys2, ts2 ] = BackEM( @f1, 1, 0, 10, .5 );
[ ys3, ts3 ] = RungeKutta4( @f1, 1, 0, 10, .5 );

hold
% true solution
xs1 = linspace( 0, 5, 1000 );
plot( xs1, exp( xs1 ), 'kx' );

% euler's method calculated solutions
plot( ts1, ys1, 'r' );
plot( ts2, ys2, 'g' );
plot( ts3, ys3, 'b' );

hold off

function r = f1( t, y )
r = y;
end