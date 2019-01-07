function stop = stop_crit(current_gen, fitnV, x, req_improvement)
% if fitness doesn't improve bij req_improvement every x generations return
% TRUE
% INPUT PARAMETERS
%   FITNV = array of best or median fitness values of every generation
%           untill current generation
%   X = check stop criterium every x generations
%   REQ_IMPROVEMENT is a percentage of improved fitness since generation 1

    if (current_gen>0)
        improvement = (fitnV(current_gen-x+1) - fitnV(current_gen))/(fitnV(1) - fitnV(current_gen));
        stop = req_improvement>improvement;
    else
        stop = 0; %FALSE
        
    end
end
    

                
        