function output = computeCost(k)

global x y
f = @(b,a) b(1)*(1-exp(b(2)*a));
Yhat = f(k,x);
SE = (y-Yhat).^2;
SSE = sum(SE);
output= SSE;

end