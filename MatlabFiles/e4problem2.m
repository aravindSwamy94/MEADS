clc;
clear all;
load data2;
oil = data(:,2);
eco = data(:,3);
corr = xcorr(oil,eco,'coeff');
figure;
plot(corr);
%% 2.b
clc;
[s_om s_on] = size(oil);
[s_em s_en] = size(eco);
tro = uint8(0.75*s_om);
tre = uint8(0.75*s_em);
tso = s_om - tro;
tse = s_em - tre;
Training_oil = zeros(tro,1);
Training_eco = zeros(tre,1);
Testing_oil= zeros(tso,1);
Testing_eco = zeros(tse,1);
i=1;
j=1;
k=1;
while i < s_om
    if i <= s_om
        Training_oil(k) = oil(i);
    end
    if i+1 <= s_om
        Training_oil(k+1) = oil(i+1);
    end
    if i+2 <= s_om
        Training_oil(k+2) = oil(i+2);
    end
    if i+3 <= s_om
        Testing_oil(j) = oil(i+3);
    end
    j=j+1;
    i=i+4;
    k=k+3;
end
i=1;
j=1;
k=1;
while i < s_em
    if i<= s_em
        Training_eco(k) = eco(i);
    end
    if i+1 <= s_em
        Training_eco(k+1) = eco(i+1);
    end
    if i+2 <= s_em
        Training_eco(k+2) = eco(i+2);
    end
    if i+3 <= s_em
        Testing_eco(j) = eco(i+3);
    end
    j=j+1;
    i=i+4;
    k=k+3;
end

% [m,n] = size(oil) ;
% P = 0.70 ;
% idx = randperm(m)  ;
% Training_oil = oil(idx(1:round(P*m)),:) ; 
% Testing_oil = oil(idx(round(P*m)+1:end),:) ;
% 
% [m,n] = size(eco) ;
% P = 0.70 ;
% idx = randperm(m)  ;
% Training_eco = eco(idx(1:round(P*m)),:) ; 
% Testing_eco = eco(idx(round(P*m)+1:end),:) ;

result = zeros(1,5);
for i=1:5
    fit = polyfit(Training_oil,Training_eco,i);
    est_val = polyval(fit,Testing_eco);
    SE = (Testing_eco-est_val).^2;
    SSE = sum(SE);
    result(i) = SSE;
end

[M,I] = min(result);
S= sprintf("The best polynomial degree will be %d, because it has the minimum SSE",I);
disp(S);


%% 2.c
figure;
scatter (oil,eco)
hold on;
fit = polyfit(Training_oil,Training_eco,1);
x = -4:0.1:4;
y = (x* fit(1)) + fit(2) ;
plot(x,y);