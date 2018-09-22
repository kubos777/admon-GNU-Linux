# Diplomado: Infraestructura de TI
## Módulo GNU/Linux


### Configuración de proyecto laravel 5.0.16

- Asignar permisos(DAC con el comando *chmod*) a **/var/www/html/proyecto**
- Cambiar permisos para el storage: **$sudo chmod -R 775 proyecto/storage **
- Crear la base de datos en mysql
- Cambiar la configuración de **.env** ubicado en **/var/www/html/proyecto**
	- Nos ayudará a configurar la base de datos, correo etc.
- Para aplicar las migraciones de los modelos a esa base de datos:
	- Utilizando artisan: **$php artisan migrate**
- Cambiar los permisos de administración **$sudo chown -R admin:apache /var/www/html/proyecto**
- Configurar **/etc/httpd/conf/httpd.conf** y permitir el **AllowOverride  All** para permitir las *pretty urls*
- Reiniciar el servicio **$sudo systemctl restart httpd**
- Desactivar o cambiar los permisos SELinux:
	- Para desactivar **$sudo setenforce 0**
	- Para cambiar configurar y los permisos(MAC)
		- **$sudo semanage fcontext -a -t httpd_sys_content_t /var/www/html/proyecto**
		- **$sudo restorecon -RvF**
		- **$sudo semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/proyecto/(/.*)"**
		- **$sudo restorecon -RvF /var/www/html/proyecto**  
-  Finalmente reiniciamos el servicio:
	- **$sudo systemctl restart httpd **


### Configurar envío de correos

 1. En el archivo *.env* configurar las siguientes variables:
	MAIL_DRIVER=smtp
	MAIL_HOST=smtp.gmail.com
	MAIL_PORT=587
	MAIL_USERNAME= *correoelectrónicodegmail*
	MAIL_PASSWORD=*passworddelcorreodegmail*
 2. En el archivo *mail.php* ubicado en **/var/www/html/proyecto/config/** configurar **addres** y **name** ya que esta como *null*, además de colocar también el MAIL_HOST.
 3. En cuanto a Gmail, hay que acceder y permitir el acceso a [aplicaciones menos seguras](https://myaccount.google.com/lesssecureapps)
 4. Finalmente debemos cambiar los contextos:
	 - Para permitir conexiones a redes mediante sockets:
		 - **$sudo setsebool -P httpd_can_network_connect on**
	- Para permitir la salida de correos electrónicos:
		- **$sudo setsebool -P httpd_can_sendmail on**
