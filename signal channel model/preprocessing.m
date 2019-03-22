function [rBPF] = preprocessing(Rphi, zBPF, t, data)
% TO DO: Set L, alpha, tau, b as inputs received from SIM
% 
% Summary: Calculates and returns the filtered preamble symbol rBPF(t) using the
% autocorrelation function Rphi and the filtered Gaussian white noise zBPF
% as well as other constants.

if (t == 0)
   rBPF = 0;
   return
end

% Prepare input data


% CONSTANTS

% Parameters: TEST DATA randomly chosen
% Number of multipath components
L = data.L;
% Complex amplitude of lth MPC
alpha = data.alpha;
% Delay of lth MPC (ns)
tau = data.tau * 10^9;

global_constants;

global Ep;
global NSync;
global Nc;

% All-one row vector with dimension NSync
Onevec = ones(1, NSync);

% Total number of chips per preamble 
Ntot = NSync * Nc;


% CALCULATION

rBPF = 0;

% Vector lengths [no. rows x no. columns:
% rBPF, alpha(k), sqrt(Ep), zBPF = [1 x 1]
% Onevec = [1 x 64]
% C = [1 x 31]
% delta64 = [1 x 64]
% S = [1 x  C*delta64] = [1 x 1984]
% kron(...) = [1 x 126976]
% Rphi = [Ntot x 1] = [Nc*Nsync x 1] = [126976 x 1]
% cross(...) = [1 x 1]
  
% Calculate Kronecker Product
Pulse_energy = db2pow(Ep - 30) ; % pulse energy for each nano second
A = sqrt(Pulse_energy)*kron(Onevec, S);

for k = 1:L
   C =  db2mag(-alpha(k)) *A;
   B = ftn(Rphi, Ntot, t-tau(k));
   % Calculate cross product
   crossresult = C*B;
   rBPF = rBPF + crossresult;
end

rBPF = rBPF + zBPF(t);
% rBPF = rBPF ;    
end
