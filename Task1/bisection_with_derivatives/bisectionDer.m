function [a,b,k,l] = bisectionDer(f,lambda)
%bisection with derivatives
%a: a vector of the values from the lower limit of the interval
%b: a vector of the values from the upper limit of the interval
%

k = 1; n = 0;
a = []; b = []; l = lambda;
a(k) = -4; b(k) = 4;

syms x;
df = diff(f);

while( n<log2((b(k) - a(k))/ l)) %(1/2)^n <= (1/(b1-a1))
    n = n +1;
end

for k = 1:n
    x_k = (a(k)+b(k))/2;
    der = subs(df,x_k);
    
    if der == 0
        return
    elseif der > 0
        a(k+1) = a(k);
        b(k+1) = x_k;
    else
        a(k+1) = x_k;
        b(k+1) = b(k);
    end
end
end

