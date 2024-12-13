#!/bin/bash


LOCK_FILE="/tmp/locks.txt"


#Se adquiere el lock
flock -n "$LOCK_FILE" || { echo "No se pudo optener el lock"; exit 1; }



echo "Haciendo una operacion critica..."
sleep 10


flock -u "$LOCK_FILE"

echo "Operacion critica completada"
