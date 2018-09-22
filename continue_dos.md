# Diplomado: Infraestructura de TI
## Módulo GNU/Linux

## Configuración de servidor NGINX

 1. Instalación de NGINX:
	- Para instalar NGINX debemos ejecutar el siguiente comando:
		- **$ sudo yum install nginx -y**
	- Para iniciar el servicio corremos:
		- **$ sudo systemctl start nginx**
	- Para habilitar el servicio:
		- **$ sudo systemctl enable nginx**
	- Ahora cambiaremos el puerto de salida, ya que nuestro servidor también cuenta con el servicio de *Apache* y este sale por el puerto 80. Usaremos el puerto 8080 editando el archivo */etc/nginx/nginx.conf* y buscaremos los guiente:
	~~~    
	server {
	listen       8080 default_server;
	listen       [::]:8080 default_server;
	.
	.
	~~~
	-  Para este ejercicio instalaremos y configuraremos php7 para que funcione correctamente con NGINX:
		- Si tenemos una version antigua de php:
			- **$ sudo yum remove php**
		- Si queremos actualizar php:
			-  **$ wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm**
			- **$ sudo rpm -Uvh remi-release-7.rpm**
			- Habilitamos los repositorios para php71:
				- **$ sudo yum install yum-utils -y**
				- **$ sudo yum-config-manager --enable remi-php71**
			- Instalando php71:
				- **$ sudo yum --enablerepo=remi,remi-php71 install php-fpm php-common**
			- Instalando paquetes adicionales:
				- **$ sudo yum --enablerepo=remi,remi-php71 install php-opcache php-pecl-apcu php-cli php-pear php-pdo php-mysqlnd php-pgsql php-pecl-mongodb php-pecl-redis php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml**
			- Creando el archivo de configuración */etc/nginx/conf.d/default.conf*:
			~~~
			server {
			listen   8080;
			server_name  ip_del_servidor
			# note that these lines are originally from the "location /" block
			root   /usr/share/nginx/html;
			index index.php index.html index.htm;
			location / {
			try_files $uri $uri/ =404;
			}
		    error_page 404 /404.html;
		    error_page 500 502 503 504 /50x.html;
		    location = /50x.html {
		        root /usr/share/nginx/html;
		    }

		    location ~ \.php$ {
		        try_files $uri =404;
		        fastcgi_pass unix:/var/run/php-fpm/php-fpm.sock;
		        fastcgi_index index.php;
		        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
		        include fastcgi_params;
		    }
			}			
		- Reiniciamos el servicio de NGINX
			- **$ sudo systemctl restart nginx**
		- Finalmente debemos configurar el archivo */etc/php-fpm.d/www.conf* editando los siguientes parámetros:
			~~~
			user = apache cambiar a  user = nginx
			group = apache cambiar a group = nginx
			isten.owner = nobody cambiar a listen.owner = nginx
			listen.group = nobody cambiar a listen.group = nginx

			Y debajo de la línea: listen = 127.0.0.1:9000  agregar:
				listen = /var/run/php-fpm/php-fpm.sock

		- Para observar los cambios habilitamos e iniciamos el servicio de *php-fpm*:
			- **$ systemctl start php-fpm.service**
			- **$ systemctl enable php-fpm.service**
2. El código para probar lo alojaremos en */usr/share/nginx/html* como **index.php**:
	~~~
	<?php
	echo "Hola mundo";
	echo phpinfo();
	?>



  # Configurar SQUID con DANSGUARDIAN

  1. Primero actualizaremos los repositorios:
  	- **$ sudo yum update -y**
  2. Instalando *Squid*
  	- **$ sudo yum install squid**
  	- Para verificar la versión de *Squid* que instalamos **$ squid -v**
  3. Configurando el archivo */etc/squid/squid.conf*:
  	- Hay que agregar dos listas de control de acceso(ACL[Acces Control List]):
  		- **$ acl localhost src 127.0.0.1/32**
  		- **$ acl localnet src IP-TU-HOST/24 **
  - Continuará...
  - 
