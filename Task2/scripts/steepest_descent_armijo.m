function [xk,n] = steepest_descent_armijo(f,epsilon,gamma,X)
%STEEPEST_DESCENT_CONST
%
%xk: the minimum point
%n: # of iterations
%
%
% The idea is to take repeated steps in the opposite direction of the 
% gradient of the function at the current point, because this is
% the direction of steepest descent and thus we can find the local minimum.
% In this particular method we are using the armijo method to minimize the
% gamma with a=0.002 and b=0.25 .
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d = []; %create an array to hold the values of the dk vector
k = 1; 
xk = X;

grad_f = gradient(f);

% Set the armijo algorithm constants
        mk = 0;
        a = 2*10^(-3);
        b = 1/4;
        s = gamma * b^mk;
        
% set when our algorithm is gonna end
while (norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))) > epsilon)
            
        % Calculate the k+1 d value and place it in the the 
        % placeholder Dk matrix
        d = [d -double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];
            
        fx_k = double(f(xk(1,k),xk(2,k)));
        grad_matrix = double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
        % find the mk value for which the inequality is satisfied
        while (fx_k - double(f(xk(1,k)+gamma*d(1,k),xk(2,k)+gamma*d(2,k)))...
                < -a * b^mk * s * d(:,k)' * grad_matrix)
            mk = mk + 1;
            gamma = s * b^mk;
        end
            
        % calculate the xk+1 values
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

