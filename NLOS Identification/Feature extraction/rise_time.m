function [feature3] = rise_time(gamma)
%Summary:Calcutale the rise time.
%This function is on Page 1361 (14)

%Constant
N0 = -113.93;
global W;
global Tc;
beta = 0.6;

%Length of the gamma vector.
Nd = length(gamma);

%Calculate the standard deviation of thermal noise.
%sigma(n)^2 = N0 * BW
%N0: power spectral density of noise
%BW: Bandwidth
sigman2 = N0 + 10 * log10(W);
sigman = sqrt(10^((sigman2-30)/10));

%Find zeta1 for maximum amplitude.
for i = 1:Nd
    if (gamma(i) >= beta * maximum_amplitude(gamma))
        zeta1 = (i - 0.5) * Tc;
        break;
    end
end

%Find zeta2
for i = 1:Nd
    if (gamma(i) >= beta * sigman)
        zeta2 = (i - 0.5) * Tc;
        break;
    end
end

feature3 = zeta1 - zeta2;
end
