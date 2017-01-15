imname = 'fingerprint';
image =imread([imname '.tif']);

figure(1) 
imshow(image)
imwrite(image,[imname '.png'])

figure(2)
[binimage, T0] = IPautothresh(image);
imshow(binimage)
imwrite(binimage,[imname 'globalthresholding.png'])
T0

