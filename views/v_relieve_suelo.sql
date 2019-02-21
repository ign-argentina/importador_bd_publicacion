
CREATE OR REPLACE VIEW public.v_relieve_suelo AS
SELECT 5 AS clase,
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
				   FROM lineas_de_geomorfologia
				         LEFT JOIN clase ON (clase.id = 5)
 UNION 
SELECT 5 AS clase,
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
				   FROM lineas_de_glaciologia
				         LEFT JOIN clase ON (clase.id = 5)
 UNION 
SELECT 5 AS clase,
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
				   FROM puntos_de_geomorfologia
				         LEFT JOIN clase ON (clase.id = 5)
 UNION 
SELECT 5 AS clase,
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
				   FROM puntos_de_glaciologia
				         LEFT JOIN clase ON (clase.id = 5)
 UNION 
SELECT 5 AS clase,
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
				   FROM areas_de_geomorfologia
				         LEFT JOIN clase ON (clase.id = 5)
 UNION 
SELECT 5 AS clase,
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
				   FROM areas_de_glaciologia
				         LEFT JOIN clase ON (clase.id = 5);
GRANT ALL ON TABLE public.v_relieve_suelo TO postgres;
GRANT ALL ON TABLE public.v_relieve_suelo TO sig_readonly;
GRANT ALL ON TABLE public.v_relieve_suelo TO sig_operator;