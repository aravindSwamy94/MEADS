clc;
clear;
load data2
[fr gof] = createFit(x,y,u,v);
[gridx,gridy] = meshgrid(0:0.05:1,0:0.05:1);
figure
output = quiver(gridx,gridy,fr{1}(gridx,gridy),fr{2}(gridx,gridy));