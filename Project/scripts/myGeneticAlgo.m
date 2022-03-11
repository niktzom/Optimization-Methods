%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Optimization Techniques - Project 2021/2022
%%%% Tzomidis Nikolaos - Fotios (9461)
%%%% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [bestCandidate,err] = myGeneticAlgo(gaussiansN,maxGenerations,mutationChance)
tic;

populationSize = 150; 
generation = 1; 
chromosomes = gaussiansN * 5;  
population = zeros(populationSize,chromosomes+1);
genes = zeros(1,chromosomes);
c1Lims = [-3 4]; 
c2Lims = [-4 3];
err = inf(1,maxGenerations);
best = zeros(maxGenerations,chromosomes+1);


[minf,maxf] = fLimits();
% First Generation - Random values
for j = 1:populationSize
    for i = 1:5:chromosomes
        genes(i) = minf + (maxf - minf)*rand; %magnitude
        genes(i+1) = c1Lims(1) + (c1Lims(2) - c1Lims(1))*rand; %center1
        genes(i+2) = c2Lims(1) + (c2Lims(2) - c2Lims(1))*rand; %center2
        genes(i+3) = 0.2 + 1.1 * rand; %sigma1 
        genes(i+4) = 0.2 + 1.1 * rand; %sigma2
    end
    population(j,1:chromosomes) = genes;
    population(j,chromosomes+1) = fitnessFunc(genes,chromosomes);
end

% Sorting the 1st generation based on the fitness score of each indivual.
population = sortrows(population,chromosomes+1);

best(generation,:) = (population(1,:));
err(generation) = population(1,chromosomes+1); 
prev_error = population(1,chromosomes+1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bestPerc = 0.3;
randomPerc = 0.1;                            % "random" percentages for the   
crossoverPerc = 1 - (bestPerc + randomPerc); % crossover method.

bestSelections = populationSize*bestPerc;
randomSelections = populationSize*randomPerc;
crossoverSelections = populationSize*crossoverPerc;

randomStart = bestSelections +1;
randomEnd = randomStart + randomSelections - 1;

bestPopulation = population(1:bestSelections,1:chromosomes);
crossoveredPop = zeros(crossoverSelections, length(bestPopulation));

while ( prev_error >=0.005 && generation <= maxGenerations)
    generation = generation + 1;

 population(randomStart:randomEnd, 1:end-1) = ...
     randSelection(population(randomStart:end,1:chromosomes),randomSelections);

% Apply crossover on the pseudorandom part of our population that we chose.
for i=1:crossoverSelections
    randBest = [randi(size(bestPopulation,1)-1) randi(size(bestPopulation,1))];
    crossoveredPop(i,:) = crossover(bestPopulation(randBest(1),:),bestPopulation(randBest(2),:));
    population(randomEnd+1:end, 1:chromosomes) = crossoveredPop;
end

%Mutating some of the  individuals
for i = 1:populationSize
    if rand * 100 < mutationChance   
       population(i,1:chromosomes) = mutation(population,chromosomes,populationSize);
    end
end

%Calculate again the fitness for each gene
for j = 1:populationSize
    population(j,chromosomes+1) = fitnessFunc(population(j,1:chromosomes),chromosomes);
end

% Sorting our population for each generation based on the fitness score 
% of each indivual.
population = sortrows(population,chromosomes+1);

best(generation,:) = (population(1,:));
err(generation) = population(1,chromosomes+1); 
prev_error = population(1,chromosomes+1);
end    

[~,idx] = min(err); % index of the generation with the lowest MSE.
bestCandidate = best(idx,1:chromosomes); % take the individual with that index,

toc;
end
