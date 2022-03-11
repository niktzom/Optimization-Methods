function [xk,n] = lev_marq_armijo(f,epsilon,gamma,X)
% Levenberg-Marquardt this time using the armijo method to minimize gamma. 
% A method that calculates the minimum point xk of a given functions
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

 % Set the armijo algorithm constants
        mk = 0;
        a = 2*10^(-3);
        b = 1/4;
        s = gamma * b^mk;
        
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
            
            fxk = double(f(xk(1,k),xk(2,k)));
            
            % find the mk value for which the inequality is satisfied
            while (fxk - double(f(xk(1,k)+gamma*d(1,k),xk(2,k)+gamma*d(2,k))) < -a * b^mk * s * d(:,k)' * (-B))
                mk = mk + 1;
                gamma = s * b^mk;
            end
            
            % Calculate the xk+1 value and place it in the xk matrix
            x_k = xk(:,k) + gamma * d(:,k);
            xk = [xk x_k];
            
            % Increase the k counter
            k = k + 1;
            
            % Set mk to 0 for the next iteration
            mk = 0;
            gamma = s * b^mk;
        end
        n = k - 1;
end

