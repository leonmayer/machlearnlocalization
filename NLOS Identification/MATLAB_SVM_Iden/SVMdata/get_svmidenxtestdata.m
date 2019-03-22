function [xtestdata] = get_svmidenxtestdata()
% Test data to be classified by SVMModel

clos1 = [11, 19, 11, 4, 5, 12];
cnlos2 = [3, 9, 12, 12, 11, 5];
clos3 = [11, 11, 9, 9, 9, 11];
cnlos4 = [12, 12, 14, 13, 17, 8];
clos5 = [19, 4, 9, 6, 9, 7];

xtestdata = [clos1; cnlos2; clos3; cnlos4; clos5];
end

