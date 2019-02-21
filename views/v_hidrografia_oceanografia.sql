
CREATE OR REPLACE VIEW public.v_hidrografia_oceanografia AS
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
				         LEFT JOIN clase ON (clase.id = 3)
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
				         LEFT JOIN clase ON (clase.id = 3)
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
				         LEFT JOIN clase ON (clase.id = 3)
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
				         LEFT JOIN clase ON (clase.id = 3)
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
				         LEFT JOIN clase ON (clase.id = 3)
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
				         LEFT JOIN clase ON (clase.id = 3)
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
				         LEFT JOIN clase ON (clase.id = 3)
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
				         LEFT JOIN clase ON (clase.id = 3)
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
				         LEFT JOIN clase ON (clase.id = 3)
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
				         LEFT JOIN clase ON (clase.id = 3)
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
				         LEFT JOIN clase ON (clase.id = 3)
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
				         LEFT JOIN clase ON (clase.id = 3);
GRANT ALL ON TABLE public.v_hidrografia_oceanografia TO postgres;
GRANT ALL ON TABLE public.v_hidrografia_oceanografia TO sig_readonly;
GRANT ALL ON TABLE public.v_hidrografia_oceanografia TO sig_operator;