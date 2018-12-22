function Best_pop = tournament_det(pop, m)
    copypop = pop;
    n = size(pop)
    Best_pop = array.empty()
    for t=1:m
        maxfit = 0;
        maxind = 0;
        for el = 1:n
            if pop(el) > maxfit
                maxfit = pop(el);
                maxind = el;
            end
        end
        pop(maxind) = -inf
        
    end
end