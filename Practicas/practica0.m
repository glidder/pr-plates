2 * 3
ans * 2
a = 2 * 3
a
cadena1 = 'Inteligencia Artificial'
%cadena2 = "IA" Error: The input character bis not valid in MATLAB
%statements or expressions
1.0 / 0.0
0 / 0
inf / inf
A = [1 2 3; 4 5 6; 7 8 9]
B = [] %% matriz vacía
A'
2:0.5:4
A = 1:100;
A
x = [0.0:0.1:2*pi];
y = sin(x);
plot(x,y,'-r')
title('Funcion seno(x)')
legend('y = seno(x)')
A = [10 22 34; 43 55 64; 76 86 96; 89 90 91]
A(4,3)
A(1,:)
A(:,2)
A(2:3,:)
A(1:2,2:3)
A = imread('cameraman.tif');
imshow(A)
B = imread('mri.tif');
imshow(B)
size(B)
imtool(B)
A = imread('board.tif');
%imtool(A)
%imshow([A(:,:,1) A(:,:,2) A(:,:,3)])
IG = imread('rice.png');
figure, imshow(IG);
BW = im2bw(IG);
figure, imshow(BW);
impixelinfo;
BW = false([120, 200]);
for i=1:40:200, BW(i:i+19,:) = true; end
imshow(BW)
imshow(BW')
A = [256, 256]
f1 = [1:256]
%for i=1:256
   % A(i,:) = f1;
%end
%imshow(A,[1, 256])
A = repmat(f1, 256, 1)
imshow(A,[1,256])
imshow(A',[1,256])
clear all
close all
A = imread('lena.jpg');
B = rgb2gray(A);
subplot(2,1,1