imname = 'characters.tif';

image = imread(imname);

figure(1)
imshow(image)


f = im2double(image);
F = fft2(f);
% fourier spectrum;
spec = abs(F);



% contrast stretch
M = max(spec(:));
m = min(spec(:));
spec = (256/(M-m))*(spec-m);

figure(2)
imshow(im2uint8(fftshift(spec)))

% average value
((F(1,1)*255)/size(image,1))/size(image,2)
% compare
sum(image(:))/(size(image,1)*size(image,2))


