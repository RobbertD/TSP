function NewChrom = scx(OldChrom, XOVR, Dist);

if nargin < 2, XOVR = NaN; end
   
[rows,cols]=size(OldChrom);
   
   maxrows=rows;
   if rem(rows,2)~=0
	   maxrows=maxrows-1;
   end
   
   for row=1:2:maxrows
	
     % crossover of the two chromosomes
   	% results in 2 offsprings
	if rand<XOVR			% recombine with a given probability
		NewChrom(row,:) =scx_ind([OldChrom(row,:);OldChrom(row+1,:)],Dist);
		NewChrom(row+1,:)=scx_ind([OldChrom(row+1,:);OldChrom(row,:)], Dist);
	else
		NewChrom(row,:)=OldChrom(row,:);
		NewChrom(row+1,:)=OldChrom(row+1,:);
	end
   end

   if rem(rows,2)~=0
	   NewChrom(rows,:)=OldChrom(rows,:);
   end
