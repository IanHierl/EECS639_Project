function [ func ] = BZ( constants )
% Takes a set of constants f, k0, k1, k2, k3, k4, k5
% and returns the system of ODE's for X, Y, Z from the
% BZ Reaction as a handler to a function that computes:
% func( t, u ) = [ dX/dt, dY/dt, dZ/dt ];
func = @(t,u) ( BZGen( t, u, constants ) );
end

function [ uprime ] = BZGen( t, u, constants )

f = constants( 1 );
k0 = constants( 2 );
k2 = constants( 3 );
k3 = constants( 4 );
k4 = constants( 5 );
k5 = constants( 6 );

A = 0.01;
B = 0.01;
X = u(1);
Y = u(2);
Z = u(3);

uprime = zeros( 3, 1 );
uprime( 1 ) = k3*A.*Y - k2*X.*Y + k5*A.*X;
uprime( 2 ) = -k3*A.*Y - k2*X.*Y + 0.5*f*k0*B.*Z;
uprime( 3 ) = 2*k5*A.*X - k0*B.*Z;

end