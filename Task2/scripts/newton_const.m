function [xk,n] = newton_const(f,epsilon,gamma,X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NEWTON, gamma is constant.
%
%x: the minimum point
%n: # of iterations
%
%The idea is to approach f, with a quadratic function in each iteration and
%find mininum around xk.
%First we are using a constant gamma in the f(xk+gamma*dk) term.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d = []; %initialize an array to hold the values of the Dk vector
k = 1;
xk = X;

grad_f = gradient(f);
hess_f = hessian(f);

while ((norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'})))) > epsilon)
            
         % Calculate the gradient and the hessian matrix at xk
         grad_matrix = double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
         hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
         % create the d matrix
         d = [d -hess_matrix\grad_matrix];
            
         % Calculate the xk+1 value and place it in the xk matrix
         x_k = xk(:,k) + gamma * d(:,k);
         xk = [xk x_k];
         k = k + 1;
end
n = k - 1;
end

