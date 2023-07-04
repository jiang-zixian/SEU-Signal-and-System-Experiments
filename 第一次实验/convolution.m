function [y_n] = convolution(x_n,h_n)
%编程实现信号h(n),x(n)间的卷积和运算函数y(n)  图解法
%取长度
x_len=length(x_n);
h_len=length(h_n);

%偏移量
offset=h_len-1;

% 翻转h(n)
h_n=fliplr(h_n);

%将x_n右移offset个
[x_n,l]=MoveRight(x_n,1,offset);

%每次循环h_n右移一位,初始化h_n有效数字的最左一位下标
left=1;

%用循环相乘后叠加
for i=1:x_len+h_len
    if x_len+offset<left
        break;%之后的y_n(i)==0
    else 
        y_n(i)=0;%初始化y_n(i)的值
        for j=1:min(h_len+left-l,x_len)%j为当前列数关于x_n数组有效数字最左边一个值的下标的偏移量
            y_n(i)=y_n(i)+x_n(j+offset)*h_n(j+offset);%相乘后叠加
        end
        [h_n,left]=MoveRight(h_n,left,1);%每次循环后h_n右移一位
    end
end

        
    
