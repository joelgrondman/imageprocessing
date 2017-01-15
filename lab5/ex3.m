band1=imread('WashingtonDC_Band1_564.tif');
band2=imread('WashingtonDC_Band2_564.tif');
band3=imread('WashingtonDC_Band3_564.tif');
band4=imread('WashingtonDC_Band4_564.tif');
band5=imread('WashingtonDC_Band5_564.tif');
band6=imread('WashingtonDC_Band6_564.tif');

X=[band1(:)';band2(:)';band3(:)';band4(:)';band5(:)';band6(:)'];

k=318096;

IPprincipalcomponents( X,k )

