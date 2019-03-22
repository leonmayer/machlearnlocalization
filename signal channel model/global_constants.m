% This script introduces and sets global data that is reused throughout the
% project. To be called at the beginning.

% Data vector length
% Roughly 2x preamble symbol duration
% 1 data point per ns


% Pulse energy (dBM*s)
global Ep;
Ep = 0; -74.43;



% Bandwidth (Hz)
global W;
W = 499.2e6;

% Number of symbols in SYNC sequence
global NSync;
NSync = 16;

% M
global M
M = 4;

% Number of chips per preamble symbol
global Nc;
Nc = 31 * M;

% preamble duration 
global Tpsym
Tpsym = floor(3974.4);

% Chip duration
global Tc;
Tc = floor(Tpsym / Nc);
Tpsym = Tc * Nc;

% PDP estimation window
global Tob;
% New calculation: Objective is to allow measurements of distances up to
% 200m, as some transmitter-receiver pairs are 170, 180m apart. So we get
% 1/2 * Tob = 10^9 * 200/c0 = 670 ns. This contradicts the formula given in
% the lower left on page 1360. (Previous value 500)
Tob = 1000;

% Nd
global Nd;
% Originally Tob instead of 500
Nd = round(500/Tc);

% noise power
global N0 
N0 = -108.93;

% 
global beta_
beta_ = 0.6;

% carrier frequency
global f_c
f_c = 4492.8e6;

% Ternary sequence
global C;
C = [-1,0,1,-1,0,0,1,1,1,-1,1,0,0,0,-1,1,0,1,1,1,0,-1,0,1,0,0,0,0,-1,0,0];


% All-one row vector with dimension NSync
Onevec = ones(1, NSync);

% Total number of chips per preamble 
Ntot = 64 * Nc;


delta_m = zeros(1,M); 
delta_m(1,1) = 1;

global S;
% Preamble symbol
S = kron(C, delta_m);

global datalength;
datalength = (NSync * Tpsym);