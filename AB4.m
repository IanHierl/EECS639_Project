function pred = AB4(Y,t,h,f)
    %Use the AB4 predictor method to compute predicted value for the
    %iteration given by initial values in Y; 
    %f is the anonymous function y' = f(t,y)
    t4 = t + h.*3;
    t3 = t + h.*2;
    t2 = t + h;
    
    pred = Y(4) + (h./24)*(55*f(t4,Y(4)) - 59*f(t3,Y(3)) + ...
            37*f(t2,Y(2)) - 9*f(t,Y(1)));
    return;
end

