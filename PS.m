function [ N, A, D ] = PS( imageSet, subDirectory, numOfImages, L )
[ I, IGray, mask ] = LoadImages( imageSet, subDirectory, numOfImages );
[height,width] = size(mask);
[h,w]= size(mask);
 d=3;
[indc, indr] = meshgrid(1:width, 1:height);

N = Normals(IGray, mask, L);
A = Albedos(I,mask, L, N);
D = Depth(N,mask,h,w,d);


end

