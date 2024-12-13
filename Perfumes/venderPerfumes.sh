 #!/bin/bash

PERFUMES_FILE="perfumes.txt"


VENTAS_FILE="ventas.txt"


listar_perfumes() {

	echo "Perfumes disponibles para la venta:"
	if [ ! -f "$PERFUMES_FILE" ] || [ ! -s "$PERFUMES_FILE" ]; then
		echo "no hay perfumes disponibles."
		exit 1
	fi


	#Se muestra la lista d eperfumes en indice
	awk -F',' '{print NR ". " $1 " - $" $2}' "$PERFUMES_FILE"
}

vender_perfume() {
	echo "Ingrese el numero del perfume que deasea vender (o '0' para salir):"
	read opcion

	if [ "$opcion" -eq 0 ]; then
		echo "Cancelando la venta"
		exit 0
	fi


	#Validar la opcion seleccionada
	total_perfumes=$(wc -l < "$PERFUMES_FILE")
	if [ "$opcion" -lt 1 ] || [ "$opcion" -gt "$total_perfumes" ]; then
		echo "Opcion invalida. Por favor intente de nuevo."
		vender_perfume
		return
	fi

	#Se obtiene el perfume seleccionado
	perfume=$(sed -n "${opcion}p" "$PERFUMES_FILE")
	



	#Se agrega el perfume vendido al archivo de ventas
	echo "$perfume" >> "$VENTAS_FILE"
	echo "Se a vendido: $perfume"


	#Se elimina el perfume del archivo original
	sed -i "${opcion}d" "$PERFUMES_FILE"
}

listar_perfumes
vender_perfume
