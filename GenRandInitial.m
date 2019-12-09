constants = 5*rand( 6, 1 );

% u0 = [A0; B0; X0; Y0; Z0; P0; ];
u0 = randi( 100, 6, 1 ) + 50*ones( 6, 1 );
u0( 6 ) = 0;
u0 = 0.25*u0 ./ (u0'*u0);