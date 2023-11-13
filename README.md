# Práctica-01-05-iaw
## En esta práctica vamos a usar una máquina de ubuntu en la que vamos a aprender a usar let´s encrypt y Cerbot.Para ello primero creamos nuestra máquina de ubuntu en Amazon.

### Una vez que tenemos ya la máquina le instalamos y configuramos un sitio web mediante un script que hemos usado anteriormente el install_lamp, que paso por paso es este:

#### Muestra todos los comandos que se van ejecutando
~~~
set -ex
~~~
#### Actualizamos los repositorios
~~~
apt update
~~~
#### Actualizamos los paquetes
~~~
apt upgrade -y
~~~
#### Instalamos el servidor web Apache
~~~
apt install apache2 -y
~~~
#### Instalamos e sistema gestor de base de datos de mysql
~~~
apt install mysql-server -y
~~~
~~~
mysql -u $DB_USER -p $DP_PASSWD < .../sql/database.sql
~~~
#### Instalamos  PHP
~~~
apt install php libapache2-mod-php php-mysql -y
~~~
#### Reiniciamos el servicio Apache
~~~
systemctl restart apache2
~~~
#### Modificamos el propietario y el grupo del directorio /var/www/html
~~~
chown -R www-data:www-data /var/www/html
~~~
### Después tenemos que registrar un nombre de dominio que para ello vamos a usar la página de No-IP

### Ahora instalaremos y configuraremos nuestro cliente ACME Cerbot, para ello creamos este script paso por paso para hacerlo:

#### Muestra todos los comandos que se van ejecutando 
~~~
set -ex
~~~
#### Actualizamos los repositorios 
~~~
apt update 
~~~
#### Actualizamos los paquetes 
~~~
apt upgrade -y
~~~
#### Importamos el archivo de variables .env
~~~
source .env
~~~
#### Instalamos y actualizamos aquí 
~~~
snap install core 
snap refresh core
~~~
#### Eliminamos cualquier instalación previa de cerbot con apt
~~~
apt remove certbot
~~~
#### Instalamos la aplicación de cerbot 
~~~
snap install --classic certbot 
~~~
#### Creamos un alias para la aplicación 
~~~
ln -fs /snap/bin/certbot /usr/bin/certbot
~~~
#### Ejecutamos el comando cerbot 
~~~
certbot --apache -m $CERTIFICATE_EMAIL --agree-tos --no-eff-email -d $CERTIFICATE_DOMAIN --non-interactive
~~~
### Y ya tendriamos nuestro certificado creado por cerbot
