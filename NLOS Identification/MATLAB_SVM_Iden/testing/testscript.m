x = [1;2;3;4;5];
y = [6;7;8;9;10];
matrix = zeros(5,2);

for i = 1:2
    matrix(:,i) = x;
    if i == 2
        matrix(:,i) = y;
    end
end

matrix

