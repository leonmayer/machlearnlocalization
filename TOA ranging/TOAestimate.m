function [d] = TOAestimate(PDPe)
% TOA estimate

% CONSTANTS

% PDP estimation window
global Tob;
global Tc;
global Nd;
global N0;
global W;

% ED threshold (dB)
eta = -87.16;

% Calculate delays
delays = ((1:Nd) - 0.5) .* Tc;

% ! Value for Tob has been changed in global_constants

t1 = min(delays((delays <= 0.5*Tob) & (PDPe >= db2pow(eta + N0 + pow2db(W) ))));

if (size(t1,2) == 0)
    sprintf('Error: No solution in TOA ranging')
    t1 = 0; 
end

% Ranging estimate
d = physconst('LightSpeed')* t1 * 10^(-9);

end