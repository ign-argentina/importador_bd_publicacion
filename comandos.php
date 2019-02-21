<?php
/****************************************************
Genera el listado de comandos para importar SHP
a la base de datos de publicación
Además de este script, se requiere un archivo
config.php, un directorio llamado tmp, otro
llamado create_tables y un tercero llamado
SHPs.
- config.php: archivo de configuración
- tmp: directorio temporal donde guardar archivos
- create_tables: directorio donde persisten los
                 archivos de creación de tablas
                 (para evitar eliminar una tabla
                 creada en corridas previas)
- SHPs: directorio donde estarán los subdirectorios,
        cada uno con sus respectivos archivos SHP
****************************************************/
require_once 'config.php';

$aDatos = array();

if ($sSistemaOperativo == 'windows') {
	$sBashComentario = 'REM';
    $sComandosIniciales = 'chcp 65001';
    $sEnvVar = 'SET';
    $sCopy = 'copy';
    $sDirSep = "\\";
    $sEnvQuotes = "";
} elseif ($sSistemaOperativo == 'linux') {
	$sBashComentario = '#';
	$sComandosIniciales = '';
    $sEnvVar = 'export';
    $sCopy = 'cp';
    $sDirSep = '/';
    $sEnvQuotes = "\"";
} else {
	die('Falta indicar el sistema operativo');
}

//Vistas para el nomenclador
$aClases = array();
$aClases[1] = 'v_geodesia_demarcacion';
$aClases[2] = 'v_habitat_infraestructura';
$aClases[3] = 'v_hidrografia_oceanografia';
$aClases[4] = 'v_industria_servicios';
$aClases[5] = 'v_relieve_suelo';
$aClases[6] = 'v_transporte';
$aClases[7] = 'v_vegetacion';

echo '
'.$sComandosIniciales.'

'.$sBashComentario.' Crear variable entorno password
'. $sEnvVar.' PGPASSWORD='.$sEnvQuotes.$sDBPsw.$sEnvQuotes.'

'.$sBashComentario.' Extension para UUID
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "CREATE EXTENSION IF NOT EXISTS \\"uuid-ossp\\""

'.$sBashComentario.' Extension para busquedas en texto
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "CREATE EXTENSION IF NOT EXISTS \\"fuzzystrmatch\\""
';

foreach ($aClases as $sVista) {

	echo '
'.$sBashComentario.' Eliminar vista
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "DROP VIEW public.'.$sVista.'"
';

}

if ($gestor = opendir('SHPs')) {
	
	while (false !== ($entrada = readdir($gestor))) { //Recorre el directorio SHPs
		
		if ($entrada != '.' && $entrada != '..' && is_dir('SHPs'.$sDirSep.$entrada) && ($gestor2 = opendir('SHPs'.$sDirSep.$entrada))) {
			
			while (false !== ($entrada2 = readdir($gestor2))) { //Recorre los subdirectorios del directorio SHPs
				
				if (!is_dir('SHPs'.$sDirSep.$entrada.'/'.$entrada2) && preg_match('/.shp$/i', $entrada2)) { //Si encontro archivos SHP
					
					$sShp = $entrada.$sDirSep.$entrada2;
					$sTabla = nombreSHP2NombreTabla($entrada2); //Genera el nombre de la tabla a partir del nombre del SHP
					
					echo '
'.$sBashComentario.' Eliminar tabla
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "DROP TABLE '.$sTabla.'"
';

                    if (file_exists('create_tables/create_'.$sTabla.'.sql')) { //Si ya existe el script de creación de la tabla, lo utiliza
	
						echo '	
'.$sBashComentario.' Crear la tabla en BD
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -f create_tables'.$sDirSep.'create_'.$sTabla.'.sql
';

                    } else { //Si no existe el script de creacion de tabla, lo genera a partir del SHP
                        
                        echo '	
'.$sBashComentario.' Generar solo CREATE TABLE
'.$sBashComentario.' shp2pgsql -s '.$iEPSGTransformation.' -t 3DZ -p "SHPs'.$sDirSep.$sShp.'" '.$sTabla.' > tmp'.$sDirSep.'create_'.$sTabla.'.sql
shp2pgsql -t 3DZ -p "SHPs'.$sDirSep.$sShp.'" '.$sTabla.' > tmp'.$sDirSep.'create_'.$sTabla.'.sql
'.$sCopy.' tmp'.$sDirSep.'create_'.$sTabla.'.sql create_tables'.$sDirSep.'create_'.$sTabla.'.sql

'.$sBashComentario.' Crear la tabla en BD
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -f tmp'.$sDirSep.'create_'.$sTabla.'.sql
';

                    }

					echo '
'.$sBashComentario.' Permisos sobre la tabla';
                    foreach ($aDBGrantUsers as $sGrantUser) { //Recorre el vector de usuarios y le asigna permisos sobre la tabla creada
                        echo '
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "GRANT ALL ON TABLE public.'.$sTabla.' TO '.$sGrantUser.'"';
                    }

                    echo '
'.$sBashComentario.' Agregar columna centroide
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "SELECT AddGeometryColumn(\'\',\''.$sTabla.'\',\'centroide\',\''.$iEPSGTransformation.'\',\'POINT\',2)"

'.$sBashComentario.' Agregar columna UUID
'.$sBashComentario.' psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "ALTER TABLE '.$sTabla.' ADD COLUMN globalid uuid DEFAULT uuid_generate_v4()"

'.$sBashComentario.' Generar solo INSERT
'.$sBashComentario.' shp2pgsql -s '.$iEPSGTransformation.' -t 3DZ -a "SHPs'.$sDirSep.$sShp.'" '.$sTabla.' > tmp'.$sDirSep.'insert_'.$sTabla.'.sql
shp2pgsql -t 3DZ -a "SHPs'.$sDirSep.$sShp.'" '.$sTabla.' > tmp'.$sDirSep.'insert_'.$sTabla.'.sql

'.$sBashComentario.' Ejecutar INSERT
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -f tmp'.$sDirSep.'insert_'.$sTabla.'.sql

'.$sBashComentario.' Transforma la geometria a EPSG '.$iEPSGTransformation.'
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "UPDATE '.$sTabla.' set geom = ST_Transform(geom, '.$iEPSGTransformation.')"

'.$sBashComentario.' Calcular el centroide
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "UPDATE '.$sTabla.' set centroide = ST_Centroid(geom)"

'.$sBashComentario.' Calcular el centroide
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "UPDATE '.$sTabla.' set centroide = ST_Centroid(geom)"

'.$sBashComentario.' Crear un indice espacial
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "CREATE INDEX '.$sTabla.'_gix ON '.$sTabla.' USING GIST (geom)"

'.$sBashComentario.' Crear trigger para calcular centroide
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "CREATE TRIGGER '.$sTabla.'_centroide_trigger AFTER INSERT ON public.'.$sTabla.' FOR EACH ROW EXECUTE PROCEDURE public.calcular_centroide()"

'.$sBashComentario.' Crear indices de búsqueda
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "SELECT crear_indice_para_busqueda_por_texto(\''.$sTabla.'\')"

'.$sBashComentario.' Ejecutar VACUUM y ANALYZE
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "VACUUM ANALYZE '.$sTabla.'"
';

				}
				
			}
			
		closedir($gestor2);
		
		}
		
	}
	
	closedir($gestor);
}

foreach ($aClases as $sVista) { //Crea las vistas para el nomenclador

	echo '
'.$sBashComentario.' Crear vista
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -f views\\'.$sVista.'.sql
';

}

echo '
'.$sBashComentario.' Eliminar variable entorno password
'.$sEnvVar.' PGPASSWORD=
';


function nombreSHP2NombreTabla($sSHP) {
	
	$string = str_replace(' ', '_', $sSHP);
	$string = strtolower($string);
	$string = str_replace('.shp', '', $string);
	
	$string = trim($string);
 
    $string = str_replace(
        array('á', 'à', 'ä', 'â', 'ª', 'Á', 'À', 'Â', 'Ä'),
        array('a', 'a', 'a', 'a', 'a', 'A', 'A', 'A', 'A'),
        $string
    );
 
    $string = str_replace(
        array('é', 'è', 'ë', 'ê', 'É', 'È', 'Ê', 'Ë'),
        array('e', 'e', 'e', 'e', 'E', 'E', 'E', 'E'),
        $string
    );
 
    $string = str_replace(
        array('í', 'ì', 'ï', 'î', 'Í', 'Ì', 'Ï', 'Î'),
        array('i', 'i', 'i', 'i', 'I', 'I', 'I', 'I'),
        $string
    );
 
    $string = str_replace(
        array('ó', 'ò', 'ö', 'ô', 'Ó', 'Ò', 'Ö', 'Ô'),
        array('o', 'o', 'o', 'o', 'O', 'O', 'O', 'O'),
        $string
    );
 
    $string = str_replace(
        array('ú', 'ù', 'ü', 'û', 'Ú', 'Ù', 'Û', 'Ü'),
        array('u', 'u', 'u', 'u', 'U', 'U', 'U', 'U'),
        $string
    );
 
    $string = str_replace(
        array('ñ', 'Ñ', 'ç', 'Ç'),
        array('n', 'N', 'c', 'C',),
        $string
    );
 
    //Esta parte se encarga de eliminar cualquier caracter extraño
    $string = str_replace(
        array('º', '-', '~',
             '#', '@', '|', '!', '"',
             '·', '$', '%', '&', '/',
             '(', ')', '?', '\'', '¡',
             '¿', '[', '^', '<code>', ']',
             '+', '}', '{', '¨', '´',
             '>', '< ', ';', ',', ':'),
        '',
        $string
    );
	
	return $string;
}

die;
