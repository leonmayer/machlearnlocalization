function [initialw] = priordistribution()

% Summary: Creates prior distribution for weight vector
% TO DO: Generate kleinlambda covariances for pdi

nooftrainingdata = get_nooftrainingdata;
kleinlambda = get_kleinlambda;
initialw = zeros(nooftrainingdata, 1);
mean = 0;
grosslambda = diag(kleinlambda);

% matlab function which stores pdi in vector initialw
initialw = normpdf(0, mean, kleinlambda);
% normpdf only works with vector as third parameter, not the diagonal
% matrix

end
