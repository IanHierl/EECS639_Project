function pred = AB4(Y,t,h,f)
    %Use the AB4 predictor method to compute predicted value for the
    %iteration given by initial values in Y; 
    %f is the anonymous function y' = f(t,y)
    t3 = t - h;         %t_{k-1}
    t2 = t - 2*h;       %t_{k-2}
    t1 = t - 3*h;       %t_{k-3}
    
    pred = Y(4) + (h./24)*(55.*f(t,Y(4)) - 59.*f(t3,Y(3)) + ...
            37.*f(t2,Y(2)) - 9.*f(t1,Y(1)));
    return;
end

