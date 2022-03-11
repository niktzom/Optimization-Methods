%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Optimization Techniques - Project 2021/2022
%%%% Tzomidis Nikolaos - Fotios (9461)
%%%% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function value = fBar(u1Bar,u2Bar,genes,size)
%fBar
%
% Function to calculate value for each Gaussian.
%
value = 0;
for i = 1:5:size
    A = genes(i);
    c1 = genes(i+1);
    c2 = genes(i+2);
    s1 = genes(i+3);
    s2 = genes(i+4);
    power = ((u1Bar-c1)^2/(2*s1^2)) + ((u2Bar-c2)^2/(2*s2^2));
    value = value + A * exp(-power);
end
end

