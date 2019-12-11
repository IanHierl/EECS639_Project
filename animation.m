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
        us_init( i, j, : ) = 0.01.*randi( 10, 3, 1 ) + 0.05;
    end
end

f = 500;
us = zeros( 100, 100, f, 3 );
us( :, :, 1, : ) = us_init;
tic; 
new_u = zeros( 3, 1 );
t = 0;
h = 10;
uv = [1, 5, 1]/sqrt(27);
for k=2:f
    for i=1:100
        for j=1:100
            %{
            new_u(1) = uv * us(i-1:i+1,j-1:j+1,k-1,1) * uv';
            new_u(2) = uv * us(i-1:i+1,j-1:j+1,k-1,2) * uv';
            new_u(3) = uv * us(i-1:i+1,j-1:j+1,k-1,3) * uv';
            %}
            if i == 1
                xRange = 1:2;
            elseif i == 100
                xRange = 99:100;
            else
                xRange = i-1:i+1;
            end
            if j == 1
                yRange = 1:2;
            elseif j == 100
                yRange = 99:100;
            else
                yRange = j-1:j+1;
            end
            
            new_u( 1 ) = mean( us( xRange, yRange, k-1, 1 ), 'all' );
            new_u( 2 ) = mean( us( xRange, yRange, k-1, 2 ), 'all' );
            new_u( 3 ) = mean( us( xRange, yRange, k-1, 3 ), 'all' );
            %new_u = us(i,j,k-1,:);
            [ temp, ~ ] = RK4( func, new_u, t, 1, h );
            us( i, j, k, : ) = temp(:,2);
        end
    end
    t = t + h;
end
toc

frames(f) = struct('cdata',[],'colormap',[]);
for k=1:f
    C = us(:,:,k,3);
    colormap(cool);
    caxis([0.06,0.08]);
    I = image(C,'CDataMapping','scaled');
    frames(k) = getframe;
end

movie(frames);
    
    