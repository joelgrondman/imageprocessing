band1=imread('WashingtonDC_Band1_564.tif');
band2=imread('WashingtonDC_Band2_564.tif');
band3=imread('WashingtonDC_Band3_564.tif');
band4=imread('WashingtonDC_Band4_564.tif');
band5=imread('WashingtonDC_Band5_564.tif');
band6=imread('WashingtonDC_Band6_564.tif');

figure(1)
subplot(2,3,1)
imshow('WashingtonDC_Band1_564.tif'), title('Band1')
subplot(2,3,2)
imshow('WashingtonDC_Band2_564.tif'), title('Band2')
subplot(2,3,3)
imshow('WashingtonDC_Band3_564.tif'), title('Band3')
subplot(2,3,4)
imshow('WashingtonDC_Band4_564.tif'), title('Band4')
subplot(2,3,5)
imshow('WashingtonDC_Band5_564.tif'), title('Band5')
subplot(2,3,6)
imshow('WashingtonDC_Band6_564.tif'), title('Band6')
annotation('textbox', [0 0.9 1 0.1], 'String',...
    'Multispectral satellite images','EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')


X=[band1(:)';band2(:)';band3(:)';band4(:)';band5(:)';band6(:)'];

k=2;

[X_r,y,eigen] = IPprincipalcomponents( X,k );

% contract/stretch y such that its intensity range is 0 to 255
X_s = nan(size(X_r));
for i = 1:size(X_r,1)
    M = max(X_r(i,:));
    m = min(X_r(i,:));
    X_s(i,:) = (255/(M - m))*(X_r(i,:) - m);
end
X_s = uint8(X_s);

% contract/stretch y such that its intensity range is 0 to 255
y_s = nan(size(y));
for i = 1:size(y,1)
    M = max(y(i,:));
    m = min(y(i,:));
    y_s(i,:) = (255/(M - m))*(y(i,:) - m);
end
y_s = uint8(y_s);

figure(2)
for i = 1:6
    subplot(2,3,i)
    imshow(reshape(y_s(i,:),564,564))
    title(['Band' num2str(i)])
end
annotation('textbox', [0 0.9 1 0.1],'String',... 
    'Principal component images','EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')

figure(3)
for i = 1:6
    subplot(2,3,i)
    imshow(reshape(X_s(i,:),564,564))
    title(['Band' num2str(i)])
end
annotation('textbox', [0 0.9 1 0.1],'String',... 
    ['Multispectral images reconstructed using ' num2str(k)...
    ' principal component images'],'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')

