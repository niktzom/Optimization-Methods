%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Optimization Techniques - Project 2021/2022
%%%% Tzomidis Nikolaos - Fotios (9461)
%%%% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mutationChance = 30;
maxGen = 10000;
gaussians = 15;
genesSize = gaussians*5;

%% Runtime around 5 to 6 minutes! 
% If we need to just see the plots and the Gaussians table comment this part out.
%
% Calculate our best individual candidate and our error progress. 

[bestCand,bestError] = myGeneticAlgo(gaussians,maxGen,mutationChance);


%% Load our best result from the test and generate the plots from that.

%load best33mut.mat
plotsG(bestCand,genesSize,bestError)


gaussianNames = {'1st Gaussian';'2nd Gaussian';'3rd Gaussian';'4th Gaussian';...
    '5th Gaussian';'6th Gaussian';'7th Gaussian';'8th Gaussian';'9th Gaussian';...
    '10th Gaussian';'11th Gaussian';'12th Gaussian';'13th Gaussian';...
    '14th Gaussian';'15th Gaussian'};
A = bestCand(1:5:end)';
center1 = bestCand(2:5:end)'; center2 = bestCand(1:5:end)';
sigma1 = bestCand(1:5:end)'; sigma2 = bestCand(1:5:end)'; 
gaussiansTable = table(gaussianNames,A,center1,center2,sigma1,sigma2);
disp(gaussiansTable)
%writetable(gaussiansTable,'Gaussians.xlsx','FileType','spreadsheet');