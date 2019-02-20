# Importador base de datos de publicación

Scripts de importación desde geodatabase hacia base de datos de publicación.

### Descripción de scripts:

  - comandos.php: toma los archivos dentro del directorio SHPs y los importa a la base de datos de publicación.
  - genera_tablas_sig.php: genera las tablas "lindas" a partir de las tablas importadas con el script "comandos.php". La estructura de datos necesaria se encuentra en "tablas_sig.backup".

### Todo

 - Autodectar el sisitema operativo en comandos.php (y generar comandos correspondientes al sistema operativo).
 - Mejorar el listado de tablas a procesar en genera_tablas_sig.php (reemplazar el vector $aTablas).
