function [epsilonoutput] = SVMerror()
% Summary: Calculates SVM Mitigation
% Output: Calculated error values

% mitifeatmat = training feature matrix [no of trainingdata x no of
% features]
% epsilon = training epsilon vector [no of training data x 1]

%{
mitifeatmat = get_mitifeatmat();
epsilon = get_epsilon();
featmattest = get_mitifeatmattest();
%}

LoadedTrainingData = load('TrainingData14.mat');
field1 = LoadedTrainingData.Traindata;

featuremat =[];

for(i=1:14)
    featuremat = [featuremat; field1(i).features];
end

mitifeatmat = featuremat(:,[1 2 3 4]);
featmattest = featuremat(:,[5 1 3 4]);
epsilon = [0.1,0.2,0.1,0.2,0.1,0.2,0.1,0.2,0.1,0.2,0.1,0.2,0.1,0.2]';

% MATLAB function to construct SVM Model

% SVMMitiModel = Calculated SVM Model
SVMMitiModel = fitcecoc(mitifeatmat,epsilon);

% Calculates output values using MATLAB function

epsilonoutput = predict(SVMMitiModel, featmattest);

end

