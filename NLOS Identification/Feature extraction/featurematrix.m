function [matrix] = featurematrix(signalmatrix)
%FEATUREMATRIX Summary of this function goes here
% Input: matrix with one row per signal
% Output: matrix with one feature column for one signal

for k = 1:length(signalmatrix)
    matrix(:,k) = singlefeaturevector(signalmatrix(k,:))

end

