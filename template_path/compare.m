function [pmx, order, xalt, scx] = compare()
% load the data sets
datasetslist = dir('datasets/');
datasets=cell( size(datasetslist,1)-2,1);
for i=1:size(datasets,1);
    datasets{i} = datasetslist(i+2).name;
end

% start with first dataset
data = load(['datasets/' datasets{10}]);
x=data(:,1)/max([data(:,1);data(:,2)]);
y=data(:,2)/max([data(:,1);data(:,2)]);
NVAR=size(data,1);

NIND=50;		% Number of individuals
MAXGEN=50;		% Maximum no. of generations
PRECI=1;		% Precision of variables
ELITIST=0.05;    % percentage of the elite population
GGAP=1-ELITIST;		% Generation gap
STOP_PERCENTAGE=.95;    % percentage of equal fitness individuals for stopping
PR_MUT=.0;     % probability of crossover
LOCALLOOP=0;      % local loop removal
TWO_OPT = 0;
 % default crossover operator
  MUTATION ='scramble';
probs = [0.2 0.5 0.8];
order = zeros(3,10);
pmx = zeros(3,10);
xalt = zeros(3,10);
scx = zeros(3,10);
CROSSOVER = 'xalt_edges';
for i = 1:3
    for j = 1:15
    PR_CROSS = probs(i);
    best_ind = run_ga_path_compare(x, y, NIND, MAXGEN, NVAR, ELITIST, STOP_PERCENTAGE, PR_CROSS, PR_MUT, CROSSOVER, MUTATION, LOCALLOOP, TWO_OPT);
    xalt(i,j) = best_ind;
    end
end
CROSSOVER='pmx'
for i = 1:3
    for j = 1:15
    PR_CROSS = probs(i);
    best_ind = run_ga_path_compare(x, y, NIND, MAXGEN, NVAR, ELITIST, STOP_PERCENTAGE, PR_CROSS, PR_MUT, CROSSOVER, MUTATION, LOCALLOOP, TWO_OPT);
    pmx(i, j) = best_ind;
    end
end
CROSSOVER ='order_high_level';
for i = 1:3
    for j = 1:15
    PR_CROSS = probs(i);
    best_ind = run_ga_path_compare(x, y, NIND, MAXGEN, NVAR, ELITIST, STOP_PERCENTAGE, PR_CROSS, PR_MUT, CROSSOVER, MUTATION, LOCALLOOP, TWO_OPT);
    order(i,j) = best_ind;
    end
end
CROSSOVER ='scx';
for i = 1:3
    for j = 1:15
    PR_CROSS = probs(i);
    best_ind = run_ga_path_compare(x, y, NIND, MAXGEN, NVAR, ELITIST, STOP_PERCENTAGE, PR_CROSS, PR_MUT, CROSSOVER, MUTATION, LOCALLOOP, TWO_OPT);
    scx(i,j) = best_ind;
    end
end