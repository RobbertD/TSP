function [fit_begin, fit_end, stop_values] = run_ga_test_stopcrit(Ngen, req_impr, NIND, MAXGEN, ELITIST, STOP_PERCENTAGE, PR_CROSS, PR_MUT, CROSSOVER, LOCALLOOP)
% usage: run_ga(
%               NIND, MAXGEN, NVAR, 
%               ELITIST, STOP_PERCENTAGE, 
%               PR_CROSS, PR_MUT, CROSSOVER, 
%               ah1, ah2, ah3)
%
%

% NIND: number of individuals
% MAXGEN: maximal number of generations
% ELITIST: percentage of elite population
% STOP_PERCENTAGE: percentage of equal fitness (stop criterium)
% PR_CROSS: probability for crossover
% PR_MUT: probability for mutation
% CROSSOVER: the crossover operator
% calculate distance matrix between each pair of cities
% ah1, ah2, ah3: axes handles to visualise tsp
%{NIND MAXGEN ELITIST STOP_PERCENTAGE PR_CROSS PR_MUT CROSSOVER LOCALLOOP}

    % load the data sets
    datasetslist = dir('template/datasets/');
    datasets=cell( size(datasetslist,1)-2,1);
    for i=1:size(datasets,1)
        datasets{i} = datasetslist(i+2).name;
    end

    % start with first dataset
    data = load(['datasets/' datasets{5}]);
    x=data(:,1)/max([data(:,1);data(:,2)]);
    y=data(:,2)/max([data(:,1);data(:,2)]);
    NVAR=size(data,1);
        
        stop_values = [];
        GGAP = 1 - ELITIST;
        mean_fits=zeros(1,MAXGEN+1);
        worst=zeros(1,MAXGEN+1);
        Dist=zeros(NVAR,NVAR);
        diversity = zeros(MAXGEN+1);
        for i=1:size(x,1)
            for j=1:size(y,1)
                Dist(i,j)=sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
            end
        end
        % initialize population
        Chrom=zeros(NIND,NVAR);
        for row=1:NIND
        	%Chrom(row,:)=path2adj(randperm(NVAR));
            Chrom(row,:)=randperm(NVAR);
        end
        gen=0;
        % number of individuals of equal fitness needed to stop
        stopN=ceil(STOP_PERCENTAGE*NIND);
        % evaluate initial population
        ObjV = tspfun(Chrom,Dist);
        best=zeros(1,MAXGEN);
        % generational loop
        while gen<MAXGEN
            sObjV=sort(ObjV);
          	best(gen+1)=min(ObjV);
        	minimum=best(gen+1);
            mean_fits(gen+1)=mean(ObjV);
            worst(gen+1)=max(ObjV);
            if gen == 0, fit_begin = best(gen+1);  end
            for t=1:size(ObjV,1)
                if (ObjV(t)==minimum)
                    break;
                end
            end

            if (sObjV(stopN)-sObjV(1) <= 1e-15)
                  break;
            end 
            
            %%added stop criterium
            if (stop_crit(gen, best, Ngen, req_impr))
                disp("stop_crit")
                stop_values = [stop_values;[gen, best(gen)]];
                
                  %break;
            end 
            diversity(gen+1) = stop_crit_diversity(Chrom);
        	%assign fitness values to entire population
        	FitnV=ranking(ObjV);
        	%select individuals for breeding
        	SelCh=select('sus', Chrom, FitnV, GGAP);
        	%recombine individuals (crossover)
            SelCh = recombin(CROSSOVER,SelCh,PR_CROSS);
            SelCh=mutateTSP('inversion',SelCh,PR_MUT);
            %evaluate offspring, call objective function
        	ObjVSel = tspfun(SelCh,Dist);
            %reinsert offspring into population
        	[Chrom ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
            
            Chrom = tsp_ImprovePopulation(NIND, NVAR, Chrom,LOCALLOOP,Dist);
        	%increment generation counter
        	gen=gen+1;            
        end
        fit_end = best(MAXGEN);
end
