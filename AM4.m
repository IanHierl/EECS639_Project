function corr = AM4(Y,t,h,f)
    %Use the AM4 corrector method to compute corrected value for the
    %iteration given by the updated inital values in Y(1..3) and the
    %predicted value in Y(4)
    %f is the anonymous function y' = f(t,y)
    t4 = t + h.*3;
    t3 = t + h.*2;
    t2 = t + h;
    
    corr = Y(3) + (h./24)*(9*f(t4,Y(4)) + 19*f(t3,Y(3)) - ...
                5*f(t2,Y(2)) + f(t,Y(1)));
    return;
end

