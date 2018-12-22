function stop = stop_crit(gen, fitnV, x, req_improvement)
% if fitness doesn't improve bij req_improvement every x generations return
% TRUE
% REQ_IMPROVEMENT is a percentage of improved fitness since generation 1 
    if (mod(gen,x) == 0 && gen>0)
        improvement = (fitnV(gen-x+1) - fitnV(gen))/(fitnV(1) - fitnV(gen));
        stop = req_improvement>improvement;
    else
        stop = 0; %FALSE
        
    end
end