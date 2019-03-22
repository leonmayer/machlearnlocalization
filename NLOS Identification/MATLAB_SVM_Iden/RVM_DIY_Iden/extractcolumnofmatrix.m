function [colvec] = extractcolumnofmatrix(matrix, N)
% Summary: Used for xi
% Input:    training data matrix; N = no. of column of vector


[norows, nocolumns] = size(matrix);
colvec = matrix(1:norows,N);

end

