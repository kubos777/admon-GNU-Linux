# Diplomado: Infraestructura de TI
## Módulo GNU/Linux

## Referente a la tarea:


# Open Source & Software libre

## Open Source

El **Open Source** o código abierto, es una expresión con la cual se le conoce desarrollo libre y distribución de software.
Se enfoca más en los beneficios de acceso al código que en aspectos éticos o las libertades relevantes como es caso del **Sotware libre**. Lo ideal es compartir el código pero el *open source* no obliga a compartir el código.


# SSH (Secure Shell)

### Cambiando el puerto

Para cambiar el puerto primero crearemos una copia de seguridad del archivo:

 - **$ sudo cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.orig.$(date +%F)**

Ahora cambiaremos el puerto editando el archivo:

 - **$sudo nano /etc/ssh/sshd_config**        

Pondrémos el puerto 2222

Y reiniciaremos el servicio con el comando:

 - **$sudo systemctl restart sshd.service**

Al estar activados los permisos SELinux, **ssh** sólo nos permite tener el puerto 22, entonces para dar permisos aplicaremos el siguiente contexto indicando el puerto 2222:

 - **$sudo semanage port  -a  -t  ssh_port_t  -p  tcp  2222**

 Para comprobar si funciona podemos ejecutar el siguiente comando:

 - ** $ssh < ipdelequipo > -p 2222**

En caso de tener problemas con el *firewall* le asignamos los permisos correspondientes:

 - **$sudo firewall-cmd --permanent --zone=public --add-port=2222/tcp**

Reiniciamos el *firewall*:

 - **$sudo firewall-cmd  --reload**

Y comprobamos de nuevo.
