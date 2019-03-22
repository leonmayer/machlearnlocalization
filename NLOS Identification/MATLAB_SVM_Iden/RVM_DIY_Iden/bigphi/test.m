bigphi(1,1) = 1;
for i = 1:5
    test = smallphi(x,xm(:,i));
    bigphi = [bigphi; smallphi(x,xm(:,i))];
end