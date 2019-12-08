close all;
constants = 25.*[ 1; 0.001; 1; 0.1; 0.01; 0.01; 0.1; 1 ];

% u0 = [A0; B0; X0; Y0; Z0; P0; ];
u0 = randi( 25, 6, 1 ) + [5;5;5;5;5;5;];
u0( 6 ) = 0;
u0 = 0.25*u0 ./ (u0'*u0);

func = BZ( constants );

t0 = 0;
tf = 250;
n = 100000;
h = (tf - t0)/n;

[ us, ts ] = A4( func, u0, 0, n, h );
colors = {'k', 'y', 'r', 'g', 'b', 'cyan' };

subplot( 4, 2, 1 );
hold on;
for i=1:6
    plot( ts, us( i, :), colors{i} );
end;

subplot( 4, 2, 2 );
plot( us( :, 1 ), us( :, 5 ) );

subplot( 4, 2, 3 );
plot( us( :, 3 ), us( :, 4 ) );

hold off;