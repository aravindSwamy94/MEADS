clc;
clear all;
load data4;
global x y;
f = fminsearch('computeCost',[1 1]);
S= sprintf("The estimated parameters are %f and %f",f(1),f(2));
disp(S);

[X,Y] = meshgrid(x,y);
Y_hat = f(1)*(1-exp(f(2)*X));
Cost = (Y-Y_hat).^2;
surf(X,Y,Cost);
