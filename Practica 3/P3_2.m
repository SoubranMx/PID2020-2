clear variables; close all; clc;

% Seleccionar una imagen tipo tif o tiff utilizando el explorador de
% archivos.
Satelite1 = imread('Imagenes/zonaA_b5.tif');
Satelite2 = imread('Imagenes/zonaB_b5.tif');

%figure(1); imshow(Satelite1); title('Imagen Satelital 1 Original');
%figure(2); imshow(Satelite2); title('Imagen Satelital 2 Original');

% Inciso A. Desplegar las imagenes satelitales cortando o eliminando las
% zonas donde la informacion es nula. Desplegar ademas el histograma
% correspondiente a cada una de ellas.

% A[0 0 infA 1500] y B[infA? 0 2500 1500]
recorteA = imcrop(Satelite1,[0 0 1761 1500]);
recorteB = imcrop(Satelite2,[1761 0 1229 1500]);
histA = imhist(recorteA);
histB = imhist(recorteB);

figure();
subplot(1,2,1); imshow(recorteA); title('Imagen Satelital 1 Recortada');
subplot(1,2,2); plot(histA); title('Histograma 1');
figure();
subplot(1,2,1); imshow(recorteB); title('Imagen Satelital 2 Recortada');
subplot(1,2,2); plot(histB); title('Histograma 2');
pause;

% Inciso B. Desplegar el mosaico que resulta de unir las dos imagenes
% satelitales sin el uso de la tecnica de especifacion del histograma.

unionB = imfuse(recorteA,recorteB,'montage');
unionB = imcrop(unionB,[0 0 2500 1500]);
figure();
imshow(unionB);
title('Imagenes unidas sin especificacion de histograma');
pause;

% Inciso C. Desplegar la zona de traslape y su histograma.
%traslapeC = imcrop(unionB,[1548 0 400 1500]);
traslapeC = imcrop(unionB,[1661 0 200 1500]);
histoTras = imhist(traslapeC);
figure();
subplot(1,2,1);
imshow(traslapeC);
title('Zona de traslape');
subplot(1,2,2);
plot(histoTras);
title('Histograma del traslape');
pause;

% Inciso D. Desplegar las imagenes satelitales recortadas, cuyos
% histogramas han sido especificados con el histograma del inciso anterior.
% Desplegar ademas el histograma correspondiente a cada una de ellas.
recorteAD = histeq(recorteA,histoTras);
recorteBD = histeq(recorteB,histoTras);
histoAD = imhist(recorteAD);
histoBD = imhist(recorteBD);

% Mosaico para mostrar la diferencia entre sin especificar y especificada
figure();
subplot(2,2,1);
imshow(recorteA);
title('Imagen 1 Recortada sin especificacion');
subplot(2,2,2);
plot(histA);
subplot(2,2,3);
imshow(recorteAD);
title('Imagen 1 Recortada con especificacion');
subplot(2,2,4);
plot(histoAD);

figure();
subplot(2,2,1);
imshow(recorteB);
title('Imagen 2 Recortada sin especificacion');
subplot(2,2,2);
plot(histB);
subplot(2,2,3);
imshow(recorteBD);
title('Imagen 2 Recortada con especificacion');
subplot(2,2,4);
plot(histoBD);


% Inciso E. Desplegar el mosaico que resulta de unir las dos imagenes
% satelitales despues de la especificacion del histograma. Desplegar
% tambien el histograma del mosaico.
unionE = imfuse(recorteAD,recorteBD,'montage');
unionE = imcrop(unionE,[0 0 2500 1500]);
histoE = imhist(unionE);
figure();
imshow(unionE);
title('Despliegue con especificacion');
figure();
plot(histoE);
title('Histograma con especificacion');

pause;

% Inciso F. Especificar el histograma del mosaico usando 128,64,32,16,8 y 2
% niveles de cuantizacion.

niveles = 128;
while(1)
    histoF = imhist(unionE,niveles);
    unionF = histeq(unionE,histoF);

    figure(9);
    subplot(1,2,1);
    imshow(unionF);
    title(strcat('Especificacion a ',' ',int2str(niveles),' niveles'));
    subplot(1,2,2);
    plot(histoF);
    title('Histograma');
    if(niveles ~= 2)
        niveles = niveles/2;
    else
        niveles = 128;
    end
    pause;
end
