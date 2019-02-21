
CREATE OR REPLACE VIEW public.v_geodesia_demarcacion AS
SELECT 1 AS clase,
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
				   FROM linea_de_limite
				         LEFT JOIN clase ON (clase.id = 1)
 UNION 
SELECT 1 AS clase,
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
				   FROM area_de_limites
				         LEFT JOIN clase ON (clase.id = 1);
GRANT ALL ON TABLE public.v_geodesia_demarcacion TO postgres;
GRANT ALL ON TABLE public.v_geodesia_demarcacion TO sig_readonly;
GRANT ALL ON TABLE public.v_geodesia_demarcacion TO sig_operator;