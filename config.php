<?php

//Datos de conexion a la base de datos
$sDBHost = '127.0.0.1';
$sDBName = 'dbname';
$sDBUsr = 'usrname';
$sDBPsw = 'psw';

//Usuarios que deben estar asignados a las tablas
$aDBGrantUsers = array();
$aDBGrantUsers[] = 'postgres';
$aDBGrantUsers[] = 'role_readonly';
$aDBGrantUsers[] = 'role_operator';

//EPSG al cual se desea transformar las geometrias
$iEPSGTransformation = 4326;

//Sistema operativo (opciones = windows o linux)
$sSistemaOperativo = 'linux';
