#!/bin/bash

#Ruta de los directorios
BASE_DIR="$(pwd)"

#Funcion para mostrar los datos de los archivos .txt
mostrar_datos() {
	local archivo=$1
	if [[ -f $archivo ]]; then
		echo ""
		echo "Contenido de $archivo: "
		echo ""
		cat "$archivo"
	else
		echo ""
		echo "El archivo $archivo no existe."
	fi
}

#Funcion para ejecutar un script

ejecutar_script() {
	local script=$1
	if [[ -f $script ]]; then
		echo ""
		echo "Ejecutando $script..."
		bash "$script"
	else
		echo""
		echo "El script $script no existe."
	fi
}

submenu() {
	local opcion=$1
	case $opcion in
		1)
			echo ""
			echo "=====Submenu Bodegas====="
			echo "1. Mostrar bodegas"
			echo "2. Agregar Bodega"
			read -p "Seleccione una opcion: " subopcion
			case $subopcion in
				1)
					mostrar_datos "$BASE_DIR/Bodegas/bodegas.txt"
					;;
				2)
					ejecutar_script "$BASE_DIR/Bodegas/agregarBodega.sh"
					;;
				*)
					echo "opcion no valida"
					;;
			esac
			;;
		2)
			echo ""
			echo "=====Submenu Logs====="
			echo "1. Mostrar logs"
			read -p "Seleccione una opcion: " subopcion
			case $subopcion in
				1)
					mostrar_datos "$BASE_DIR/Logs/logs.txt"
					;;
				*)
					echo "Opcion no valida."
					;;
			esac
			;;
		3)
			echo ""
			echo "=====Submenu Perfumes====="
			echo "1. Mostrar perfumes"
			echo "2. Agregar perfumes"
			echo "3. Vender perfume"
			read -p "Seleccione una opcion: " subopcion
			case $subopcion in
				1)
					mostrar_datos "$BASE_DIR/Perfumes/perfumes.txt"
					;;
				2)
					ejecutar_script "$BASE_DIR/Perfumes/agregarPerfume.sh"
					;;
				3)
					ejecutar_script "$BASE_DIR/Perfumes/venderPerfumes.sh"
					;;
				*)
					echo "Opcion no valida"
					;;
			esac
			;;
		4)
			echo ""
			echo "=====Submenu Proveedores====="
			echo "1. Mostrar proveedores"
			echo "2. Agregar proveedores"
			read -p "Seleccione una opcion" subopcion
			case $subopcion in
				1)
					mostrar_datos "$BASE_DIR/Proveedores/proveedores.txt"
					;;
				2)
					ejecutar_script "$BASE_DIR/Proveedores/agregarProveedor.sh"
					;;
				*)
					echo "OPcionj no valida"
					;;
			esac
			;;
		5)
			echo ""
			echo "=====Submenu Puntos de Venta====="
			echo "1. Mostrar puntos de venta"
			echo "2. Agregar punto de venta"
			read -p "Seleccione una opcion: " subopcion
			case $subopcion in
				1)
					mostrar_datos "$BASE_DIR/PuntosVenta/puntosVenta.txt"
					;;
				2)
					ejecutar_script "$BASE_DIR/PuntosVenta/agregarPuntoVenmta.sh"
					;;
				*)
					echo "Opcion no valida"
					;;
			esac
			;;
		*)
			echo "Opcion no valida"
			;;
	esac
}



while true; do
	echo ""
	echo "===== Menu Principal ====="
	echo ""
	echo "1. Bodegas"
	echo "2. Logs"
	echo "3. Perfumes"
	echo "4. Proveedores"
	echo "5. Puntos de Venta"
	echo "6. Salir"
	read -p "Seleccione una opcion: " opcion

	if [[ $opcion -ge 1 && $opcion -le 5 ]]; then
		submenu $opcion
	elif [[ $opcion -eq 6 ]]; then
		echo ""
		echo "Salinedo del programa..."
		break
	else
		echo ""
		echo "Opcion no valida, intente de nuevo."
	fi
done






