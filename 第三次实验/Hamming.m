function Hamming()
Wp=0.2*pi; %通带截止频率
Ws=0.4*pi; %阻带截止频率
tr_wide=Ws-Wp; %过渡带宽度
N=ceil(6.6*pi/tr_wide)+1; %滤波器长度
n=0:1:N-1;
Wc=(Wp+Ws)/2; %理想低通滤波器的截止频率
hd=idealFilter(Wc,N); %理想滤波器的单位冲击响应
w_ham=(hamming(N))'; %海明窗
y=hd.*w_ham; %实际海明窗的响应
[db,mag,pha,w]=actualFilter(y,[1]); %计算实际滤波器的幅度响应
delta_w=2*pi/1000;
Ap=-(min(db(1:1:Wp/delta_w+1))); %实际通带纹波
As=-round(max(db(Ws/delta_w+1:1:501))); %实际阻带纹波

figure; % 创建新的画布
plot(511)
stem(n,hd)
title('理想单位脉冲序列响应')

figure; % 创建新的画布
plot(511)
stem(n,w_ham)
title('海明窗窗函数')

figure; % 创建新的画布
plot(511)
stem(n,y)
title('实际单位脉冲序列响应')

figure; % 创建新的画布
[h,w]=freqz(y,1);
db=20*log10(abs(h))/max(abs(h)); %归一化频率
plot(511)
plot(w/pi,db)
title('FIR低通滤波器的幅频响应')
axis([0,1,-100,10]);

figure; % 创建新的画布
pha=angle(h); 
plot(511);
plot(w/pi,unwrap(pha));
title('FIR低通滤波器的相频响应');

end


