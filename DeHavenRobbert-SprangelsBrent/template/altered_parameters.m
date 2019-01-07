function Newset = altered_parameters(InitialSet, Indices)
%This function is called in the parameter_tuning algorithm.
%Given a set of parameters and a set of indices, the function gives a new
%set of parameters with the parameters at the positions of the indices
%altered with respect to the initial set. An upper limit of 150 is chosen
%for the integer parameter values.
%
%   Initialset: a list of parameters
%   Indices of the list that need to be altered
%

L = size(Indices, 2);
Newset = InitialSet;



for i = 1:L

    if Indices(i) == 2
        r = round(normrnd(Newset(2), 20));
        while r < 20 || r > 250
            r = round(normrnd(Newset(1), 20));
        end
        Newset(1) = round(5000/r);
        Newset(2) = r;
    else
        r = 2.0;
        while r > 1 || r < 0 || r == Newset(Indices(i))
            rnd = round(normrnd(0,1.3));
            if rnd >= 0
                r = Newset(Indices(i)) + 0.1;
            else 
                r = Newset(Indices(i)) - 0.1;
            end
        end
        Newset(Indices(i)) = r;
    end
end