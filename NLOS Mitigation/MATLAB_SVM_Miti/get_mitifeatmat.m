function [featmat] = get_mitifeatmat()

nlos1 = [5, 6, 14, 14, 11, 9];
nlos2 = [2, 3, 11, 12, 13, 8];
nlos3 = [8, 9, 19, 14, 12, 7];
nlos4 = [7, 6, 14, 19, 15, 6];
nlos5 = [9, 5, 19, 11, 17, 4];
featmat = [nlos1; nlos2; nlos3; nlos4; nlos5];
featmat = featmat(:,1:2);
end

