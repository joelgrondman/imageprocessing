clear all

imname = 'darkstream';
image = imread([imname '.tif']);

R = image(:,:,1); % extract RGB components
G = image(:,:,2);
B = image(:,:,3);

% original image
figure(1)
subplot(2,2,1)
imshow(image);
title('Original image')
subplot(2,2,2)
histogram(R); xlim([0,255])
subplot(2,2,3)
histogram(G); xlim([0,255])
title('G component')
xlabel('Intensity level')
ylabel('Occurrence')
subplot(2,2,4)
histogram(B); xlim([0,255])
saveas(gcf,[imname 'RGB' '.png'])

% image RGB seperately equalized
R = histeq(R);
G = histeq(G);
B = histeq(B);
seqimage = cat(3,R,G,B); % concatenate RGB

figure(2)
subplot(2,2,1)
imshow(seqimage);
title('RGB equalized seperately')
subplot(2,2,2)
histogram(R); xlim([0,255])
subplot(2,2,3)
histogram(G); xlim([0,255])
title('G component')
xlabel('Intensity level')
ylabel('Occurrence')
subplot(2,2,4)
histogram(B); xlim([0,255])
saveas(gcf,[imname 'RGBeq' '.png'])

% image RGB average equalized
R = image(:,:,1); % set color intensity values to original values
G = image(:,:,2);
B = image(:,:,3);
Rh = histcounts(R,0:256); % frequency of each color
Gh = histcounts(G,0:256);
Bh = histcounts(B,0:256);
avh = (Rh + Gh + Bh)/3; % average frequency

L = 256;
MN = size(image,1)*size(image,2);
Sk = ((L-1)/MN)*cumsum(avh);           % the transformed histogram
Sk = uint8(round(Sk));                 % round to remove doubles

R = Sk(R + 1); % map intensity levels to transformed intensity levels
G = Sk(G + 1);
B = Sk(B + 1);
avimage = cat(3,R,G,B); % concatenate RGB

figure(3)
subplot(2,2,1)
imshow(avimage);
title('RGB average equalized')
subplot(2,2,2)
histogram(R); xlim([0,255])
subplot(2,2,3)
histogram(G); xlim([0,255])
title('G component')
xlabel('Intensity level')
ylabel('Occurrence')
subplot(2,2,4)
histogram(B); xlim([0,255])
saveas(gcf,[imname 'RGBav' '.png'])


