#!/bin/bash

# Lista de procesos simulados
PROCESOS=("sleep 5" "sleep 10" "sleep 15")

# FIFO: Ejecutar procesos en orden
echo "Simulando planificación FIFO..."
for PROCESO in "${PROCESOS[@]}"; do
    echo "Iniciando proceso: $PROCESO"
    eval "$PROCESO &"
    PID=$!
    echo "Proceso con PID $PID asignado a la CPU principal."
    wait $PID
    echo "Proceso con PID $PID terminado."
done

# Multiprocesador: Asignar procesos a núcleos diferentes
echo "Asignando procesos a múltiples núcleos..."
CPU=0
for PROCESO in "${PROCESOS[@]}"; do
    echo "Ejecutando $PROCESO en CPU $CPU..."
    taskset -c $CPU $PROCESO &
    ((CPU++))
    if [[ $CPU -gt 3 ]]; then CPU=0; fi  # Ciclar entre núcleos 0-3
done

wait
echo "Todos los procesos se han ejecutado."
