%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Optimization Techniques - Project 2021/2022
%%%% Tzomidis Nikolaos - Fotios (9461)
%%%% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function mut_pop = mutation(individual,gsize,populationNum)
%mutation
%
% Function that randomly chooses one gene from the individual to mutate.
% Mutation is achieved with changing the current value of the gene with a
% random value within its set limits.
mod_index = randi(populationNum);
switch(mod(mod_index,5))
    case 1
        individual(mod_index,1:gsize) = -1 + 2*rand; %magnitude of Gaussian
    case 2
        individual(mod_index,1:gsize) = -3 + 7*rand; %center1 [-3,4]
    case 3
        individual(mod_index,1:gsize) = -4 + 7*rand; %center2 [-4,3]
    case 4
        individual(mod_index,1:gsize) = 0.2 + 1.1 * rand; %sigma1 [0.2,1.3]
    case 5
        individual(mod_index,1:gsize) = 0.2 + 1.1 * rand; %sigma2 [0.2,1.3]
end
mut_pop = individual(mod_index,1:gsize); %The individual, with one of his genes changed
end