%% Sección del primer y segundo inciso de la práctica 4
clear variables; close all; clc;

% Se declara la imagen y se le asigna ruido
original = rgb2gray(imread("Lena.tiff"));
conRuido = imnoise(original, 'salt & pepper');

% Se despliega la imagen y la imagen con ruido
figure(1);
imshow(original);
axis image;
title('Imagen Original');
figure(2);
imshow(conRuido);
title('Imagen Con Ruido');

% Se declara el filtro de bloque de 3x3
filtroBloque = ones(3,3)*(1/9);
% Se hace la convolución entre el filtro y la imagen original
imagenFiltrada = conv2(original, filtroBloque);
% Se despliega la imagen filtrada
figure(3);
subplot(2, 2, 1);
imshow(original);
title('Imagen Original');
subplot(2, 2, 2);
imshow(conRuido);
title('Imagen Con Ruido');
subplot(2, 2, 3);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Original Con Filtro De Bloque De 3x3');
% Se hace la convolución entre el filtro y la imagen con ruido
imagenFiltrada = conv2(conRuido, filtroBloque);
% Se despliega la imagen filtrada
subplot(2, 2, 4);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Con Ruido Con Filtro De Bloque De 3x3');

% Se declara el filtro de bloque de 5x5
filtroBloque = ones(5,5)*(1/25);
% Se hace la convolución entre el filtro y la imagen original
imagenFiltrada = conv2(original, filtroBloque);
% Se despliega la imagen filtrada
figure(4);
subplot(2, 2, 1);
imshow(original);
title('Imagen Original');
subplot(2, 2, 2);
imshow(conRuido);
title('Imagen Con Ruido');
subplot(2, 2, 3);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Original Con Filtro De Bloque De 5x5');
% Se hace la convolución entre el filtro y la imagen con ruido
imagenFiltrada = conv2(conRuido, filtroBloque);
% Se despliega la imagen filtrada
subplot(2, 2, 4);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Con Ruido Con Filtro De Bloque De 5x5');

% Se declara el filtro de bloque de 7x7
filtroBloque = ones(7,7)*(1/49);
% Se hace la convolución entre el filtro y la imagen original
imagenFiltrada = conv2(original, filtroBloque);
% Se despliega la imagen filtrada
figure(5);
subplot(2, 2, 1);
imshow(original);
title('Imagen Original');
subplot(2, 2, 2);
imshow(conRuido);
title('Imagen Con Ruido');
subplot(2, 2, 3);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Original Con Filtro De Bloque De 7x7');
% Se hace la convolución entre el filtro y la imagen con ruido
imagenFiltrada = conv2(conRuido, filtroBloque);
% Se despliega la imagen filtrada
subplot(2, 2, 4);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Con Ruido Con Filtro De Bloque De 7x7');

% Se declara el filtro de bloque de 11x11
filtroBloque = ones(11,11)*(1/121);
% Se hace la convolución entre el filtro y la imagen original
imagenFiltrada = conv2(original, filtroBloque);
% Se despliega la imagen filtrada
figure(6);
subplot(2, 2, 1);
imshow(original);
title('Imagen Original');
subplot(2, 2, 2);
imshow(conRuido);
title('Imagen Con Ruido');
subplot(2, 2, 3);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Original Con Filtro De Bloque De 11x11');
% Se hace la convolución entre el filtro y la imagen con ruido
imagenFiltrada = conv2(conRuido, filtroBloque);
% Se despliega la imagen filtrada
subplot(2, 2, 4);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Con Ruido Con Filtro De Bloque De 11x11');

%% Sección del tercer inciso de la práctica 4
%clear variables; close all; clc;

% Se declara la imagen y se le asigna ruido
original = rgb2gray(imread("Lena.tiff"));
conRuido = imnoise(original, 'salt & pepper');

% Se declara el filtro binomial de 3x3
arregloHorizontal = [1, 2, 1];
arregloVertical = [1; 2; 1];
filtroBinomial = (arregloHorizontal.*arregloVertical)*(1/16);
% Se hace la convolución entre el filtro y la imagen original
imagenFiltrada = conv2(original, filtroBinomial);
% Se despliega la imagen filtrada
figure(7);
subplot(2, 2, 1);
imshow(original);
title('Imagen Original');
subplot(2, 2, 2);
imshow(conRuido);
title('Imagen Con Ruido');
subplot(2, 2, 3);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Original Con Filtro Binomial De 3x3');
% Se hace la convolución entre el filtro y la imagen con ruido
imagenFiltrada = conv2(conRuido, filtroBinomial);
% Se despliega la imagen filtrada
subplot(2, 2, 4);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Con Ruido Con Filtro Binomial De 3x3');

% Se declara el filtro binomial de 5x5
arregloHorizontal = [1, 4, 6, 4, 1];
arregloVertical = [1; 4; 6; 4; 1];
filtroBinomial = (arregloHorizontal.*arregloVertical)*(1/256);
% Se hace la convolución entre el filtro y la imagen original
imagenFiltrada = conv2(original, filtroBinomial);
% Se despliega la imagen filtrada
figure(8);
subplot(2, 2, 1);
imshow(original);
title('Imagen Original');
subplot(2, 2, 2);
imshow(conRuido);
title('Imagen Con Ruido');
subplot(2, 2, 3);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Original Con Filtro Binomial De 5x5');
% Se hace la convolución entre el filtro y la imagen con ruido
imagenFiltrada = conv2(conRuido, filtroBinomial);
% Se despliega la imagen filtrada
subplot(2, 2, 4);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Con Ruido Con Filtro Binomial De 5x5');

% Se declara el filtro binomial de 7x7
arregloHorizontal = [1, 6, 15, 20, 15, 6, 1];
arregloVertical = [1; 6; 15; 20; 15; 6; 1];
filtroBinomial = (arregloHorizontal.*arregloVertical)*(1/4096);
% Se hace la convolución entre el filtro y la imagen original
imagenFiltrada = conv2(original, filtroBinomial);
% Se despliega la imagen filtrada
figure(9);
subplot(2, 2, 1);
imshow(original);
title('Imagen Original');
subplot(2, 2, 2);
imshow(conRuido);
title('Imagen Con Ruido');
subplot(2, 2, 3);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Original Con Filtro Binomial De 7x7');
% Se hace la convolución entre el filtro y la imagen con ruido
imagenFiltrada = conv2(conRuido, filtroBinomial);
% Se despliega la imagen filtrada
subplot(2, 2, 4);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Con Ruido Con Filtro Binomial De 7x7');

% Se declara el filtro binomial de 11x11
arregloHorizontal = [1, 10, 45, 120, 210, 252, 210, 120, 45, 10, 1];
arregloVertical = [1; 10; 45; 120; 210; 252; 210; 120; 45; 10; 1];
filtroBinomial = (arregloHorizontal.*arregloVertical)*(1/1048576);
% Se hace la convolución entre el filtro y la imagen original
imagenFiltrada = conv2(original, filtroBinomial);
% Se despliega la imagen filtrada
figure(10);
subplot(2, 2, 1);
imshow(original);
title('Imagen Original');
subplot(2, 2, 2);
imshow(conRuido);
title('Imagen Con Ruido');
subplot(2, 2, 3);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Original Con Filtro Binomial De 11x11');
% Se hace la convolución entre el filtro y la imagen con ruido
imagenFiltrada = conv2(conRuido, filtroBinomial);
% Se despliega la imagen filtrada
subplot(2, 2, 4);
image(imagenFiltrada);
axis image;
colormap('gray');
title('Imagen Con Ruido Con Filtro Binomial De 11x11');
