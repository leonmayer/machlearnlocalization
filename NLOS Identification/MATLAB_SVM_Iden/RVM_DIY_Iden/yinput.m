function [y] = yinput(x, w)
% Summary: Calculates input for delta function (19)
% Input: column vectors of Gaussian kernels
% Output: Input for delta function

% w = weight vector
y = (w)*bigphi(x);


end

