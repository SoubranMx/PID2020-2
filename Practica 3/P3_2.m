clear variables; close all; clc;

% Seleccionar una imagen tipo tif o tiff utilizando el explorador de
% archivos.
Satelite1 = imread('Imagenes/zonaA_b5.tif');
Satelite2 = imread('Imagenes/zonaB_b5.tif');

figure(1); imshow(Satelite1); title('Imagen Satelital 1 Original');
figure(2); imshow(Satelite2); title('Imagen Satelital 2 Original');

% Inciso A. Desplegar las imágenes satelitales cortando o eliminando las
% zonas donde la información es nula. Desplegar además el histograma
% correspondiente a cada una de ellas.

recorteA = imcrop(Satelite1,[0 0 1761 1500]);
recorteB = imcrop(Satelite2,[1229.5 0.5 1271 1500]);
histA = imhist(recorteA);
histB = imhist(recorteB);

figure();
subplot(1,2,1); imshow(recorteA); title('Imagen Satelital 1 Recortada');
subplot(1,2,2); plot(histA); title('Histograma 1');
figure();
subplot(1,2,1); imshow(recorteB); title('Imagen Satelital 2 Recortada');
subplot(1,2,2); plot(histB); title('Histograma 2');
pause;

% Inciso B. Desplegar el mosaico que resulta de unir las dos imágenes
% satelitales sin el uso de la técnica de especifación del histograma.

unionB = imfuse(recorteA,recorteB,'montage');
figure();
imshow(unionB);
title('Imagenes unidas sin especificacion de histograma');
pause;

% Inciso C. Desplegar la zona de traslape y su histograma.
recorteAc = imcrop(Satelite1,[910 0 1179 1500]);
recorteBc = imcrop(Satelite2,[910 0 1179 1500]);
unionABc = imfuse(recorteAc,recorteBc,'blend');
histoABc = imhist(unionABc);
figure();
subplot(1,2,1);
imshow(unionABc);
title('Zona de traslape');
subplot(1,2,2);
plot(histoABc);
title('Histograma del traslape');
pause;

% Inciso D. Desplegar las imágenes satelitales recortadas, cuyos
% histogramas han sido especificados con el histograma del inciso anterior.
% Desplegar además el histograma correspondiente a cada una de ellas.
recorteAD = histeq(recorteA,histoABc);
recorteBD = histeq(recorteB,histoABc);
histoAD = imhist(recorteAD);
histoBD = imhist(recorteBD);

figure();
subplot(1,2,1);
imshow(recorteAD);
title('Imagen 1 con especificación');
subplot(1,2,2);
plot(histoAD);
title('Histograma 1 con especificación');

figure();
subplot(1,2,1);
imshow(recorteBD);
title('Imagen 2 con especificación');
subplot(1,2,2);
plot(histoBD);
title('Histograma 2 con especificación');

figure();
subplot(2,2,1);
imshow(recorteA);
title('Imagen 1 Recortada sin especificación');
subplot(2,2,2);
plot(histA);
subplot(2,2,3);
imshow(recorteAD);
title('Imagen 1 Recortada con especificación');
subplot(2,2,4);
plot(histoAD);

figure();
subplot(2,2,1);
imshow(recorteB);
title('Imagen 2 Recortada sin especificación');
subplot(2,2,2);
plot(histB);
subplot(2,2,3);
imshow(recorteBD);
title('Imagen 2 Recortada con especificación');
subplot(2,2,4);
plot(histoBD);
% Inciso E. Desplegar el mosaico que resulta de unir las dos imágenes
% satelitales después de la especificación del histograma. Desplegar
% también el histograma del mosaico.

% Inciso F. Especificar el histograma del mosaico usando 128,64,32,16,8 y 2
% niveles de cuantización.