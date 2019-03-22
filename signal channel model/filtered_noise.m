function [zBPF] = filtered_noise(t)

% Summary: Generates and samples Gaussian White Noise, then passes that
% signal through a RRC Bandpass Filter. The received filtered signal will be
% used in the preprocessing function.
% SEED: 1

s = round(t);
for i = 1:length(s)
   if (s(i) == 0)
       s(i) = 1;
   end
end

% CONSTANTS
% Two-sided power spectral density (dBm/MHz)
global N0 
% N = -200.93;


% Data vector length
global datalength;

% RRC Bandpass filter

%Effective Bandwidth (MHz)
global W


% Calculate variance from PSD (see Wikipedia article "Spectral density")

var = db2pow(N0 - 30) * W * 1e-9; % sampled noise energy

% Generate White Gaussian Noise
% z = wgn(1,l, N, 'dBm');
rng(1);
z = sqrt(var)./ sqrt(2) * (randn([1 length(s)]) + 1i*randn([1 length(s)])) ;

% Output: Noise at t
zBPF = z;

end
