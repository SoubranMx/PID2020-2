%% Proyecto segmentacion
clear variables; close all; clc;

% Lectura de las imagenes
%imagen = mat2gray(niftiread('tr_im.nii.gz'));
imagen = mat2gray(niftiread('val_im.nii.gz'));

% Despliegue de las imagenes completas
for i = (1:10)
    figure(i);
    subplot(2, 2, 1);
    imagesc(imagen(:, :, i));
    axis image;
    colormap('gray');
end

%% Primera segmentacion
for j = (1:10)
    
    % Se filtra la imagen
    filtroBloque = ones(11, 11)*(2/120);
    imagenFiltrada = conv2(imagen(:, :, j), filtroBloque, 'same');

    % Histograma de la imagen
%     figure;
%     imhist(imagenFiltrada);
    [counts, x] = imhist(imagenFiltrada);

    % Obtencion de una mascara con otsuthresh
    T = otsuthresh(counts);
    BW = imbinarize(imagenFiltrada, T);

    % Asignar la máscara a una variable
    masca = BW ;
%     figure;
%     imshow(masca);

    % Segmentacion por multiplicacion con la mascara
    segmento1 = masca .* imagen(:, :, j);

    % Despliegue de la primera segmentacion
    figure(j);
    subplot(2, 2, 2);
    imagesc(segmento1);
    axis image;
    colormap('gray');
    
%% Segunda segmentacion
    
    % Se filtra la imagen
    filtroBloque2 = ones(11, 11)*(1/60);
    imagenFiltrada2 = conv2(imagen(:, :, j), filtroBloque2, 'same');

    % Histograma de la imagen
%     figure;
%     imhist(imagenFiltrada);
    [counts2, x2] = imhist(imagenFiltrada2);

    % Obtencion de una mascara con otsuthresh
    T2 = 1;
    BW2 = imbinarize(imagenFiltrada2, T2);

    % Inversion de los valores de la mascara
    masca2 = BW2 +1 ;
    masca2(masca2==2)=0;
%     figure;
%     imshow(masca2);

    % Segmentacion por multiplicacion con la mascara
    segmento12 = masca2 .* imagen(:, :, j);

    % Despliegue de los pulmones segmentados
    figure(j);
    subplot(2, 2, 3);
    imagesc(segmento12);
    axis image;
    colormap('gray');
    
    % Se obtiene la máscara para el vidrio despulido y se segmenta
    mascaFinal = masca .* masca2;
    segmento123 = mascaFinal .* imagen(:, :, j);
    
    % Despliegue del resultado final
    figure(j);
    subplot(2, 2, 4);
    imagesc(segmento123);
    axis image;
    colormap('gray');
    
end
