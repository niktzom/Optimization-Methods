function [a,b,k,l] = fibonacciM(f,lambda)
%Fibonacci Method
%
%(a) a vector of the values from the lower limit of the interval
%(b) a vector of the values from the upper limit of the interval
%

l = lambda; n = 0; k = 1; a = []; b = [];
a(k) = -4; b(k) = 4; 
F = (b(k) - a(k))/l;

while F > fibS(n+1)
    n = n + 1;
end

x_1 = a(k) + (1 -  fibS(n-1-k)/fibS(n-k) )*(b(k) - a(k));
x_2 = a(k) + ( fibS(n-1-k)/fibS(n-k) )*(b(k) - a(k));

for k = 1:n-1
    if( subs(f,x_1)<= subs(f,x_2))
        a(k+1)=a(k);
        b(k+1) = x_2;  
        x_2 = x_1;
        x_1 =  a(k+1) + (1 - fibS(n-1-(k+1))/fibS(n-(k+1)) )*(b(k+1) - a(k+1));
    else
        b(k+1)=b(k);
        a(k+1) = x_1; 
        x_1 = x_2; 
        x_2 =  a(k+1) + (fibS(n-1-(k+1))/fibS(n-(k+1)) )*(b(k+1) - a(k+1));
    end  
end
end



    