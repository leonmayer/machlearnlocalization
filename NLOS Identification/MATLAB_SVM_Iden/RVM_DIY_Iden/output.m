function [delta] = output(x,w)

% Summary: This is the umbrella function for whole NLOS Identification (18)
% Output: a binary value, 0->LOS & 1->NLOS
% Input: a feature vector [no. of features x 1]

% delta is NLOS/LOS identifier

delta = sign(yinput(x,w));


end
