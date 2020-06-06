%% Proyecto segmentacion
clear variables; close all; clc;

% Lectura de las imagenes
imagen = mat2gray(niftiread('val_im.nii.gz'));

% Despliegue de las imagenes
for i = (1:10)
    figure(i);
    subplot(1, 2, 1);
    imagesc(imagen(:, :, i));
    axis image;
    colormap('gray');
end

% Primera segmentacion, los pulmones
for j = (1:10)
    
    % Se filtra la imagen
    filtroBloque = ones(11, 11)*(1/121);
    imagenFiltrada = conv2(imagen(:, :, j), filtroBloque, 'same');

%     % Histograma de la imagen
%     figure;
%     imhist(imagenFiltrada);
    [counts, x] = imhist(imagenFiltrada);

    % Obtencion de una máscara con otsuthresh
    T = otsuthresh(counts);
    BW = imbinarize(imagenFiltrada, T);
%     figure;
%     imshow(BW);

    % Inversion de los valores de la mascara
    masca = BW + 1;
    masca(masca==2)=0;

    % Segmentacion por multiplicacion con la mascara
    segmento1 = masca .* imagen(:, :, j);

    % Despliegue de los pulmones segmentados
    figure(j);
    subplot(1, 2, 2);
    imagesc(segmento1);
    axis image;
    colormap('gray');
end
