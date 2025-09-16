clear all
close all
rng(1); % Establece la semilla para la generación de números aleatorios, garantizando reproducibilidad

cd('C:\Users\vero\Desktop\Codigos') % Cambia el directorio de trabajo

% Definición de parámetros del modelo

% Dimensiones celulares y vacuola
diametro_cell = 4; %[um]
diametro_vac = 3; %[um]

% Velocidades de transporte de calcio por diferentes proteínas
% Valores extraídos de literatura
alpha_vcx1 = 10/60; %[uM/seg] Cui, et al
alpha_pmc1 = 4/60; %[uM/seg] Cui, et al
alpha_pmr1 = 1/60; %[uM/seg] Cui, et al

% Concentraciones iniciales de calcio en citoplasma y vacuola
ca_0_cit = 0.300; %[uM] *Halamich, et al 1989
ca_0_vac = 2000; %[uM] *Dunn 1994 o 1300000 NnM en Halamich 1989

% Constantes de Michaelis-Menten para las proteínas de transporte
k_vcx1 = 0.8; %[uM] Cui, et al
k_pmc1 = 0.2; %[uM] Cui/Pittman
k_pmr1 = 0.1; %[uM] Cui, et al

% Agrupación de constantes en vectores
k_v = [k_vcx1 k_pmc1 k_pmr1];
v = [1*alpha_vcx1 1*alpha_pmc1 1*alpha_pmr1];

%Evolución temporal del tamaño del citosol
xo  = 3800;
v_x = 0.001;
t=0:1:6000;
sigmoid = @(x, v_x, xo) 1 + 0.25 ./ (1 + exp(-v_x*(x - xo)));
inv_sigmoid = @(y, v, xo) xo - log(1./y - 1) / v;
% Cálculo de los extremos de la sigmoide
Sa = 1 / (1 + exp(-v_x*(0 - xo)));  % S(0)
Sb = 1 / (1 + exp(-v_x*(6000 - xo)));  % S(6000)

% % Evaluación de la función
% y = sigmoid(t, v_x, xo);
% 
% % Plot
% figure;plot(t, y, 'b', 'LineWidth', 2);
% xlabel('Tiempo (t)');ylabel('Tamaño del citosol (normalizado)');grid on;

%% Definición de distribuciones de amplitud para diferentes tipos de eventos de liberación
mu_H = 0.25; sigma_H = .2; % Parámetros para eventos HACS (altas amplitudes)
mu_L = 0.6; sigma_L = 0.2; % Parámetros para eventos LACS (bajas amplitudes)
mu_Y = 0.1; sigma_Y = 0.05; % Parámetros para liberación de la vacuola (YVC1) NO CICR

% Tasas promedio de ocurrencia de ráfagas por tipo de evento
lambda_H = 6;
% lambda_H = 0;
lambda_L = 9;
% lambda_L = 0;
lambda_Y = 0; %Con =0 asumo que no hay liberación independiente por YVC1

% Umbrales y parámetros de simulación
% dcaY_0 = 0.0; % Variación inicial del calcio por liberación de YVC1
dcaY_0 = 0.6; % Variación inicial del calcio por liberación de YVC1
umbral_YVC1 = 0.3; % Umbral de liberación de la vacuola en [df/f0]
umbral_detec = 0.6; % Umbral de detección de eventos en microscopía en [df/f0]
tau = 50; % Tiempo mínimo de activación de YVC1 (si ha pasado suficiente tiempo desde la última liberación)
gamma = .001; % Factor de disipación del calcio

guardar_resultados = false;
celulas = 10; % Número de simulaciones a ejecutar
modoYVC1 = 1; % 1 para variante sin rampa, 2 para rampa saturada
usarSigmoide = true;  % Cambia a false para usar alturas L sin modulación y H uniforme

resultados = cell(celulas,1);  % Cell array para guardar datos por célula

for j = 1:celulas
    wt=[];
    dmid1=[];
    dfig1=[];
    dyvc1=[];
    
    % Definición de distribuciones para las amplitudes de eventos
    pdH = makedist('Normal','mu',mu_H,'sigma',sigma_H);%Agrega de baja amplitud (HACS)
    pdL = makedist('Normal','mu',mu_L,'sigma',sigma_L);%Agrega de alta amplitud (LACS)
    pdY = makedist('Normal','mu',mu_Y,'sigma',sigma_Y); %Agrega liberacion de la vac (yvc1)
    
    % Generación del número de eventos basado en distribuciones de Poisson
    clear nroH nroL nroC
    nroH=poissrnd(lambda_H,1,1);
    nroL=poissrnd(lambda_L,1,1);
    nroY=poissrnd(lambda_Y,1,1);
    
    % Asignación de alturas de ráfagas
    clear H L aux1 aux2 aux3 rH rL u s
    H=abs(random(pdH,nroH,1));
    L=abs(random(pdL,nroL,1));
    Y=abs(random(pdY,nroY,1));
    
    rL = random('Uniform',0,6000,nroL,1);
    rY = random('Uniform',0,6000,nroY,1);
    
    if usarSigmoide
        u = Sa + (Sb - Sa) * rand(nroH,1);
        rH = xo - (1/v_x) * log((1 - u) ./ u);% Escala al rango de timpo (0,6000) [seg.]
        rH(rH <= 0) = 0 + eps;     % evita exactamente 0
        rH(rH >= 6000) = 6000 - eps;     % evita exactamente 6000
%         size(aux1)
        % Altura de ráfaga: HACS sin modificación, LACS moduladas por crecimiento del citosol
        aux1(:,2) = [H; sigmoid(rL, v_x, xo).*L; 0];% Altura de ráfaga
    else
        rH = random('Uniform',0,6000,nroH,1);
        aux1(:,2) = [H; L; 0];
    end
    
    aux1(:,3) = [rH; rL; 6000];
    aux1(:,1) = j;
    aux1 = sortrows(aux1,3);
    wt = cat(1,wt,aux1);

    % Inicialización ODE
    x0 = [ca_0_cit ca_0_vac];
    tspan = [0 wt(1,3)];
    [ts, y] = ode45(@(t,x)modeloCa2(t,x,v,gamma,k_v,diametro_cell,diametro_vac), tspan, x0);
    contadortau = -tau;

    % Matriz para guardar resultados por célula
    eventos_celula = nan(length(wt(:,3))-1, 3);

    for i = 2:length(wt(:,3))
        y(end,1) = y(end,1) * (1 + wt(i-1,2));
        x0 = [y(end,1) y(end,2)];

        entroIf = 0;
        dCay_reg = NaN;
        if (contadortau + tau) < wt(i-1,3)

            if modoYVC1 == 1
                % Variante 1: umbral fijo
                if wt(i-1,2) > umbral_YVC1
                    entroIf = 1;
                    dCay = dcaY_0 * (x0(2) - x0(1)) * ...
                        (1 - exp((contadortau - wt(i-1,3)) / tau)) / ...
                        (ca_0_vac - ca_0_cit);
                    contadortau = wt(i-1,3);
                    
                    concCa_2inspect = x0(1);
                    
                    x0(1) = x0(1) + dCay;
                    x0(2) = x0(2) - dCay * (((diametro_cell^3)*0.5 + ...
                        (((diametro_cell + 0.0005*wt(i-1,3))*(diametro_cell^2))*0.5) - ...
                        diametro_vac^3) / diametro_vac^3);
                    
                    dCay_reg = dCay;
                end

            elseif modoYVC1 == 2
                % Variante 2: rampa saturada
                if x0(2) <= umbral_YVC1
                    f = 0;
                elseif x0(2) < (umbral_YVC1 + dcaY_0)
                    f = (x0(2) - umbral_YVC1) / dcaY_0;
                else
                    f = 1;
                end

                dCay = f * dcaY_0 * (x0(2) - x0(1)) * ...
                    (1 - exp((contadortau - wt(i-1,3)) / tau)) / ...
                    (ca_0_vac - ca_0_cit);
                contadortau = wt(i-1,3);

                x0(1) = x0(1) + dCay;
                x0(2) = x0(2) - dCay * (((diametro_cell^3)*0.5 + ...
                    (((diametro_cell + 0.0005*wt(i-1,3))*(diametro_cell^2))*0.5) - ...
                    diametro_vac^3) / diametro_vac^3);

                dCay_reg = dCay;
            end
        end

        % Guardamos resultados del evento actual
        eventos_celula(i-1,1) = j;   %ID cell 
        eventos_celula(i-1,2) = wt(i-1,3);   % Tiempo
        eventos_celula(i-1,3) = concCa_2inspect;% [Ca]cit to decide if yvc1 liberation
        eventos_celula(i-1,4) = entroIf;     % Result of decition 
        eventos_celula(i-1,5) = dCay_reg;    % Valor dCay

        % Resolver ODE para el siguiente intervalo
        tspan = [wt(i-1,3) wt(i,3)];
        [ts_aux, y_aux] = ode45(@(t,x)modeloCa2(t,x,v,gamma,k_v,diametro_cell,diametro_vac), tspan, x0);

        ts = cat(1, ts, ts_aux);
        y = cat(1, y, y_aux);
    end

    % Guardamos datos de esta célula
    resultados{j}.aux1    = aux1;           % Guardamos aux1
    resultados{j}.eventos = eventos_celula; % Guardamos matriz de eventos

    % Picos detectados
    [tsR, b] = unique(ts);
    [pk_values, locs] = findpeaks((y(b,1)-ca_0_cit)/ca_0_cit, ...
                                  'MinPeakDistance',35, ...
                                  'MinPeakHeight',umbral_detec);
    pk_times = tsR(locs);
    resultados{j}.pks = [pk_values, pk_times];
    pks{j} = [pk_values, pk_times]; % Guarda picos y tiempos juntos
    disp([num2str(j)])
end

%%

figure;

% ===== SUBPLOT 1: CDF del número de ráfagas por simulación =====
subplot(2,1,1);
hold on;

% Número de ráfagas por simulación
num_rafagas = cellfun(@(x) size(x,1), pks);

% Ordenar y normalizar
num_rafagas_sorted = sort(num_rafagas);
N = length(num_rafagas_sorted);
cdf_rafagas = (1:N) / N;

stairs(num_rafagas_sorted, cdf_rafagas, 'b', 'LineWidth', 2);
xlabel('Número de ráfagas por simulación');
ylabel('CDF');
xlim([0 30])
% title('CDF del número de ráfagas por simulación');
grid on;

% ===== SUBPLOT 2: CDF de amplitudes de ráfagas =====
subplot(2,1,2);
hold on;

% Concatenar todas las amplitudes
todas_amplitudes = vertcat(pks{:});
amplitudes = todas_amplitudes(:,1);  % columna 1 = amplitudes

% Ordenar y normalizar
amplitudes_sorted = sort(amplitudes);
M = length(amplitudes_sorted);
cdf_amplitudes = (1:M) / M;

stairs(amplitudes_sorted, cdf_amplitudes, 'r', 'LineWidth', 2);
xlabel('Amplitud de ráfagas');
ylabel('CDF');
xlim([0 3])
% title('CDF de amplitudes de ráfagas');
grid on;

% ===== SUBPLOT 3: CDF de tiempos de ráfagas =====
tiempos = todas_amplitudes(:,2);  % columna 1 = amplitudes
% Ordenar y normalizar
tiempos_sorted = sort(tiempos);

if guardar_resultados
    save('resultados_simulacion.mat', 'num_rafagas_sorted', 'amplitudes_sorted', 'tiempos_sorted');
    print('Resultados guardados como .mat')
end

%%

%Opcional: gráfico de la última simulación
subplot(3,1,1)
plot(ts,y(:,1))%,ts,line,ts,line2)
ylabel('Ca^{2+} Cit (uM)')
legend('Ca^{2+} Cit')
title(['Gamma=' num2str(gamma)])

subplot(3,1,2)
plot(ts,y(:,2))
xlabel('Tiempo (s)')
ylabel('Ca^{2+} Vac (uM)')
legend('Ca^{2+} Vac')

% subplot(3,1,3)
% plot(tsR, (y(b,1)-ca_0_cit)/ca_0_cit) % Señal normalizada
% hold on
% plot([tsR(1), tsR(end)], [umbral_YVC1, umbral_YVC1], '--r', 'LineWidth', 1.5) % Línea horizontal umbral YVC1
% plot([tsR(1), tsR(end)], [umbral_detec, umbral_detec], '--b', 'LineWidth', 1.5) % Línea horizontal umbral detección
% hold off
% ylabel('Ca^{2+} Cit \Deltaf/f_o')
% legend('Ca^{2+} Cit \Deltaf/f_o', 'Umbral YVC1', 'Umbral detección')


subplot(3,1,3)
plot(tsR, (y(b,1)-ca_0_cit)/ca_0_cit, 'LineWidth', 1.5) % Señal normalizada
hold on
% Líneas horizontales
plot([tsR(1), tsR(end)], [umbral_YVC1, umbral_YVC1], '--r', 'LineWidth', .5) 
plot([tsR(1), tsR(end)], [umbral_detec, umbral_detec], '--b', 'LineWidth', .5) 
% Líneas verticales en pk_times
yl = ylim;  % límites actuales en Y
for k = 1:length(pk_times)
    line([pk_times(k) pk_times(k)], yl, ...
         'Color','r','LineStyle','--','LineWidth',0.2);
end
hold off
ylabel('Ca^{2+} Cit \Deltaf/f_o')
legend('Ca^{2+} Cit \Deltaf/f_o', 'Umbral YVC1', 'Umbral detección', 'Peak detec time')
ylim([-1 max((y(b,1)-ca_0_cit)/ca_0_cit)+1])