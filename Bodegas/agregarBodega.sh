#!/bin/bash

ARCHIVO_BODEGAS="Bodegas/bodegas.txt"

#Agregar Bodega

echo "Nombre de la bodega: "
read nombre
echo "Direccion de la Bodega: "
read direccion
echo "Numero de contacto de la bodega: "
read contacto

#Crear archivo
echo "Nombre: $nombre, Direccion: $direccion, Contacto: $contacto" >> "$ARCHIVO_BODEGAS"
echo "La bodega $nombre  se a guardado en $ARCHIVO_BODEGA"
