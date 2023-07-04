clc;clear;
%% 原信号
[x,fs]=audioread('6-6.wav');
%fs是采样频率，x是离散时间信号（采样序列）
X=fft(x);
amp_X=abs(X);%幅度谱

%% 时域绘制
figure;
n=length(x);%采样点数
t=(0:n-1)/fs;%转换成连续时间
plot(t,x);%时域波形
title("语音文件时域波形")

%% 幅度谱绘制
X=fft(x);
amp_X=abs(X);%幅度谱
a_x=0:length(X)-1;
a_x=a_x.*2.*pi./(length(X));%横坐标转移到[0,2π]
figure;
plot(a_x,amp_X);%频域波形
title("语音文件幅度谱");
xlim([0,pi]);  % 设置x轴的范围为[0, π]

%% 低通滤波 时域
myfir_1=fir1(48,[pi/24,pi/20],'low');
fir_1 = filter(myfir_1,1,x);
n=length(x);%采样点数
t=(0:n-1)/fs;%转换成连续时间
figure;
plot(t,fir_1);
title("低通滤波后时域波形");


%% 低通滤波 频域
myfir_1=fir1(48,[pi/24,pi/20],'low');
fir_1 = filter(myfir_1,1,x);
n=length(x);%采样点数
t=(0:n-1)/fs;%转换成连续时间
%plot(t,fir_1);
x=fir_1;
X=fft(x);
amp_X=abs(X);%幅度谱
a_x=0:length(X)-1;
a_x=a_x.*2.*pi./(length(X));%横坐标转移到[0,2π]
figure;
plot(a_x,amp_X);
title("低通滤波后频域波形")
xlim([0,pi]);  % 设置x轴的范围为[0, π]

%% 高通滤波 时域
myfir_2=fir1(80,[pi/5,5*pi/24],'high');
fir_2 = filter(myfir_2,1,x);
n=length(x);%采样点数
t=(0:n-1)/fs;%转换成连续时间
figure;
plot(t,fir_2);
title("高通滤波后时域波形");

%% 高通滤波 频域
myfir_2=fir1(80,[pi/5,5*pi/24],'high');
fir_2 = filter(myfir_2,1,x);
n=length(x);%采样点数
t=(0:n-1)/fs;%转换成连续时间
x=fir_2;
X=fft(x);
amp_X=abs(X);%幅度谱
a_x=0:length(X)-1;
a_x=a_x.*2.*pi./(length(X));%横坐标转移到[0,2π]
figure;
plot(a_x,amp_X);
title("高通滤波后频域波形")
xlim([0,pi]);  % 设置x轴的范围为[0, π]
