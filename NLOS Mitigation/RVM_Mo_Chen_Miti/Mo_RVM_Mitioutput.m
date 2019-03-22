function [y] = Mo_RVM_Mitioutput()
% Summary: Calculates classification for testvector
% Output: Classification for testdata

% featmat = feature vector for training data [no of training data x no of
% features)
% delta = classification for training data (no of training data x 1)
% xtestdata = feature vectors to be classified 
featmat = get_mitifeaturemat()';
delta = get_mitidelta()';
xtestdata = get_mitixtestdata()';


LoadedTrainingData = load('TrainingData14.mat');
field1 = LoadedTrainingData.Traindata;

featuremat =[];

for(i=1:14)
    featuremat = [featuremat; field1(i).features];
end

featmat = featuremat(:,[1 2 3])';
xtestdata = featuremat(:,[4 5 6])';
delta = [0.1,0.1,0.1,0.1,0.1,0.2,0.1,0.2,0.1,0.2,0.1,0.2,0.1,0.2]'';
% Calculates RVM model 

% RVMmodel = model for RVM classification
[mitimodel, llh] = rvmRegFp(featmat, delta);

% Predicts new input data 
% The function returns a classification, that is no yet binary
% The closer the value is to 0, the more likely it is to be LOS
% The closer the value is to 1, the more likely it is to be NLOS

% y = predictions
[y, sigma] = rvmRegPred(mitimodel, xtestdata);

end

