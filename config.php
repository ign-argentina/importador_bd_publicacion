<?php

//Datos de conexion a la base de datos
$sDBHost = '127.0.0.1';
$sDBName = 'dbname';
$sDBUsr = 'postgres';
$sDBPsw = 'postgres*123';

//Usuarios que deben estar asignados a las tablas
$aDBGrantUsers = array();
$aDBGrantUsers[] = 'admins';
$aDBGrantUsers[] = 'readonly';

//Directorio donde se encuentran los archivos SHP.
//Existe una jerarquia, el primer nivel de directorios indica el esquema.
//El segundo nivel, indica la subclase
//Dentro del segundo nivel se encuentran los archivos SHP
$sDirectorioSHPs = '../shps';

//EPSG al cual se desea transformar las geometrias
$iEPSGTransformation = 4326;

//Sistema operativo (opciones = windows o linux)
$sSistemaOperativo = 'linux';
