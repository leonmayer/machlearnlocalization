% set up the domain over which you want to visualize the decision
% boundary
xrange = [-8 8];
yrange = [-8 8];
% step size for how finely you want to visualize the decision boundary.
inc = 0.1;
 
% generate grid coordinates. this will be the basis of the decision
% boundary visualization.
[x, y] = meshgrid(xrange(1):inc:xrange(2), yrange(1):inc:yrange(2));
 
% size of the (x, y) image, which will also be the size of the 
% decision boundary image that is used as the plot background.
image_size = size(x);
 
xy = [x(:) y(:)]; % make (x,y) pairs as a bunch of row vectors.




figure;
 
%show the image
imagesc(xrange,yrange,decisionmap);
hold on;
set(gca,'ydir','normal');
 
% colormap for the classes:
% class 1 = light red, 2 = light green, 3 = light blue
cmap = [1 0.8 0.8; 0.95 1 0.95; 0.9 0.9 1]
colormap(cmap);
 
% plot the class training data.
plot(training{1}(:,1),training{1}(:,2), 'r.');
plot(training{2}(:,1),training{2}(:,2), 'go');
plot(training{3}(:,1),training{3}(:,2), 'b*');
 
% include legend
legend('Class 1', 'Class 2', 'Class 3','Location','NorthOutside', ...
    'Orientation', 'horizontal');
 
% label the axes.
xlabel('x');
ylabel('y');