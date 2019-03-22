function [] = SVMoutput()
% Classifies xtestdata  using SVM

% fitcsvm creates a SVMModel 
% label: labels the new data as 0 (LOS) or 1 (NLOS)
% score: the greater the value, the more reliable is the label

featuremat = get_featuremat();
testdata = get_xtestdata();
delta = get_delta();
SVMModel = fitcsvm(featuremat, delta);
[label, score] = predict(SVMModel, testdata);
label

end



