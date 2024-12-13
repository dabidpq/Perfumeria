#!/bin/bash

ARCHIVO_PUNTO_VENTA="PuntosVenta/puntosVenta.txt"

echo "Nombre del punto de venta: "
read nombre

echo "Direccion del punto de venta: "
read direccion

echo "Numero de contacto del punto de venta: "
read contacto


echo "Nombre: $nombre, Direccion: $direccion, Contacto: $contacto" >> "$ARCHIVO_PUNTO_VENTA"

echo "El punto de venta $nombre a sido agregado en $ARCHIVO_PUNTO_VENTA"
