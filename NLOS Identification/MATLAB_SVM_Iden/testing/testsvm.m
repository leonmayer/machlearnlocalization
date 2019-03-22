function [testsvm] = testsvm()

featuremat = get_featuremat();
delta = get_delta();
SVMModel = fitcsvm(featuremat, delta);
testdata = [1, 5, 18, 19, 17, 2];
[label, score] = predict(SVMModel, testdata);
label

end

