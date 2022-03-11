%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Optimization Techniques - Project 2021/2022
%%%% Tzomidis Nikolaos - Fotios (9461)
%%%% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [value] = real_f(u1,u2)
% The f(u1,u2) function to be used for creating the data and for evaluation
% of our results.

value = sin(u1+u2)*sin(u2^2);
end

