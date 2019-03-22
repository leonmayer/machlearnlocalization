function [delta] = get_MCdelta()
% outputs for featurematrix

delta = [0; 1; 0; 1; 0; 1; 0; 1; 0; 1];


delta1 = round(rand(20,1));
for i = 1:20
    if delta1(i) == 0
        delta1(i) = -1;
    end
end
%delta = delta1;

end

