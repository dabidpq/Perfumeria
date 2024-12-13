#!/bin/bash

# Monitoreo de memoria con vmstat
echo "Monitoreando uso de memoria..."
vmstat 1 5

# Ajustar parámetros del kernel
echo "Optimizando parámetros de memoria..."
sudo sysctl -w vm.swappiness=10  # Reducir uso de swap
sudo sysctl -w vm.dirty_ratio=15  # Limitar memoria para escritura diferida

# Verificar espacio de swap
echo "Estado actual del espacio de swap:"
free -h

# Generar alerta si el uso de swap supera el 50%
USO_SWAP=$(free | awk '/Swap/ {printf "%.2f", $3/$2 * 100}')
if (( $(echo "$USO_SWAP > 50.0" | bc -l) )); then
    echo "ALERTA: Uso de swap es superior al 50% ($USO_SWAP%)."
    echo "$(date): ALERTA - Uso de swap $USO_SWAP%" >> "$BASE_DIR/Logs/logs.txt"
else
    echo "Uso de swap dentro de los límites ($USO_SWAP%)."
fi
