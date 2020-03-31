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
% C = ifft2(ds);
% figure(5),imagesc(abs(C)),truesize;
% 
% 
% D = fftshift(fft2(ds));
% figure(6),imagesc(abs(D)),truesize;

%ejercicio2 
C = fft2(ds);
figure(5),imagesc(log(1+abs(C))),truesize;
%colormap(gray(255));


D = fftshift(fft2(ds));
figure(6),imagesc(log(1+abs(D))),truesize;
%colormap(gray(255));

%ejercicio3
ccirc = ifft2(fft2(ds).*fft2(filtro1));
figure(7);imagesc(ccirc),axis image,colormap('gray');