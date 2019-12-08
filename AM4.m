function corr = AM4(Y,t,h,f)
    %Use the AM4 corrector method to compute corrected value for the
    %iteration given by the updated inital values in Y(1..3) and the
    %predicted value in Y(4)
    %f is the anonymous function y' = f(t,y)
    tp1 = t + h;        %t_{k+1}
    tm1 = t - h;        %t_{k-1}
    tm2 = t - 2*h;      %t_{k-2}
    
    corr = Y(3) + (h./24)*(9.*f(tp1,Y(4)) + 19.*f(t,Y(3)) - ...
                5.*f(tm1,Y(2)) + f(tm2,Y(1)));
    return;
end

