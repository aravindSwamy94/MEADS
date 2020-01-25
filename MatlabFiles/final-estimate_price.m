function price_house= estimate_price(house_params)
clc;
data = xlsread('data2.xlsx');
[data_m data_n] = size(data);
data_training_size   = uint8(0.75*data_m);
data_validation_size = data_m - data_training_size;
data_training = zeros(data_training_size,data_n);
data_validation = zeros(data_validation_size , data_n);
i=1;
j=1;
k=1;
while i < data_m
    if i <= data_m
        data_training(k,:) = data(i,:);
    end
    if i+1 <= data_m
        data_training(k+1,:) = data(i+1,:);
    end
    if i+2 <= data_m
        data_training(k+2,:) = data(i+2,:);
    end
    if i+3 <= data_m
        data_validation(j,:) = data(i+3,:);
    end
    j=j+1;
    i=i+4;
    k=k+3;
end
price = data_training(:,1);
area  = data_training(:,2);
year  = data_training(:,3);
rooms = data_training(:,4);
floor = data_training(:,5);
x_cor = data_training(:,6);
y_cor = data_training(:,7);

figure;
subplot(3,2,1)
title('area vs price')
scatter(area,price);
subplot(3,2,2)
title('year vs price')
scatter(year,price);
subplot(3,2,3)
title('No of rooms vs price')
scatter(rooms,price);
subplot(3,2,4)
title('Floor vs price')
scatter(floor,price);
subplot(3,2,5)
title('X coordinates vs price')
scatter(x_cor,price);
subplot(3,2,6)
title('Y coordinates vs price')
scatter(y_cor,price);
col1 = ones(size(price));
X = [col1 area year rooms floor x_cor y_cor];
Y = price;
theta = inv(transpose(X)*X)*transpose(X)*Y;
k1 = theta(1);
k2 = theta(2);
k3 = theta(3);
k4 = theta(4);
k5 = theta(5);
k6 = theta(6);
k7 = theta(7);
Y_est = k1*X(:,1) + k2*X(:,2) + k3*X(:,3) + k4*X(:,4) + k5*X(:,5) + k6*X(:,6) + k7*X(:,7);    
SE = (Y-Y_est).^2;
SSE= sum(SE);
S= sprintf("THE SSE of training data is %f", SSE);
disp(S);
Ymean = mean(Y);
SST = sum((Y-Ymean).^2);
R2 = 1-(SSE/SST);
S= sprintf("THE R^2 of training data is %f", R2);
disp(S);


col1_val = ones(size(data_validation(:,1)));
X_val = [col1_val data_validation(:,2) data_validation(:,3) data_validation(:,4) data_validation(:,5) data_validation(:,6) data_validation(:,7)];
Y_val = data_validation(:,1);
Y_val_est = X_val*theta;
SE = (Y_val-Y_val_est).^2;
SSE= sum(SE);
S= sprintf("THE SSE of validation data is %f", SSE);
disp(S);

Ymean = mean(Y_val);
SST = sum((Y_val-Ymean).^2);
R2 = 1-(SSE/SST);
S= sprintf("THE R^2 of validation data is %f", R2);
disp(S);

house_params = [1 house_params];
price_house = house_params*theta;

end
