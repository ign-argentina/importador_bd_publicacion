
CREATE OR REPLACE VIEW public.v_habitat_infraestructura AS
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
				         LEFT JOIN clase ON (clase.id = 2)
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
				         LEFT JOIN clase ON (clase.id = 2)
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
				         LEFT JOIN clase ON (clase.id = 2)
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
				         LEFT JOIN clase ON (clase.id = 2)
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
				   FROM puntos_de_defensa_y_seguridad
				         LEFT JOIN clase ON (clase.id = 2)
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
				         LEFT JOIN clase ON (clase.id = 2)
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
				         LEFT JOIN clase ON (clase.id = 2)
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
				         LEFT JOIN clase ON (clase.id = 2)
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
				         LEFT JOIN clase ON (clase.id = 2)
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
				         LEFT JOIN clase ON (clase.id = 2)
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
				   FROM areas_de_defensa_y_seguridad
				         LEFT JOIN clase ON (clase.id = 2)
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
				         LEFT JOIN clase ON (clase.id = 2)
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
				         LEFT JOIN clase ON (clase.id = 2);
GRANT ALL ON TABLE public.v_habitat_infraestructura TO postgres;
GRANT ALL ON TABLE public.v_habitat_infraestructura TO sig_readonly;
GRANT ALL ON TABLE public.v_habitat_infraestructura TO sig_operator;