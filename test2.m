X = linspace(-1,1,1000);
Y = linspace(-1,1,1000);

z = zeros( 1000, 2 );

g = @( x ) ( cos( x ) );

for x = X
    for y = Y
        FixedPoint( , x, 32 )
        
    end
end