function [xk,n] = newton_armijo(f,epsilon,gamma,X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NEWTON, gamma using the Armijo method. 
%
%x: the minimum point
%n: # of iterations
%
%The idea is to approach f, with a quadratic function in each iteration and
%find mininum around xk.
% In this particular method we are using the armijo method to minimize the
% gamma with a=0.002 and b=0.25 .
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d = []; %initialize an array to hold the values of the Dk vector
k = 1;
xk = X;

grad_f = gradient(f);
hess_f = hessian(f);
max_step = 100;

% Set the armijo algorithm constants
mk = 0;
a = 2*10^(-3);
b = 1/4;
s = gamma * b^mk;
        
% set when our algorithm is gonna end
while (norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))) > epsilon)
            
  % Calculate the k+1 d value and place it in the the 
  % placeholder Dk matrix
            
  grad_matrix = double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
  hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
  % create the d matrix
  d = [d -hess_matrix\grad_matrix];

  fx_k = double(f(xk(1,k),xk(2,k)));

  % find the mk value for which the inequality is satisfied
  while (fx_k - double(f(xk(1,k)+gamma*d(1,k),xk(2,k)+gamma*d(2,k))) < ...
          -a * b^mk * s * d(:,k)' * grad_matrix)
     mk = mk + 1;
     gamma = s * b^mk;
  end
            
  % calculate the xk+1 values
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
  % Set mk to 0 for the next iteration
  mk = 0;
  gamma = s * b^mk;

end      
n = k - 1;
end

