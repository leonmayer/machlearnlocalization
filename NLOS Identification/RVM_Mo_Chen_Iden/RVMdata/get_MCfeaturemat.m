function [featmat] = get_MCfeaturemat()
% featurematrix for training

% 1. Received Energy: higher->LOS; 10
% 2. Maximum Amplitude: higher->LOS; 10
% 3. Rise Time: longer -> NLOS; 10
% 4. Mean Excess Delay: longer -> NLOS; 10
% 5. RMS Delay Spread: larger -> NLOS; 10
% 6. Kurtosis: higher -> LOS; 10


los1 = [15, 12, 5, 8, 9, 19];
los2 = [14, 11, 9, 3, 2, 16];
los3 = [11, 11, 1, 6, 4, 17];
los4 = [12, 18, 9, 5, 3, 13];
los5 = [19, 19, 9, 9, 9, 11];

nlos1 = [5, 6, 14, 14, 11, 9];
nlos2 = [2, 3, 11, 12, 13, 8];
nlos3 = [8, 9, 19, 14, 12, 7];
nlos4 = [7, 6, 14, 19, 15, 6];
nlos5 = [9, 5, 19, 11, 17, 4];

featmat = [los1; nlos1; los2; nlos2; los3; nlos3; los4; nlos4; los5; nlos5];

data = zeros(20,2);
for k = 1:20
for i = 1:2
    data(k,i) = 1 + rand*(19-1);
end
end
%featmat = data;

end

