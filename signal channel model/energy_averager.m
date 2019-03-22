function [y] = energy_averager(rBPF)
% Summary: Calculates a row vector of sample energy averages by integrating
% over |rBPF|^2 with different time intervals.


% CONSTANTS

global NSync;
global Nc;
global Tc;

Y = reshape(abs(rBPF.').^2 , Tc, Nc, NSync );
Y = permute(Y,[3 2 1]);
Y = sum(Y,3);

y = (1/NSync) * sum(Y,1) ;


end