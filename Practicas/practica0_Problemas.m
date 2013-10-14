% --------------- Ejercicios propuestos ---------------

% --------

disp('Ejercicio 1')
x1 = [-2.0 : 0.05 : 2.0];
x2 = [2.0 : 0.01 : 4.0];
y1 = (x1 .^ 2) - x1 + 3;
y2 = (2 * x2) + 1;
figure, plot(x1, y1, '-m', x2, y2, '-b') %Pinta
title('Funcion definida por partes')
legend('x^2 - x + 3', '2x + 1')
grid on

% --------

disp('Ejercicio 2')
x = [-5.0 : 0.02 : 5.0];
y = (x .^ 2) - (3 * x) - 2;
z = (x .^ 3) - (2 * x) + 1;
figure
subplot(2, 1, 1)
plot(x, y, '-g'), title('funcion y'), legend('y = x^2 - 2x - 2')
hold on, plot(2, 1, '+r'), hold off
grid on
subplot(2, 1, 2)
plot(x, z, '--b'), title('funcion z'), legend('z = x^3 - 2x + 1')
hold on, plot(2, 1, '+r'), hold off
grid on

% --------

disp('Ejercicio 3')
A = imread('spine.tif');
R = imnoise(A, 'salt & pepper', 0.05);
h1 = fspecial('average');
h2 = fspecial('gaussian');
M1 = imfilter(R, h1);
M2 = imfilter(R, h2);
figure
subplot(2, 2, 1), subimage(A), title('Imagen original');
subplot(2, 2, 2), subimage(R), title('Imagen con ruido');
subplot(2, 2, 3), subimage(M1), title('Filtro Media');
subplot(2, 2, 4), subimage(M2), title('Filtro Gaussiano');

% --------

disp('Ejercicio 4') 
A = imread('peppers.png');
R = imnoise(A, 'gaussian');
h1 = fspecial('average');
h2 = fspecial('gaussian');
G = imfilter(R, h2);
M = imfilter(R, h1);
figure
subplot(3, 2, 1),subimage(A),title('Imagen original')
subplot(3, 2, 2),subimage(R),title('Imagen con ruido');
subplot(3, 2, 3), subimage(M),title('Filtro Media');
subplot(3, 2, 4),subimage(G),title('Filtro Gaussiano');
subplot(3, 2, 5), imhist(rgb2gray(M)), title('Histograma Media');
subplot(3, 2, 6), imhist(rgb2gray(G)), title('Histograma Gaussiano');
