function [ExtractedData] = prepare_data(k,l)

global BP;

%{
% Index i for bulk_parameters cells (1...20)
i = mod(k, 900);
if (i == 0)
   i = 900; 
end
% Index j for next 900 cells (1...900)
j = 1 + floor(k/900);
%}

C = BP{k};
S = C{l};
% S is the data vector needed, but includes unused data

ExtractedData.L = S.n_cluster;
ExtractedData.alpha = S.power;
ExtractedData.tau = S.delay;

end