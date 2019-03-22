function [kleinlambda] = get_kleinlambda()
% Summary: Returns kleinlambda, values are set here

% kleinlambda:  values for covariance
%               [nooftrainingdata + 1 x nooftrainingdata +1]
nooftrainingdata = get_nooftrainingdata();
kleinlambda = ones(1,nooftrainingdata +1);

end

