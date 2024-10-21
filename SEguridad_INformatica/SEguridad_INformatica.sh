#!/bin/bash

# Limpiar pantalla antes de ejecutar el resto del script
clear



#VARIABLES


#COLORES

# Definir los colores
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'

# Colores en negrita
BOLD_BLACK='\033[1;30m'
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
BOLD_YELLOW='\033[1;33m'
BOLD_BLUE='\033[1;34m'
BOLD_MAGENTA='\033[1;35m'
BOLD_CYAN='\033[1;36m'
BOLD_WHITE='\033[1;37m'

# Resetear color
NC='\033[0m' # No Color

#RUTAS

#SEguridad INformatica
SEIN="SEguridad INformatica"
RUTA_SEIN="SEguridad_INformatica"

# Función para calcular el color RGB interpolado entre dos colores
# Recibe el índice actual, el total de pasos y los colores inicial y final
interpolate_color() {
    local idx=$1
    local steps=$2
    local start_color=($3)
    local end_color=($4)

    local r=$(( start_color[0] + ( (end_color[0] - start_color[0]) * idx / steps ) ))
    local g=$(( start_color[1] + ( (end_color[1] - start_color[1]) * idx / steps ) ))
    local b=$(( start_color[2] + ( (end_color[2] - start_color[2]) * idx / steps ) ))

    # Devuelve el color en formato ANSI
    echo -e "\033[38;2;${r};${g};${b}m"
}

# Colores RGB de inicio (azul) y final (rojo)
start_color=(0 0 255)   # Azul (RGB)
end_color=(255 0 0)     # Rojo (RGB)

# Texto a mostrar con el degradado
text=(
" ################################## "
"                                    "
"  #####   #######   ####    ##   ## "
" ##   ##   ##   #    ##     ###  ## "
" #         ## #      ##     #### ## "
"  #####    ####      ##     ## #### "
"      ##   ## #      ##     ##  ### "
" ##   ##   ##   #    ##     ##   ## "
"  #####   #######   ####    ##   ## "
"                                    "
" ################################## "
""
)

# Recorrer cada línea del texto
for line in "${text[@]}"; do
    # Definir el número de pasos como la longitud de la línea
    steps=${#line}

    # Recorrer cada carácter de la línea
    for (( i=0; i<${#line}; i++ )); do
        # Calcular el color interpolado usando la posición del carácter en la línea
        color=$(interpolate_color $i $steps "${start_color[*]}" "${end_color[*]}")
        # Imprimir el carácter con el color correspondiente
        echo -ne "${color}${line:i:1}"
    done
    # Imprimir un salto de línea y restablecer el color
    echo -e "\033[0m"
done



# OPCIONES
	echo -e "${CYAN}Seleccione una opción:${NC}"
	echo -e "${CYAN}A${NC}${BLUE})${NC} ${YELLOW}NMAP${NC}"
	echo -e "${CYAN}B${NC}${BLUE})${NC} ${YELLOW}Segunda${NC}"
	echo -e "${CYAN}C${NC}${BLUE})${NC} ${YELLOW}Tercera${NC}"
	echo -e "${CYAN}D${NC}${BLUE})${NC} ${YELLOW}Salir${NC}"

	# Leer la opción del usuario
	read -p "Elija una opción (A/B/C/D): " opcion

	# Convertir la opción a minúscula para que no importe si el usuario escribe en mayúscula o minúscula
	opcion=$(echo "$opcion" | tr '[:upper:]' '[:lower:]')

	# Manejar la opción elegida
	case $opcion in
	    a)
		echo -e "${CYAN}Ha seleccionado ${YELLOW}NMAP ${CYAN}opción.${NC}"
		sleep 3
		./$RUTA_SEIN/NMAP.sh
		;;
	    b)
		echo -e "${CYAN}Ha seleccionado la ${YELLOW}Segunda opción.${NC}"
		;;
	    c)
		echo -e "${CYAN}Ha seleccionado la ${YELLOW}Tercera opción.${NC}"
		;;
	    d)
		echo -e "${YELLOW}Saliendo...${NC}"
		exit 0
		;;
	    *)
		echo -e "${YELLOW}Opción no válida. Intente de nuevo.${NC}"
		;;
	esac
