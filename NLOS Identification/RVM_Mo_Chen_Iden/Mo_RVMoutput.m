function [y] = Mo_RVMoutput()
% Summary: Calculates classification for testvector
% Output: Classification for testdata

% featmat = feature vector for training data [no of training data x no of
% features)
% delta = classification for training data (no of training data x 1)
% testdata = feature vectors to be classified 
featmat = get_MCfeaturemat()';
delta = get_MCdelta()';
testdata = get_MCxtestdata()';

% Calculates RVM model 

% RVMmodel = model for RVM classification
[RVMmodel, llh] = rvmRegFp(featmat, delta);

% Predicts new input data 
% The function returns a classification, that is no yet binary
% The closer the value is to 0, the more likely it is to be LOS
% The closer the value is to 1, the more likely it is to be NLOS

% y = predictions
[y, sigma] = rvmRegPred(RVMmodel, testdata);
llh
% Converts prediction into binary classification
% if value < 0.5 -> LOS
% if value >= 0.5 -> NLOS

for i = 1:length(y)
    if y(i) < 0.5
        y(i) = 0;
    else
        y(i) = 1;
    end
end


end

