close all
constants = [
   1.311147070430053 ;
   4.350407178956268 ;
   0.915131672126108 ;
   6.146269580129458 ;
   0.109790922908117 ;
   5.732603832633724 ];

func = BZ( constants );

us_init = zeros( 100, 100, 3 );
for i=1:100
    for j=1:100
        us_init( i, j, : ) = 0.1.*rand( 3, 1 );
    end
end

us = zeros( 100, 100, 100, 3 );
us( :, :, 1, : ) = us_init;
tic; 
new_u = zeros( 3, 1 );
t = 0;
h = 100;
for k=2:100
    for i=2:99
        for j=2:99
            new_u( 1 ) = mean( us( i-1:i+1, j-1:j+1, k-1, 1 ), 'all' );
            new_u( 2 ) = mean( us( i-1:i+1, j-1:j+1, k-1, 2 ), 'all' );
            new_u( 3 ) = mean( us( i-1:i+1, j-1:j+1, k-1, 3 ), 'all' );
            [ temp, ~ ] = RK4( func, new_u, t, 1, h );
            us( i, j, k, : ) = temp(2);
            t = t + h;
        end
    end
end
toc

frames(100) = struct('cdata',[],'colormap',[]);
for k=1:100
    C = us(:,:,k,1);
    I = image(C,'CDataMapping','scaled');
    colormap(cool);
    frames(k) = getframe;
end

movie(frames);
    
    