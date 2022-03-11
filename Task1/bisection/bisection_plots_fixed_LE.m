% Plot the number of calculations for each function, for the different
% lambdas and epsilons.
clear;
close all;
%functions to be minimized
syms x;
f_1 = (x-3)^2 + (sin(x+3))^2;
f_2 = (x-1)*cos(x/2) + x^2;
f_3 = (x+2)^2 + exp(x-2)*sin(x+3);

size = 50;

%% Fixed Lambda.
% Plot the the number of calculations for each function, for the different
% lambdas
k = zeros(size,1); e = zeros(size,1); lambda = 0.01;
figure('Name','Plots for fixed lambda','NumberTitle','off')
i = 0;
for epsilon = linspace(0.001,0.0049,size) %epsilon> lambda/2
    i = i + 1;
    [a,b,k(i),e(i),~] = bisection(f_1, epsilon, lambda);
end
subplot(3,1,1)
plot(e,2*(k-1),'-r','LineWidth',1.4)
title('$f_1$ = $(x-3)^{2}$ + $sin^{2}(x+3)$','Interpreter', 'latex')
xlabel('\epsilon') 
ylabel('numbers of iterations') 

i = 0;
for epsilon = linspace(0.0001,0.0049,size) %epsilon> lambda/2
    i = i + 1;
    [a,b,k(i),e(i),~] = bisection(f_2, epsilon, lambda);
end
subplot(3,1,2)
plot(e,2*(k-1),'-r','LineWidth',1.4)
title('$f_2$ = (x-1) $\cdot$ $cos(\frac{x}{2})$  + $x^{2}$','Interpreter', 'latex')
xlabel('\epsilon') 
ylabel('numbers of iterations') 

i = 0;
for epsilon = linspace(0.0001,0.0049,size) %epsilon> lambda/2
    i = i + 1;
    [a,b,k(i),e(i),~] = bisection(f_3, epsilon, lambda);
end
subplot(3,1,3)
plot(e,2*(k-1),'-r','LineWidth',1.4)
title('$f_{3}$ = ${(x+2)}^{2}$ + $e^{x-2}$ $\cdot$ $sin{(x+3)}$','Interpreter', 'latex')
xlabel('\epsilon') 
ylabel('numbers of iterations') 

%% Fixed epsilon

k = zeros(size,1); l = zeros(size,1); epsilon = 0.001; 
figure('Name','Plots for fixed epsilon','NumberTitle','off')
i = 0;
for lambda = linspace(0.0021,0.1,size) %lambda>2epsilon
    i = i + 1;
    [a,b,k(i),epsilon,l(i)] = bisection(f_1, 0.001, lambda);
end
subplot(3,1,1)
plot(l,2*(k-1),'-r','LineWidth',1.4)
title('$f_1$ = $(x-3)^{2}$ + $sin^{2}(x+3)$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 

i = 0;
for lambda = linspace(0.0021,0.1,size) %lambda>2epsilon
    i = i + 1;
    [a,b,k(i),epsilon,l(i)] = bisection(f_2, 0.001, lambda);
end
subplot(3,1,2)
plot(l,2*(k-1),'-r','LineWidth',1.4)
title('$f_2$ = (x-1) $\cdot$ $cos(\frac{x}{2})$  + $x^{2}$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 

i = 0;
for lambda = linspace(0.0021,0.1,size) %lambda>2epsilon
    i = i + 1;
    [a,b,k(i),epsilon,l(i)] = bisection(f_3, epsilon, lambda);
end
subplot(3,1,3)
plot(l,2*(k-1),'-r','LineWidth',1.4)
title('$f_{3}$ = ${(x+2)}^{2}$ + $e^{x-2}$ $\cdot$ $sin{(x+3)}$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 