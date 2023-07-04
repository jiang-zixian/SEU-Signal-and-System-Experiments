function hd=idealFilter(Wc,N)
%理想滤波器的单位冲击响应
alpha = (N-1)/2;
n = [0:1:(N-1)];
m = n-alpha+eps; % add smallest number to avoid divided by zero
hd = sin(Wc*m)./(pi*m);
end