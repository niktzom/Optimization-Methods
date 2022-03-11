%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tzomidis Nikolaos-Fotios (9461), tzomidis@ece.auth.gr
% 3rd Assignment in Optimization Techniques 7th Semester@ ECE AuTH.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = steepestDescent_projection(f, x, epsilon, gamma, X, sk, flag)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Steepest Descent with projection
%Function to execute the Steepest Descent with projection method that
%minimizes a function using its projection.
% inputs:
% (f): our function to be minimized
% (x): syms x
% (epsilon): the termination constant
% (gamma): initial step value for g_k
% (X): (x_1,x_2) starting point for the method
% (sk): constant step to find the xbar
% (flag): max step if the method is not converging
%
% (val): [min(x_1),min(x_2),iterations]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = 1;
xk = projection(X);

gradf = gradient(f,x);
x1 = xk(1);
x2 = xk(2);
fval = f(xk(1), xk(2));

% set when our method is gonna end
while (norm(gradf(xk(1), xk(2))) > epsilon && k < flag) 
    % x_{k+1} term
    xk = xk + gamma*(projection(xk - (sk*gradf(xk(1), xk(2))).') - xk);
   
        
    fval = [fval, f(xk(1), xk(2))]; % values of the function in each iteration
    x1 = [x1, xk(1)];
    x2 = [x2, xk(2)];
    k = k + 1;
end

val = [vpa(x1(k)), vpa(x2(k)), k - 1];
 
figure;
plot(x1, x2,'-o','Color','red');
hold on;
fcontour(f,[-20 20 -25 25], 'linewidth', 1.5);
title1 = sprintf(['Gradient Descent with Projection - Convergence of'...
        ' x_1,x_2\nγ_k = %.2f,  ε = %.2f, s_k = %.1f\nStarting Point ='...
        ' (%d,%d),  #iterations = %d'],gamma,epsilon,sk,X(1),X(2),k-1);
title(title1);
xlabel('x_1 values'); ylabel('x_2 values');
legend('(x_1,x_2) convergence');
rectangle('position',[-15 -20 30 32],  'linestyle', '--', 'edgecolor', 'r',...
    'linewidth', 0.8);


    
if flag == 100  % if clause to run this figure only for part 2 where 
                % we want to take a zoomed in part of the original figure    
  figure;
  plot(x1, x2,'-o','Color','red');
  xlim([-.1 .4]); ylim([-.06 .06]);
  hold on;
  fcontour(f, 'linewidth', 1.5);
  title1_2 = sprintf(['Gradient Descent with Projection - Convergence of'...
        ' x_1,x_2 (zoomed in)\nγ_k = %.2f,  ε = %.2f, s_k = %.1f\nStarting'...
        ' Point = (%d,%d),  #iterations = %d'],gamma,epsilon,sk,X(1),X(2),k-1);
  title(title1_2); 
  xlabel('x_1 values'); ylabel('x_2 values');
  legend('(x_1,x_2) convergence');

end
    
figure;
plot(fval, '-o', 'linewidth', 1.5);
title2 = sprintf(['Gradient Descent with Projection - Values of f('...
        'x_1,x_2)\nγ_k = %.2f, ε = %.2f, s_k = %.1f\nStarting Point ='...
        ' (%d,%d),  #iterations = %d'],gamma,epsilon,sk,X(1),X(2),k-1);
title(title2);
txt = sprintf("Minimum @(%.5f,%.5f)\n f = %.3f",val(1),val(2),fval(k));
annotation('textbox', 'String', txt,'Position',[0.5 0.7 0.1 0.1]);
xlabel('k values'); ylabel('f(x_k) values');
grid on; 
    
end