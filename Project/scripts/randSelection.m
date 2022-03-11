%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Optimization Techniques - Project 2021/2022
%%%% Tzomidis Nikolaos - Fotios (9461)
%%%% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [selectedPop] = randSelection(population,numOfSelections)
%randSelection
%
% Function to select a random span inside our population to then use the
% crossover proccess on it.

data = zeros(1,numOfSelections);

for i=1:numOfSelections
    data(i) = randi(size(population,1));
end
   
selectedPop = population(data,:);

end
