function [SelCh, ObjVSel] = survivorRR(Chrom, SelCh, ObjVCh, ObjVSel)
%	Implementation of the round robin survivor selection as described in
%	Introdustion to evolutionary computing
%   
q=50;
chrompool = [Chrom; SelCh];
objpool = [ObjVCh; ObjVSel];
Nind = size(chrompool,1);

%calculates the number of wins for a single chrom
for i = 1:Nind
    % generate contenders
    contenderIx = floor(rand(q,1)*Nind)+1;
    % win if tour is smaller
    indWins = find(objpool(i)<objpool(contenderIx(1:q)));
    % count the wins
    wins(i) = size(indWins,1);
end

% sort by most wins
[Dummy, ix] = sort(wins, 'descend');

SelCh = chrompool(ix,:);
ObjVSel = objpool(ix,:);

end

