function [] = testplot()
% Labels are -1 or 1

delta = get_svmidendelta();
d  = get_svmidenfeaturemat();
%{
LoadedTrainingData = load('TrainingData14.mat');
field1 = LoadedTrainingData.Traindata;

featuremat =[];

for(i=1:14)
    featuremat = [featuremat; field1(i).features];
end

d = featuremat(:,[4 6]);
delta = td14delta();
%}
model = svmtrain(delta, d);
%{
d = get_svmidenfeaturemat();
delta = get_svmidendelta();
[model,llh] = rvmRegFp(d', delta');
%}
%model = fitcsvm(delta, d);

figure

% plot training data
hold on;
pos = find(delta==1);
scatter(d(pos,1), d(pos,2), 'r')
pos = find(delta==-1);
scatter(d(pos,1), d(pos,2), 'b')

% now plot support vectors

hold on;
sv = full(model.SVs);
plot(sv(:,1),sv(:,2),'ko');


% now plot decision area
[xi,yi] = meshgrid([min(d(:,1)):0.01:max(d(:,1))],[min(d(:,2)):0.01:max(d(:,2))]);
dd = [xi(:),yi(:)];
tic;[predicted_label, accuracy, decision_values] = svmpredict(zeros(size(dd,1),1), dd, model);toc
pos = find(predicted_label==1);
hold on;

xlabel('Maximum amplitude');
ylabel('Mean Excess Delay');

redcolor = [1 0.8 0.8];
bluecolor = [0.8 0.8 1];
h1 = plot(dd(pos,1),dd(pos,2),'s','color',redcolor,'MarkerSize',10,'MarkerEdgeColor',redcolor,'MarkerFaceColor',redcolor);
pos = find(predicted_label==-1);
hold on;
h2 = plot(dd(pos,1),dd(pos,2),'s','color',bluecolor,'MarkerSize',10,'MarkerEdgeColor',bluecolor,'MarkerFaceColor',bluecolor);
uistack(h1, 'bottom');
uistack(h2, 'bottom');

end