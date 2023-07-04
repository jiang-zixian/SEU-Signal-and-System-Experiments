function [X] = myFFT(x,N)
%信号频率f，采样点数N，采样间隔T
%按时间抽取的FFT算法
%N=length(x);
if N==1
    X=x;
else
    W_N=exp(-(1i*2*pi)/N*(0:N-1));%
    X_even=myFFT(x(1:2:N-1),N/2);
    X_odd=myFFT(x(2:2:N),N/2);
    X=[X_even + W_N(1:N/2).*X_odd, X_even - W_N(1:N/2).*X_odd];
end
end

