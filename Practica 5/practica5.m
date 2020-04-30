%% Sección del primer ejercicio de la práctica 5
clear variables; close all; clc;

% Se declara la imagen
pentagono = imread("pentagon256x256.tif");

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

%% Sección del segundo ejercicio de la práctica 5
pentagono = imread("pentagon256x256.tif");

% Sobremuestreo de la imagen
sobremuesCon2 = imrotate(upsample(imrotate(upsample(pentagono, 2), 270), 2), -270);
sobremuesCon4 = imrotate(upsample(imrotate(upsample(pentagono, 4), 270), 4), -270); 
ISC= ones(2,2)
imagenISC2 = conv2(sobremuesCon2,ISC);
figure(10);
subplot(1, 3, 1);
imagesc(pentagono);
axis image;
colormap('gray');
title('Imagen original');
subplot(1, 3, 2);
imagesc(imagenISC2);
axis image;
colormap('gray');
imagenISC4=conv2(sobremuesCon2,ISC)
subplot(1, 3, 3);
imagesc(imagenISC4);
axis image;
colormap('gray');%% interpolacion de orden lineal 
%% parte b 
pentagono = imread("pentagon256x256.tif");

% Sobremuestreo de la imagen
sobremuesCon2 = imrotate(upsample(imrotate(upsample(pentagono, 2), 270), 2), -270);
sobremuesCon4 = imrotate(upsample(imrotate(upsample(pentagono, 4), 270), 4), -270); 

F = griddedInterpolant(double(sobremuesCon2));
[sx,sy] = size(sobremuesCon2);
xq = (0:5/6:sx)';
yq = (0:5/6:sy)';
vq = uint8(F({xq,yq}));
figure
imshow(vq)
title('Higher Resolution')
figure
imshow(sobremuesCon2,'InitialMagnification','fit')
zoom(10)
title('Original Image, 10x Zoom')

figure
F.Method = 'linear';
vq = uint8(F({xq,yq}));
imshow(vq,'InitialMagnification','fit')
zoom(10)
title('Metodo Lineal ')

figure
F.Method = 'cubic';
vq = uint8(F({xq,yq}));
imshow(vq,'InitialMagnification','fit')
zoom(10)
title('Metodo Cubico')



%% Sección del tercer ejercicio de la práctica 5

% Despliegue del DFT de la imagen original
figure(3);
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
figure(4);
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
figure(5);
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
