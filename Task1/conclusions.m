% A script to help visualize our final conclusions on the efficiency on
% the methods studied above.
clear
close

syms x;
f_1 = (x-3)^2 + (sin(x+3))^2; % we will only use f_1 to compare the methods

size = 10;
k1 = zeros(size,1); k2 = zeros(size,1); k3 = zeros(size,1); k4 = zeros(size,1); 
l1 = zeros(size,1); l2 = zeros(size,1); l3 = zeros(size,1); l4 = zeros(size,1); 

figure(1)
i = 0;
for lambda=linspace(0.0021,0.01,size)
    i = i + 1;
[~,~,k1(i),~,l1(i)] = bisection(f_1,0.0001,lambda);
[~,~,k2(i),l2(i)] = golden_section(f_1,lambda);
[~,~,k3(i),l3(i)] = fibonacciM(f_1,lambda);
[~,~,k4(i),l4(i)] = bisectionDer(f_1,lambda);
end

plot(l1,2*(k1-1),'r','LineWidth', 1.2)
hold on
plot(l2,k2,'b','LineWidth', 1.2)
hold on 
plot(l3,k3-1,'c','LineWidth', 1.2)
hold on
plot(l4,k4,'g','LineWidth', 1.2)
ylim([9 28])
title('Comparison between the 4 methods')
xlabel('l')
ylabel('# of function calls')
legend('bisection','golden section','fibonacci','bisection with derivatives')