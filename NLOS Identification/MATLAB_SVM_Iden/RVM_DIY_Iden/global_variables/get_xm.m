function [xm] = get_xm()
% Summary: Returns xm, values are randomly set here

% xm =  Matrix, that contains random feature vectors
%       [nooffeatures x nooftrainingdata]
xm = rand(get_nooffeatures(),get_nooftrainingdata());

end

