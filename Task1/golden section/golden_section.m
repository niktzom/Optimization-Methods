function [a,b,k,l] = golden_section(f,lambda)
% Golden section method
%
% (a) a vector of the values from the lower limits of the interval
% (b) a vector of the values from the upper limits of the interval
% (k) # of iterations

gamma = (sqrt(5)-1)/2; %γ = 0.618
k = 1;
a = []; b = []; l = lambda;
a(k) = -4; b(k)=4;
x_1 = a(k) + (1 - gamma)*(b(k) - a(k));
x_2 = a(k) + gamma*(b(k) - a(k));

while b(k)-a(k)>l
    k = k + 1;
    if subs(f,x_1) > subs(f,x_2)
        a(k) = x_1;
        b(k) = b(k-1);
        x_1 = x_2;
        x_2 = a(k) + gamma*(b(k) - a(k));
    else
        a(k) = a(k-1);
        b(k) = x_2;
        x_2 = x_1;
        x_1 = a(k) + (1-gamma)*(b(k)-a(k));
    end
end

        

