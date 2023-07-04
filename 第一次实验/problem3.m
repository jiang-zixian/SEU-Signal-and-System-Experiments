clc
clear
%将问题转化为[1 1 1]和[5 4 3 2 1]两个信号的卷积
x_n=[1 1 1];
h_n=[5 4 3 2 1];
y_n=convolution(x_n,h_n)

%% 绘制
n=1:length(y_n)+1;
figure('name','打怪游戏结果');
stem(y_n,'filled');