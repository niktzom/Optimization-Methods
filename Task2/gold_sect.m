function [value] = gold_sect(f,lambda,alpha,beta)
%golden_section (sligtly changed from Task 1)
%f: is the function whose the local minimum i want to find
%lamda: the tolerance of the final interval [a,b]
%
%value: the middle point of the last interval
%

n = 1; g = (sqrt(5) -1)/2 ; a = []; b = [];
l = lambda; 
a(n) = alpha; b(n) = beta;
x_1 = a(n) + (1 - g)*(b(n) - a(n));
x_2 = a(n) + g*(b(n) - a(n));
while b(n)-a(n)>l
    n = n + 1;
    if f(x_1) > f(x_2)
        a(n) = x_1;
        x_1 = x_2;
        b(n) = b(n-1);
        x_2 = a(n) + g*(b(n) - a(n));
    else
        a(n) = a(n-1);
        b(n) = x_2;
        x_2 = x_1;
        x_1 = a(n) + (1 - g)*(b(n) - a(n));
    end
end
value = (a(n)+b(n))/2;