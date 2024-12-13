#!/bin/bash


#Se inicia un nuevo proceso
sleep 60 &
echo "Se inicio un nuevo proceso (PID $!)"


#Se verifica cual es el PID del proceso que se inicio
PID=$(ps -ef | grep sleep | awk '{print $2}')
echo "El procesos tiene el PID: $PID"


#Termina el proceso
kill $PID
echo "Se termino el proceso con el PID: $PID"


#Se ajusta la prioridad del proceso
renice -n 5 -p $PID
echo "Se cambio la prioridad del proceso con PID: $PID"

