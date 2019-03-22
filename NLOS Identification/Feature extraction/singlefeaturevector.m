function [vector] = singlefeaturevector(gamma)

% Summary: Store extracted features of a single signal in a vector
% Output: feature vector
% TO DO: create rise_time function

vector(1) = received_energy(gamma);
vector(2) = maximum_amplitude(gamma);
vector(4) = mean_excess_delay(gamma);
vector(3) = 0;
vector(5) = received_energy(gamma);
vector(6) = rms_delay_spread(gamma);

end

