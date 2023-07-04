function [Y] = MatrixConvolution(A,B)
%矩阵A和B卷积 前提：卷积核B的行列数为奇数

%先将B翻转180度
B=flip(B);
B=flip(B,2);
m=size(A);
m=m(2);
n=size(B);
n=n(2);

Y=zeros(m+n-1,m+n-1);
Y1=zeros(m+n-1,m+n-1);
Y((n-1)/2+1:(n-1)/2+m,(n-1)/2+1:(n-1)/2+m)=A;

for i=1:m
    for j=1:m
        re=0;
        for k1=1:n
            for k2=1:n
                re=re+B(k1,k2)*Y(i+k1-1,j+k2-1);
            end
        end
        Y1((n-1)/2+i,(n-1)/2+j)=re;
    end
end
Y=Y1((n-1)/2+1:(n-1)/2+m,(n-1)/2+1:(n-1)/2+m);
end

