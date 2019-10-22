# Importador base de datos de publicación

Scripts de importación desde archivos Shape hacia base de datos de publicación.

## Uso

  - Editar el archivo de configuración `config.php`
  - Ejecutar el script PHP `comandos.php`


### Edición de archivo de configuración `config.php`

El archivo de configuración contiene los datos necesarios para que el script pueda conectarse a la base de datos y pueda realizar la importación de los mismos desde archivos Shape hacia la base de datos PostgreSQL.
Los parámetros de configuración son:

- sDBHost: host name o dirección IP del servidor de base de datos
- sDBName: nombre de la base de datos
- sDBUsr: usuario de conexión a la base de datos
- sDBPsw: contraseña de conexión a la base de datos
- aDBGrantUsers: vector con el listado de roles y usuarios a los cuales se le asignaran permisos sobre las tablas creadas
- sDirectorioSHPs: path donde se encuentran los archivos Shape a importar. Los archivos Shape deben estar dentro de directorios que indican el esquema de la base de datos donde se importarán como tablas y, dentro del esquema, en directorios que indican a qué espacio de trabajo corresponden. Un ejemplo de ubicación típica de un archivo Shape es: `shp/public/transporte/aeropuertos.shp`
- iEPSGTransformation: sistema de coordenadas al cual se desean transformar los datos geométricos
- sSistemaOperativo: sistema operativo donde se ejecuta el script PHP


### Ejecución de script PHP `comandos.php`

El script arroja por salida estándar los comandos bash correspondientes a la importación, por lo tanto, para ejecutarlo se debe capturar esa salida en un archivo bash:

```
php -f comandos.php > comandos.sh
```

Una vez generado el archivo bash, será al ejecutarlo que se realice la importación efectivamente.
