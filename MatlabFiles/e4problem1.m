%% 1.a
clc;
clear all;
H = tf([1],[1,3,2]);
Ts=0.1;
t = 0:Ts:200;
N = length(t);
u = idinput(N,'PRBS');
y = lsim(H,u,t);
figure;
subplot(2,1,1);
plot(u);
title('input');
subplot(2,1,2);
plot(y);
title('output');
data = iddata(y,u,Ts);

%% 1.b
corr= xcorr(y,200,'coeff');
figure;
plot(corr);
title('autocorrelation');
%% 1.c
figure;
[ir,R,cl] = cra(data,10*10);
tImp = 0:0.1:10;
stem(tImp,ir*10);
hold on;
impulse(H,10) 
legend('cra','transfer function');
%% 1.d
spa_o = spa(data);
etfe_o = etfe(data);
figure;
bode(spa_o,etfe_o);
legend('spa','etfe');