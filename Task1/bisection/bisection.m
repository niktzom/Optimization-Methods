function [a,b,k,e,l] = bisection(f,epsilon,lambda)
% Bisection 
%
% a: a vector of the values from the lower limit of the interval
% b: a vector of the values from the upper limit of the interval
% k: # of iterations



k = 1; a = []; b= [];
l = lambda;
e = epsilon;
a(k) = -4; b(k) = 4;

while b(k)-a(k)>l
    x_1 = (a(k) + b(k))/2 - e;
    x_2 = (a(k) + b(k))/2 + e;
    k = k + 1;
    if subs(f,x_1) < subs(f,x_2)
        a(k) = a(k-1);
        b(k) = x_2;
    else
        a(k) = x_1;
        b(k) = b(k-1);
    end
end