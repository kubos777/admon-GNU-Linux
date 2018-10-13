# Diplomado: Infraestructura de TI
## Módulo GNU/Linux

## Logical Volume Manager(LVM)

### Creación de un LVM

**X** -> representa el disco añadido, puede ser b,c,d...
**Y** -> representa el disco añadido a expander, puede ser c,d,f...

 1. Crear o insertar un nuevo disco físico
 2. Crear una partición que utilice todo el espacio del disco con:
	 `$ sudo fstab /dev/sdX`
 3. Indicamos qué volumen físico vamos a utilizar con: 	 
	  `$ sudo pvcreate /dev/sdX1`
  4. Creamos un grupo para el LVM:
	  `$ sudo vgcreate respaldo /dev/sdX1`
 5. Creamos el volumen lógico, dándole un nombre e indicando el grupo:
	  `$ sudo lvcreate -L 5G -n musica respaldo`
  6. Le damos un sistema de archivos al volumen lógico creado: 
  `	$ sudo mkfs.ext4 /dev/respaldo/musica`

#### Expandiendo LVM

1. Ya contando con nuestro **LVM** creado:
	-  Añadir un nuevo disco y  crearle una partición con:
		- `$ sudo fdisk /dev/sdY`
	  - Indicar a qué disco se va a a expander: 
		 - `$ sudo vgextend respaldo /dev/sdY1`
	  - Indicamos qué volumen lógico y cuánto espacio vamos a expandir:
		  - `$ sudo lvextend -L +2G /dev/respaldo/musica`
	  - Le asignamos un sistema de archivos:
		   - `$ sudo mkfs.ext4 /dev/respaldo/musica`
	 - Montamos la partición:  
		  - `$ sudo mount /dev/respaldo/musica /home/$USER/LVMPRUEBA/ `

#### Decreciendo LVM 

 1. Ya contando con nuestro **LVM** creado:
	  - Verificamos que nuestro volumen físico esté correcto con: 
		 - `$ sudo e2fsck -ff /dev/respaldo/musica`
	  - Primero tenemos que reducir el sistema de archivos con:
		  - `$ sudo resize2fs /dev/respaldo/musica 2G`
	  - Ahora hay que reducir el volumen lógico:
		   - `$ sudo lvreduce -L -2G /dev/respaldo/musica`
	 - Para ver que se realizó correctamente la reducción utilizamos:  
		  - `$ sudo lvdisplay `
 Finalmente faltaría montar y probar nuestro LVM
