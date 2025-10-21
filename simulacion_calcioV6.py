# -*- coding: utf-8 -*-
"""
Created on Wed Oct 15 16:40:18 2025

@author: Lucia
"""
# -*- coding: utf-8 -*-
"""
Created on Tue Sep 16 16:33:51 2025

@author: Nahuel

Simulación de dinámica de calcio intracelular con eventos HACS, LACS y YVC1
"""

import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp
from scipy.signal import find_peaks
import random
import scipy.io as sio

# =============================================================================
# CONFIGURACIÓN DE SEMILLA 
# =============================================================================
SEMILLA = 42  # Cambia este número para diferentes resultados
np.random.seed(SEMILLA)
random.seed(SEMILLA)


# =============================================================================
# PARÁMETROS DEL MODELO
# =============================================================================

# Dimensiones celulares
diametro_cell = 4  # [um]
diametro_vac = 3   # [um]

# Velocidades de transporte de calcio
v = np.array([10/60, 4/60, 1/60])  # [alpha_vcx1, alpha_pmc1, alpha_pmr1]

# Concentraciones basales
ca_0_cit = 0.200  # [uM] Halamich et al 1989
ca_0_vac = 2000   # [uM] Dunn 1994

# Constantes de Michaelis-Menten
k = np.array([0.8, 0.2, 0.1])  # [k_vcx1, k_pmc1, k_pmr1]

# Parámetros de crecimiento celular
xo = 3800
v_x = 0.001
v_xL = 0.0005

# Distribuciones de amplitud para eventos
mu_H = 0.25; sigma_H = 0.2   # HACS (altas amplitudes) [df/f0]
mu_L = 0.6; sigma_L = 0.2    # LACS (bajas amplitudes) [df/f0]
mu_Y = 0.0; sigma_Y = 0.05   # YVC1 [df/f0]

# Tasas de eventos (eventos/hora)
lambda_H = 6
lambda_L = 9
lambda_Y = 0  # No implementado diferente de cero

# Parámetros de simulación
max_YVC1 = 0.6        # Variación inicial por liberación de YVC1 [df/f0] DEFAULT=0.6
umbral_YVC1 = 0.3      # Umbral de liberación vacuolar [df/f0]
umbral_detec = 0.6     # Umbral de detección en microscopía [df/f0]
tau = 50            # Tiempo mínimo de activación de YVC1 [s] DEFAULT=50
gamma = 0.001          # Factor de disipación del calcio

# Configuración de simulación
guardar_resultados = True
guardar_imagenes = False
celulas = 5
modoYVC1 = 1           # 0: desactivado, 1: umbral fijo, 2: rampa saturada
usarSigmoide = False   # True: usar sigmoide para tiempos, False: uniforme

# Tiempo de simulación
t_simulacion = 6000    # [s]
dt = 1                 # [s]
t_span = (0, t_simulacion)
t_eval = np.arange(0, t_simulacion, dt)

# =============================================================================
# FUNCIONES DEL MODELO
# =============================================================================

def modeloCa2(t, x, v, gamma, k, dcell, dvac):
    """
    Modelo de calcio con dinámica citosólica y vacuolar
    
    Parameters:
    t : float - Tiempo
    x : array_like - Vector de estados [cac, cav]
    v : array_like - Velocidades [alpha_vcx1, alpha_pmc1, alpha_pmr1]
    gamma : float - Factor de disipación
    k : array_like - Constantes [k_vcx1, k_pmc1, k_pmr1]
    dcell : float - Diámetro de la célula [um]
    dvac : float - Diámetro de la vacuola [um]
    
    Returns:
    dx : array - Derivadas [dcac, dcav]
    """
    k_vcx1, k_pmc1, k_pmr1 = k
    alpha_vcx1, alpha_pmc1, alpha_pmr1 = v
    
    # Cálculo de constantes
    k1 = alpha_pmc1 * ca_0_cit / (ca_0_cit + k_pmc1)
    k2 = alpha_pmr1 * ca_0_cit / (ca_0_cit + k_pmr1)
    k3 = alpha_vcx1 * ca_0_cit / (ca_0_cit + k_vcx1)
    
    cac, cav = x
    
    # Ecuación del citosol
    dcac = (-alpha_pmc1 * cac / (cac + k_pmc1) + k1 
            - alpha_pmr1 * cac / (cac + k_pmr1) + k2 
            - alpha_vcx1 * cac / (cac + k_vcx1) + k3)
    
    # Ecuación de la vacuola
    factor_vol = calcular_factor_volumen(t, dcell, dvac)
    
    dcav = factor_vol * (alpha_pmc1 * cac / (cac + k_pmc1) - k1 + 
                         alpha_pmr1 * cac / (cac + k_pmr1) - k2 +
                         alpha_vcx1 * cac / (cac + k_vcx1) - k3 - 
                         gamma * (cav - ca_0_vac))
    
    return np.array([dcac, dcav])

def concentracion2deltaf(ca_0_cit, ca_cit):
    """Convierte concentración de calcio a ΔF/F0"""
    return (ca_cit - ca_0_cit) / ca_0_cit

def deltaf2concentracion(ca_0_cit, df_f0):
    """Convierte ΔF/F0 a concentración de calcio"""
    return ca_0_cit * (1 + df_f0)

def calcular_factor_volumen(t, dcell, dvac):
    """Calcula el factor de volumen consistentemente"""
    return ((dcell**3 - dvac**3) + (0.0005 * t * dcell**2)) / dvac**3

def simular_liberaciones_aleatorias(lambda_rate, mu, sigma):
    """
    Simula eventos de liberación aleatorios con distribución normal truncada
    
    Returns:
    eventos_ordenados, amplitudes_ordenadas : list - Ordenados por tiempo
    """
    eventos = []
    amplitudes = []
    
    # Generar número de eventos con distribución de Poisson
    n_eventos = np.random.poisson(lambda_rate * t_simulacion / 3600)
    
    for _ in range(n_eventos):
        # Tiempo aleatorio dentro de la simulación
        tiempo_evento = random.uniform(0, t_simulacion)
        
        # Generar amplitud positiva (distribución normal truncada)
        amplitud = np.random.normal(mu, sigma)
        while amplitud <= 0:
            amplitud = np.random.normal(mu, sigma)
        
        eventos.append(tiempo_evento)
        amplitudes.append(amplitud)
    
    # Ordenar por tiempo
    eventos_amplitudes = sorted(zip(eventos, amplitudes), key=lambda x: x[1])
    eventos_ordenados = [e for e, a in eventos_amplitudes]
    amplitudes_ordenadas = [a for e, a in eventos_amplitudes]
    
    return eventos_ordenados, amplitudes_ordenadas

def simular_celula_con_yvc1(modoYVC1, eventos_H, amplitudes_H, eventos_L, amplitudes_L):
    """
    Versión que reintegra explícitamente después de cada activación de YVC1
    """
    print(f"Simulando célula con modoYVC1={modoYVC1}")
    # print(f"Eventos HACS: {len(eventos_H)}, Eventos LACS: {len(eventos_L)}")
    
    # dcaY_0 = deltaf2concentracion(ca_0_cit, max_YVC1) #in uM
    dcaY_0 = deltaf2concentracion(ca_0_cit, max_YVC1) - ca_0_cit #Es el INCREMENTO in uM
    # Combinar y ordenar todos los eventos HACS/LACS
    todos_eventos = []
    for tiempo, amplitud in zip(eventos_H, amplitudes_H):
        todos_eventos.append(('HACS', tiempo, amplitud))
    for tiempo, amplitud in zip(eventos_L, amplitudes_L):
        todos_eventos.append(('LACS', tiempo, amplitud))
    
    todos_eventos.sort(key=lambda x: x[1]) # in dF/f0
    todos_eventos.append(('FIN', t_simulacion, 0))
    
    # Condiciones iniciales
    x0 = np.array([ca_0_cit, ca_0_vac])  # in uM
    
    # Arrays para resultados
    ts_total = np.array([0])
    y_total = np.array([x0])  # in uM
    eventos_Y = []
    ultima_activacion_yvc1 = -tau  # Permite activación desde inicio
    
    print(f"Estado inicial: ca_cit={x0[0]:.3f}uM, ca_vac={x0[1]:.0f}uM")
    
    # Simular entre cada par de eventos HACS/LACS
    for i in range(len(todos_eventos)):
        if i == 0:
            t_inicio_segmento = 0
            t_fin_segmento = todos_eventos[i][1]
        else:
            t_inicio_segmento = todos_eventos[i-1][1]
            t_fin_segmento = todos_eventos[i][1]
            
            # Aplicar liberación del evento HACS/LACS anterior
            if todos_eventos[i-1][0] in ['HACS', 'LACS']:
                tipo, tiempo_evento, amplitud = todos_eventos[i-1]
                
                # Aplicar liberación de calcio
                incremento = deltaf2concentracion(ca_0_cit, amplitud) - ca_0_cit #in uM
                y_total[-1, 0] = y_total[-1, 0] + incremento
                x0 = y_total[-1, :].copy()
        
        # Integrar este segmento con detección de YVC1
        if t_fin_segmento > t_inicio_segmento:
            t_pendiente = t_inicio_segmento
            estado_pendiente = x0.copy()
            segmento_completado = False
            
            while not segmento_completado:
                # Integrar un sub-segmento completo
                t_eval_subsegmento = np.arange(t_pendiente, t_fin_segmento + dt, dt)
                t_eval_subsegmento = t_eval_subsegmento[t_eval_subsegmento <= t_fin_segmento]
                
                if len(t_eval_subsegmento) < 2:
                    # Segmento muy pequeño, completar
                    ts_total = np.concatenate([ts_total, [t_fin_segmento]])
                    y_total = np.concatenate([y_total, [estado_pendiente]])
                    segmento_completado = True
                    continue
                
                # Integrar el sub-segmento completo
                sol_subsegmento = solve_ivp(
                    lambda t, x: modeloCa2(t, x, v, gamma, k, diametro_cell, diametro_vac),
                    [t_pendiente, t_fin_segmento], estado_pendiente,
                    t_eval=t_eval_subsegmento, method='RK45', rtol=1e-6, atol=1e-8
                )
                
                # Buscar activación de YVC1 en este sub-segmento
                yvc1_activado = False
                idx_yvc1 = -1
                t_yvc1 = -1
                estado_antes_yvc1 = None
                df_f0_actual = 0
                
                for j in range(len(sol_subsegmento.t)):
                    t_actual = sol_subsegmento.t[j]
                    estado_actual = sol_subsegmento.y.T[j]
                    df_f0_actual = concentracion2deltaf(ca_0_cit, estado_actual[0])
                    
                    # Verificar condiciones para YVC1
                    if (df_f0_actual > umbral_YVC1 and 
                        (t_actual - ultima_activacion_yvc1) >= tau):
                        
                        yvc1_activado = True
                        idx_yvc1 = j
                        t_yvc1 = t_actual
                        estado_antes_yvc1 = estado_actual.copy()
                        break
                
                if yvc1_activado and modoYVC1 != 0:  # Solo si YVC1 no está desactivado
                    # Guardar resultados hasta el momento de activación (INCLUYENDO el punto de YVC1)
                    if idx_yvc1 >= 0:  # Cambiado a >= 0 para incluir el punto de activación
                        ts_total = np.concatenate([ts_total, sol_subsegmento.t[1:idx_yvc1+1]])
                        y_total = np.concatenate([y_total, sol_subsegmento.y.T[1:idx_yvc1+1]])
                    
                    # CALCULAR LIBERACIÓN SEGÚN MODO YVC1 (CON FACTOR TEMPORAL PARA AMBOS MODOS)
                    dCay = 0
                    factor_temporal = (1 - np.exp((ultima_activacion_yvc1 - t_yvc1) / tau))
                    
                    if modoYVC1 == 1:
                        # Modo 1: Liberación fija con factor temporal
                        dCay = dcaY_0 * (estado_antes_yvc1[1] - estado_antes_yvc1[0]) * factor_temporal / (ca_0_vac - ca_0_cit)
                    elif modoYVC1 == 2:
                        # Modo 2: Rampa saturada basada en calcio CITOSÓLICO
                        cac_actual = estado_antes_yvc1[0]  # uM citosólico
                        
                        # Convertir umbral a unidades consistentes
                        umbral_cit = deltaf2concentracion(ca_0_cit, umbral_YVC1)  # 0.26 uM
                        
                        if cac_actual <= umbral_cit:
                            f = 0
                        elif cac_actual < (umbral_cit + dcaY_0):
                            f = (cac_actual - umbral_cit) / dcaY_0
                        else:
                            f = 1
                        dCay = f * dcaY_0 * (estado_antes_yvc1[1] - estado_antes_yvc1[0]) * factor_temporal / (ca_0_vac - ca_0_cit)
                    
                    # Aplicar liberación
                    estado_despues_yvc1 = estado_antes_yvc1.copy()
                    estado_despues_yvc1[0] += dCay  # Aumentar calcio citosólico
                    
                    factor_vol = calcular_factor_volumen(t_yvc1, diametro_cell, diametro_vac)
                    estado_despues_yvc1[1] -= dCay * factor_vol  # Disminuir calcio vacuolar
                    
                    # ¡GUARDAR EL ESTADO DESPUÉS DE YVC1!
                    ts_total = np.concatenate([ts_total, [t_yvc1]])
                    y_total = np.concatenate([y_total, [estado_despues_yvc1]])
                    
                    
                    # Registrar evento y actualizar
                    eventos_Y.append(t_yvc1)
                    ultima_activacion_yvc1 = t_yvc1  # Actualizar para el próximo evento
                    
                    # Reiniciar integración desde el nuevo estado después de YVC1
                    t_pendiente = t_yvc1
                    estado_pendiente = estado_despues_yvc1.copy()
                    
                else:
                    # No hubo YVC1 o YVC1 está desactivado (modoYVC1 = 0)
                    ts_total = np.concatenate([ts_total, sol_subsegmento.t[1:]])
                    y_total = np.concatenate([y_total, sol_subsegmento.y.T[1:]])
                    estado_pendiente = sol_subsegmento.y.T[-1].copy()
                    segmento_completado = True
            
            # Actualizar x0 para el próximo segmento
            x0 = estado_pendiente.copy()
            
    # Resultados finales
    cac = y_total[:, 0]
    cav = y_total[:, 1]
    df_f0 = concentracion2deltaf(ca_0_cit, cac)
    
    print(f"\n=== SIMULACIÓN COMPLETADA ===")
    # print(f"Máximo calcio citosólico final: {np.max(cac):.4f}uM")
    
    return ts_total, cac, cav, df_f0, eventos_Y


def detectar_eventos_detectables(df_f0, ts, umbral_detec, min_peak_distance=15):
    """
    Detecta eventos usando detección de picos similar a findpeaks de Matlab
    
    Returns:
    pk_values, pk_times, peaks_indices : picos detectados
    """
    peaks_indices, peaks_properties = find_peaks(
        df_f0, 
        height=umbral_detec, 
        distance=min_peak_distance
    )
    
    pk_times = ts[peaks_indices]
    pk_values = df_f0[peaks_indices]
    
    return pk_values, pk_times, peaks_indices

def graficar_resultados(t, cac, cav, df_f0, eventos_H, eventos_L, eventos_Y, eventos_detectables, num_celula):
    """Grafica los resultados de la simulación"""
    fig, axes = plt.subplots(4, 1, figsize=(14, 12))
    
    # Calcio citosólico
    axes[0].plot(t, cac, 'b-', linewidth=1)
    axes[0].set_ylabel('Ca citosólico [uM]')
    axes[0].set_title(f'Célula {num_celula} - Dinámica de calcio')
    axes[0].grid(True, alpha=0.3)
    axes[0].set_xlim(0, t_simulacion)
    
    # Marcar eventos YVC1 en calcio citosólico
    if len(eventos_Y) > 0:
        for t_yvc1 in eventos_Y:
            idx = np.argmin(np.abs(t - t_yvc1))
            axes[0].plot(t_yvc1, cac[idx], 'ro', markersize=6, label='YVC1' if t_yvc1 == eventos_Y[0] else "")
    
    # Calcio vacuolar
    axes[1].plot(t, cav, 'r-', linewidth=1)
    axes[1].set_ylabel('Ca vacuolar [uM]')
    axes[1].grid(True, alpha=0.3)
    axes[1].set_xlim(0, t_simulacion)
    
    # Marcar eventos YVC1 en calcio vacuolar
    if len(eventos_Y) > 0:
        for t_yvc1 in eventos_Y:
            idx = np.argmin(np.abs(t - t_yvc1))
            axes[1].plot(t_yvc1, cav[idx], 'ro', markersize=6, label='YVC1' if t_yvc1 == eventos_Y[0] else "")
    
    # ΔF/F0 con eventos
    axes[2].plot(t, df_f0, 'g-', linewidth=1, label='ΔF/F0', alpha=0.7)
    axes[2].axhline(y=umbral_YVC1, color='orange', linestyle='--', label='Umbral YVC1')
    axes[2].axhline(y=umbral_detec, color='red', linestyle='--', label='Umbral detección')
    
    # Marcar eventos
    if len(eventos_Y) > 0:
        indices_Y = [np.argmin(np.abs(t - ti)) for ti in eventos_Y]
        axes[2].plot(eventos_Y, df_f0[indices_Y], 'ro', markersize=6, label='Eventos YVC1')
    
    if len(eventos_detectables) > 0:
        indices_det = [np.argmin(np.abs(t - ti)) for ti in eventos_detectables]
        axes[2].plot(eventos_detectables, df_f0[indices_det], 'bo', markersize=4, label='Eventos detectables')
    
    axes[2].set_ylabel('ΔF/F0')
    axes[2].legend()
    axes[2].grid(True, alpha=0.3)
    axes[2].set_xlim(0, t_simulacion)
    
    # Eventos HACS, LACS y YVC1
    axes[3].vlines(eventos_H, 0, 1, colors='purple', linewidth=2, label='HACS', alpha=0.7)
    axes[3].vlines(eventos_L, 0, 0.5, colors='brown', linewidth=2, label='LACS', alpha=0.7)
    # axes[3].vlines(eventos_Y, 0, 0.75, colors='red', linewidth=2, label='YVC1', alpha=0.9)
    axes[3].set_xlabel('Tiempo [s]')
    axes[3].set_ylabel('Eventos')
    axes[3].set_ylim(0, 1.1)
    axes[3].set_xlim(0, t_simulacion)
    axes[3].legend()
    axes[3].grid(True, alpha=0.3)
    
    plt.tight_layout()
    
    if guardar_imagenes:
        plt.savefig(f'celula_{num_celula}_yvc1.png', dpi=300, bbox_inches='tight')
    
    plt.show()
    
    # Estadísticas
    print(f"\nEstadísticas Célula {num_celula}:")
    print(f" - Eventos HACS: {len(eventos_H)}")
    print(f" - Eventos LACS: {len(eventos_L)}")
    print(f" - Eventos YVC1: {len(eventos_Y)}")
    print(f" - Eventos detectables: {len(eventos_detectables)}")

# =============================================================================
# SIMULACIÓN PRINCIPAL
# =============================================================================

print("Iniciando simulación...")

# 1. PRIMERO: Crear una lista para acumular resultados
resultados_celulas = []

for i in range(celulas):
    # Simular eventos aleatorios
    eventos_H, amplitudes_H = simular_liberaciones_aleatorias(lambda_H, mu_H, sigma_H)
    eventos_L, amplitudes_L = simular_liberaciones_aleatorias(lambda_L, mu_L, sigma_L)

    # Simular dinámica con eventos YVC1 
    t, cac, cav, df_f0, eventos_Y = simular_celula_con_yvc1(
        modoYVC1, eventos_H, amplitudes_H, eventos_L, amplitudes_L
    )
    
    # Detectar eventos detectables
    pk_values, pk_times, _ = detectar_eventos_detectables(df_f0, t, umbral_detec)
    eventos_detectables = pk_times
    
    # 2. SEGUNDO: Guardar resultados de ESTA célula
    resultados_celula = {
        'numero_celula': i + 1,
        'eventos_HACS': len(eventos_H),
        'eventos_LACS': len(eventos_L),
        'eventos_YVC1': len(eventos_Y),
        'eventos_detectables': len(eventos_detectables),
        'pk_values': pk_values.tolist() if len(pk_values) > 0 else [],
        'pk_times': pk_times.tolist() if len(pk_times) > 0 else [],
        'tiempos_HACS': eventos_H,
        'tiempos_LACS': eventos_L, 
        'tiempos_YVC1': eventos_Y,
        'amplitudes_HACS': amplitudes_H,
        'amplitudes_LACS': amplitudes_L
    }
    
    resultados_celulas.append(resultados_celula)
    
    # Graficar resultados
    # graficar_resultados(t, cac, cav, df_f0, eventos_H, eventos_L, eventos_Y, eventos_detectables, i+1)

# 3. TERCERO: Guardar TODOS los resultados después del loop
if guardar_resultados and resultados_celulas:
    print("\n=== GUARDANDO RESULTADOS ===")
    
    from datetime import datetime
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    nombre_base = f"resultados_simulacion_{timestamp}"
    
    try:
        # Preparar datos para MATLAB
        mat_data = {}
        
        # Agregar datos de cada célula
        for i, celula in enumerate(resultados_celulas):
            prefix = f"celula_{i+1}_"
            mat_data[prefix + 'num_HACS'] = celula['eventos_HACS']
            mat_data[prefix + 'num_LACS'] = celula['eventos_LACS']
            mat_data[prefix + 'num_YVC1'] = celula['eventos_YVC1']
            mat_data[prefix + 'num_detectables'] = celula['eventos_detectables']
            
            # Arrays de picos detectados
            mat_data[prefix + 'pk_values'] = np.array(celula['pk_values']) if celula['pk_values'] else np.array([])
            mat_data[prefix + 'pk_times'] = np.array(celula['pk_times']) if celula['pk_times'] else np.array([])
            
            # Tiempos de eventos
            mat_data[prefix + 'tiempos_HACS'] = np.array(celula['tiempos_HACS'])
            mat_data[prefix + 'tiempos_LACS'] = np.array(celula['tiempos_LACS'])
            mat_data[prefix + 'tiempos_YVC1'] = np.array(celula['tiempos_YVC1'])
            mat_data[prefix + 'amplitudes_HACS'] = np.array(celula['amplitudes_HACS'])
            mat_data[prefix + 'amplitudes_LACS'] = np.array(celula['amplitudes_LACS'])
        
        # Agregar parámetros globales
        mat_data['modoYVC1'] = modoYVC1
        mat_data['max_YVC1'] = max_YVC1
        mat_data['umbral_YVC1'] = umbral_YVC1
        mat_data['umbral_detec'] = umbral_detec
        mat_data['tau'] = tau
        mat_data['lambda_H'] = lambda_H
        mat_data['lambda_L'] = lambda_L
        mat_data['mu_H'] = mu_H
        mat_data['sigma_H'] = sigma_H
        mat_data['mu_L'] = mu_L
        mat_data['sigma_L'] = sigma_L
        mat_data['num_celulas'] = celulas
        mat_data['timestamp'] = timestamp
        
        # Guardar como .mat
        archivo_mat = f"{nombre_base}.mat"
        sio.savemat(archivo_mat, mat_data, format='4')
        print(f"Resultados guardados en: {archivo_mat} (formato MATLAB v4)")
        
    except Exception as e:
        print(f"Error guardando .mat: {e}")
    
    
print(f"\n=== SIMULACIÓN COMPLETADA ===")