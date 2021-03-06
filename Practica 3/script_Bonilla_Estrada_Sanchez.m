%{
PRACTICA 3: ECUALIZACION Y ESPECIFICACION DEL HISTOGRAMA
Nombres:
-Bonilla Galicia Yardiel
correo: yardielbonilla@gmail.com

-Estrada Soubran Uriel Alejandro
correo: uriel.503p6@gmail.com

-Sanchez Diaz Omar Diego
correo: diego_omar5@hotmail.com

Materia: Procesamiento de Imagenes Digitales

Profesor: Dr. Boris Escalante Ramirez
Profesor: Dra. Jimena Olveres Montiel

Modo de uso:
1. En el ejercicio 1, se abre una ventana del explorador de windows para abrir
la imagen tipo tif o tiff.

2. Para pasar de inciso en inciso, presione cualquier tecla.

3. En el inciso C del ejercicio 1, la visualizaci�n de los niveles est� en un
bucle finito. Cada nivel aparece cada 2 segundos, hasta llegar al nivel 2.
Ah� se quedar� esperando una tecla para pasar al segundo ejercicio.

4. En el inciso F del ejercicio 2, la visualizacion de la imagen y el
histograma est� en un bucle infinito, para pasar de niveles de cuantizaci�n
se presiona cualquier tecla. En cuanto llega a 2, el siguiente nivel es de
nuevo 128, por lo que el bucle se repite.

5. Para salir de este bucle, basta con presionar ctrl + c dentro del Command
Window
%}

%% EJERCICIO 1 %%
clear variables; close all; clc;

% Seleccionar una imagen tipo tif o tiff utilizando el explorador de
% archivos.
[filename, filepath] = uigetfile('*.tif*', 'Select a tif file');
fullname = fullfile(filepath, filename);
TheImage = imread(fullname);

% Histograma, ecualizacion e histograma de la ecualizacion.
imageHist = imhist(TheImage);
imageEqu = histeq(TheImage);
histEqu = imhist(imageEqu);

% Incisos A y B
figure(1);
subplot(2,2,1);
imshow(TheImage);
title('Imagen Original');
subplot(2,2,2);
plot(imageHist);
title('Histograma Original');
subplot(2,2,3);
imshow(imageEqu);
title('Ecualizaci�n de la Imagen');
subplot(2,2,4);
plot(histEqu);
title('Histograma de la imagen ecualizada');
pause;

% Inciso C
niveles = 128;
%while(1);
for i=1:7
    histo = imhist(TheImage,niveles);
    ecual = histeq(TheImage,histo);
    histEcual = imhist(ecual);
    figure(2);
    subplot(1,2,1);
    imshow(ecual);
    title(strcat('Ecualizacion a',' ',int2str(niveles),' niveles'));
    subplot(1,2,2);
    plot(histEcual);
    title('Histograma');
    pause(2);
    if(niveles ~= 2)
        niveles = niveles/2;
    else
        niveles = 128;
    end
end

pause;

%% EJERCICIO 2 %%
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

pause;

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