%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Optimization Techniques - Project 2021/2022
%%%% Tzomidis Nikolaos - Fotios (9461)
%%%% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [minf,maxf] = fLimits()
%fLimits
%
% Calculating the maximum and the mininum value of f(u1,u2) in order for
% the min and max to then be used to define the magnitude for the Gaussians
%

size = 100;
fval = zeros(size,size);
count_u1 = 1;
for u1 = linspace(-1,2,size)
    count_u2 = 1;
    for u2 = linspace(-2,1,size)
        fval(count_u1,count_u2) = real_f(u1,u2);
    count_u2 = count_u2 + 1;
    end
    count_u1 = count_u1 + 1;
end
minf = min(min(fval));
maxf = max(max(fval));
end
