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
countdiff = sum(sum(imagediff))

figure(4)
imshow(imagediff)

imagerec = IPrecon_by_dilation(IPerode(imagen,F),imagen,F);

figure(5)
imshow(imagerec)

imagediff2 = imagerec ~= image;
countdiff = sum(sum(imagediff2))

figure(6)
imshow(imagediff2)


