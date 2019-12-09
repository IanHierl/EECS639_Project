constants = rand( 6, 1 )*10;

% u0 = [A0; B0; X0; Y0; Z0; P0; ];
u0 = randi( 10, 3, 1 );
u0 = u0 ./ (u0'*u0);