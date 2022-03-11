%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tzomidis Nikolaos-Fotios (9461), tzomidis@ece.auth.gr
% 3rd Assignment in Optimization Techniques 7th Semester@ ECE AuTH.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% script that generates all the plots needed for parts 2,3 and 4 of the
% assignment.
clear;
close all;
clc;

x = sym('x',[1 2]);
f(x) = 0.5*x(1)^2 + 2*x(2)^2;

X = [10, -5;-7, 5;17, -5];
epsilon = [0.01 0.02 0.01];
gamma = [0.05 0.3 0.1];
sk = [8 10 0.5];
flag = [100 20 200];
values = zeros(3,3);
for i=1:3
    values(i,:) = steepestDescent_projection(f, x, epsilon(i), gamma(i),...
        X(i,:), sk(i),flag(i));
end
disp(values);

%% uncomment for comparison of the 2 methods in part 2
% figure;
% [xk,n] = steepestDescent(f,0.01,0.05,[10;-5]);
% plot(0:n,f(xk(1,:),xk(2,:)));
% hold on;
% scatter(n,f(xk(1,end),xk(2,end)),'x');
% graph_title = sprintf(['Steepest Descent\nStarting point = (%d,%d)\n'...
%   '#iterations = %d g_k = %.2f'], 10,-5,n,0.05);
% title(graph_title);
% set(gca, 'XTick', 0:n);
% txt = sprintf('Minimum @(%.3f,%.2f)\n f = %.3f',xk(1,end),...
%        xk(2,end),double(f(xk(1,end),xk(2,end))));
% annotation('textbox', 'String', txt);   
% xlabel("k-th iteration");
% xticks([0:15:n-1 n]);
% ylabel("f(xk,yk)");
