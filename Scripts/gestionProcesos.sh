#!/bin/bash

# Crear un proceso en segundo plano
sleep 60 &
PID=$!
echo "Se inició un nuevo proceso en segundo plano (PID: $PID)"

# Verificar el estado del proceso
if ps -p $PID > /dev/null; then
    echo "El proceso con PID $PID está en ejecución."
else
    echo "El proceso con PID $PID no se encuentra activo."
fi

# Ajustar la prioridad del proceso
renice -n 5 -p $PID > /dev/null 2>&1
echo "Se cambió la prioridad del proceso con PID: $PID a 5."

# Terminar el proceso
kill $PID
if [[ $? -eq 0 ]]; then
    echo "El proceso con PID $PID fue terminado exitosamente."
else
    echo "No se pudo terminar el proceso con PID $PID."
fi
