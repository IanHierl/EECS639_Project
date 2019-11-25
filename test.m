% might want to change the n argument to there being a t_max and use
% linspace to generate them all at once?
[ ys1, ts1 ] = EulerMethod( @f1, 1, 0, 10, 0.5 );
[ ys2, ts2 ] = EulerMethod( @f1, 1, 0, 20, 0.25 );
[ ys3, ts3 ] = EulerMethod( @f1, 1, 0, 40, 0.125 );
[ ys4, ts4 ] = EulerMethod( @f1, 1, 0, 100, 0.05 );

hold
% true solution
xs1 = linspace( 0, 5, 1000 );
plot( xs1, exp( xs1 ), 'k' );

% euler's method calculated solutions
plot( ts1, ys1, 'r' );
plot( ts2, ys2, 'y' );
plot( ts3, ys3, 'g' );
plot( ts4, ys4, 'b' );

hold off

function r = f1( t, y )
r = y;
end