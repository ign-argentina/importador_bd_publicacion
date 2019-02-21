
CREATE OR REPLACE VIEW public.v_transporte AS
SELECT 6 AS clase,
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
				   FROM controles
				         LEFT JOIN clase ON (clase.id = 6)
 UNION 
SELECT 6 AS clase,
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
				   FROM infraestructura_de_transporte
				         LEFT JOIN clase ON (clase.id = 6)
 UNION 
SELECT 6 AS clase,
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
				   FROM lineas_de_cruces_y_enlaces
				         LEFT JOIN clase ON (clase.id = 6)
 UNION 
SELECT 6 AS clase,
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
				   FROM lineas_de_transporte_ferroviario
				         LEFT JOIN clase ON (clase.id = 6)
 UNION 
SELECT 6 AS clase,
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
				   FROM lineas_de_transporte_fluvial_lacustre_y_maritimo
				         LEFT JOIN clase ON (clase.id = 6)
 UNION 
SELECT 6 AS clase,
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
				   FROM puntos_de_cruces_y_enlaces
				         LEFT JOIN clase ON (clase.id = 6)
 UNION 
SELECT 6 AS clase,
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
				   FROM puntos_de_transporte_aereo
				         LEFT JOIN clase ON (clase.id = 6)
 UNION 
SELECT 6 AS clase,
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
				   FROM puntos_de_transporte_ferroviario
				         LEFT JOIN clase ON (clase.id = 6)
 UNION 
SELECT 6 AS clase,
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
				   FROM puntos_de_transporte_fluvial_lacustre_y_maritimo
				         LEFT JOIN clase ON (clase.id = 6)
 UNION 
SELECT 6 AS clase,
					clase.nombre AS clase_desc,
					globalid,
					entidad,
					objeto,
					geom,
					centroide,
					fna1::varchar as fna,
					gna1 as gna,
					nam1::varchar as nam,
					sag::varchar
				   FROM vial*
				         LEFT JOIN clase ON (clase.id = 6)
 UNION 
SELECT 6 AS clase,
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
				   FROM areas_de_transporte_aereo
				         LEFT JOIN clase ON (clase.id = 6)
 UNION 
SELECT 6 AS clase,
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
				   FROM areas_de_transporte_ferroviario
				         LEFT JOIN clase ON (clase.id = 6);
GRANT ALL ON TABLE public.v_transporte TO postgres;
GRANT ALL ON TABLE public.v_transporte TO sig_readonly;
GRANT ALL ON TABLE public.v_transporte TO sig_operator;