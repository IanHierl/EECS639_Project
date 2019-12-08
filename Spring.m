function [ uprime ] = Spring( t, u )
m = 2;
k = 128;

uprime = [ u( 2 ); -k*u( 1 ) / m; ];
