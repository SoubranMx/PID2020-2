clear variables; close all; clc;

% Seleccionar una imagen tipo tif o tiff utilizando el explorador de
% archivos.
% [filename, filepath] = uigetfile('*.tif*', 'Select a tif file');
% fullname = fullfile(filepath, filename);
% Satelite1 = imread(fullname);
% 
% [filename, filepath] = uigetfile('*.tif*', 'Select a tif file');
% fullname = fullfile(filepath, filename);
% Satelite2 = imread(fullname);
Satelite1 = imread('Imagenes/zonaA_b5.tif');
Satelite2 = imread('Imagenes/zonaB_b5.tif');

figure(1);
imshow(Satelite1);
title('Imagen Satelital 1 Original');
figure(2);
imshow(Satelite2);
title('Imagen Satelital 2 Original');

% Inciso A. Recorte de imagen sin el área negra.
% figure();
recorteA = imcrop(Satelite1,[0 0 1761 1500]);
recorteB = imcrop(Satelite2,[1229.5 0.5 1271 1500]);
histA = imhist(recorteA);
histB = imhist(recorteB);
figure();
subplot(1,2,1);
imshow(recorteA);
title('Imagen Satelital 1 Recortada');
subplot(1,2,2);
plot(histA);
title('Histograma 1');

figure();
subplot(1,2,1);
imshow(recorteB);
title('Imagen Satelital 2 Recortada');
subplot(1,2,2);
plot(histB);
title('Histograma 2');
    
% Inciso B. Imagen unida sin especificacion del histograma.
union = imfuse(recorteA,recorteB,'montage');
figure();
imshow(union);
title('Imagenes unidas sin especificacion de histograma');
% Con montage, se "concatenan" dos imágenes, pero como no son del mismo
% tamaño, añade ceros a la matriz para dejarla del mismo tamaño.

%ejercicio 2_c
recorteC=imcrop(union,[1300 1 800 1800]);
figure();
imshow(recorteC);
figure();
histD=imhist(recorteC);
plot(histD);

