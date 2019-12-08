function pred = AB4(Y,t,h,f)
    %Use the AB4 predictor method to compute predicted value for the
    %iteration given by initial values in Y; 
    %f is the anonymous function y' = f(t,y)
    
    pred = Y(4) + (h./24)*( 55.*Y(4) - 59.*Y(3) + 37.*Y(2) - 9.*Y(1) );
    return;
end

