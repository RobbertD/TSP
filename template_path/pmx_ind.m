
function Offspring=pmx_ind(Parents)
    cols=size(Parents,2);
	r = zeros(1,2);
    while r(1) == r(2)
        r = rand_int(1,2,[1,cols]);
    end
    r = sort(r);
    Offspring=zeros(1,cols);
    Offspring(r(1):r(2)) = Parents(1,r(1):r(2));
    for i = r(1):r(2)
        %j: position in offspring where Parents(2, i) will come
        if not(ismember(Parents(2,i), Offspring))
            %element occupying position of Parent(2,i)
            j = Parents(2,:) == Offspring(i);
            while not(Offspring(j) == 0)
            new_j = Parents(2,:) == Offspring(j);
            j = new_j;
            end
            Offspring(j) = Parents(2, i);
        end
        
    end
    for i = 1:cols
        if Offspring(i) == 0
            Offspring(i) = Parents(2, i);
        end
    end
% end function
