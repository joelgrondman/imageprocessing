imname = 'wirebondmask.tif';
image = imread(imname);
    
figure(1)
imshow(image)

F = [0 0 0;
    0 1 1;
    0 0 0];

tic
image = IPdilate(image,F);
toc
figure(2)
imshow(image)


F = [0 0 0;
    0 1 1;
    0 0 0];

for i = 1:100
tic
image = IPerosion(image,F);
tic
figure(3)
imshow(image)
pause
end