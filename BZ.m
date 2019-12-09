function [ func ] = BZ( constants )
% u = [ a, b, x, y, z ];
% u' = [ da/dt, db/dt, dx/dt, dy/dt, dz/dt, dp/dt ]
func = @(t,u) ( BZGen( t, u, constants ) );
end

function [ uprime ] = BZGen( t, u, constants )

f = constants( 1 );
k0 = constants( 2 );
k2 = constants( 3 );
k3 = constants( 4 );
k4 = constants( 5 );
k5 = constants( 6 );

A = u(1);
B = u(2);
X = u(3);
Y = u(4);
Z = u(5);
P = u(6);

uprime = zeros( 6, 1 );
uprime( 1 ) = k4*X.*X -k5*A.*X-k3*A.*Y;
uprime( 2 ) = -k0*B.*Z;
uprime( 3 ) = k3*A.*Y - k2*X.*Y + k5*A.*X;
uprime( 4 ) = -k3*A.*Y - k2*X.*Y + 0.5*f*k0*B.*Z;
uprime( 5 ) = 2*k5*A.*X - k0*B.*Z;
uprime( 6 ) = k3*A.*Y + 2*k2*X*Y + k4*X.*X;

end