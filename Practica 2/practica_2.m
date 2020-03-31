 clear variables; close all; clc;

filtro7 = ones(7,7)*(1/49);
filtro9 = ones(9,9)*(1/81);
filtro11 = ones(11,11)*(1/121);

ds=imread("cameraman.tif");
figure(1); imshow(ds); title('Imagen Original');
I2=conv2(ds,filtro7,'same');
figure(2);imagesc(I2),axis image,colormap('gray');
title('Imagen desenfocada 7x7 -Same','FontSize',14);

I3=conv2(ds,filtro11,'valid');
figure(3);imagesc(I3),axis image,colormap('gray');
title('Imagen desenfocada 11x11 -Valid','FontSize',14)

I4=conv2(ds,filtro9,'full');
figure(4);imagesc(I4),axis image,colormap('gray');
title('Imagen desenfocada 9x9 -Full','FontSize',14)

pause;
close all;
%ejercicio2 
C = fft2(ds);
figure(5),imagesc(log(1+abs(C))),truesize;
title('FFT de la Imagen','FontSize',14)
%colormap(gray(255));


%D = fftshift(fft2(ds));
D = fftshift(C);
figure(6),imagesc(log(1+abs(D))),truesize;
title('FFT cambiada de ejes','FontSize',14)
%colormap(gray(255));
pause;
close all;

%ejercicio 3
ceros7x = zeros(7,505);
ceros7y = zeros(505,512);
ceros9x = zeros(9,503);
ceros9y = zeros(503,512);
ceros11x = zeros(11,501);
ceros11y = zeros(501,512);

filtroZ7 = [filtro7 ceros7x; ceros7y];
filtroZ9 = [filtro9 ceros9x; ceros9y];
filtroZ11 = [filtro11 ceros11x; ceros11y];

ds1=reshape(ds,[],1);

filtroc=reshape(filtroZ7,1,[]);
imgcon=cconv(ds1,filtroc,262144)
imgcon1=reshape(imgcon,512,512);
figure(7);imagesc(imgcon1),axis image,colormap('gray'); title('F.cicular 7','FontSize',14);

filtroc=reshape(filtroZ9,1,[]);
imgcon2=cconv(ds1,filtroc,262144)
imgcon3=reshape(imgcon2,512,512);
figure(8);imagesc(imgcon3),axis image,colormap('gray'); title(' F.circular 9','FontSize',14);

filtroc=reshape(filtroZ11,1,[]);
imgcon4=cconv(ds1,filtroc,262144)
imgcon5=reshape(imgcon4,512,512);
figure(9);imagesc(imgcon5),axis image,colormap('gray'); title(' F.circular 11','FontSize',14);
