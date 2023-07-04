function[Hk]=FIR(Wc,N)
%返回抽样得到的频域滤波器
Wc=fix(Wc+0.5); %要求整数所以四舍五入,Wc为理想滤波器的截止频率
Hd = zeros(1,(N+1)/2);
Hd(1:Wc-1) = 1;
Hd(Wc+1:end) = 0;%对理想滤波器进行采样，先求前半段，后半段对称性可得
k = 0:(N-1)/2;
A = exp(-1j*pi*k*(N-1)/N);
Hd = Hd.*A;
Hk = [Hd,conj(fliplr(Hd(2:end)))];%对称性
end