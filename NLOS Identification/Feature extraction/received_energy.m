function [feature1] = received_energy(gamma)
%Summary: Calculates the Received Energy with PDP estimatino gamma.
%This function is on Page 1361 (12)

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
    sum = sum + gamma(i);
end

feature1 =  Tc * sum;
    
end

