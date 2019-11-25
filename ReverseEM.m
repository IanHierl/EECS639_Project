function [ ys, ts ] = ReverseEM( f, y_0, t_0, n, h, solver )
% f      - function handler, y' = f( t, y )
% y_0    - initial value
% t_o    - initial input
% n      - number of steps to take
% h      - step size
% solver - function handler to solver, defaults to FixedPoint iteration
%           takes args g( x ), x_0, n
if nargin < 6
    solver = @FixedPoint;
end

end