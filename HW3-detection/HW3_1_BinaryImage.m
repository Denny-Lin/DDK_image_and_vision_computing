clc;clear;
%讀取圖檔
[FN] = uigetfile({'*.jpg','JPEG (*.jpg;*.jpeg;*)';...
                  '*.png','PNG (*.png)';...
                  '*.bmp','BMP (*.bmp)'},'開啟圖檔');
RGB = imread(FN);
%Binary
threshold = 150; %閾值
threshold2 = threshold / 255;
Binary = im2bw(RGB,threshold2); %二值化轉換
subplot(1,2,1); imshow(Binary); title('Binary');
%將輸入的訊息轉成字串
work = input(...
    '請輸入以下代號對二值化影像作形態處理:\n(E)erosion、(D)dilation、(O)opening、(C)closing '...
    ,'s');
se = strel('disk',2);
if work == 'e' | work == 'E'
    w1 = imerode(Binary,se);
    subplot(1,2,2); imshow(w1); title('erosion');
elseif work == 'd' | work == 'D'
    w1 = imdilate(Binary,se);
    subplot(1,2,2); imshow(w1); title('erosion');
elseif work == 'o' | work == 'O'
    w1 = imopen(Binary,se);
    subplot(1,2,2); imshow(w1); title('erosion');
elseif work == 'c' | work == 'C'
    w1 = imclose(Binary,se);
    subplot(1,2,2); imshow(w1); title('erosion');
end
saveas(figure(1),'CV_HW3_1_M1035502','jpg');
