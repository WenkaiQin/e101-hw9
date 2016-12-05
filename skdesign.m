function [R1, R2] = skdesign(wc, C1, C2, theta)
    
    a = 1;
    b = 2*cos(theta)/(wc*C2);
    c = 1/(wc^2*C1*C2);

    R2 = (-b+sqrt(b^2-4*a*c))/(2*a);
    R1 = c/R2;
    
end

