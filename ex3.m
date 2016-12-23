imname = 'angio.tif';
imnamen = 'angio_noise.tif';
image = imread(imname);
imagen = imread(imnamen);
    
figure(1)
imshow(image)
figure(2)
imshow(imagen)

F = [1 1 1;
    1 1 1;
    1 1 1];
imageop = IPopening(imagen,F);

figure(3)
imshow(imageop)

imagediff = imageop ~= image;

figure(4)
imshow(imagediff)

imagerec = IPrecon_by_dilation(imagen,image,F);

figure(5)
imshow(imagerec)

imagediff2 = imagerec ~= image;

figure(6)
imshow(imagediff2)


