function [rPhi] = autocorrelation(t)
% Summary:  Generates the autocorrelation function of r(t)
%           Function (7) on page 1359
%           Parameters taken from Table 1, page 1360
%           Output: rPhi for rBPF calculation
global W
global beta_
global f_c

Tp = 1/ W;
ind = t < - Tp; 
rPhi = sinc(t/Tp * 1e-9).*((cos(pi* beta_ * t/Tp * 1e-9))./((1-( 2 * beta_ * t * 1e-9) / Tp).^2)).*cos(2*pi*t* 1e-9 *f_c);
rPhi(ind) = 0;

end
