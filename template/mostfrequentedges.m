function [maxvalues, ind] = mostfrequentedges(N, Pop);
    % Pop is population in the path representation
    Lengths = size(Pop);
    FrequencyMatrix = zeros(Lengths(1));
    for p = 1:Lengths(1)
        path = Pop(p,:);
        for t=1:(size(path)-1)
            FrequencyMatrix(path(t),path(t+1)) = FrequencyMatrix(path(t),path(t+1)) + 1;
        end
        FrequencyMatrix(path(size(path)), path(1)) = FrequencyMatrix(path(size(path)), path(1)) + 1;
    end   
    [maxvalues, ind] = maxk(FrequencyMatrix(:), N)
end
  
    
    
        
           