clear all

imname = 'characters.tif';
image = imread(imname);

[M,N] = size(image);
D0 = 10;
H = IPgaussian(D0, M , N);
imwrite(uint8(H*255),'transferfunction.png')
imwrite(fftshift(uint8(H*255)),'transferfunctioncentered.png')

FI = IPftfilter(image,H);
imwrite(FI,'charactersfiltered.png')
