% Script that plots the results of the minimization of f using the Levenberg
% Marquard algorithm for different starting values and the 3 different
% methods for finding the gamma step.

close all
clc
clear

% Create our function
syms x y;
f(x,y) = x.^3 .* exp(-x.^2 - y.^4);

X = [0 -1 1;0 -1 1;]; % starting points
method = ["levenberg_marquardt_const","lev_marq_gamma","lev_marq_armijo"];
gamma_method = ["const", "minimization with golden section", "armijo"];
epsilon = 0.01;
gamma = 0.5; % set gamma for the first case 
fig_counter = 1;

for i = 1:3
    for j = 1:3
        algo = str2func(method(j));
        [xk,n] = algo(f,epsilon,gamma,X(:,i));
        graph_title = sprintf(['Levenberg Marquardt\nMethod for gamma: %s '... 
           ',Starting point = (%d,%d) \n#iterations = %d Minimum = '...
          '(%.2f,%.2f)'],gamma_method(j),X(1,i),X(2,i),n,xk(1,end),xk(2,end));
        figure(fig_counter);
        fig_counter = fig_counter + 1;
        fcontour(f,[-3 3]);
        hold on;
        grid on;
        title(graph_title);
        xlabel("x");
        ylabel("y");
        plot(xk(1,1:end),xk(2,1:end));
        scatter(xk(1,end),xk(2,end),'*');
        figure(fig_counter);
        hold on;
        fig_counter = fig_counter + 1;
        plot(0:n,f(xk(1,:),xk(2,:)));
        scatter(n,f(xk(1,end),xk(2,end)),'*');
        anno_txt = sprintf("Minimum @(%.3f,%.2f)\n f = %.3f",xk(1,end),...
            xk(2,end),double(f(xk(1,end),xk(2,end))));
        annotation('textbox', 'String', anno_txt);
        graph_title2 = sprintf(['Value of the function as k changes, using'...
            '\n%s method for gamma with (%d,%d) as starting point.']...
            ,gamma_method(j),X(1,i),X(2,i));
        title(graph_title2);
        set(gca, 'XTick', 0:n);
        xlabel("k-th iteration");
        ylabel("f(xk,yk)");
      
    end
end