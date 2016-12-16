
imname = 'originalDIP';
image = imread([imname '.tif']);

imwrite(image, [imname '.png'])
% create fourier transform
[M,N] = size(image);
T = 1;
a = 0.1;
b = 0.1;
H = IPblurdir(2*M,2*N,a,b,T);
% save centered fourier spectrum of H
imwrite(uint8(abs(fftshift(H))*255), 'Hspectrum.png')
% apply fourier transform through PFftfilter
blurimage = IPftfilter(image,H);
imwrite(blurimage, [imname 'dirblur' '.png'])

figure(1)
imshow(image)
figure(2)
imshow(blurimage)

% introduce noise
noiseblurimage = imnoise(blurimage, 'gaussian',0,(10/256)^2);
imwrite(noiseblurimage, [imname 'dirblurnoise' '.png'])

figure(3)
imshow(noiseblurimage);

% apply wiener filter on noisy image
wienerimage = IPwiener(noiseblurimage,H);
imwrite(wienerimage, [imname 'dirblurnoisewiener' '.png'])

figure(4)
imshow(wienerimage);