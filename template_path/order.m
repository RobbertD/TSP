% low level function for calculating an offspring
% given 2 parent in the Parents - agrument
% Parents is a matrix with 2 rows, each row
% represent the genocode of the parent
% order recombination as in A.Eiben & J.Smith

function Offspring=order(Parents);
cols=size(Parents,2);
Offspring=zeros(1,cols);

rndi=zeros(1,2);

while rndi(1)==rndi(2)
    rndi=rand_int(1,2,[1 size(Offspring,2)]);
end
rndi = sort(rndi);
Offspring(rndi(1):rndi(2)) = Parents(1,rndi(1):rndi(2));
ParentOrder = [];
for i = 1:cols
    if not(ismember(Parents(2, i), Offspring))
        ParentOrder = [ParentOrder, Parents(2, i)];
    end
end
for i = 1:cols
    if Offspring(i) == 0
        Offspring(i) = ParentOrder(1);
        if size(ParentOrder, 1) ~= 0
            ParentOrder(1) = [];
        end
    end
end
% end function
