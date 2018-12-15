% low level function for TSP mutation
% reciprocal exchange : two random cities in a tour are swapped
% Representation is an integer specifying which encoding is used
%	1 : adjacency representation
%	2 : path representation
%

function NewChrom = scramble_new(OldChrom,Representation);

NewChrom=OldChrom;

if Representation==1 
	NewChrom=adj2path(NewChrom);
end

% select two positions in the tour

rndi=zeros(1,2);

while rndi(1)==rndi(2)
	rndi=rand_int(1,2,[1 size(NewChrom,2)]);
end
rndi = sort(rndi)
segment = NewChrom(rndi(1):rndi(2));
length_segment = size(segment, 2);
p = randperm(length_segment);
new_segment = zeros(1, length_segment);
for i = 1:length_segment
    new_segment(i) = segment(p(i));
end
NewChrom(rndi(1):rndi(2)) = new_segment;
%buffer=NewChrom(rndi(1));
%NewChrom(rndi(1))=NewChrom(rndi(2));
%NewChrom(rndi(2))=buffer;


if Representation==1
	NewChrom=path2adj(NewChrom);
end


% End of function
