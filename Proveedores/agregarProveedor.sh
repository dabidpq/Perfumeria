#!/bin/bash

ARCHIVO_PROVEEDORES="Proveedores/proveedores.txt"

echo "Nombre del proveedor: "
read nombre

echo "Contacto del proveedor: "
read contacto


echo "Nombre: $nombre, Contacto: $contacto" >> "$ARCHIVO_PROVEEDORES"

echo "El proveedor $nombre fue agregado en $ARCHIVO_PROVEEDORES"
