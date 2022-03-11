% A script to plot the given f function to help visualize its form.

close all 
clf 
clear

%create the function
syms x y ;
f(x,y) = (x.^3).*exp(-x.^2 - y.^4);

%create the plots
figure(1)
grid on;
fsurf(f,'ShowContours','on');
title('3D plot of $f(x,y)$ = $x^{3}$ $\cdot$ $e^{-x^2-y^4}$'...
    ,'Interpreter', 'latex');
xlabel('x');
ylabel('y');
zlabel('f(x,y)');
box on;
saveas(figure(1),'3dplot.png');

figure(2) % contour lines of the function
fcontour(f,[-3 3]);
grid on;
title('Contour lines of $f(x,y)$ = $x^{3}$ $\cdot$ $e^{-x^2-y^4}$'...
    ,'Interpreter','latex');
xlabel('x');
ylabel('y');
saveas(figure(2),'contour.png');
