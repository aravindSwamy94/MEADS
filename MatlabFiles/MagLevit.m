g=9.81;
a=0.0066;
L=0.229;
m=0.8;
d=0.01;
ze=d;
ie=1.431;

A = [0 1;L*ie*ie*exp(-ze/a)/(2*a*a*m) 0];
B = [0 L*ie*exp(-ze/a)/(a*m)]';
C = [1 0];
D = 0;

sys = ss(A,B,C,D);
[b,a] = ss2tf(A,B,C,D);
H = tf(b,a);
%pzmap(H);
stability=isstable(sys);
if stability == 0
    disp('unstable')
else
    disp('stable')
end
impulse(sys);
