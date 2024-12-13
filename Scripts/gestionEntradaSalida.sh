#!/bin/bash

# Organización de archivos
DIRECTORIO="$BASE_DIR/Logs"
echo "Reorganizando archivos en $DIRECTORIO..."
find "$DIRECTORIO" -type f -mtime +30 -exec mv {} "$DIRECTORIO/archivados/" \;
echo "Archivos mayores a 30 días movidos a /archivados."

# Verificar espacio en disco
echo "Estado actual del disco:"
df -h | grep "^/"

# Optimización del disco
echo "Liberando espacio..."
sudo rm -rf "$DIRECTORIO/archivados/*"  # Simulación: Borrar archivos antiguos
echo "Espacio liberado."

# Registrar cambios
echo "$(date): Mantenimiento completado en $DIRECTORIO" >> "$BASE_DIR/Logs/logs.txt"
