% Calculate how the edges of the intervals change for different lambda
% values in the bisection method.
clear;
close all;

%functions to be minimized
syms x;
f_1 = (x-3)^2 + (sin(x+3))^2;
f_2 = (x-1)*cos(x/2) + x^2;
f_3 = (x+2)^2 + exp(x-2)*sin(x+3);

epsilon = 0.001;
lam = [0.003 0.025 0.05]; %our different lambda values.
funcNames = {'$f_1$ = $(x-3)^{2}$ + $sin^{2}(x+3)$',... 
    '$f_2$ = (x-1) $\cdot$ $cos(\frac{x}{2})$  + $x^{2}$',...
    '$f_{3}$ = ${(x+2)}^{2}$ + $e^{x-2}$ $\cdot$ $sin{(x+3)}$'};
F = {f_1,f_2,f_3};   


for j=1:3

figure('Name',sprintf('Interval reduction for f_%i',j))
for n=1:3
subplot(3,1,n)
[a,b,k] = bisection(F(j),epsilon,lam(n));
for i=0:1:k-1
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 14])
title(funcNames(1,j),'Interpreter', 'latex')
xlabel(sprintf('numbers of iterations @l=%1.3f',lam(n))) 
ylabel('[a,b]') 
end
end
