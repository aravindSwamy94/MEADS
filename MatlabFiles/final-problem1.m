clc;
clear all;
R1 = 4;
R2 = 2;
R3 = 3;
L =1.6;
C = 0.25;
tspan = [0 20];  
init = [15;2];

d= @(t) sin(t);
func = @(t,x) rhs(t,x,R1,R2,R3,L,C,d);
[t,x] = ode45(func,tspan,init);

figure;
plot(t,x(:,1),'-o')
title('Current in loop 1 and Charge in capacitor');
xlabel('Time_t')
ylabel('Current (in A)')
legend('Current in loop 1')
figure;
plot(t,x(:,2),'-o');
title('Charge in capacitor');
xlabel('Time_t')
ylabel('Charge (in A s)')
legend('Charge in capacitor')
