function [bestset, bests] = random_uphill_walk(Parameterset, N)
    bests = zeros(1, N);
    bests(1) = run_ga_path_best(3, Parameterset);
    current_set = Parameterset;
    length = size(Parameterset, 2);
    count = 1;
    run = 1;
    while count < N
        if run == 15
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
        val = run_ga_path_best(3, Tempparams);
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
        
    
