function [h] = handler(x, data)

% This function sets the input functions of preprocessing correctly.

h = preprocessing(@autocorrelation, @filtered_noise, x, data);

end