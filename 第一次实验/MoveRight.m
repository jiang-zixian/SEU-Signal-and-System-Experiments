function [x_MoveRight,Newleft] = MoveRight(x,left,m)
%将数组x右移m位，前面补0(有效位数的下标+m)
%left是x最左边一个有效数字的下标
%Newleft是x_MoveRight最左边一个有效数字的下标
x_len=length(x);

x_MoveRight(1,1+m:x_len+m)=x(1,1:x_len);
for i=1:m
    x_MoveRight(i)=0;
end
Newleft=left+m;
end

