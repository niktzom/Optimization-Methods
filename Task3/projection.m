%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tzomidis Nikolaos-Fotios (9461), tzomidis@ece.auth.gr
% 3rd Assignment in Optimization Techniques 7th Semester@ ECE AuTH.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function proj = projection(X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that calculates the projection of vector X=[x_1;x_2] with given 
% intervals such as (a(1)<=x1<=a(2),b(1)<=x2<=b(2)) Where:
%   a,b: restriction intervals for the variables x1,x2 
%   X: the vector x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a = [-15,15]; b = [-20,12];

    % if xk(1) out of X:
    if  X(1)  < a(1) 
        
        X(1) = a(1);
        
    elseif X(1) > a(2) 
            
            X(1) = a(2);
    end
    
    % if xk(2) out of X: 
    if  X(2)  < b(1) 
        
        X(2) = b(1);
        
    elseif X(2) > b(2) 
            
            X(2) = b(2);
    end 

    proj = X;
end

