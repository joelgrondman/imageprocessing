imname = 'wirebondmask.tif';
image = imread(imname);
    
figure(1)
imshow(image)

F = [0 0 0;
    1 1 1;
    0 0 0];

image = IPdilate(image,F);
figure(2)
imshow(image)

F = [1 1 1;
    1 1 1;
    1 1 1];
for i = 1:100
image = IPerosion(image,F);

figure(3)
imshow(image)
pause
end