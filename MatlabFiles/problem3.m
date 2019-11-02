clc;
clear all; 
load data3;
scatter(x,y);hold on
col1 = ones(size(x));
X = [col1 log(x)];
Y= log(y);
theta = inv(transpose(X)*X)*transpose(X)*Y;
k1 = exp(theta(1));
k2 = theta(2);
%theta


%Solution for 3.b
scatter(xv,yv);hold on
%legend('validation data')
xdir = 0:0.01:15;
ydir = k1*(xdir.^k2) ;
plot(xdir,ydir); % plots the value of (x,y) with the given polynomial expression 
legend('Training data','Validation data','estimated function')
f = @(k1,k2,x) k1*x.^k2 ; 
SSE = @(theta) sum((Y-f(theta,X)).^2);

Yhat = f(k1,k2,x);
SE = (y-Yhat).^2;
SSE= sum(SE);
S= sprintf("THE SSE of training data is %f", SSE);
disp(S);

Ymean = mean(y);
SST = sum((y-Ymean).^2);
R2 = 1-(SSE/SST);
S = sprintf("The value of R2 for training set is %f",R2);
disp(S)


% Solution for 3.c
result = zeros(1,5);
for i=1:5
    fit = polyfit(x,y,i);
    est_val = polyval(fit,xv);
    SE = (yv-est_val).^2;
    SSE = sum(SE);
    result(i) = SSE;
end

[M,I] = min(result);
S= sprintf("The best polynomial degree will be %d, because it has the minimum SSE",I);
disp(S)