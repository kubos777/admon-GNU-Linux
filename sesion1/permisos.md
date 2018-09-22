# Diplomado: Infraestructura de TI
## Módulo GNU/Linux


### SELinux


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



# Open Source & Software libre

## Open Source

El **Open Source** o código abierto, es una expresión con la cual se le conoce desarrollo libre y distribución de software.
Se enfoca más en los beneficios de acceso al código que en aspectos éticos o las libertades relevantes como es caso del **Sotware libre**. Lo ideal es compartir el código pero el *open source* no obliga a compartir el código.

## Software libre

El **Software libre o Free Software** es aquel software que respeta las cuatro libertades que la *Free Software Foundation(FSF)* establece:

-   La libertad de usar el programa, con cualquier propósito.
-   La libertad de estudiar cómo funciona el programa y modificarlo, adaptándolo a tus necesidades.
-   La libertad de distribuir copias del programa, con lo cual puedes ayudar a tu prójimo.
-   La libertad de mejorar el programa y hacer públicas esas mejoras a los demás, de modo que toda la comunidad se beneficie.
