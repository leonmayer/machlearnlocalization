function [delta] = get_svmidendelta()
% outputs for featurematrix

delta = [-1; 1; -1; 1; -1; 1; -1; 1; -1; 1];
delta1 = round(rand(100,1));
for i = 1:100
    if delta1(i) == 0;
        delta1(i) = -1;
    end
end
 delta = delta1;
end


