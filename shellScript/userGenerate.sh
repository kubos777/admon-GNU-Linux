
usuarios=( `cat "usuarios.txt" `)
IFS=':' read -ra usrs <<< "$usuarios"    #Convirtiendo cadena a arreglo

#Para borrar los usuarios
#for nuevousuario in "${usrs[@]}"; do
#    deluser $nuevousuario
#done

#Asignando la constraseña
for nuevousuario in "${usrs[@]}"; do
    #Se genera la constraseña aleatoria
    randompw=$(openssl rand -base64 12)
    #Agregamos el usuario
    useradd $nuevousuario
    #Le asignamos la contraseña
    echo $nuevousuario:$randompw | chpasswd
    #Éxito!
    echo "ID de usuario: " $nuevousuario ", se creo con la contraseña: " $randompw
done
