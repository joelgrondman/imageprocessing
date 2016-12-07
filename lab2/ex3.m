clear all

imname = 'circuitboard.tif';
image = imread(imname);
imwrite(image, 'circuitboard.png')

imagenoise = imnoise(image,'salt & pepper', 0.2);
imwrite(imagenoise, 'circuitboardnoise.png')

imagemedian = IPmedian(imagenoise);
imwrite(imagemedian, 'circuitboardmedian.png')

imagefilter = IPfilter(imagenoise);
imwrite(imagefilter, 'circuitboardfilter.png')

