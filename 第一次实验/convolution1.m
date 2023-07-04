function [y_n] = convolution1(x_n,h_n)
%用公式法实现卷积
x_len=length(x_n);
h_len=length(h_n);

for n=1:x_len+h_len
    y_n(n)=0;
    for k=max(1,n-h_len):min(x_len,n-1)
        y_n(n)=y_n(n)+x_n(k)*h_n(n-k);
    end
end
y_n(1)=[];
end

