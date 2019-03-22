function [vec] = ftn(func, n, t)
% Summary: Generates vector from function func in which the nth column is
% the n-delayed version of func
% Input: Function to shift, Number of maximal shifts
% Output: The generated [n x 1] vector
% Tc: Chip duration taken from global_constants.m

% CONSTANTS
global Tc;

% Test outputs
sprintf('%d', n);
sprintf('%d', length(func));
sprintf('%d', n*Tc);

% Initialize a vector of zeros. The size is defined by the number of
% shifts n.

vec = zeros(n,1);

% Print out test outputs

sprintf('%d', length(vec));

% Iterate through the output vector elements. Each time, the k*Tc-shifted
% value of the input function is written into the kth element.

k = 1:n; 
tau = t - k.'.* Tc; 
vec = func(tau); 

end
