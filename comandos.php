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
require_once 'LibStrings.php';
require_once 'LibDirs.php';
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

createDir('create_tables');
createDir('tmp');

echo '
'.$sComandosIniciales.'

'.$sBashComentario.' Crear variable entorno password
'. $sEnvVar.' PGPASSWORD='.$sEnvQuotes.$sDBPsw.$sEnvQuotes.'

'.$sBashComentario.' Extension para UUID
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "CREATE EXTENSION IF NOT EXISTS \\"uuid-ossp\\""

'.$sBashComentario.' Extension postgis para s$sDBName
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "CREATE EXTENSION IF NOT EXISTS \\"postgis\\""

'.$sBashComentario.' Extension para busquedas en texto
psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "CREATE EXTENSION IF NOT EXISTS \\"fuzzystrmatch\\""
';

$aEsquemas = Array(); //Vector con todos los esquemas que se utilizan en la importacion
$aEsquemas[] = "public";

if ($gestor = opendir($sDirectorioSHPs)) {
    
    while (false !== ($esquema = readdir($gestor))) { //Recorre el directorio SHPs (cada subdirectorio es un esquema)
        
		$sDirEsquema = $sDirectorioSHPs.$sDirSep.$esquema;
        if ($esquema != '.' && $esquema != '..' && is_dir($sDirEsquema) && ($gestor2 = opendir($sDirEsquema))) {
            
			if (!in_array($esquema, $aEsquemas)) {
				$aEsquemas[] = $esquema;
			}
			
			echo "\n".$sBashComentario.' Crear el esquema'
				 ."\n".'psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "CREATE SCHEMA '.$esquema.'"';
			
            while (false !== ($subclase = readdir($gestor2))) { //Recorre los subdirectorios de cada esquema (cada subdirectorio es una subclase)
			
				$sDirSubclase = $sDirEsquema.$sDirSep.$subclase;
				if ($subclase != '.' && $subclase != '..' && is_dir($sDirSubclase) && ($gestor3 = opendir($sDirSubclase))) {
					
					while (false !== ($archivo = readdir($gestor3))) { //Recorre los subdirectorios de cada subclase (cada subdirectorio contiene SHPs)
                
						$sShp = $sDirSubclase.$sDirSep.$archivo;
						if (!is_dir($sShp) && preg_match('/.shp$/i', $archivo)) { //Si encontro archivos SHP
                    
							$sTablaSoloNombre = nombreSHP2NombreTabla($archivo); //Genera el nombre de la tabla a partir del nombre del SHP
							$sTablaNombreAux = $esquema.'_'.$sTablaSoloNombre; //Concatena el nombre del esquema al nombre de la tabla (solo para utilización como nombre único)
							$sTabla = $esquema.'.'.$sTablaSoloNombre; //Concatena el nombre del esquema al nombre de la tabla (para llamar correctamente a toda la ruta de la tabla <esquema>.<tabla>)
							
							echo "\n".$sBashComentario." Eliminar tabla $sDBName\n" . 'psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "DROP TABLE '.$sTabla.'" '."\n";

							if (file_exists('create_tables/create_'.$sTabla.'.sql')) { //Si ya existe el script de creación de la tabla, lo utiliza
			
								echo "\n".$sBashComentario.' Crear la tabla en BD' . "\n".'psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -f create_tables'.$sDirSep.'create_'.$sTabla.'.sql'."\n";


							} else { //Si no existe el script de creacion de tabla, lo genera a partir del SHP
								
								echo "\n".$sBashComentario.' Generar solo CREATE TABLE'."\n".
						  $sBashComentario.' shp2pgsql -s '.$iEPSGTransformation.' -t 2D -p "'.$sShp.'" '.$sTabla.' > tmp'.$sDirSep.'create_'.$sTabla.'.sql'."\n".
						  'shp2pgsql -s '.$iEPSGTransformation.' -t 2D -p "'.$sShp.'" '.$sTabla.' > tmp'.$sDirSep.'create_'.$sTabla.'.sql'."\n".
						  $sCopy.' tmp'.$sDirSep.'create_'.$sTabla.'.sql create_tables'.$sDirSep.'create_'.$sTabla.'.sql'."\n\n".
						  $sBashComentario.' Crear la tabla en BD'."\n".'
						  psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -f tmp'.$sDirSep.'create_'.$sTabla.'.sql'."\n";

							}

							echo "\n".$sBashComentario.' Permisos sobre la tabla';
							echo "\n".'psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "ALTER TABLE '.$sTabla.' OWNER to '.$sDBOwner.'"';
							foreach ($aDBGrantUsers as $sGrantUser => $sPrivilege) { //Recorre el vector de usuarios y le asigna permisos sobre la tabla creada
								echo "\n".'psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "GRANT '.$sPrivilege.' ON TABLE '.$sTabla.' TO '.$sGrantUser.'"';
							}

							echo "\n".$sBashComentario.' Agregar columna centroide'
							."\n".'psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "SET search_path TO '.implode(',', $aEsquemas).'; SELECT AddGeometryColumn(\'\',\''.$sTablaSoloNombre.'\',\'centroide\',\''.$iEPSGTransformation.'\',\'POINT\',2);"'
							."\n"
							."\n".$sBashComentario.' Agregar columna UUID (Global ID)'
							."\n".$sBashComentario.' psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "ALTER TABLE '.$sTabla.' ADD COLUMN globalid uuid DEFAULT uuid_generate_v4()"'
							."\n"
							."\n".$sBashComentario.' Generar solo INSERT'
							."\n".$sBashComentario.' shp2pgsql -s SRS_Origen:SRS_destino -t 2D -a "'.$sShp.'" '.$sTabla.' > tmp'.$sDirSep.'insert_'.$sTabla.'.sql'
							."\n".'shp2pgsql -s '.$iEPSGTransformation.' -t 2D -a "'.$sShp.'" '.$sTabla.' > tmp'.$sDirSep.'insert_'.$sTabla.'.sql'
							."\n"
							."\n".$sBashComentario.' Ejecutar INSERT'
							."\n".'psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -f tmp'.$sDirSep.'insert_'.$sTabla.'.sql'
							."\n".$sBashComentario.' Transforma la geometria a EPSG '.$iEPSGTransformation." La transformación se debe hacer al momento de generar el insert"
							."\n".$sBashComentario.' psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "UPDATE '.$sTabla.' set geom = ST_Transform(geom, '.$iEPSGTransformation.')"'
							."\n".$sBashComentario.' Calcular el centroide'
							."\n".$sBashComentario.' psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "UPDATE '.$sTabla.' set centroide = ST_Centroid(geom)"'
							."\n"
							."\n".$sBashComentario.' Calcular el centroide'
							."\n".'psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "UPDATE '.$sTabla.' set centroide = ST_Centroid(geom)"'
							."\n"
							."\n".$sBashComentario.' Crear un indice espacial'
							."\n".'psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "CREATE INDEX '.$sTablaNombreAux.'_gix ON '.$sTabla.' USING GIST (geom)"'
							."\n"
							."\n".$sBashComentario.' Crear trigger para calcular centroide'
							."\n".$sBashComentario.' psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "CREATE TRIGGER '.$sTabla.'_centroide_trigger AFTER INSERT ON '.$sTabla.' FOR EACH ROW EXECUTE PROCEDURE public.calcular_centroide()"'
							."\n"
							."\n".$sBashComentario.' Crear indices de búsqueda'
							."\n".$sBashComentario.' psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "SELECT crear_indice_para_busqueda_por_texto(\''.$sTabla.'\')"'
							."\n"
							."\n".$sBashComentario.' Ejecutar VACUUM y ANALYZE'
							."\n".'psql -h '.$sDBHost.' -U '.$sDBUsr.' -d '.$sDBName.' -c "VACUUM ANALYZE '.$sTabla.'"'
							;
							
						}
						
					}
					
                }
                
            }
            
        closedir($gestor2);
        
        }
        
    }
    
    closedir($gestor);
}

echo '
'.$sBashComentario.' Eliminar variable entorno password
'.$sEnvVar.' PGPASSWORD=
';

die;
