%
% ObjVal = tspfun(Phen, Dist)
% Implementation of the TSP fitness function
%	Phen contains the phenocode of the matrix coded in path
%	representation
%	Dist is the matrix with precalculated distances between each pair of cities
%	ObjVal is a vector with the fitness values for each candidate tour (=each row of Phen)
%

function ObjVal = tspfun(Phen, Dist)
	cols = size(Phen, 2);
    rows = size(Phen, 1);
    ObjVal = zeros(rows, 1);
    for j = 1:rows
        ObjVal(j) = ObjVal(j) + Dist(Phen(j,cols), Phen(j, 1));
    end
    for t = 1:(cols-1)
        for j = 1:rows
            ObjVal(j) = ObjVal(j) + Dist(Phen(j,t), Phen(j,t+1));
        end
    end

% End of function

