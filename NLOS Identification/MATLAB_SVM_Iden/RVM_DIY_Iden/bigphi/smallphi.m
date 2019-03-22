function [smallphi] = smallphi(x, xi)
% Summary: gaussian kernel for classification
% Input:    x = signal feature vector to be classified
%           xi = ith column vector of training data matrix (feature vector)
% Output: gausian kernel

% omega:    Combining vector of features 
%           Normed feature values
%           All features are valued equally by adjusting with lenght

for k = 1: length(x)
    omega(k,1) = 1/length(x);
end

% Calculates smallphi int

smallphi = exp(-transpose((x-xi))*diag(omega)*(x-xi));

end

