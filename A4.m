function [ys,ts] = A4(f,y0,t0,n,h)
    
    deg = length(y0);
    ys = zeros(deg, n+1);
    ts = linspace(t0, t0 + h*n, n+1);
    
    %First, use single-step method to obtain initial values for the
    %multi-step predictor method
    %Single-step method used: 4th-order Runge-Kutta
    [ys(:,1:4),~] = RK4(f,y0,t0,3,h);
    [y0,y1,y2,y3] = deal(ys(:,1),ys(:,2),ys(:,3),ys(:,4));
    t = t0 + 4*h;
    
    %Iterate in PECE mode until number of steps have been reached
    pred = AB4([y0,y1,y2,y3],t,h,f);   %Predictor method
    %Here, the deal function is used to update our initial-value parameters
    %for the next iteration of the Adams functions, so the "oldest"
    %parameter, y0, takes on the value of the second "oldest", y1, and so
    %on. The "newest" parameter, y3, takes on the predicted value.
    [y0,y1,y2,y3] = deal(y1,y2,y3,pred);
    s = AM4([y0,y1,y2,y3],t,h,f);   %Corrector method
    %After correction, the "newest" parameter is updated to the corrected
    %value, to be used in the next iteration
    y3 = s;
    ys(:,5) = y3;
    t = t + h;          %Update for next iteration
    %The below while loop iterates over the above process until convergence
    %is reched
    for i=6:n           %Start at 6; the first five iters. were handled above
        pred = AB4([y0,y1,y2,y3],t,h,f);
        [y0,y1,y2,y3] = deal(y1,y2,y3,pred);
        s = AM4([y0,y1,y2,y3],t,h,f);
        y3 = s;
        ys(:,i) = y3;
        t = t + h;
    end
    %Once we have reached convergence, we are done
    return;
end

