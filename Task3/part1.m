%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tzomidis Nikolaos-Fotios (9461), tzomidis@ece.auth.gr
% 3rd Assignment in Optimization Techniques 7th Semester@ ECE AuTH.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% script for the plots necessary for part 1 of the assignment.
clear;
close all;
clc; 

syms x1 x2; 
f(x1,x2) = (1/2) * x1^2 + 2 * x2^2; % function to be minimized

X = [3;4];
gamma = [0.05 0.5 2 10];    
epsilon = 0.01;

figure_counter = 1;

for i = 1:4
    [xk,n] = steepestDescent(f,epsilon,gamma(i),X);
    figure(figure_counter);
    figure_counter = figure_counter + 1;
    if (i == 3 || i == 4 )
        semilogy(0:n,f(xk(1,:),xk(2,:)));
        hold on;
    else
        hold on;
        plot(0:n,f(xk(1,:),xk(2,:)));
    end
    scatter(n,f(xk(1,end),xk(2,end)),'x');
    graph_title = sprintf(['Steepest Descent\nStarting point = (%d,%d)\n'...
    '#iterations = %d g_k = %.2f'], X(1),X(2),n,gamma(i));
    title(graph_title);
    set(gca, 'XTick', 0:n);
    txt = sprintf('Minimum @(%.3f,%.2f)\n f = %.3f',xk(1,end),...
        xk(2,end),double(f(xk(1,end),xk(2,end))));
    if (i == 1 || i ==2)
        annotation('textbox', 'String', txt);
    end
    xlabel("k-th iteration");
    xticks([0:10:n-1 n]);
    ylabel("f(xk,yk)");
end

figure_counter2 = 5;
for j=1:2
[xk,n] = steepestDescent(f,epsilon,gamma(j),X);
figure(figure_counter2);
figure_counter2 = figure_counter2 + 1;
fcontour(f,[-5 5]);
hold on;
title(sprintf('Convergence of (x_1,x_2) for γ_k = %1.2f',gamma(j)));
xlabel('x_1');
ylabel('x_2');
plot(xk(1,1:end),xk(2,1:end),'-.r');
scatter(xk(1,end),xk(2,end),'x','r');
grid on;
end
