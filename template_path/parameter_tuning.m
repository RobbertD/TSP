function [Parameterset, best, means, bests, worsts] = parameter_tuning(Initialpop)
    
    pop_size = size(Initialpop, 1);
    length = size(Initialpop, 2);
    
    %Utility values for the initial parameter vectores
    Utility = zeros(1, pop_size);
    for i = 1:pop_size
        [value,~] = run_ga_path_best(3, Initialpop(i,:));
        Utility(i) = value;
    end
    %worst and best parameter vectors
    [minimum, ~] = min(Utility); 
    [maximum, index_max] = max(Utility);
    
    %sets to track the evolution
    means = [mean(Utility)];
    bests = [minimum];
    worsts = [maximum];
    
    
    for k = 1:10
        k
        for i = 1:pop_size
            % select n parameters to be altered
            n = rand_int(1,1,[1 2]);
            rndi = rand_int(1,n,[2 length]);
            while not(size(unique(rndi))==size(rndi))
                rndi=rand_int(1,n,[2 length]);
            end
            
            %alter parameters and run ga
            Newset = altered_parameters(Initialpop(i,:), rndi);
            [new_utility, ~] = run_ga_path_best(3, Newset);
            
            % replace worst parameterset if new set is better
            if new_utility < maximum
                Initialpop(index_max, :) = Newset;
                Utility(index_max) = new_utility;
                [maximum, index_max] = max(Utility);
            end
        end
        means = [means mean(Utility)];
        bests = [bests min(Utility)];
        worsts = [worsts max(Utility)];
    end
    [best, index_best] = min(Utility);
    Parameterset = Initialpop(index_best,:);
            
        
    
        