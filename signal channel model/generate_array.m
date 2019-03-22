function [A] = generate_array(func, size_)
% Generates an array of function values from a function.

% Initialize matrix
A = zeros(1, size_);

%tic;

for i = 1:size_
     if (mod(i, 1000) == 0)
         i
     end
    % Calculate function values
    A(i) = func(i);
end

%toc;

%INFO: Generation of 1000-element-array takes 56.365430 seconds.

end