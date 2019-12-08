function [ func ] = BZ( constants )
% u = [ a, b, x, y, z ];
% u' = [ da/dt, db/dt, dx/dt, dy/dt, dz/dt ]
func = @(t,u) ( BZGen( t, u, constants ) );
end

function [ uprime ] = BZGen( t, u, constants )

f = constants( 1 );
k0 = constants( 2 );
k1 = constants( 3 );
k2 = constants( 4 );
k3 = constants( 5 );
k4 = constants( 6 );
k5 = constants( 7 );

uprime = zeros( 5, 1 );
uprime( 1 ) = k4*u(3).*u(3) -k5*u(1).*u(3)-k3*u(1).*u(4);
uprime( 2 ) = -k0*u(2).*u(5);
uprime( 3 ) = k3*u(1).*u(4) - k2*u(3).*u(4) + k5*u(1).*u(3);
uprime( 4 ) = -k3*u(1).*u(4) - k2*u(3).*u(4) + 0.5*f*k0*u(2).*u(5);
uprime( 5 ) = 2*k5*u(1).*u(3) - k0*u(2).*u(5);

end