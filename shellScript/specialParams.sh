#!/bin/bash

echo "Parámetros especiales"

while :
do

  echo -e '¿Qué parámetro quiéres probar? \n
  1)Parámetro especial $0
  2)Parámetro especial $*
  3)Parámetro especial $@
  4)Parámetro especial $#
  5)Parámetro especial $?
  6)Parámetro especial $$
  7)Parámetro especial $!
  Presiona S para salir\n
  Ingresa tú elección: '
  read opcion
  clear
  case $opcion in
  1)
    echo "Este parámetro contiene el nombre del script que se esta ejecutando"
    echo "El script en ejecución es: $0"
    ;;
  2)
    echo "Tiene el conjunto de todos los parámetros en un solo argumento"
    echo "Parámetros: $*"
    cont=1
    for parametro in "$*"; do
        echo "$parametro parámetro número $cont"
        let cont=cont+1
    done
    ;;
  3)
    cont=1
    echo "Contiene el conjunto de argumentos, un argumento por parámetro"
    echo "Parametros: $@"
    for parametro in "$@"; do
        echo "$parametro parámetro número $cont"
        let cont=cont+1
    done


    ;;
  4)
    echo 'Tiene el número de parámetros pasados al script'
    echo "Número de parámetros pasados al script $#"
    ;;
  5)
    echo 'Contiene el código de retorno del último comando'
    echo "El retorno del último comando es:  $?"
    ;;
  6)
    echo "El PID del shell que ejecuta el script es: $$ "
    ;;
  7)
  	echo "El PID del último proceso ejecutado en segundo plano es: $!"
    ;;
  S)
    echo '¡Hasta pronto :) !'
		break
    ;;
  s)
    echo '¡Hasta pronto :) !'
		break
		;;
	*)
		echo "¡Opción inválida, intenta de nuevo!"
		;;
  esac
done
echo
echo "¡ Bye bye !"
