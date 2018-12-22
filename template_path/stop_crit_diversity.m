function stop = stop_crit_diversity(chrom)
    [m,n] = size(chrom);
    edges = zeros(m*n, 2);
    for c=1:m
        for t=1:n-1 %add all the edges 
            city1 = min(chrom(c,t),chrom(c,t+1));   
            city2 = max(chrom(c,t),chrom(c,t+1));
            edges((c-1)*n+t, 1) = city1;
            edges((c-1)*n+t, 2) = city2;
        end
        %add the edge of the last and the first city
        city1 = min(chrom(c,n),chrom(c,1));   
        city2 = max(chrom(c,n),chrom(c,1));
        edges(c*n, 1) = city1;
        edges(c*n, 2) = city2;
    end
    u = unique(edges, 'rows');
   [s,a] = size(u);
    stop = s;
end