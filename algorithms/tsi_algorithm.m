function [ p_underroof ] = tsi_algorithm( range_estimates , range_variances , p , p_0 )
%This function ist the tsi-algorithm 1365.

%These are the Inputs:
%1.Range estimates(d_underroof): It is a vector with Va elements.(Matrix 1 * Va)

%2.Range variances(sigma_underroof_square): It is also a vector with Va
%  elements.(Matrix 1 * Va)

%3.Positions of anchors(p): It is a Matrix. Each row is a vector, that
%  shows the position of an anchor. There are Va rows in total. (Matrix Va * 2)

%4.Initial position of agent(p0): It is a vector with 2 elements. They are
%  the x-value and y-value of an initial position which is randomly chosen.
%  Tipp: It dosen't have any influence on the output. (Matrix 2 * 1)

%Output: Position of an agent(p_underroof): (Matrix 2 * 1)

%====================Algorithm Start=======================================

%Step 0 : Initialize the position of agent p0, let x = p0.
x = p_0;

judge = 0;

%Get the length of all inputs and check if they are the same.
%The Inputs are wrong, if the values are different.
Va = length(range_estimates);
Va1 = length(range_variances);
Va2 = size(p,1);
if (Va ~= Va1 || Va ~= Va2)
    error(1,'Error: Length of inputs are different!');
end


for i = 1:Va
    if(range_variances(1,i) == 0)
        judge = 1;
    end
end

%Get sigma_underroof_square. It will be used in the Function in step 3.
sigma = 1 / sum(1./range_variances);

%Initialize two vectors for later.
costheta = zeros(1,Va);
sintheta = zeros(1,Va);

%The loop that repeats step 1 - 3.
while 1
    disp('test:loop!');
    x_old = x;
    %Step 1: Given x, find the optional values of auxiliary varialbes
    %        theta_i by calculating cos(theta_i) and sin(theta_i).
    for index = 1:Va
        p_i = p(index,:)';
        % Theta_i = 0, if x = p_i.
        if(x == p_i)
            costheta(1,index) = 1;
            sintheta(1,index) = 0;
        else
            costheta(1,index) =   ( x(1,1) - p_i(1,1) )  / norm(x - p_i) ;
            sintheta(1,index) =   ( x(2,1) - p_i(2,1) )  / norm(x - p_i) ;
        end
    end
    %Tipp: Here are always some problems if I choose one variable theta. Because
    %      different angles could have the same cosine (or sine) values.
    
    %Step 2: Now we have two vectors of values of costheta and sintheta.
    %        We are going to update the value of x with the function(33) on
    %        Page 1365.
    x = 0;
    for index2 = 1:Va
        p_i2 = p(index2,:)';
        if(judge == 0 )
            x = x + sigma/range_variances(1,index2)*(range_estimates(1,index2)*[costheta(1,index2);sintheta(1,index2)]+p_i2);
        else
            x = x + 1/Va * (range_estimates(1,index2)*[costheta(1,index2);sintheta(1,index2)]+p_i2);
        end
    end
    
    %Step 3: Check if ||x|| satisfies the stoping criterion.(x_n - x_n-1 <= 10cm)
    %        If yes, stop the loop.
    %Question: I don't know the unit here. Is 10cm same to 0.1 ?
    if(norm(x_old - x) <= 0.1)
        break;
    end

end

%Agent position is x vector at the end. 
p_underroof = x;
end



