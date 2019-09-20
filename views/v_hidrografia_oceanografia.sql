
CREATE OR REPLACE VIEW nomenclador.v_hidrografia_oceanografia AS
SELECT 3 AS clase,
					clase.nombre AS clase_desc,
					globalid,
					entidad,
					objeto,
					geom,
					centroide,
					fna::varchar,
					gna,
					nam::varchar,
					sag::varchar
				   FROM ayuda_a_la_navegacion
				         INNER JOIN nomenclador.clase ON (clase.id = 3)
 UNION 
SELECT 3 AS clase,
					clase.nombre AS clase_desc,
					globalid,
					entidad,
					objeto,
					geom,
					centroide,
					fna::varchar,
					gna,
					nam::varchar,
					sag::varchar
				   FROM lineas_de_aguas_continentales
				         INNER JOIN nomenclador.clase ON (clase.id = 3)
 UNION 
SELECT 3 AS clase,
					clase.nombre AS clase_desc,
					globalid,
					entidad,
					objeto,
					geom,
					centroide,
					fna::varchar,
					gna,
					nam::varchar,
					sag::varchar
				   FROM lineas_de_puertos_y_muelles
				         INNER JOIN nomenclador.clase ON (clase.id = 3)
 UNION 
SELECT 3 AS clase,
					clase.nombre AS clase_desc,
					globalid,
					entidad,
					objeto,
					geom,
					centroide,
					fna::varchar,
					gna,
					nam::varchar,
					sag::varchar
				   FROM lineas_de_zona_costera
				         INNER JOIN nomenclador.clase ON (clase.id = 3)
 UNION 
SELECT 3 AS clase,
					clase.nombre AS clase_desc,
					globalid,
					entidad,
					objeto,
					geom,
					centroide,
					fna::varchar,
					gna,
					nam::varchar,
					sag::varchar
				   FROM mareas_y_corrientes
				         INNER JOIN nomenclador.clase ON (clase.id = 3)
 UNION 
SELECT 3 AS clase,
					clase.nombre AS clase_desc,
					globalid,
					entidad,
					objeto,
					geom,
					centroide,
					fna::varchar,
					gna,
					nam::varchar,
					sag::varchar
				   FROM puntos_de_aguas_continentales
				         INNER JOIN nomenclador.clase ON (clase.id = 3)
 UNION 
SELECT 3 AS clase,
					clase.nombre AS clase_desc,
					globalid,
					entidad,
					objeto,
					geom,
					centroide,
					fna::varchar,
					gna,
					nam::varchar,
					sag::varchar
				   FROM puntos_de_obstrucciones
				         INNER JOIN nomenclador.clase ON (clase.id = 3)
 UNION 
SELECT 3 AS clase,
					clase.nombre AS clase_desc,
					globalid,
					entidad,
					objeto,
					geom,
					centroide,
					fna::varchar,
					gna,
					nam::varchar,
					sag::varchar
				   FROM puntos_de_puertos_y_muelles
				         INNER JOIN nomenclador.clase ON (clase.id = 3)
 UNION 
SELECT 3 AS clase,
					clase.nombre AS clase_desc,
					globalid,
					entidad,
					objeto,
					geom,
					centroide,
					fna::varchar,
					gna,
					nam::varchar,
					sag::varchar
				   FROM areas_de_aguas_continentales
				         INNER JOIN nomenclador.clase ON (clase.id = 3)
 UNION 
SELECT 3 AS clase,
					clase.nombre AS clase_desc,
					globalid,
					entidad,
					objeto,
					geom,
					centroide,
					fna::varchar,
					gna,
					nam::varchar,
					sag::varchar
				   FROM areas_de_obstrucciones
				         INNER JOIN nomenclador.clase ON (clase.id = 3)
 UNION 
SELECT 3 AS clase,
					clase.nombre AS clase_desc,
					globalid,
					entidad,
					objeto,
					geom,
					centroide,
					fna::varchar,
					gna,
					nam::varchar,
					sag::varchar
				   FROM areas_de_puertos_y_muelles
				         INNER JOIN nomenclador.clase ON (clase.id = 3)
 UNION 
SELECT 3 AS clase,
					clase.nombre AS clase_desc,
					globalid,
					entidad,
					objeto,
					geom,
					centroide,
					fna::varchar,
					gna,
					nam::varchar,
					sag::varchar
				   FROM areas_de_zona_costera
				         INNER JOIN nomenclador.clase ON (clase.id = 3);
GRANT ALL ON TABLE nomenclador.v_hidrografia_oceanografia TO admins;
GRANT ALL ON TABLE nomenclador.v_hidrografia_oceanografia TO readonly;
