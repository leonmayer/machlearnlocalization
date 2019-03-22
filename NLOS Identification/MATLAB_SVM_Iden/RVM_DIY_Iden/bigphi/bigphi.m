function [bigphi] = bigphi(x)
% Summary: column vector consisting of small phis (19)
% Output: [no. of training data+1 x 1]

% xi is a vector of input features [column vector]
% TO DO: set xi (Zhu)
% x is a input feature vector
% first index is '1', sets corresponding smallphi for each row

nooffeatures = get_nooffeatures();
nooftrainingdata = get_nooftrainingdata();
xm = get_xm();


%bigphi = zeros(nooffeatures+1,1);
bigphi(1,1) = 1;
for i = 1:nooftrainingdata
    bigphi = [bigphi; smallphi(x,xm(:,i))];
end

end

