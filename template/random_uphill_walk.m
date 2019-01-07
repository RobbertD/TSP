function [bestset, bests] = random_uphill_walk(Parameterset, N)
    % PARAMETERSET = [POP_SIZE, MAX_GENERATIONS, ELITISM, CROSSOVER_RATE, MUTATION_RATE]
    % N = AMOUNT OF IMPROVEMENT ROUNDS
    m = 50 % amount of times a certain parameterset is run when calculating mean scores
    max_runs = 50; %Max amount of runs without improvement
    bests = zeros(1, N);
    bests(1) = run_ga_path_best(3, Parameterset);
    current_set = Parameterset;
    length = size(Parameterset, 2);
    count = 1;
    run = 1;
    while count < N
        if run == max_runs
            run = 0;
            break
        end
        count
        n = rand_int(1,1,[1 2]);
        rndi = rand_int(1,n,[2 length]);
        while not(size(unique(rndi))==size(rndi))
            rndi=rand_int(1,n,[2 length]);
        end
        Tempparams = altered_parameters(current_set, rndi);
        val = run_ga_path_best(m, Tempparams);
        if val < bests(count)
            count = count + 1;
            bests(count) = val;
            current_set = Tempparams;
            run = 0;
        end
        run = run+1
    end
    bestset = current_set;
end
        
    
