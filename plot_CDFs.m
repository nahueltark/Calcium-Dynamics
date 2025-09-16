close all;
clear all;

cd('C:\Users\vero\Desktop\Codigos\Variante') % Cambia el directorio de trabajo

condiciones = {'WT', 'FIG1', 'MID1', 'YVC1'};
% metodos = {'metodo1', 'metodo2'};
colores = {'k', 'b', 'r', 'g'};  % WT=negro, fig1D=rojo, mid1D=azul, yvc1D=verde

figure;
m=1;
% for m = 1:2
%     metodo = metodos{m};
    
    % --- SUBPLOT: Número de ráfagas
    subplot(2,2,m); hold on;
    for c = 1:length(condiciones)
        nombre_archivo = sprintf('resultados_simulacion%s.mat', condiciones{c});
        load(nombre_archivo, 'num_rafagas_sorted');
        N = length(num_rafagas_sorted);
%         disp(N)
        stairs(num_rafagas_sorted, (1:N)/N, 'Color', colores{c}, 'LineWidth', 2);
    end
    title(['Método ', num2str(m), ' - Número de ráfagas']);
    xlabel('Número de ráfagas'); ylabel('CDF');
    legend(condiciones, 'Location', 'southeast');
    xlim([0 30]); grid on;

    % --- SUBPLOT: Amplitudes
    subplot(2,2,m+2); hold on;
    for c = 1:length(condiciones)
        nombre_archivo = sprintf('resultados_simulacion%s.mat', condiciones{c});
        load(nombre_archivo, 'amplitudes_sorted');
        N = length(amplitudes_sorted);
        stairs(amplitudes_sorted, (1:N)/N, 'Color', colores{c}, 'LineWidth', 2);
    end
    title(['Método ', num2str(m), ' - Amplitudes']);
    xlabel('Amplitud'); ylabel('CDF');
    legend(condiciones, 'Location', 'southeast');
    xlim([0 3]); grid on;
% end

%%
clear all;

% condiciones = {'WT', 'fig1D', 'mid1D', 'yvc1D'};
condiciones = {'WT', 'FIG1', 'MID1', 'YVC1'};
colores = {'k', 'b','r',  'g'};  % WT=negro, fig1D=rojo, mid1D=azul, yvc1D=verde

figure;

% --- SUBPLOT: Número de ráfagas
subplot(2,2,1); hold on;
for c = 1:length(condiciones)
    nombre_archivo = sprintf('resultados_simulacion%s.mat', condiciones{c});
    load(nombre_archivo, 'num_rafagas_sorted');
    N = length(num_rafagas_sorted);
    stairs(num_rafagas_sorted, (1:N)/N, 'Color', colores{c}, 'LineWidth', 2);
end
xlabel('Número de ráfagas'); ylabel('CDF');
legend(cellfun(@(x) [x, '\Delta'], condiciones, 'UniformOutput', false), 'Location', 'southeast');
xlim([0 30]); grid on;

% --- SUBPLOT: Amplitudes
subplot(2,2,2); hold on;
for c = 1:length(condiciones)
    nombre_archivo = sprintf('resultados_simulacion%s.mat', condiciones{c});
    load(nombre_archivo, 'amplitudes_sorted');
    N = length(amplitudes_sorted);
%     disp(N)
    if c == 4
        stairs(amplitudes_sorted, (1:N)/N, 'Color', colores{c}, 'LineWidth', 2);
    else
        stairs(amplitudes_sorted-0.3, (1:N)/N, 'Color', colores{c}, 'LineWidth', 2);
    end
end
xlabel('Amplitud'); ylabel('CDF');
legend(cellfun(@(x) [x, '\Delta'], condiciones, 'UniformOutput', false), 'Location', 'southeast');
xlim([0 3]); grid on;

% --- SUBPLOT: Tiempos
subplot(2,2,3); hold on;
for c = 1:length(condiciones)
    nombre_archivo = sprintf('resultados_simulacion%s.mat', condiciones{c});
    load(nombre_archivo, 'tiempos_sorted');
    N = length(tiempos_sorted);
    stairs(tiempos_sorted, (1:N)/N, 'Color', colores{c}, 'LineWidth', 2);
end
T_max=6000;
% Graficar la línea de la distribución uniforme
t_uniforme = linspace(0, T_max, 100);  % Crear puntos en el intervalo [0, T_max]
cdf_uniforme = t_uniforme / T_max;  % CDF de la distribución uniforme
plot(t_uniforme, cdf_uniforme, 'k--', 'LineWidth', 1.2);  % Línea de la distribución uniforme (línea punteada)

xlabel('Tiempos [seg.]'); ylabel('CDF');
legend(cellfun(@(x) [x, '\Delta'], condiciones, 'UniformOutput', false), 'Location', 'southeast');
xlim([0 6000]); grid on;

