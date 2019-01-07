function Offspring = scx_ind(Parents, Dist)
    current_node = Parents(1,1);
    L = size(Parents,2);
    Newchrom = zeros(1, L);
    Newchrom(1) = current_node;
    current_index = 2;
    while ismember(0, Newchrom)
        leg_node1 =  leg_node(Newchrom, Parents(1,:), current_node, L);
        leg_node2 =  leg_node(Newchrom, Parents(2, :), current_node, L);
        if Dist(current_node, leg_node1) < Dist(current_node, leg_node2)
                Newchrom(1,current_index) = leg_node1;
                current_node = leg_node1;
        else
                Newchrom(1,current_index) = leg_node2;
                current_node = leg_node2;
        end
        current_index = (current_index +1);
    end
    Offspring = Newchrom;
end
function Node = leg_node(TempChrom, Parent, current_node, L)
    buffer = linspace(1, L, L);
    index = Parent == current_node;
    [~, ind] = max(index);
    index = mod(ind, L) + 1;
    Node = Parent(index);
    i = 1;
    while ismember(Node, TempChrom)
        Node = buffer(i);
        i = i +1;
    end
end
        
    