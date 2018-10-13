#!/bin/bash
echo -e "Respaldando tu base de datos: "
usuario="root"
passwd="123qwe"
namedb="proyecto"
nombrefecha=$(date +"%d-%m-%Y_%H_%M")

mysqldump -u $usuario -p$passwd $namedb > $nombrefecha.sql
tar -czvf $nombrefecha.tar.gz $nombrefecha.sql
