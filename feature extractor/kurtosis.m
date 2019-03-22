function [feature6] = kurtosis(gamma)
%Summary: Calculate the Kurtosis of Vector gamma.
%This function is on Page 1362 (17)

%Length of the gamma vector.
Nd = length(gamma);

%Calculate the value of Mu
sum1 = 0;
for i = 1:Nd
    if (gamma(i) < 0)
    gamma(i)=0;
    end
    sum1 = sum1 + sqrt(gamma(i));
end
mu = sum1 / Nd;

%Calculate the value of Sigma
sum2 = 0;
for i = 1:Nd
    if (gamma(i) < 0)
    gamma(i)=0;
    end
    sum2 = sum2 + (sqrt(gamma(i))-mu)^2;
end
sigma_square = sum2 / Nd;

%Sum of PDP estimation
sum = 0;
for i = 1:Nd
    if (gamma(i) < 0)
    gamma(i)=0;
    end
    
    sum = sum + (sqrt(gamma(i))-mu)^4 ;
end

feature6 = sum / (Nd * sigma_square^2);
    
end

