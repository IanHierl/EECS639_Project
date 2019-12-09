close all;
%constants = 5*rand( 6, 1 );

% u0 = [A0; B0; X0; Y0; Z0; P0; ];
%u0 = randi( 100, 6, 1 ) + 50*ones( 6, 1 );
%u0( 6 ) = 0;
%u0 = 0.25*u0 ./ (u0'*u0);

func = BZ( constants );

t0 = 0;
tf = 1500;
n = 10000;
h = (tf - t0)/n;


[ us, ts ] = A4( func, u0, 0, n, h );
colors = {'k', 'y', 'r', 'g', 'b', 'cyan' };
figure();

hold on;
for i=1:5
    plot( ts, us( i, :), colors{i} );
end;
hold off;
%{
figure();
hold on;
for i=1:6
    for j=1:6
        subplot( 6, 6, (i - 1 ) * 6 + j );
        plot( us( i, : ), us( j, : ) );
    end
end
%}

hold off;