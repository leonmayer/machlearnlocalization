function [feature2] = maximum_amplitude(gamma)
%Summary: Find the biggest value of gamma vector
%This function is on Page 1361 (13)

%Length of the gamma vector.
Nd = length(gamma);

%Set every minus value to 0.
for i = 1:Nd
    if (gamma(i) < 0)
    gamma(i)=0;
    end
end

%Find the biggest value.
feature2 = max(gamma);
end

