%% Secci贸n del primer ejercicio de la pr谩ctica 5
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

%% Secci贸n del segundo ejercicio de la pr谩ctica 5
[m, n]= size(pentagono);
[x, y] = meshgrid(1:n, 1:m);

% Factor de escala T = 2
T2 = 0.5;
[p, q] = meshgrid(1:T2:n, 1:T2:m);

% Orden 0
interpolOrd0T2 = interp2(x, y, pentagono, p, q, 'nearest');
% Orden 1
interpolOrd1T2 = interp2(x, y, pentagono, p, q, 'linear');
% Orden 3
interpolOrd3T2 = interp2(x, y, pentagono, p, q, 'cubic');

% Filtros para T = 2
filtro0T2 = ones(2, 2);
interpolOrd0T2 = conv2(sobremuesCon2, filtro0T2);
filtro1T2 = ([0.5, 1, 0.5].*[0.5; 1; 0.5]);
interpolOrd1T2 = conv2(sobremuesCon2, filtro1T2);
filtro3T2 = [];
for factor = abs(-2:0.5:2)
    if (factor >= 0) && (factor < 1)
        filtro3T2 = [filtro3T2 (((3/2) * power(factor, 3))-((5/2) * power(factor, 2))+1)];
    else
        if (factor >= 1) && (factor < 2)
            filtro3T2 = [filtro3T2 (((-1/2) * power(factor, 3))+((5/2) * power(factor, 2))-(4 * factor)+2)];
        end
    end
end
filtro3T2 = filtro3T2'.*filtro3T2;
interpolOrd3T2 = conv2(sobremuesCon2, filtro3T2);

figure(3);
subplot(1, 3, 1);
imagesc(interpolOrd0T2);
axis image;
colormap('gray');
zoom(3);
title('Interpolaci髇 orden 0 con T = 2');
figure(3);
subplot(1, 3, 2);
imagesc(interpolOrd1T2);
axis image;
colormap('gray');
zoom(3);
title('Interpolaci髇 orden 1 con T = 2');
figure(3);
subplot(1, 3, 3);
imagesc(interpolOrd3T2);
axis image;
colormap('gray');
zoom(3);
title('Interpolaci髇 orden 3 con T = 2');

% Factor de escala T = 4
T4 = 0.25;
[p, q] = meshgrid(1:T4:n, 1:T4:m);

% Orden 0
interpolOrd0T4 = interp2(x, y, pentagono, p, q, 'nearest');
% Orden 1
interpolOrd1T4 = interp2(x, y, pentagono, p, q, 'linear');
% Orden 3
interpolOrd3T4 = interp2(x, y, pentagono, p, q, 'cubic');

% Filtros para T = 4
filtro0T4 = ones(4, 4);
interpolOrd0T4 = conv2(sobremuesCon4, filtro0T4);
filtro1T4 = ([0.25, 0.5, 0.75, 1, 0.75, 0.5, 0.25].*[0.25; 0.5; 0.75; 1; 0.75; 0.5; 0.25]);
interpolOrd1T4 = conv2(sobremuesCon4, filtro1T4);
filtro3T4 = [];
for factor = abs(-2:0.25:2)
    if (factor >= 0) && (factor < 1)
        filtro3T4 = [filtro3T4 (((3/2) * power(factor, 3))-((5/2) * power(factor, 2))+1)];
    else
        if (factor >= 1) && (factor < 2)
            filtro3T4 = [filtro3T4 (((-1/2) * power(factor, 3))+((5/2) * power(factor, 2))-(4 * factor)+2)];
        end
    end
end
filtro3T4 = filtro3T4'.*filtro3T4;
interpolOrd3T4 = conv2(sobremuesCon4, filtro3T4);

figure(4);
subplot(1, 3, 1);
imagesc(interpolOrd0T4);
axis image;
colormap('gray');
zoom(3);
title('Interpolaci髇 orden 0 con T = 4');
figure(4);
subplot(1, 3, 2);
imagesc(interpolOrd1T4);
axis image;
colormap('gray');
zoom(3);
title('Interpolaci髇 orden 1 con T = 4');
figure(4);
subplot(1, 3, 3);
imagesc(interpolOrd3T4);
axis image;
colormap('gray');
zoom(3);
title('Interpolaci髇 orden 3 con T = 4');

% Mostrando las DFT de T = 2
% Orden 0
figure(5);
subplot(2, 3, 1);
imagesc(log(1+abs(fftshift(fft2(interpolOrd0T2)))));
axis image;
colormap('gray');
title('DFT de la interpolaci髇 orden 0 con T = 2');
% Orden 1
figure(5);
subplot(2, 3, 2);
imagesc(log(1+abs(fftshift(fft2(interpolOrd1T2)))));
axis image;
colormap('gray');
title('DFT de la interpolaci髇 orden 1 con T = 2');
% Orden 3
figure(5);
subplot(2, 3, 3);
imagesc(log(1+abs(fftshift(fft2(interpolOrd3T2)))));
axis image;
colormap('gray');
title('DFT de la interpolaci髇 orden 3 con T = 2');

% Mostrando las DFT de T = 4
% Orden 0
figure(5);
subplot(2, 3, 4);
imagesc(log(1+abs(fftshift(fft2(interpolOrd0T4)))));
axis image;
colormap('gray');
title('DFT de la interpolaci髇 orden 0 con T = 4');
% Orden 1
figure(5);
subplot(2, 3, 5);
imagesc(log(1+abs(fftshift(fft2(interpolOrd1T4)))));
axis image;
colormap('gray');
title('DFT de la interpolaci髇 orden 1 con T = 4');
% Orden 3
figure(5);
subplot(2, 3, 6);
imagesc(log(1+abs(fftshift(fft2(interpolOrd3T4)))));
axis image;
colormap('gray');
title('DFT de la interpolaci髇 orden 3 con T = 4');

%% Secci贸n del tercer ejercicio de la pr谩ctica 5
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

%% Secci贸n del cuarto ejercicio de la pr谩ctica 5
figure(9);
subplot(2, 2, 1);
imagesc(interpolOrd0T2);
axis image;
colormap('gray');
title('Interpolaci髇 orden 0 con T = 2');
subplot(2, 2, 2);
imagesc(interpolOrd1T2);
axis image;
colormap('gray');
title('Interpolaci髇 orden 1 con T = 2');
subplot(2, 2, 3);
imagesc(interpolOrd3T2);
axis image;
colormap('gray');
title('Interpolaci髇 orden 3 con T = 2');
subplot(2, 2, 4);
imagesc(originaldftInv512);
axis image;
colormap('gray');
title('Inv del DFT con ceros a 512');

figure(10);
subplot(2, 2, 1);
imagesc(interpolOrd0T4);
axis image;
colormap('gray');
title('Interpolaci髇 orden 0 con T = 4');
subplot(2, 2, 2);
imagesc(interpolOrd1T4);
axis image;
colormap('gray');
title('Interpolaci髇 orden 1 con T = 4');
subplot(2, 2, 3);
imagesc(interpolOrd3T4);
axis image;
colormap('gray');
title('Interpolaci髇 orden 3 con T = 4');
subplot(2, 2, 4);
imagesc(originaldftInv1024);
axis image;
colormap('gray');
title('Inv del DFT con ceros a 1024');
