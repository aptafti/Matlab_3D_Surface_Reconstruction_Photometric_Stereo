close all;
clear all;
clc;


 L = [300.0, 400.0, 300.0;
     -500.0, 450.0, 350.0;
      530.0, -450.0, 300.0;
     -370.0, -450.0, 360.0;
     370.0, 250.0, 390.0;
     ]; 

  
numOfImages = 5;
imageSet = 'Sphere';
subDirectory = '/Sphere-Light3/';


[ N, A, D ] = PS( imageSet, subDirectory, numOfImages, L );
imwrite(N, 'results/Normal.png');
imwrite(A, 'results/Albedo.png');


figure ('Name', '2D Images under different light directions plus Normal and Albedo','NumberTitle','off'),
subplot (1,4, [1 2]), imshow(N); title ('Normal');
subplot (1,4, [3 4]), imshow(A); title('Albedo');


