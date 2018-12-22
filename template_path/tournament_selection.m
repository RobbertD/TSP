function SelCh = tournament_selection(OldCh, FitnV, Replacement, k, GGAP)
% Tournament selection:
%   OldCh:          The population from wich to select parents
%   Fval:           Fitness values
%   Replacement:    should be 1 or 0: with or without replacement
%   GGAP:           (optional) Rate of individuals to be selected, if omitted 1.0 is assumed
%   k:              amount of participants in each tournament
    
    if nargin < 5
        GGAP = 1.0;
    end
    Nind = size(OldCh, 1);
    L = size(OldCh, 2);
    
    % Compute number of new individuals (to select)
    NSel=max(floor(Nind*GGAP+.5),2)
    
    % Select individuals from population
    SelCh = zeros(NSel, L);
    for j = 1:NSel
        %With replacement:
        if Replacement == 1
            r = rand_int(1, k, [1 Nind]);

        %Without replacement:
        else
            r = rand_int(1, k, [1 Nind]);
            %check if r has all unique values
            while size(unique(r),2) ~= size(r,2)
                r = rand_int(1, k, [1 Nind]);
            end
        end
        tournament_vals = zeros(1, k);
        for i = 1:k
            tournament_vals(i) = FitnV(k);
        end
        [~, winner_ind] = min(tournament_vals)
        SelCh(j, :) = OldCh(winner_ind, :);
    end
    
    