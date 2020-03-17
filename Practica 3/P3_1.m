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
title('Ecualización de la Imagen');
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