%% SecciÃ³n del primer ejercicio de la prÃ¡ctica 5
clear variables; close all; clc;

% Se declara la imagen
pentagono = double(imread("pentagon256x256.tif"));

% Sobremuestreo de la imagen
sobremuesCon2 = imrotate(upsample(imrotate(upsample(pentagono, 2), 270), 2), -270);
sobremuesCon4 = imrotate(upsample(imrotate(upsample(pentagono, 4), 270), 4), -270);

figure(1);
subplot(1, 3, 1);
imagesc(pentagono);
axis image;
colormap('gray');
title('Imagen original');
subplot(1, 3, 2);
imagesc(sobremuesCon2);
axis image;
colormap('gray');
title('sobremuestreo con T = 2');
subplot(1, 3, 3);
imagesc(sobremuesCon4);
axis image;
colormap('gray');
title('sobremuestreo con T = 4');

% Obteniendo la DFT de la imagen original y las sobremuestreadas
originaldft = fftshift(fft2(pentagono));
sobremuesCon2dft = fftshift(fft2(sobremuesCon2));
sobremuesCon4dft = fftshift(fft2(sobremuesCon4));

figure(2);
subplot(1, 3, 1)
imagesc(log(1+abs(originaldft)));
axis image;
colormap('gray');
title('DFT de imagen original');
subplot(1, 3, 2)
imagesc(log(1+abs(sobremuesCon2dft)));
axis image;
colormap('gray');
title('DFT de sobremuestreo con T = 2');
subplot(1, 3, 3)
imagesc(log(1+abs(sobremuesCon4dft)));
axis image;
colormap('gray');
title('DFT de sobremuestreo con T = 4');

%% SecciÃ³n del segundo ejercicio de la prÃ¡ctica 5
[m, n]= size(pentagono);
[x, y] = meshgrid(1:n, 1:m);

% Factor de escala T = 2
T2 = 0.5;
[p, q] = meshgrid(1:T2:n, 1:T2:m);
% Orden 0
interpolOrd0T2 = interp2(x, y, pentagono, p, q, 'nearest');
figure(3);
subplot(1, 3, 1);
imagesc(interpolOrd0T2);
axis image;
colormap('gray');
zoom(3);
title('Interpolación orden 0 con T = 2');
% Orden 1
interpolOrd1T2 = interp2(x, y, pentagono, p, q, 'linear');
figure(3);
subplot(1, 3, 2);
imagesc(interpolOrd1T2);
axis image;
colormap('gray');
zoom(3);
title('Interpolación orden 1 con T = 2');
% Orden 3
interpolOrd3T2 = interp2(x, y, pentagono, p, q, 'cubic');
figure(3);
subplot(1, 3, 3);
imagesc(interpolOrd3T2);
axis image;
colormap('gray');
zoom(3);
title('Interpolación orden 3 con T = 2');

% Factor de escala T = 4
T4 = 0.25;
[p, q] = meshgrid(1:T4:n, 1:T4:m);
% Orden 0
interpolOrd0T4 = interp2(x, y, pentagono, p, q, 'nearest');
figure(4);
subplot(1, 3, 1);
imagesc(interpolOrd0T4);
axis image;
colormap('gray');
zoom(3);
title('Interpolación orden 0 con T = 4');
% Orden 1
interpolOrd1T4 = interp2(x, y, pentagono, p, q, 'linear');
figure(4);
subplot(1, 3, 2);
imagesc(interpolOrd1T4);
axis image;
colormap('gray');
zoom(3);
title('Interpolación orden 1 con T = 4');
% Orden 3
interpolOrd3T4 = interp2(x, y, pentagono, p, q, 'cubic');
figure(4);
subplot(1, 3, 3);
imagesc(interpolOrd3T4);
axis image;
colormap('gray');
zoom(3);
title('Interpolación orden 3 con T = 4');

% Mostrando las DFT de T = 2
% Orden 0
figure(5);
subplot(2, 3, 1);
imagesc(log(1+abs(fftshift(fft2(interpolOrd0T2)))));
axis image;
colormap('gray');
title('DFT de la interpolación orden 0 con T = 2');
% Orden 1
figure(5);
subplot(2, 3, 2);
imagesc(log(1+abs(fftshift(fft2(interpolOrd1T2)))));
axis image;
colormap('gray');
title('DFT de la interpolación orden 1 con T = 2');
% Orden 3
figure(5);
subplot(2, 3, 3);
imagesc(log(1+abs(fftshift(fft2(interpolOrd3T2)))));
axis image;
colormap('gray');
title('DFT de la interpolación orden 3 con T = 2');

% Mostrando las DFT de T = 4
% Orden 0
figure(5);
subplot(2, 3, 4);
imagesc(log(1+abs(fftshift(fft2(interpolOrd0T4)))));
axis image;
colormap('gray');
title('DFT de la interpolación orden 0 con T = 4');
% Orden 1
figure(5);
subplot(2, 3, 5);
imagesc(log(1+abs(fftshift(fft2(interpolOrd1T4)))));
axis image;
colormap('gray');
title('DFT de la interpolación orden 1 con T = 4');
% Orden 3
figure(5);
subplot(2, 3, 6);
imagesc(log(1+abs(fftshift(fft2(interpolOrd3T4)))));
axis image;
colormap('gray');
title('DFT de la interpolación orden 3 con T = 4');

%% SecciÃ³n del tercer ejercicio de la prÃ¡ctica 5
% Despliegue del DFT de la imagen original
figure(6);
imagesc(log(1+abs(originaldft)));
axis image;
colormap('gray');
title('DFT de imagen original');

% Agregando los ceros al DFT
ceros1 = zeros(128, 512);
ceros2 = zeros(256, 128);
ceros3 = zeros(384, 1024);
ceros4 = zeros(256, 384);
originaldftConCeros512 = [ceros1; ceros2 originaldft ceros2; ceros1];
originaldftConCeros1024 = [ceros3; ceros4 originaldft ceros4; ceros3];
figure(7);
subplot(1, 2, 1);
imagesc(log(1+abs(originaldftConCeros512)));
axis image;
colormap('gray');
title('DFT con ceros a 512');
subplot(1, 2, 2);
imagesc(log(1+abs(originaldftConCeros1024)));
axis image;
colormap('gray');
title('DFT con ceros a 1024');

% Calcular la inversa
originaldftInv512 = abs(ifft2(originaldftConCeros512));
originaldftInv1024 = abs(ifft2(originaldftConCeros1024));
figure(8);
subplot(1, 2, 1);
imagesc(originaldftInv512);
axis image;
colormap('gray');
title('Inv del DFT con ceros a 512');
subplot(1, 2, 2);
imagesc(originaldftInv1024);
axis image;
colormap('gray');
title('Inv del DFT con ceros a 1024');
