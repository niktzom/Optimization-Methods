%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tzomidis Nikolaos-Fotios (9461), tzomidis@ece.auth.gr
% 3rd Assignment in Optimization Techniques 7th Semester@ ECE AuTH.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% script to plot our f(x1,x2) for a better visualization of the assignment.
% and also the countour of f with its restriction rectangle.
clear;
close all;

syms x1 x2;
f(x1,x2) = (1/2) * x1^2 + 2 * x2^2;

figure(1)
fsurf(f,[-20 20],'ShowContours','on');
title('3D plot of f(x_1,x_2)');
xlabel('x1');
ylabel('x2');
zlabel('f(x_1,x_2)');
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fcontour with rectangle
figure(2)
fcontour(f,[-20 20 -25 25], 'linewidth', 1.5);
title('Restrictions rectangle visible on f contour'); 
xlabel('x_1 values'); ylabel('x_2 values');
hold on;
s = scatter([-15 15 -15 15],[-20 -20 12 12]);
r = rectangle('position',[-15 -20 30 32],  'linestyle', '-', 'edgecolor', 'r',...
    'linewidth', 1.5);
dt1 = datatip(s,-15,-20,'FontSize',8,'Location','northwest'); 
dt2 = datatip(s,15,-20,'FontSize',8); 
dt3 = datatip(s,-15,12,'FontSize',8,'Location','northwest');
dt4 = datatip(s,15,12,'FontSize',8);
grid on;
