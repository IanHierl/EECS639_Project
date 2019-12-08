function [ys,ts] = A4(f,y0,t0,n,h)
    
    deg = length(y0);
    ys = zeros(deg, n+1);
    ts = linspace(t0, t0 + h*n, n+1);
    
    %First, use single-step method to obtain initial values for the
    %multi-step predictor method
    %Single-step method used: 4th-order Runge-Kutta
    [ys(:,1:4),~] = RK4(f,y0,t0,3,h);
    [y0,y1,y2,y3] = deal(ys(:,1),ys(:,2),ys(:,3),ys(:,4));
    fs = zeros( deg, n + 1 );   % fs(k) = f(t_k, y_k)
    for i=1:4
        fs(:,i) = f(ts(i),ys(:,i));
    end
    
    for k=5:n+1
        pk = ys(:,k-1) + (h/24) * (-9*fs(:,k-4) + 37*fs(:,k-3) -59*fs(:,k-2) + 55*fs(:,k-1));
        ys(:,k) = ys(:,k-1) + (h/24)*(9*f(ts(k),pk) +19*fs(:,k-1)-5*fs(:,k-2)+fs(:,k-3));
        fs(:,k) = f(ts(k), ys(:,k));
    end
end

