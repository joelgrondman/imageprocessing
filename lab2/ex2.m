clear all


M = 512;
N = 512;
D0 = 10;
H = IPgaussian(D0, M , N);
imwrite(uint8(H*255),'transferfunction.png')
imwrite(fftshift(uint8(H*255)),'transferfunctioncentered.png')

if 1 == 1
imname = 'characters.tif';
image = imread(imname);

FI = IPftfilter(image,H);
imwrite(FI,'charactersfiltered.png')

end