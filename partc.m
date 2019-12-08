constants = [ 0.8319, 0.1343, 0.0605, 0.0842, 0.1639, 0.3242, 0.3017 ];

u0 = [ 3; 5; 5; 2; 0; ];
u0 = u0./(u0'*u0);

func = BZ( constants );

t0 = 0;
tf = 50;
n = 10000;
h = (tf - t0)/n;

[ us, ts ] = RK4( func, u0, 0, n, h );
colors = {'k', 'y', 'r', 'g', 'b'};

hold on;
for i=1:5
    plot( ts, us( i, : ), colors{i} );
end
hold off;