function NewChrom=two_opt(Chrom, Dist)
%2-opt method as described on wikipedia
%   Chrom: a single Chromosome
%   Dist: the Distane matrix
    NewChrom = Chrom;
    L = size(NewChrom, 2);
    Repeat = true;
    while Repeat
        for i = 1:L-1
            SwappedChrom = NewChrom;
            SwappedChrom(i) = NewChrom(i+1);
            SwappedChrom(i+1) = NewChrom(i);
            if tspfun(SwappedChrom, Dist) < tspfun(NewChrom, Dist)
                NewChrom = SwappedChrom;
            end
        end
        SwappedChrom = NewChrom;
        SwappedChrom(L) = NewChrom(1);
        SwappedChrom(1) = NewChrom(L);
            if tspfun(SwappedChrom, Dist) < tspfun(NewChrom, Dist)
                NewChrom = SwappedChrom;
            end
        if NewChrom == Chrom
            Repeat = false;
        end
        Chrom = NewChrom;
    end
end
    