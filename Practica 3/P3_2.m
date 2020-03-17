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

% Inciso A. Recorte de imagen sin el �rea negra.
figure();
recorteA = imcrop(Satelite1);
recorteB = imcrop(Satelite2);
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
    
