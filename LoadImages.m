function [ I, IGray, mask ] = LoadImages( imageSet, subDirectory, numOfImages )

figure ('Name', '2D Images under different light directions','NumberTitle','off'),
for i = 1:numOfImages
    
    img = imread(strcat(imageSet, subDirectory, 'Sphere-Diffuse-',int2str(i),'.TIF'));
    I(:,:,:,i) = img;
    subplot (1,6, i), imshow(I(:,:,:,i));
    IGray(:,:,i) = rgb2gray(img);
end

img = imread(strcat(imageSet, subDirectory,'Sphere-Mask', '.TIF'));
mask = im2bw(img);
mask= (mask>0);
end


