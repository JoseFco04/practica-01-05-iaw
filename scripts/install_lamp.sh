#!/bin/bash

# Muestra todos los comandos que se van ejecutando
set -ex

# Actualizamos los repositorios
# apt update

# Actualizamos los paquetes

# apt upgrade -y

# instalamos el servidor web Apache
apt install apache2 -y

# Instalamos e sistema gestor de base de datos de mysql
apt install mysql-server -y

#mysql -u $DB_USER -p $DP_PASSWD < .../sql/database.sql

# Instalamos  PHP
apt install php libapache2-mod-php php-mysql -y

# Reiniciamos el servicio Apache
systemctl restart apache2

# Modificamos el propietario y el grupo del directorio /var/www/html

chown -R www-data:www-data /var/www/html
