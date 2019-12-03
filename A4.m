function s = A4(y0,t0,h,f)
    %First, use single-step method to obtain initial values for the
    %multi-step predictor method
    %Single-step method used: 4th-order Runge-Kutta
    y1 = RK4(y0);
    y2 = RK4(y1);
    y3 = RK4(y2);
    
    %Iterate in PECE mode until convergence (i.e., until |s - sold| <
    %1e-8)
    t = t0;
    sold = y3;                         %Last computed value for solution
    pred = AB4([y0,y1,y2,y3],t,h,f);   %Predictor method
    %Here, the deal function is used to update our initial-value parameters
    %for the next iteration of the Adams functions, so the "oldest"
    %parameter, y0, takes on the value of the second "oldest", y1, and so
    %on. The "newest" parameter, y3, takes on the predicted value.
    [y0,y1,y2,y3] = deal(y1,y2,y3,pred);
    t = t + h;                      %Also update timestep for corrector
    s = AM4([y0,y1,y2,y3],t,h,f);   %Corrector method
    %After correction, the "newest" parameter is updated to the corrected
    %value, to be used in the next iteration
    y3 = s;
    %The below while loop iterates over the above process until convergence
    %is reched
    while (abs(s - sold) >= 1e-8)
        sold = s;
        pred = AB4([y0,y1,y2,y3],t,h,f);
        [y0,y1,y2,y3] = deal(y1,y2,y3,pred);
        t = t + h;
        s = AM4([y0,y1,y2,y3],t,h,f);
        y3 = s;
    end
    %Once we have reached convergence, we are done
    return;
end

