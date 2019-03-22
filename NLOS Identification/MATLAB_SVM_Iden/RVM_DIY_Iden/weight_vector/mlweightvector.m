function [w_new] = mlweightvector()
%MLWEIGHTVECTOR Summary of this function goes here
%   Detailed explanation goes here
sum = 0;
xmdelta = get_xmdelta();
greekxivec = Greekxi();

for i = 1 : get_nooftrainingdata()
    sum = sum +( xmdelta(i)* ln(greekxivec(i))+(1-xmdelta(i))*ln(1-greekxivec(i)));
end


end

