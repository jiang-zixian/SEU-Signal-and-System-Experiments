% 定义杨辉三角的行数
n = 10;

% 初始化杨辉三角矩阵
triangle = zeros(n);

% 计算杨辉三角
for i = 1:n
    triangle(i,1:i) = 1;%先将三角范围全初始化为1（也可以只初始化左边和后边两列为1）
    for j = 2:i-1
        triangle(i,j) = triangle(i-1,j-1) + triangle(i-1,j);
    end
end

% 输出杨辉三角
disp('杨辉三角：');
for i = 1:n
    for j = 1:i
        fprintf('%d ',triangle(i,j));
    end
    fprintf('\n');
end
