#!/bin/bash

UMBRAL=80  # Definir umbral de alerta

# Obtener el uso de memoria como porcentaje
USO_MEMORIA=$(free | awk '/Mem/ {printf "%.2f", $3/$2 * 100}')

# Verificar si el uso de memoria supera el umbral
if (( $(echo "$USO_MEMORIA > $UMBRAL" | bc -l) )); then
    echo "ALERTA: Uso de memoria ($USO_MEMORIA%) ha superado el umbral ($UMBRAL%)."
    echo "$(date): ALERTA - Uso de memoria: $USO_MEMORIA%" >> "$BASE_DIR/Logs/logs.txt"
else
    echo "Uso de memoria dentro de límites: $USO_MEMORIA%"
fi
