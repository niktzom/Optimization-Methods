% Script that plots the results of the minimization of f using the Steepest
% descent method for different starting values and the 3 different methods
% for finding the gamma step.

close all
clc
clear

% Create our function
syms x y;
f(x,y) = x.^3 .* exp(-x.^2 - y.^4);

X = [0 -1 1;0 -1 1;]; % starting points
method = ["steepest_descent_const","steepest_descent_gamma","steepest_descent_armijo"];
gamma_method = ["const", "minimization with golden section", "armijo"];
epsilon = 0.01;
gamma = 0.1; % set gamma for the first case 
figure_counter = 1;

    
for i = 1:3
    for j = 1:3
        algo = str2func(method(j));
        [xk,n] = algo(f,epsilon,gamma,X(:,i));
        plots_titles = sprintf(['Steepest Descent\nMethod for gamma: %s '... 
           ',Starting point = (%d,%d) \n#iterations = %d Minimum = '...
          '(%.2f,%.2f)'],gamma_method(j),X(1,i),X(2,i),n,xk(1,end),xk(2,end));
        figure(figure_counter);
        figure_counter = figure_counter + 1;
        fcontour(f,[-3 3]);
        hold on;
        grid on;
        title(plots_titles);
        xlabel('x');
        ylabel('y');
        plot(xk(1,1:end),xk(2,1:end));
        scatter(xk(1,end),xk(2,end),'*');
        figure(figure_counter);
        hold on;
        figure_counter = figure_counter + 1;
        plot(0:n,f(xk(1,:),xk(2,:)));
        scatter(n,f(xk(1,end),xk(2,end)),'*');
        txt = sprintf('Minimum @(%.3f,%.2f)\n f = %.3f',xk(1,end),...
        xk(2,end),double(f(xk(1,end),xk(2,end))));
        annotation('textbox', 'String', txt);
        graph_title2 = sprintf(['Value of the function as k changes, using'...
            '\n%s method for gamma with (%d,%d) as starting point.']...
            ,gamma_method(j),X(1,i),X(2,i));
        title(graph_title2);
        set(gca, 'XTick', 0:n);
        xlabel('k-th iteration');
        ylabel('f(xk,yk)');
    end
end
        
        