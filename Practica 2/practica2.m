clear variables; close all; clc;

ds=imread("cameraman.tif");
figure(1); imshow(ds); title('Imagen Original');
filtro1=ones(7,7)*(1/49);
I2=conv2(ds,filtro1,'same');
figure(2);imagesc(I2),axis image,colormap('gray');
title('Imagen desenfocada 7x7','FontSize',14);

filtro2=ones(11,11)*(1/121);
I3=conv2(ds,filtro2,'valid');
figure(3);imagesc(I3),axis image,colormap('gray');
title('Imagen desenfocada 11x11','FontSize',14)

filtro3=ones(9,9)*(1/81);
I4=conv2(ds,filtro3,'full');
figure(4);imagesc(I4),axis image,colormap('gray');
title('Imagen desenfocada 9x9','FontSize',14)


%ejercicio2 
C = fft2(ds);
figure(5),imagesc(log(1+abs(C))),truesize;
colormap(gray(255));


D = fftshift(fft2(ds));
figure(6),imagesc(log(1+abs(D))),truesize;
colormap(gray(255));

%ejercicio3
ceros1 = zeros(7, 249);
ceros2 = zeros(249, 256);
filtroZ = [filtro1 ceros1; ceros2];
ccirc = ifft2(fft2(ds).*fft2(filtroZ));
figure(7);imagesc(ccirc),axis image,colormap('gray');
figure(9);
subplot(2,2,3);
imagesc(ccirc),axis image,colormap('gray');
title('Filtro circular 7x7');

%ejercicio4
ceros1 = zeros(7, 255);
ceros2 = zeros(255, 262);
ceros3 = zeros(256, 6);
ceros4 = zeros(6, 262);
filtroZ = [filtro1 ceros1; ceros2];
dsZ = [ds ceros3; ceros4];
ccirc = ifft2(fft2(dsZ).*fft2(filtroZ));
figure(8);imagesc(ccirc),axis image,colormap('gray');

%ejercicio5
figure(9);
subplot(2,2,1);
imshow(ds);
title('Imagen Original');
subplot(2,2,2);
imagesc(I2),axis image,colormap('gray');
title('Filtro lineal 7x7');
subplot(2,2,4);
imagesc(ccirc),axis image,colormap('gray');
title('Filtro circular con ceros en filtro e imagen 7x7');
