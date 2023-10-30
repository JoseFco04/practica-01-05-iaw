#!/bin/bash

# Muestra todos los comandos que se van ejecutando 
set -ex

# Actualizamos los repositorios 
apt update 

# Actualizamos los paquetes 
# apt upgrade -y

# Importamos el archivo de variables .env
source .env

