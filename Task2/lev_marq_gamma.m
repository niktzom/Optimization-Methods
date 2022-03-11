function [xk,n] = lev_marq_gamma(f,epsilon,~,X)
% Levenberg-Marquardt with such gamma that minimizes the f(xk+gamma*d) 
% using the golden section algorithm. 
% A method that calculates the minimum point xk of a given function
% basically with a twist in the Newton method where we ask that the hessian
% will be a positive definite matrix. To do that we add the m * I term to
% demand positive definite array(by controlling the m factor). 
%
% (xk): every point calculated with the algorithm. 
% (n): # of iterations.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d = []; %initialize an array to hold the values of the Dk vector
k = 1;
xk = X;

grad_f = gradient(f);
hess_f = hessian(f);

% Create syms variable to call the bisection with derivatives
% method
syms gamma_value
        
% While the norm of the gradient vector is larger than the selected
% value epsilon
     while (norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))) > epsilon)
            
            hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
            eigen_values = eig(hess_matrix);
            if (sum(eigen_values < 0) > 0)
                uk = max(abs(eigen_values))+0.2;
            end
            % Solve the linear system to find the dk value
            A = hess_matrix + uk*eye(2);
            B = -double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
            
            % Calculate the k+1 d value and place it in the matrix
            d = [d linsolve(A,B)];
            
            % Initialize a function with gamma_value as its input variable
            func_min(gamma_value) = f(xk(1,k)+gamma_value*d(1,k),xk(2,k)+gamma_value*d(2,k));
            
            % Find the minimum of the function using a slightly changed 
            % golden section method take from the previous assignment.
            gamma = gold_sect(func_min,0.001,0,1);
            
            % Calculate the xk+1 value and place it in the xk matrix
            x_k = xk(:,k) + gamma * d(:,k);
            xk = [xk x_k];
            
            % Increase the k counter
            k = k + 1;
     end
n = k - 1;
end

