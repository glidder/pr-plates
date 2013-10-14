% --------------- 1. Comenzando a trabajar ---------------

%Multiplicar
2 * 3
%Multiplicar el resultado anterior por 2
ans * 2
%Variable y asignar valor
a = 2 * 3
%Mostrar la variable
a
%Asignar cadenas de texto
Cadena1 = 'Inteligencia Artificial'
%El uso de comilla doble da error en Matlab
%cadena2 = "IA"
%El infinito se representa con Inf
1.0 / 0.0 %El resultado es Inf
%Para representar los resultados que no estan definidos como números utiliza NaN (Not a Number)
inf / inf %Saldría NaN
%clc Limpia la consola
%clear Borra las variables
%close Cierra las ventanas de graficos
%who / whos Muestra las variables
%help Muestra la ayuda
%quit Cierra Matlab

% --------------- 2. Vectores y matrices ---------------

%Define una matriz A de dimension (3x3)
A = [1 2 3; 4 5 6; 7 8 9]
%Matriz vacia
B = [] 
%Para poner la transpuesta de A
A'

% --------------- 3. Operador dos puntos (:) ---------------

%Sirve para especificar rango de valores y el formato es "valorMinimo:Icremento:ValorMaximo
2 : 0.5 : 4
%Vector formado por el rango de enteros del 1 al 100
A = 1 : 100;
%Generar tabla de senos y mostrarla
x = [0.0 : 0.1 : 2 * pi];
y = sin(x);
plot(x, y, '-r') %Dibuja la función y=seno(x) trazando una línea roja: ‘-r’
title('Funcion seno(x)') %Titulo
legend('y = seno(x)') %leyenda

% --------------- 4. Acceso a los elementos de una matriz ---------------

%Para coger toda la fila o columna se usa :
%Ejercicio 1
A = [10 22 34; 43 55 64; 76 86 96; 89 90 91]
A(4, 3) %Elemento de la 4 fila y la 3 columna
A(1, :) %Todos los elementos de la 1a fila
A(:, 2) %Todos los elementos de la segnda columna
A(2 : 3, :) %Todos los elementos de la 2 a la 3 fila y todas las columnas
A(1 : 2, 2 : 3) %Todos los elementos de las filas 1 y 2 de las columnas 2 y 3

% --------------- 5. Tratamiento de imagenes ---------------

%Para la lectura de imagenes se usa
A = imread('cameraman.tif');
%La visulizacion de la imagen se realiza
imshow(A)
%Ejercicio 2
E2 = imread('mri.tif');
size(E2)
imtool(E2);
%Se puede visualizar las tres componentes de color usando la notación de matrices. El nivel de gris para cada parte del espectro de la luz será definido por (:,:,i). Indica que todas las filas y las columnas para la componente i, i=1,2 ó 3 (rojo,verde,azul)
%imshow([E2(:, :, 1) E2(:, :, 2) E2(:, :, 3)])
%comando imtool para ver el nivel de gris de la imagen de cameraman.tif y los colores en board.tif.
imtool('cameraman.tif');
imtool('board.tif');
%Las imágenes son las binarias. Normalmente se emplea el ‘0’ para indicar el fondo y ‘1’ el objeto. Se empleará una técnica de umbralización para convertir las imágenes en binarias mediante la función "im2bw"
IG = imread('rice.png');
figure, imshow(IG);
BW = im2bw(IG);
figure, imshow(BW);
impixelinfo;
%Ejercicio 3
E3n = imread('coins.png');
figure, imshow(E3n);
E3b = im2bw(E3n);
figure, imshow(E3b);
impixelinfo;
%construir una imagen binaria de 120 x 200 píxeles que tenga franjas horizontales de 20 píxeles de anchura, distanciada por cada 20 píxeles
BW = false([120, 200]);
for i = 1 : 40 : 200, BW(i : i + 19, :) = true; end
figure, imshow(BW);
impixelinfo;
%Para que salgan verticales con la transpuesta
figure, imshow(BW');
impixelinfo;
%Ejercicio 4
E4 = [256, 256];
fila = [1 : 256];
E4 = repmat(fila, 256, 1); %Copia el vector "fila" en la matriz "E4"
figure, imshow(E4, [1, 256]);
impixelinfo;
figure, imshow(E4', [1, 256]);
impixelinfo;

% --------------- 6. Histograma de una imagen ---------------

%Borrar y cerrar todo
clear all
close all
%El código Matlab paravisualizar en una misma pantalla una imagen y su histograma podría ser
A = imread('board.tif'); %No existe lena.jpg
B = rgb2gray(A); %Pasa la imagen a escala de grises
subplot(2, 1, 1), subimage(B), title('Imagen original');
subplot(2, 1, 2), imhist(B), title('Histograma');
%Ejercicio 5
close all
E5n = imread('pout.tif');
figure
subplot(2, 1, 1), subimage(E5n), title('pout.tif normal');
subplot(2, 1, 2), imhist(E5n), title('Histograma');
E5e = histeq(E5n);
figure
subplot(2, 1, 1), subimage(E5n), title('pout.tif ecualizada');
subplot(2, 1, 2), imhist(E5n), title('Histograma');

% --------------- 7. Operaciones de suavizado ---------------

% ---- Filtros lineales ----

%pliquemos el filtro de la media sobre la imagen cameraman.tif a la que se le ha introducido ruido aleatorio del tipo sal y pimienta, con una máscara de 3X3 y otra de 9X9.
A = imread('cameraman.tif');
R = imnoise(A, 'salt & pepper', 0.05);
h1 = fspecial('average');
h2 = fspecial('average', [9, 9]);
M1 = imfilter(R, h1);
M2 = imfilter(R, h2);
subplot(2, 2, 1), subimage(A), title('Imagen original');
subplot(2, 2, 2), subimage(R), title('Imagen con ruido');
subplot(2, 2, 3), subimage(M1), title('Filtro Media 3x3');
subplot(2, 2, 4), subimage(M2), title('Filtro Media 9x9');
%Comparacion con el metodo gaussiano
A = imread('cameraman.tif');
R = imnoise(A, 'gaussian');
h1 = fspecial('gaussian');
h2 = fspecial('average');
G = imfilter(R, h1);
M = imfilter(R, h2);
subplot(2, 2, 1),subimage(A),title('Imagen original')
subplot(2, 2, 2),subimage(R),title('Imagen con ruido');
subplot(2, 2, 3),subimage(G),title('Filtro Gaussiano');
subplot(2, 2, 4), subimage(M),title('Filtro Media 3x3');
%Filtro gaussiano es mejor.

% ---- Filtros no lineales ----

%Ejemplo de una imagen afectada por ruido gaussiano y aleatorio y filtrada por el filtro de la media y de la mediana
A = imread('board.tif'); %No existe lena.jpg
B = rgb2gray(A);
G = imnoise(B, 'gaussian');
S = imnoise(B, 'salt & pepper', 0.1);
h1 = fspecial('average');
media1 = imfilter(G, h1);
media2 = imfilter(S, h1);
mediana1 = medfilt2(G);
mediana2 = medfilt2(S);
subplot(2, 3, 1), subimage(G), title('Con ruido Gaussiano')
subplot(2, 3, 4), subimage(S), title('Con ruido aleatorio');
subplot(2, 3, 2), subimage(media1), title('Filtro media');
subplot(2, 3, 5), subimage(media2), title('Filtro media');
subplot(2, 3, 3), subimage(mediana1), title('Filtro mediana');
subplot(2, 3, 6), subimage(mediana2), title('Filtro mediana');

%Fin de teoria de la practica
