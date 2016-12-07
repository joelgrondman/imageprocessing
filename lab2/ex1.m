imname = 'characters.tif';

image = imread(imname);
imwrite(image, 'characters.png')

f = im2double(image);
F = fft2(f);
% fourier spectrum;
Fs = abs(F);

% contrast stretch
M = max(Fs(:));
m = min(Fs(:));
Fscs = (256/(M-m))*(Fs-m);

Fscsi = im2uint8(Fscs);
imwrite(Fscsi,'charactersspectrum.png')
imwrite(fftshift(Fscsi),'charactersspectrumcentered.png')

% average value
((F(1,1)*255)/size(image,1))/size(image,2)
% comparison
sum(image(:))/(size(image,1)*size(image,2))


