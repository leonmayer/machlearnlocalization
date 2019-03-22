function [xmdelta] = get_xmdelta()
% Creates random delta values for signals and stores them

% elements of xmdelta are random binary values
xmdelta = round(rand(1, get_nooftrainingdata()));

end

