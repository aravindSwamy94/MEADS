V = 12;
qo = 0.15;
qi = 0.15;
ko = 9.4;
E = 2500;
R = 8.31;
T = 293;

A = [((-qo/V)+(-ko*exp(-E/(R*T)))) 0;(ko*exp(-E/(R*T))) (-qo/V)];
B = [qi/V 0]';
C = [1 1];
D = 0;
% State spcae model
sys= ss(A,B,C,D);
step(sys);

%u= 1;
%model= @(t,x) A*x + B*u;
%output= @(x) C*x + D*u;
%options = odeset('RelTol',1e-4,'AbsTol',1e-6)
%timespan=[0 20];
%initialCondition= [0 0]';
%[T1,X1]= ode45(model,timespan,initialCondition,options)
%Y1 = output(X1')
%plot(T1,Y1,'r')
%title('output plot in time domain')