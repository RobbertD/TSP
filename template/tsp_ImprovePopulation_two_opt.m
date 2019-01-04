function NewChrom = tsp_ImprovePopulation_two_opt(NIND, Chrom, TWO_OPT,Dist)
NewChrom = Chrom;
if (TWO_OPT)
    for i = 1:NIND
        ImprovedChrom = two_opt(Chrom(i, :), Dist);
        NewChrom(i,:) = ImprovedChrom;
    end
end
        