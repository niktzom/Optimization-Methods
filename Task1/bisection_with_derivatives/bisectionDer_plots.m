% Plots needed for the bisection with derivatives method
% (A)Study the change on calculations of our functions for different lambda
% values
% (B)Calculate how the edges of the intervals change for different lambda
% values


clear
close 

%functions to be minimized
syms x;
f_1 = (x-3)^2 + (sin(x+3))^2;
f_2 = (x-1)*cos(x/2) + x^2;
f_3 = (x+2)^2 + exp(x-2)*sin(x+3);

%% Part A

size = 40;
k = zeros(size,1); l = zeros(size,1); 
figure('Name','Number of iterations for different lambda values')
i = 0;
for lambda=linspace(0.005,0.15,size) 
    i = i + 1;
    [~,~,k(i),l(i)] = bisectionDer(f_1,lambda);
end
subplot(3,1,1)
plot(l,k,'-r','LineWidth',1.2)
title('$f_1$ = $(x-3)^{2}$ + $sin^{2}(x+3)$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 

i = 0;
for lambda=linspace(0.005,0.15,size)
    i = i + 1;
    [~,~,k(i),l(i)] = bisectionDer(f_2,lambda);
end
subplot(3,1,2)
plot(l,k,'-r','LineWidth',1.2)
title('$f_2$ = (x-1) $\cdot$ $cos(\frac{x}{2})$  + $x^{2}$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 

i = 0;
for lambda=linspace(0.005,0.15,size)
    i = i + 1;
    [~,~,k(i),l(i)] = bisectionDer(f_3,lambda);
end
subplot(3,1,3)
plot(l,k,'-r','LineWidth',1.2)
title('$f_{3}$ = ${(x+2)}^{2}$ + $e^{x-2}$ $\cdot$ $sin{(x+3)}$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 


%% Part B

lam = [0.01 0.05 0.1]; %different lambda values
funcNames = {'$f_1$ = $(x-3)^{2}$ + $sin^{2}(x+3)$',... 
    '$f_2$ = (x-1) $\cdot$ $cos(\frac{x}{2})$  + $x^{2}$',...
    '$f_{3}$ = ${(x+2)}^{2}$ + $e^{x-2}$ $\cdot$ $sin{(x+3)}$'};
F = [f_1,f_2,f_3];    
    
for j=1:3

figure('Name',sprintf('Interval reduction for f_%i',j))
for n=1:3
subplot(3,1,n)
[a,b,k] = bisectionDer(F(j),lam(n));
for i=0:1:k-1
    plot(i,a(i+1),'*r')
    hold on
    plot(i,b(i+1),'ob')
end
xlim([0 10])
title(funcNames(1,j),'Interpreter', 'latex')
xlabel(sprintf('numbers of iterations @l=%1.2f',lam(n))) 
ylabel('[a,b]') 
end
end