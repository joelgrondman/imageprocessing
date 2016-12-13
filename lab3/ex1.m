
image = imread('originalDIP.tif');

% create fourier transform
[M,N] = size(image);
T = 1;
a = 0.1;
b = 0.1;
H = IPblurdir(M,N,a,b,T);

% apply fourier transform through PFftfilter
blurimage = IPftfilter(image,H);

figure(1)
imshow(image)
figure(2)
imshow(blurimage)

% introduce noise
noiseblurimage = imnoise(blurimage, 'gaussian',0,(10/256)^2);

figure(3)
imshow(noiseblurimage);

% apply wiener filter on noisy image
wienerimage = IPwiener(noiseblurimage,H);

figure(4)
imshow(wienerimage);