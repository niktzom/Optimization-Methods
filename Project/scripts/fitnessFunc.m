%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Optimization Techniques - Project 2021/2022
%%%% Tzomidis Nikolaos - Fotios (9461)
%%%% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fit = fitnessFunc(genes,size)
%fitnessFunc
%
% The score of each solution, is calculated as the mean square error (mse)
% of the approximation to the real value of the f we are using for input- 
% output data. 

u1Lims = [-1 2];
u2Lims = [-2 1];

val = 0;
points = 25;
n = points^2;
for u1 = linspace(u1Lims(1),u1Lims(2),points)
    for u2 = linspace(u2Lims(1),u2Lims(2),points)

    val = val + (real_f(u1,u2) - fBar(u1,u2,genes,size))^2;
    end
end
fit = val/n; %mse
end

