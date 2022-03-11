function [xk,n] = newton_gamma(f,epsilon,~,X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NEWTON, gamma taken from golden section algorithm 
%
%x: the minimum point
%n: # of iterations
%
%The idea is to approach f, with a quadratic function in each iteration and
%find the mininum around xk.
%This time we are using a slightly variated golden section
%algorithm from the 1st assignment to minimize the f(xk+gamma*dk) term.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d = []; %initialize an array to hold the values of the Dk vector
k = 1;
xk = X;

grad_f = gradient(f);
hess_f = hessian(f);
max_step = 100;

% Create a syms variable to call the golden senction algorithm 
syms gamma_value
        
%set when our algorithm is gonna end
 while (norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))) > epsilon)
       grad_matrix = double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
       hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
       % create the d matrix
       d = [d -hess_matrix\grad_matrix];
            
       % Initialize a function with gamma_value as its input variable
       func_min(gamma_value) = f(xk(1,k)+gamma_value*d(1,k),xk(2,k)...
           +gamma_value*d(2,k));
            
       % Find the minimum of the function using  the golden section
       % algorithm
       gamma = gold_sect(func_min,0.001,0,1);
            
       % find the the xk+1 values
       x_k = xk(:,k) + gamma * d(:,k);
       xk = [xk x_k];
            
       % Increase the k counter
       k = k + 1;
       if (k == max_step || f(xk(1,k),xk(2,k)) >= f(xk(1,k-1),xk(2,k-1)))
            break
      % check if f(x_k) is bigger or equal to f(x_k-1)
      % necessary in order for our method to converge in a local minimum
      % point else our code won't keep running.
       end
 end
n = k - 1;
end

