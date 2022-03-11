function [xk,n] = steepest_descent_const(f,epsilon,gamma,X)
%STEEPEST_DESCENT_CONST
%
%xk: the minimum point
%n: # of iterations
%
% The idea is to take repeated steps in the opposite direction of the 
% gradient of the function at the current point, because this is
% the direction of steepest descent and thus we can find the local minimum.
% In this particular method we are using a constant value for our gamma.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d = []; %create an array to hold the values of the dk vector
k = 1; 
xk = X;
f_grad = gradient(f); %calculate the gradient of our function

%set when our algorithm is gonna end
while (norm(double(subs(f_grad,symvar(f_grad),{xk(:,k)'}))) > epsilon)
           
        % Calculate the k+1 d value and place it in the the 
        % placeholder Dk matrix
        d = [d -double(subs(f_grad,symvar(f_grad),{xk(:,k)'}))];
    
        % do the same for the xk+1 values
        x_k = xk(:,k) + gamma * d(:,k);
        xk = [xk x_k];
            
        % Increase the k counter 
        k = k + 1;
end
n = k - 1 ;

end

