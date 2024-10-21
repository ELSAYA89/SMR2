#!/bin/bash

#Shift + TAB para eliminar espaciado


# Limpiar pantalla antes de ejecutar el resto del script
clear



# VARIABLES



# COLORES
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



# ASCII ARCOIRIS
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
" ##   ##  ##   ##    ##     ######  "
" ###  ##  ### ###   ####     ##  ## "
" #### ##  #######  ##  ##    ##  ## "
" ## ####  #######  ##  ##    #####  "
" ##  ###  ## # ##  ######    ##     "
" ##   ##  ##   ##  ##  ##    ##     "
" ##   ##  ##   ##  ##  ##   ####    "
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


echo -e "${BOLD_RED}1. Escaneo Básico${NC}"
echo -e "${YELLOW}Escanea un solo host o dirección IP.${NC}"
echo -e "${BLUE}nmap 192.168.1.1${NC}"
echo -e ""
echo -e "${BOLD_RED}2. Escaneo de un Rango de IPs${NC}"
echo -e "${YELLOW}Escanea un rango de direcciones IP.${NC}"
echo -e "${BLUE}nmap 192.168.1.1-100${NC}"
echo -e "${YELLOW}También se puede usar CIDR:"
echo -e "${BLUE}nmap 192.168.1.0/24"
echo -e ""
echo -e "${BOLD_RED}3. Escaneo de Puertos Específicos${NC}"
echo -e "${YELLOW}Escanea un rango de puertos en un host.${NC}"
echo -e "${BLUE}nmap -p 80,443 <IP>${NC}"
echo -e "${YELLOW}Para escanear un rango de puertos:"
echo -e "${BLUE}nmap -p 1-1000 <IP>"
echo -e ""
echo -e "${BOLD_RED}4. Escaneo Rápido${NC}"
echo -e "${YELLOW}Realiza un escaneo rápido de los 100 puertos más comunes.${NC}"
echo -e "${BLUE}nmap -F <IP>${NC}"
echo -e ""
echo -e "${BOLD_RED}5. Detección de Sistema Operativo${NC}"
echo -e "${YELLOW}Identifica el sistema operativo del objetivo.${NC}"
echo -e "${BLUE}nmap -O <IP>${NC}"
echo -e "Nota: Se requieren privilegios de root para este tipo de escaneo."
echo -e ""
echo -e ${BOLD_RED}"6. Detección de Servicios y Versiones${NC}"
echo -e "${YELLOW}Intenta identificar los servicios y sus versiones que se están ejecutando en los puertos abiertos.${NC}"
echo -e "${BLUE}nmap -sV <IP>${NC}"
echo -e ""
echo -e "${BOLD_RED}7. Escaneo de Red Completa${NC}"
echo -e "${YELLOW}Escanea toda una subred para encontrar dispositivos activos.${NC}"
echo -e "${BLUE}nmap -sn 192.168.1.0/24${NC}"
echo -e "${YELLOW}Este comando simplemente muestra qué hosts están activos en la red, sin realizar un escaneo de puertos."
echo -e ""
echo -e "${BOLD_RED}8. Escaneo Sigiloso (TCP SYN Scan)${NC}"
echo -e "${YELLOW}Realiza un escaneo SYN que es menos detectable por algunos firewalls.${NC}"
echo -e "${BLUE}nmap -sS <IP>${NC}"
echo -e ""
echo -e "${BOLD_RED}9. Escaneo de Puertos UDP${NC}"
echo -e "${YELLOW}Escanea puertos UDP, que suelen ser más lentos de escanear.${NC}"
echo -e "${BLUE}nmap -sU <IP>${NC}"
echo -e ""
echo -e "${BOLD_RED}10. Guardar Resultados en un Archivo${NC}"
echo -e "${YELLOW}Guarda los resultados del escaneo en un archivo.${NC}"
echo -e "${BLUE}nmap -oN resultado.txt <IP>${NC}"
echo -e "${YELLOW}También puedes guardar en formato XML:"
echo -e "${BLUE}nmap -oX resultado.xml <IP>"
echo -e ""
echo -e "${BOLD_RED}11. Escaneo Agresivo${NC}"
echo -e "${YELLOW}Realiza un escaneo detallado con detección de versión, escaneo de scripts y descubrimiento de sistema operativo.${NC}"
echo -e "${BLUE}nmap -A <IP>${NC}"
