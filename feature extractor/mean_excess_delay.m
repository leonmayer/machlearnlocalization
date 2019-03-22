function [feature4] = mean_excess_delay(gamma)
%Summary: Calculate the Mean Excess Deday of Vector gamma.
%This function is on Page 1361 (15)

%CONSTANTS
global Tc;

%Length of the gamma vector.
Nd = length(gamma);

%Sum of PDP estimation
sum = 0;
for i = 1:Nd
    if (gamma(i) < 0)
    gamma(i)=0;
    end
%Calculate the value of zeta.
    zeta = (i - 0.5) * Tc;
    sum = sum + gamma(i) * zeta;
end

feature4 =  Tc * sum / received_energy(gamma);
    
end

