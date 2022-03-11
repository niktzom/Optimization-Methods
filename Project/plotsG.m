%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Optimization Techniques - Project 2021/2022
%%%% Tzomidis Nikolaos - Fotios (9461)
%%%% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotsG(genes,gsize,error)
% Plots for visualization of our best candidate and comparison with the
% function used to create the input-output data.
%
size = 50;

u1 = linspace(-1, 2, size); 
u2 = linspace(-2, 1, size); 


%The plot of the approximation of f 

f_aprox = zeros(size,size);
count_u1 = 1;
for i = u1
    count_u2 = 1;
    for j = u2
        f_aprox(count_u1,count_u2) = fBar(i,j,genes,gsize);
        count_u2 = count_u2 + 1;
    end
    count_u1 = count_u1 + 1;
end
figure(1)
surf(u1,u2,f_aprox);
title('f Αpproach plot');


%The plot of f 

fvalues = zeros(size,size);
count_u1 = 1;
    for i = u1
        count_u2 = 1;
        for j = u2
            fvalues(count_u1,count_u2) = real_f(i,j);
            count_u2 = count_u2 + 1;
        end
        count_u1 = count_u1 + 1;
    end
figure(2)
surf(u1,u2,fvalues)
title('f 3D plot');

%
%The error of the approximation (2d and 3d representation ) 
%

figure(5)
plot(error)
title('Error');


err_values = fvalues - f_aprox;

figure(6)
surf(u1,u2,err_values);
title('Error 3D');


end