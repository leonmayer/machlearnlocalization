
function [ gamma ] = PDP_estimate( y )
% This function calculates the power delay profile estimates from a given
% energy vector according to (10) in the paper.

% CONSTANTS
global Nd;
% Ternary sequence
C = [-1,0,1,-1,0,0,1,1,1,-1,1,0,0,0,-1,1,0,1,1,1,0,-1,0,1,0,0,0,0,-1,0,0];

global M

Onevec = ones(1, 31);
% Bipolar sequence
B = (2*C.*C)-Onevec;
% Unit vector of length M = 64
delta_m = zeros(1,M); 
delta_m(1,1) = 1;

Q = kron(B,delta_m);

R = zeros(Nd, length(y));

for k = 1:Nd
   R(k,:) = circshift(y,-k); 
end

gamma = Q*R.';

end
