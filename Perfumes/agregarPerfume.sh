#!/bin/bash


#Directorios
PERFUMES_FILE="Perfumes/perfumes.txt"


# Funcion para agregar perfumes
agregar_perfume() {
	local perfume_name=$1
	local perfume_price=$2

	if [ ! -f "$PERFUMES_FILE" ]; then
		echo "$perfume_name,$perfume_price" > "$PERFUME_FILE"
		echo "Se agrego $perfumename (precio: $perfume_price) a $PERFUMES_FILE"
	else
		echo "$perfume_name,$perfume_price" >> "$PERFUMES_FILE"
		echo "Se agregro $perfume_name (precio: $perfume_price) a $PERFUMES_FILE"
	fi
}


#Inputs
echo "Ingrese el nombre del nuevo perfume: "
read perfume_name

echo "Ingrese el precio del nuevo perfume: $"
read perfume_price

agregar_perfume "$perfume_name" "$perfume_price"
