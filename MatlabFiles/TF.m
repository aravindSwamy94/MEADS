A = [-18.2 -5.1;0.3 0];
B = [435.5 36.7]';
C = [-0.2 0];
D = 0;

u=1;
model= @(t,x) A*x+ B*u;
output= @(x) C*x + D*u;

options = odeset('RelTol',1e-4,'AbsTol',1e-6)
timespan=[0 20];
initialCondition= [0 0]';
[T1,X1]= ode45(model,timespan,initialCondition,options)
Y1 = output(X1')
plot(T1,Y1,'r')
title('output plot')