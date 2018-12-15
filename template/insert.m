% low level function for TSP mutation
% insert mutation as explained in A. Eiben & E. Smith
% Representation is an integer specifying which encoding is used
%	1 : adjacency representation
%	2 : path representation

function NewChrom = insert(OldChrom,Representation)

NewChrom=OldChrom;

if Representation==1 
	NewChrom=adj2path(NewChrom);
end

% select two positions in the tour

rndi=zeros(1,2);

while rndi(1)==rndi(2) | abs(rndi(1) -rndi(2)) < 2
	rndi=rand_int(1,2,[1 size(NewChrom,2)]);
end
rndi = sort(rndi);

NewChrom(rndi(1)+1) = OldChrom(rndi(2));
for i = (rndi(1)+2):size(NewChrom, 2)
    if i <= rndi(2)
        NewChrom(i) = OldChrom(i-1);
    end
end
%buffer=NewChrom(rndi(2));
%NewChrom(rndi(1))=NewChrom(rndi(2));
%NewChrom(rndi(2))=buffer;
%OldChrom(rndi(2)) = []; 
%NewChrom = [OldChrom(1:rndi(1)) buffer OldChrom(rndi(1)+1:end)]; 

if Representation==1
	NewChrom=path2adj(NewChrom);
end


% End of function
