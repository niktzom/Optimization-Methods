function [oldV] = fibS(n)
%
%To compute the fibonacci of n
%we need the two previous fibonacci numbers
%So we are using two variables - old_value and pre_old_value -
%and the admission that fibonacci(0) = 0
%
oldV = 1; preOldV = 0;
if (n == 0) 
    oldV = 0 ;
end
for i = 2:1:n          
    currentV = oldV + preOldV; %so the current value is equal to the old + pre Old Value
    preOldV = oldV;
    oldV = currentV;
end
end
