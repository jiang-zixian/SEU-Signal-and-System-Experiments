clc
clear
%% 编程实现信号h(n),x(n)间的卷积和运算函数y(n)
% 用图解法实现卷积
x_n=[1 2 3 4 5 6 7 8 9 10];
h_n=[1 1];
y_n1=convolution(x_n,h_n)

x_n=[1 2 3 9 4 5 6 0 7 8];
h_n=[-1 2 -1];
y_n2=convolution(x_n,h_n)

x_n=[1 2 3 4 5 6 7 8 9 10];
h_n=[1 2 3 4 5 6 7 8 9 10];
y_n3=convolution(x_n,h_n)

%% 用公式法实现卷积
x_n=[1 2 3 4 5 6 7 8 9 10];
h_n=[1 1];
y_n1=convolution1(x_n,h_n)

x_n=[1 2 3 9 4 5 6 0 7 8];
h_n=[-1 2 -1];
y_n2=convolution1(x_n,h_n)

x_n=[1 2 3 4 5 6 7 8 9 10];
h_n=[1 2 3 4 5 6 7 8 9 10];
y_n3=convolution1(x_n,h_n)

%% 绘制
n=1:length(y_n1)+1;
figure('name','第一小题运算结果');
stem(y_n1,'filled');

n=1:length(y_n2)+1;
figure('name','第二小题运算结果');
stem(y_n2,'filled');

n=1:length(y_n3)+1;
figure('name','第三小题运算结果');
stem(y_n3,'filled');
