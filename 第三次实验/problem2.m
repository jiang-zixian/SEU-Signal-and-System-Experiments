clc;
clear;
Wc=pi/2;
%% N=33 无过渡点
Hk=FIR(Wc,33);
h1 = ifft(Hk);
figure;
freqz(h1)

%% N=63 无过渡点
Hk=FIR(Wc,63);
h1 = ifft(Hk);
figure;
freqz(h1)

%% N=33 一个过渡点
Hk=FIR1(Wc,33);
h1 = ifft(Hk);
figure;
freqz(h1)

%% N=33 两个过渡点
Hk=FIR2(Wc,33);
h1 = ifft(Hk);
figure;
freqz(h1)