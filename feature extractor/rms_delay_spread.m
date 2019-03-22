function [feature5] = rms_delay_spread(gamma)
%Summary: Calculate the RMS Delay Spread of Vector gamma.
%This function is on Page 1361 (16)

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
    
%Calculate the Mean Excess Delay of k.
%Question: Is it the MED of the whole Vector or from k = 1 to the current value of k?
    med = mean_excess_delay(gamma);
%Alternativ: med = mean_excess_delay(gamma(1:i));
    
    sum = sum + gamma(i) * (zeta - med)^2 ;
end

feature5 =  (Tc * sum / received_energy(gamma))^0.5;
    

end

