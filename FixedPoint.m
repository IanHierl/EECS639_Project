function x = FixedPoint( g, x_0, n )
%FIXEDPOINT Summary of this function goes here
%   Detailed explanation goes here
if nargin < 3
    n = 32;
end
x = x_0;
for k = 1 : n
    x = g( x );
end
end

