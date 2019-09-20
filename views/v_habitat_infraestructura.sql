
CREATE OR REPLACE VIEW nomenclador.v_habitat_infraestructura AS
SELECT 2 AS clase,
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
				   FROM cultura_y_religion
				         INNER JOIN nomenclador.clase ON (clase.id = 2)
 UNION 
SELECT 2 AS clase,
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
				   FROM economia_y_comercio
				         INNER JOIN nomenclador.clase ON (clase.id = 2)
 UNION 
SELECT 2 AS clase,
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
				   FROM puntos_de_asentamientos_y_edificios
				         INNER JOIN nomenclador.clase ON (clase.id = 2)
 UNION 
SELECT 2 AS clase,
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
				   FROM puntos_de_ciencia_y_educacion
				         INNER JOIN nomenclador.clase ON (clase.id = 2)
 UNION 
SELECT 2 AS clase,
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
				   FROM puntos_de_equipamiento
				         INNER JOIN nomenclador.clase ON (clase.id = 2)
 UNION 
SELECT 2 AS clase,
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
				   FROM puntos_de_recreacion
				         INNER JOIN nomenclador.clase ON (clase.id = 2)
 UNION 
SELECT 2 AS clase,
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
				   FROM salud
				         INNER JOIN nomenclador.clase ON (clase.id = 2)
 UNION 
SELECT 2 AS clase,
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
				   FROM areas_de_asentamientos_y_edificios
				         INNER JOIN nomenclador.clase ON (clase.id = 2)
 UNION 
SELECT 2 AS clase,
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
				   FROM areas_de_ciencia_y_educacion
				         INNER JOIN nomenclador.clase ON (clase.id = 2)
 UNION 
SELECT 2 AS clase,
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
				   FROM areas_de_equipamiento
				         INNER JOIN nomenclador.clase ON (clase.id = 2)
 UNION 
SELECT 2 AS clase,
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
				   FROM areas_de_recreacion
				         INNER JOIN nomenclador.clase ON (clase.id = 2)
 UNION 
SELECT 2 AS clase,
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
				   FROM area_protegida
				         INNER JOIN nomenclador.clase ON (clase.id = 2);
GRANT ALL ON TABLE nomenclador.v_habitat_infraestructura TO admins;
GRANT ALL ON TABLE nomenclador.v_habitat_infraestructura TO readonly;
