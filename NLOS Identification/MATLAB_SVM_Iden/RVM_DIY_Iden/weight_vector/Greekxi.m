function [Greekxi] = Greekxi()
% Summary: Calculates GreekXi vecotr [1 x nooftrainingdata]

xm = get_xm();

for k = 1:get_nooftrainingdata()
    
    inputhi = yinput(extractcolumnofmatrix(xm,k), priordistribution());

    Greekxi(k) = 1/(1+exp(-inputhi));
end

end

