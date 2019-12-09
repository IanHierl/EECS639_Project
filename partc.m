close all;
%constants = 5*rand( 6, 1 );

% u0 = [A0; B0; X0; Y0; Z0; P0; ];
%u0 = randi( 100, 6, 1 ) + 50*ones( 6, 1 );
%u0( 6 ) = 0;
%u0 = 0.25*u0 ./ (u0'*u0);

constants = [
   1.311147070430053 ;
   4.350407178956268 ;
   0.915131672126108 ;
   6.146269580129458 ;
   0.109790922908117 ;
   5.732603832633724 ];

u0 = [0.05; 0.05; 0.05; ]

func = BZ( constants );

t0 = 0;
tf = 100000;
n = 10000;
h = (tf - t0)/n;


[ us, ts ] = Trapezoid( func, u0, 0, n, h );
colors = {'r', 'g', 'b' };
figure();

hold on;
for i=1:3
    plot( ts, us( i, :), colors{i} );
end;
hold off;
figure();
hold on;
for i=1:3
    for j=1:3
        subplot( 3, 3, ( i - 1 ) * 3 + j );
        plot( us( i, : ), us( j, : ) );
    end
end

hold off;