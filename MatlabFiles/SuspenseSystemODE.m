clear all;
close all;
clc;
m1 =10;
m2 =350;
kw = 500000;
ks = 10000;
b = 500;
tspan = [0 10];  
init = [0; 0; 0; 0];

func = @(t,x) rhs(t,x,m1,m2,kw,ks,b);
[t,x] = ode45(func,tspan,init);

plot(t,x(:,1),'-o',t,x(:,3),'-o');
title('SuspennseSystemODEGraph');
xlabel('Time_t')
ylabel('Solution')
legend('z_1','z_2')