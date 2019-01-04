% TOURNAMENTSELECT.M          (TOURNAMENT SELECTION)
%
% This function performs selection with TOURNAMENT SELECTION.
% Using same format as SUS.M
% Syntax:  NewChrIx = tournamentselect(FitnV, Nsel)
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

% Author:     Robbert DeHaven
% History:    21.12.2018     file created


function NewChrIx = tournamentselect(FitnV,Nsel);

% Identify the population size (Nind)
   [Nind,ans] = size(FitnV);
    NewChrIx = zeros(Nsel,1);
    
% Perform tournament selection
    % k = tournament size
    k = 10;
    for i = 1:Nsel
        contenders = floor(rand(k,1)*Nind)+1;
        fitn = FitnV(contenders(1:k));
        [maxFit, index] = max(FitnV(contenders));
        NewChrIx(i) = contenders(index);
    end

% Shuffle new population
   [ans, shuf] = sort(rand(Nsel, 1));
   NewChrIx = NewChrIx(shuf);

end

% End of function