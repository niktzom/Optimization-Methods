function [xk,n] = steepest_descent_gamma(f,epsilon,~,X)
%STEEPEST_DESCENT_CONST
%
%xk: the minimum point
%n: # of iterations
%
%
% The idea is to take repeated steps in the opposite direction of the 
% gradient of the function at the current point, because this is
% the direction of steepest descent and thus we can find the local minimum.
% In this particular method we are using a slightly variated golden section
% algorithm from the 1st assignment to minimize the f(xk+gamma*dk) term.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d = []; %create an array to hold the values of the dk vector
k = 1; 
xk = X;
f_grad = gradient(f); %calculate the gradient of our function

% Create a syms variable to call the golden senction algorithm 
syms gamma_value
        
%set when our algorithm is gonna end
while (norm(double(subs(f_grad,symvar(f_grad),{xk(:,k)'}))) > epsilon)
            
      % Calculate the k+1 d value and place it in the the 
      %placeholder Dk matrix
      d = [d -double(subs(f_grad,symvar(f_grad),{xk(:,k)'}))];
            
      % Initialize a function with gamma_value as its input variable
     func_min(gamma_value) = f(xk(1,k)+gamma_value*d(1,k),xk(2,k)+gamma_value*d(2,k));
            
      % Find the minimum of the function using  the golden section
      % algorithm
      gamma = gold_sect(func_min,0.001,0,1);
            
      % find the the xk+1 values
      x_k = xk(:,k) + gamma * d(:,k);
      xk = [xk x_k];
            
      % Increase the k counter
      k = k + 1;
end
n = k - 1 ;
end

