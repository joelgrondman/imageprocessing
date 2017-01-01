imname = 'wirebondmask.tif';
image = imread(imname);
    
figure(1)
imshow(image)

F = [0 1 1;
    0 1 1;
    0 1 1];

figure(2)
imshow(IPdilate(image,F))

figure(3)
image = IPerode(image,F);
