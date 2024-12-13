#!/bin/bash

LOCK_FILE="/tmp/locks.txt"

# Intentar adquirir el bloqueo
if flock -n "$LOCK_FILE" -c "sleep 10"; then
    echo "Operación crítica completada correctamente."
    echo "$(date): Operación crítica realizada" >> "$BASE_DIR/Logs/logs.txt"
else
    echo "No se pudo obtener el bloqueo. Otro proceso está trabajando."
    echo "$(date): ERROR - Operación crítica no pudo completarse" >> "$BASE_DIR/Logs/logs.txt"
fi
