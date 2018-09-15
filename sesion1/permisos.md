# Diplomado: Infraestructura de TI
## Módulo GNU/Linux


### SELinux


### Configuración de proyecto laravel 5.0.16

- Crear la base de datos en mysql
- Cambiar la configuración de **.env** ubicado en **/var/www/html/proyecto**
- Cambiar los permisos de administración **$chown -R admin:apache /var/www/html/proyecto**
- Configurar **/etc/httpd/conf/httpd.conf** y permitir el **AllowOverride  All**
- Reiniciar el servicio **$sudo systemctl restart httpd**
- Desactivar o cambiar los permisos SELinux **$sudo setenforce 0**
