#!/bin/bash

# Muestra todos los comandos que se van ejecutando 
set -ex

# Actualizamos los repositorios 
apt update 

# Actualizamos los paquetes 
apt upgrade -y

# Importamos el archivo de variables .env
source .env

# Instalamos y actualizamos aquí 
snap install core 
snap refresh core

# Eliminamos cualquier instalación previa de cerbot con apt
apt remove certbot

# Instalamos la aplicación de cerbot 
snap install --classic certbot 

# Creamos un alias para la aplicación 
ln -fs /snap/bin/certbot /usr/bin/certbot

# Ejecutamos el comando cerbot 
certbot --apache -m $CERTIFICATE_EMAIL --agree-tos --no-eff-email -d $CERTIFICATE_DOMAIN --non-interactive