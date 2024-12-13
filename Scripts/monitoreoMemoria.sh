#!/bin/bash

UMBRAL=80

USO_MEMORIA=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

if (( $(echo "$USO_MEMORIA > $UMBRAL" | bc -l) )); then
	echo "ALERTA: Uso de memoria ha superado el umbral de $UMBRAL%, Uso actual: $USO_MEMORIA%"
else
	echo "Uso de la memoria dentro de los limites: $USO_MEMORIA"
fi
