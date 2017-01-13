
image =imread('fingerprint.tif');

figure(1) 
imshow(image)

figure(2)
[binimage, T0] = IPautothresh(image);
imshow(binimage)
T0

