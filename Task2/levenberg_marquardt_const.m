function [xk,n] = levenberg_marquardt_const(f,epsilon,gamma,X)
% Levenberg-Marquardt with constant gamma. 
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

while (norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))) > epsilon)
            % Calculate the hessian matrix and its eigen values 
            hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
            eigen_values = eig(hess_matrix);
            % Check if the hessian matrix is positive definite
            if (sum(eigen_values < 0) > 0)
                % Add a small step to the max eigen value so the matrix
                % becomes positive definite
                uk = max(abs(eigen_values))+0.2;
            end
            % Solve the linear system to find the dk value
            A = hess_matrix + uk*eye(2);
            B = -double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
            
            % Calculate the k+1 d value and place it in the matrix
            d = [d linsolve(A,B)];
            
            % Calculate the xk+1 value and place it in the xk matrix
            x_k = xk(:,k) + gamma * d(:,k);
            xk = [xk x_k];
            
            % Increase the k counter 
            k = k + 1;
end
n = k -1;
end


