function [xi,u,r,z]=findxi(file)

data=dlmread(file, ',', 9, 0);
u=data(1,1);
x=data(1,2);
y=data(1,3);
r=sqrt(x^2 + y^2);
z=data(1,4);
xi=data(1,8);
