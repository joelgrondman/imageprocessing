images = {'bubbles.tif','cktboard.tif','cereal.tif'};

for i = 1:3

    image=imread(images{i});
    subimage = image(end-99:end,end-99:end);
    figure(i)
    imshow(subimage)
    imwrite(subimage,[images{i}(1:end-4) '.png'])
    [m, u2, R, u3, U, e] = IPtexturemeasures(subimage);

    fprintf('subimage from %s\n',images{i})
    fprintf('mean %6.3f\n',m)
    fprintf('standard deviation %6.3f\n',sqrt(u2))
    fprintf('R %6.3f\n',R)
    fprintf('third moment %6.3f\n',u3)
    fprintf('Uniformity %6.3f\n',U)
    fprintf('Entropy %6.3f\n',e)
    fprintf('%6.3f &%6.3f &%6.3f &%6.3f &%6.3f &%6.3f\n',m,sqrt(u2),R,u3,U,e)
end
