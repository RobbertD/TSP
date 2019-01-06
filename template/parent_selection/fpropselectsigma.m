% FPROPSELECT.M          (FITNESS PROORTIONATE SELECTION)
%
% This function performs selection with FITNESS PROORTIONATE SELECTION.
% Using same format as SUS.M
% Syntax:  NewChrIx = fpropselect(FitnV, Nsel)
%
% Input parameters:
%    FitnV     - Column vector containing the fitness values of the
%                individuals in the population.
%    Nsel      - number of individuals to be selected
%
% Output parameters:
%    NewChrIx  - column vector containing the indexes of the selected
%                individuals relative to the original population, shuffled.
%                The new population, ready for mating, can be obtained
%                by calculating OldChrom(NewChrIx,:).

function NewChrIx = fpropselectsigma(FitnV,Nsel);

% Identify the population size (Nind)
   [Nind,ans] = size(FitnV);
   
% Apply sigma scaling
    c=2;
    meanF = mean(FitnV);
    stdF = std(FitnV);
    FitnV(1:Nind) = max(FitnV(1:Nind)-(meanF-c*stdF),0);

% Perform fitness proportionate selection
    expected_count = FitnV/mean(FitnV); 
    % Whith large populations rounding errors cause fewer of more parents
    % to be selected. Adding 0.1 ensures there are enough parents. Extra
    % parents are truncated later
    expected_count = expected_count + 0.1;
    rel_expected_count = expected_count*(Nsel/Nind);
    actual_count = round(rel_expected_count);
    
    % find indexes that are not zero (and so are selected at least once)
    indexes = find(actual_count);
    % add index as often as actual_count indicates
    NewChrIx_temp = [];
    indexes = indexes.';
    for i = indexes
        [limit,dc] = size(NewChrIx_temp);
        NewChrIx_temp(limit+1:(limit + actual_count(i)),1) = i;
    end

% Shuffle new population
   [ans, shuf] = sort(rand(Nsel, 1));
   NewChrIx_temp = NewChrIx_temp(shuf);

% truncate output to desierd number of chroms
   NewChrIx(1:Nsel,1) = NewChrIx_temp;
   a = size(NewChrIx_temp)- size(NewChrIx);
   if a>0
       disp(a)
   end

% End of function