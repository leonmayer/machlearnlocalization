function [ ] = plot_algorithm(range_estimates , range_variances_matrix , p , p_0)
%This function draws the positions of agents and anchors.
%It is used to test a algorithm.
%Caution: The second input value here is a matrix. Each line is a set of
%range variances as vector.

%Draw all the anchors.
l = size(p,1);
for index = 1:l
    plot(p(index,1),p(index,2),'o');
    hold on
end

%Draw positions of agent for different range variances.
for i = 1:size(range_variances_matrix,1)
    b = tsi_algorithm(range_estimates, range_variances_matrix(i,:),p,p_0);
    plot(b(1,1),b(2,1),'o');
    hold on
    disp(b);
end
end

