close all
clear all

path ='C:\Users\vero\Desktop\WT\';
threshold=0; %Es un threshold por si se quiere filtrar por amplitud

% [cepadata, cepafrec] = analisisDeDataCEPA_NAME(path,threshold);
% cepadata contiene las variables [roi t_inicial t_final t_max f_max area
% ...] correspondientes a cada ráfaga de todos los experimentos de la cepa
% cepafrec contiene el número de rágagas de cada roi analizado


% Cepa WT (Wild Type)
[WTdata, WTfrec] = analisisDeDataWT(path,threshold);
% Cepa WT AF
[WTAFdata, WTAFfrec] = analisisDeDataWTAF(path,threshold);
% WT SF con BAPTA
[WTSFbaptaData, WTSFbaptaFrec] = analisisDeDataWTSFbapta(path,threshold);
% WT AF con BAPTA
[WTAFbaptaData, WTAFbaptaFrec] = analisisDeDataWTAFbapta(path,threshold);

% Cepa ?FIG1
[FIG1data, FIG1frec] = analisisDeDataFIG1(path,threshold);
% ?FIG1 AF
[FIG1AFdata, FIG1AFfrec] = analisisDeDataFIG1AF(path,threshold);
% ?FIG1 con BAPTA SF
[FIG1baptaSFData, FIG1baptaSFFrec] = analisisDeDataFIG1baptaSF(path,threshold);
% ?FIG1 con BAPTA AF
[FIG1baptaAFData, FIG1baptaAFFrec] = analisisDeDataFIG1baptaAF(path,threshold);
% Cepa ?MID1
[MID1data, MID1frec] = analisisDeDataMID1(path,threshold);
% ?MID1 AF
[MID1AFdata, MID1AFfrec] = analisisDeDataMID1AF(path,threshold);
% Cepa ?PMC1
[PMC1data, PMC1frec] = analisisDeDataPMC1(path,threshold);
% ?PMC1 AF
[PMC1AFdata, PMC1AFFrec] = analisisDeDataPMC1AF(path,threshold);
% Cepa ?PMR1
[PMR1data, PMR1frec] = analisisDeDataPMR1(path,threshold);
% ?PMR1 AF
[PMR1AFdata, PMR1AFFrec] = analisisDeDataPMR1AF(path,threshold);
% Cepa ?VCX1
[VCX1data, VCX1frec] = analisisDeDataVCX1(path,threshold);
% ?VCX1 AF
[VCX1AFdata, VCX1AFFrec] = analisisDeDataVCX1AF(path,threshold);
% Cepa ?YVC1
[YVC1data, YVC1frec] = analisisDeDataYVC1(path,threshold);
% ?YVC1 AF
[YVC1AFdata, YVC1AFFrec] = analisisDeDataYVC1AF(path,threshold);

% Dobles mutantes
% ?FIG1?MID1
[FIG1MID1data, FIG1MID1frec] = analisisDeDataFIG1MID1(path,threshold);
% ?FIG1?MID1 AF
[FIG1MID1AFdata, FIG1MID1AFfrec] = analisisDeDataFIG1MID1AF(path,threshold);
% ?FIG1?YVC1
[FIG1YVC1data, FIG1YVC1frec] = analisisDeDataFIG1YVC1(path,threshold);
% ?FIG1?YVC1 AF
[FIG1YVC1AFdata, FIG1YVC1AFFrec] = analisisDeDataFIG1YVC1AF(path,threshold);
% ?MID1?YVC1
[MID1YVC1data, MID1YVC1frec] = analisisDeDataMID1YVC1(path,threshold);
% ?MID1?YVC1 AF
[MID1YVC1AFdata, MID1YVC1AFFrec] = analisisDeDataMID1YVC1AF(path,threshold);
% ?PMC1?YVC1
[PMC1YVC1data, PMC1YVC1frec] = analisisDeDataPMC1YVC1(path,threshold);
% ?PMC1?YVC1 AF
[PMC1YVC1AFdata, PMC1YVC1AFFrec] = analisisDeDataPMC1YVC1AF(path,threshold);
% ?VCX1?YVC1
[VCX1YVC1data, VCX1YVC1frec] = analisisDeDataVCX1YVC1(path,threshold);
% ?VCX1?YVC1 AF
[VCX1YVC1AFdata, VCX1YVC1AFFrec] = analisisDeDataVCX1YVC1AF(path,threshold);

% Triples mutantes
% ?FIG1?MID1?YVC1
[FIG1MID1YVC1data, FIG1MID1YVC1frec] = analisisDeDataFIG1MID1YVC1(path,threshold);
% ?FIG1?MID1?YVC1 AF
[FIG1MID1YVC1AFdata, FIG1MID1YVC1AFFrec] = analisisDeDataFIG1MID1YVC1AF(path,threshold);
% ?FIG1?MID1?YVC1 bapta AF
[FIG1MID1YVC1baptaAFdata, FIG1MID1YVC1baptaAFFrec] = analisisDeDataFIG1MID1YVC1baptaAF(path,threshold);

%% Analisis de las variables en el tiempo
% [roi t_inicial t_final t_max f_max area ...]
datos = YVC1AFdata;
num_bins = 5; % Número de rangos
edges = linspace(0, 6000, num_bins + 1); % Límites de los rangos en seg.

% edges = [0,2400, 3600, 6000]
num_bins = length(edges) - 1;

ID = cell(1, num_bins); % Crear una celda para almacenar los índices

for i = 1:num_bins
    % Encuentra los índices de los valores en el rango [edges(i), edges(i+1)]
    ID{i} = find(datos(:,2) >= edges(i) & datos(:,2) < edges(i+1));
end

amplitud = cell(1, num_bins); % Crear una celda para almacenar los índices 
duracion = cell(1, num_bins); % Crear una celda para almacenar los índices
for i = 1:num_bins
    amplitud{i} = datos(ID{i},5);
    duracion{i} = datos(ID{i},3)- datos(ID{i},2);
end


bins_histo = 20;


figure('Position', [100, 100, 1400, 300]); % [x, y, width, height]
colors = lines(num_bins); % Colores distintos para cada curva
% Subplot para amplitud (CDF)
subplot(1,3,1); % 1 fila, 3 columnas, primer gráfico
hold on;
for i = 1:num_bins
    if ~isempty(amplitud{i})
        [f, x] = ecdf(amplitud{i}); % Obtiene la función CDF
        plot(x, f, 'Color', colors(i, :), 'LineWidth', 1.5); % Graficar con color único
    end
end
hold off;
legend(arrayfun(@(x) sprintf('Rango %d', x), 1:num_bins, 'UniformOutput', false));
xlabel('Amplitud');
ylabel('CDF');
title('CDF de Amplitud');
xlim([0 5]);
grid on;


hold off;
legend(arrayfun(@(x) sprintf('Rango %d', x), 1:num_bins, 'UniformOutput', false));
xlabel('Amplitud');
ylabel('CDF');
title('CDF de Amplitud');
xlim([0 5]);
grid on;

% Subplot para duración (CDF)
subplot(1,3,2); % 2 filas, 3 columnas, segundo gráfico
hold on;
for i = 1:num_bins
    if ~isempty(duracion{i})
        [f, x] = ecdf(duracion{i});
        plot(x, f, 'Color', colors(i, :), 'LineWidth', 1.5);
    end
end
hold off;
legend(arrayfun(@(x) sprintf('Rango %d', x), 1:num_bins, 'UniformOutput', false));
xlabel('Duración [s]');
ylabel('CDF');
title('CDF de Duración');
xlim([0 300]);
grid on;

% Subplot para la cantidad de datos en cada amplitud (Barras)
subplot(1,3,3); % 2 filas, 3 columnas, tercer gráfico
amplitud_counts = cellfun(@numel, amplitud); % Contar los datos en cada amplitud{i}
bar(1:num_bins, amplitud_counts, 'FaceColor', [0.2, 0.6, 0.8]);
xlabel('Rango');
ylabel('Cantidad de Ráfagas');
title('Cantidad de Ráfagas en cada Rango');
xlim([0 num_bins+1]);
grid on;

% % Subplot para histograma normalizado de amplitud (usando 'hist')
% subplot(2,3,4); % 2 filas, 3 columnas, cuarto gráfico
% hold on;
% for i = 1:num_bins
%     if ~isempty(amplitud{i})
%         [n, binCenters] = hist(amplitud{i}, bins_histo); % 10 bins
%         bar(binCenters, n / sum(n), 'EdgeColor', colors(i, :));
%     end
% end
% hold off;
% xlabel('Amplitud');
% ylabel('Frecuencia Relativa');
% title('Histograma Normalizado de Amplitud');
% xlim([0 5]);
% grid on;

% % Subplot para histograma normalizado de duración (usando 'hist')
% subplot(2,3,5); % 2 filas, 3 columnas, quinto gráfico
% hold on;
% for i = 1:num_bins
%     if ~isempty(duracion{i})
%         [n, binCenters] = hist(duracion{i}, bins_histo); % 10 bins
%         bar(binCenters, n / sum(n), 'EdgeColor', colors(i, :));
%     end
% end
% hold off;
% xlabel('Duración');
% ylabel('Frecuencia Relativa');
% title('Histograma Normalizado de Duración');
% xlim([0 300]);
% grid on;

disp('End');

%%
% Inicializamos matrices para almacenar los resultados de p-values
ks_amplitud = zeros(num_bins); % Matriz para amplitud
ks_duracion = zeros(num_bins); % Matriz para duración
alpha_value = 0.01;

% Test de Kolmogorov-Smirnov entre las distribuciones de amplitud
for i = 1:num_bins
    for j = i:num_bins % Solo comparamos pares únicos
        if ~isempty(amplitud{i}) && ~isempty(amplitud{j})
            [h, p] = kstest2(amplitud{i}, amplitud{j},'Alpha',alpha_value); % Test de KS para amplitud
            ks_amplitud(i, j) = p; % Guardamos el valor p en la matriz
            ks_amplitud(j, i) = p; % Es simétrico, por lo que lo colocamos en la otra mitad
        end
    end
end

% Test de Kolmogorov-Smirnov entre las distribuciones de duración
for i = 1:num_bins
    for j = i:num_bins % Solo comparamos pares únicos
        if ~isempty(duracion{i}) && ~isempty(duracion{j})
            [h, p] = kstest2(duracion{i}, duracion{j},'Alpha',alpha_value); % Test de KS para duración
            ks_duracion(i, j) = p; % Guardamos el valor p en la matriz
            ks_duracion(j, i) = p; % Es simétrico
        end
    end
end

% Mostrar resultados
disp('Resultados del test de Kolmogorov-Smirnov para Amplitud (valores p):');
disp(ks_amplitud);

disp('Resultados del test de Kolmogorov-Smirnov para Duración (valores p):');
disp(ks_duracion);


% Visualizar los resultados en un mapa de calor
figure('Position', [100, 100, 1200, 400]); % [x, y, width, height]

% Mapa de calor para Amplitud
subplot(1,2,1);
imagesc(ks_amplitud); % Mapa de calor de los p-values de amplitud
colorbar;
title('p-values del test de Kolmogorov-Smirnov para Amplitud');
xlabel('Rango');
ylabel('Rango');
caxis([0 5*alpha_value]);

% Ajustar ticks en el eje X e Y para que solo muestren enteros
set(gca, 'XTick', 1:num_bins, 'YTick', 1:num_bins);

% Mapa de calor para Duración
subplot(1,2,2);
imagesc(ks_duracion); % Mapa de calor de los p-values de duración
colorbar;
title('p-values del test de Kolmogorov-Smirnov para Duración');
xlabel('Rango');
ylabel('Rango');
caxis([0 5*alpha_value]);

% Ajustar ticks en el eje X e Y para que solo muestren enteros
set(gca, 'XTick', 1:num_bins, 'YTick', 1:num_bins);



disp('Deteniendo el código aquí...');
return; % Sale del script o función


%% Ejemplo de gráfico

% Definir los conjuntos de datos de forma global en celdas
% data = {YVC1AFdata, FIG1AFdata, MID1AFdata, FIG1MID1AFdata, FIG1YVC1AFdata, MID1YVC1AFdata, FIG1MID1YVC1AFdata};
% data = {WTAFbaptaData, FIG1baptaAFData, FIG1baptaAFData, FIG1MID1data, FIG1YVC1data, MID1YVC1data, FIG1MID1YVC1data};
% freq = {YVC1frec, FIG1AFfrec, MID1AFfrec, FIG1MID1AFfrec, FIG1YVC1AFFrec, MID1YVC1AFFrec, FIG1MID1YVC1AFFrec};
data = {WTAFdata, FIG1AFdata, MID1AFdata, FIG1MID1AFdata,FIG1MID1YVC1AFdata FIG1MID1YVC1baptaAFdata, WTAFbaptaData};
% data = {WTdata, FIG1data, YVC1data, FIG1MID1data,FIG1MID1YVC1AFdata FIG1MID1YVC1baptaAFdata, WTAFbaptaData};
freq = {WTAFfrec, FIG1AFfrec, MID1AFfrec, FIG1MID1AFfrec, FIG1MID1YVC1AFFrec, FIG1MID1YVC1baptaAFFrec, WTAFbaptaFrec};

% Definir nombres y colores
% names = {'dyvc1+\alphaf', 'dfig1+\alphaf', 'dmid1+\alphaf', 'dfig1dmid1+\alphaf', 'dfig1dyvc1+\alphaf','dmid1dyvc1+\alphaf', 'dfig1dmid1dyvc1+\alphaf'};
names = {'WT+\alphaf', 'dfig1+\alphaf', 'dmid1+\alphaf', 'dfig1dmid1+\alphaf','dfig1dmid1dyvc1 \alphaf', 'dfig1dmid1dyvc1 bapta+\alphaf', 'WT bapta+alpha'};
% colors = lines(4); % Colores distintos
colors = [0 0 0; 0 0 1; 1 0 0; 0 .7 0; 1 .8 0; .6 0 .8; 0 .6 .8]; % ? Definir colores manualmente (negro, azul, rojo, verde)

figure; % Crear nueva figura
% --- Subplot 1: Amplitud ---
subplot(2,2,1); hold on;
for i = 1:length(data)
    [f, x] = ecdf(data{i}(:,5));
    plot(x, f, 'Color', colors(i,:), 'LineWidth', 1.5);
end
legend(names, 'Location', 'southeast'); % ? Mueve la leyenda abajo a la derecha
xlim([0 5]); xlabel('Amplitud'); title('CDF de Amplitud');
grid on;
hold off;

% --- Subplot 2: Duración ---
subplot(2,2,2); hold on;
for i = 1:length(data)
    duracion = data{i}(:,3) - data{i}(:,2);
    [f, x] = ecdf(duracion);
    plot(x, f, 'Color', colors(i,:), 'LineWidth', 1.5);
end
legend(names, 'Location', 'southeast'); % ? Mueve la leyenda abajo a la derecha
xlim([0 160]); xlabel('Duración [seg]'); title('CDF de Duración');
grid on;
hold off;

% --- Subplot 3: Ocurrencia de las ráfagas ---
subplot(2,2,4); hold on;
for i = 1:length(data)
    ocurrencia = data{i}(:,2);
    [f, x] = ecdf(ocurrencia);
    plot(x, f, 'Color', colors(i,:), 'LineWidth', 1.5);
end
legend(names, 'Location', 'southeast'); % ? Mueve la leyenda abajo a la derecha
xlim([0 6000]); xlabel('Ocurrencia [seg]'); title('CDF de Ocurrencia');
grid on;
hold off;

% --- Subplot 4: Frecuencia (CDF) ---
subplot(2,2,3); hold on;
for i = 1:length(data)
    [f, x] = ecdf(freq{i});
    plot(x, f, 'Color', colors(i,:), 'LineWidth', 1.5);
end
legend(names, 'Location', 'southeast'); % ? Mueve la leyenda abajo a la derecha
xlim([0 20]); ylim([0 1]);
xlabel('Frecuencia'); title('CDF de Frecuencia');
grid on;
hold off;

%%
% Inicializamos matrices para almacenar los resultados de p-values
ks_amplitud = zeros(length(data)); % Matriz para amplitud
ks_duracion = zeros(length(data)); % Matriz para duración
ks_ocurrencia = zeros(length(data)); % Matriz para tiempo de ocurrencia
ks_ocurrencia_Uni = zeros(length(data),1);
ks_frecuencia = zeros(length(data)); % Matriz para tiempo de frecuencia
alpha_value = 0.01;

unif_cdf = makedist('Uniform', 'Lower', 0, 'Upper', 6000);

% Test de Kolmogorov-Smirnov entre las distribuciones de amplitud
for i = 1:length(data)
    for j = i:length(data) % Solo comparamos pares únicos
        if ~isempty(data{i}(:,5)) && ~isempty(data{j}(:,5))
            [h, p] = kstest2(data{i}(:,5), data{j}(:,5),'Alpha',alpha_value); % Test de KS para amplitud
            ks_amplitud(i, j) = p; % Guardamos el valor p en la matriz
            ks_amplitud(j, i) = p; % Es simétrico, por lo que lo colocamos en la otra mitad
        end
    end
end

% Test de Kolmogorov-Smirnov entre las distribuciones de duración
for i = 1:length(data)
    for j = i:length(data) % Solo comparamos pares únicos
        if ~isempty(data{i}(:,3) - data{i}(:,2)) && ~isempty(data{j}(:,3) - data{j}(:,2))
            [h, p] = kstest2(data{i}(:,3) - data{i}(:,2), data{j}(:,3) - data{j}(:,2),'Alpha',alpha_value); % Test de KS para duración
            ks_duracion(i, j) = p; % Guardamos el valor p en la matriz
            ks_duracion(j, i) = p; % Es simétrico
        end
    end
end

% Test de Kolmogorov-Smirnov entre las distribuciones de ocurrencia
for i = 1:length(data)
%     data_norm = data{i}(:,2)/6000;
%     [h, p] = kstest(data_norm,'Alpha',alpha_value); % Test de KS
    [h, p] = kstest(data{i}(:,2), 'CDF', unif_cdf,'Alpha',alpha_value); % Test de KS
    ks_ocurrencia_Uni(i) = p;
    for j = i:length(data) % Solo comparamos pares únicos
        if ~isempty(data{i}(:,2)) && ~isempty(data{j}(:,2))
            [h, p] = kstest2(data{i}(:,2),data{j}(:,2),'Alpha',alpha_value); % Test de KS para duración
            ks_ocurrencia(i, j) = p; % Guardamos el valor p en la matriz
            ks_ocurrencia(j, i) = p; % Es simétrico
        end
    end
end

for i = 1:length(data)
    for j = i:length(data) % Solo comparamos pares únicos
        if ~isempty(freq{i}) && ~isempty(freq{j})
            [h, p] = kstest2(freq{i}, freq{j},'Alpha',alpha_value); % Test de KS para duración
            ks_frecuencia(i, j) = p; % Guardamos el valor p en la matriz
            ks_frecuencia(j, i) = p; % Es simétrico
        end
    end
end

% Visualizar los resultados en un mapa de calor
figure('Position', [100, -100, 1000, 1000]); % [x, y, width, height]

% Mapa de calor para Amplitud
subplot(2,2,1);
imagesc(ks_amplitud); % Mapa de calor de los p-values de amplitud
colorbar;
title('p-values del test de Kolmogorov-Smirnov para Amplitud');
caxis([0 5*alpha_value]);

% Ajustar ticks en el eje X e Y para que solo muestren enteros
set(gca, 'XTick', 1:num_bins, 'YTick', 1:num_bins);

% Mapa de calor para Duración
subplot(2,2,2);
imagesc(ks_duracion); % Mapa de calor de los p-values de duración
colorbar;
title('p-values del test de Kolmogorov-Smirnov para Duración');
caxis([0 5*alpha_value]);

% Mapa de calor para Duración
subplot(2,2,3);
imagesc(ks_ocurrencia); % Mapa de calor de los p-values de duración
colorbar;
title('p-values del test de K-S para Tiempos de inicio ráfaga');
caxis([0 5*alpha_value]);

% Mapa de calor para Duración
subplot(2,2,4);
imagesc(ks_frecuencia); % Mapa de calor de los p-values de frecuencia
colorbar;
title('p-values del test de K-S para frecuencia');
caxis([0 5*alpha_value]);

% Ajustar ticks en el eje X e Y para que solo muestren enteros
set(gca, 'XTick', 1:num_bins, 'YTick', 1:num_bins);


disp('Deteniendo el código aquí...');
return; % Sale del script o función