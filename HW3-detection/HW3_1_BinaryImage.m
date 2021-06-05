clc;clear;
%Ū������
[FN] = uigetfile({'*.jpg','JPEG (*.jpg;*.jpeg;*)';...
                  '*.png','PNG (*.png)';...
                  '*.bmp','BMP (*.bmp)'},'�}�ҹ���');
RGB = imread(FN);
%Binary
threshold = 150; %�H��
threshold2 = threshold / 255;
Binary = im2bw(RGB,threshold2); %�G�Ȥ��ഫ
subplot(1,2,1); imshow(Binary); title('Binary');
%�N��J���T���ন�r��
work = input(...
    '�п�J�H�U�N����G�ȤƼv���@�κA�B�z:\n(E)erosion�B(D)dilation�B(O)opening�B(C)closing '...
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