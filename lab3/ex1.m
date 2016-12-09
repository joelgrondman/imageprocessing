
image = imread('originalDIP.tif');

[M,N] = size(image);
T = 1;
a = 0.1;
b = 0.1;
H = IPblurdir(M,N,a,b,T);

blurimage = IPftfilter(image,H);

figure(2)
imshow(blurimage);
figure(1)
imshow(image);

noiseblurimage = imnoise(blurimage, 'gaussian',0,(10/256)^2);

figure(3)
imshow(noiseblurimage);

figure(3)
imshow(IPwiener(noiseblurimage,H));