clear;
clc;
%% 人机交互，输入
f = input("请输入信号频率f：");
N = input("请输入采样点数N：");
T = input("请输入采样间隔T：");

 %% 生成信号
 n=0:N-1;
 x=sin(2*pi*f*n*T);
 
 %% 是否补零选项：从控制台读取用户输入
    is_zero_padding = input("是否补零？(y/n)：", 's');
    if is_zero_padding == "y"
        zn=input("补零的数量zn：");
        x = [x zeros(1, zn)];
        N = N+zn;
    end
 
 %% 调用FFT 
 %自己的FFT
 X=myFFT(x,N)
 %使用matlab自带的fft函数验证
 Y=fft(x,N)
 
 %% 绘制幅度频谱
    f_axis = linspace(0, 1/T, N);
    %计算幅度频谱
    amplitude = abs(X) / N;
    amplitudey = abs(Y) / N;
    % 归一化处理
    normalizedAmplitude = amplitude / max(amplitude);
    normalizedAmplitudey = amplitudey / max(amplitudey);
    %绘制
    plot(f_axis, normalizedAmplitude,'-b',f_axis, normalizedAmplitudey,'g--o','LineWidth',1.5);
    legend("myFFT()","matlab fft()");
    xlabel('频率(Hz)');
    ylabel('幅度');
    title('频谱图');

