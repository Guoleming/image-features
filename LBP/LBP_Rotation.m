function F=LBP_Rotation(image)
% 旋转不变性，LBP特征提取
I = imresize(image,[256 256]);
[m,n,h] = size(I);
if h==3
    I = rgb2gray(I);
end
F= uint8(zeros([m n]));
for i = 2:m-1
    for j = 2:n-1
        neighbor = [I(i-1,j-1) I(i-1,j) I(i-1,j+1) I(i,j+1) I(i+1,j+1) I(i+1,j) I(i+1,j-1) I(i,j-1)] > I(i,j);
        pixel = 0;
        for k = 1:8
            pixel = pixel + neighbor(1,k) * bitshift(1,8-k);
        end
        F(i,j) = uint8(rotationMin(pixel));
    end
end