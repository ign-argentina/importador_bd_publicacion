
CREATE OR REPLACE VIEW nomenclador.v_relieve_suelo AS
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
				         INNER JOIN nomenclador.clase ON (clase.id = 5)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 5)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 5)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 5)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 5)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 5);
GRANT ALL ON TABLE nomenclador.v_relieve_suelo TO admins;
GRANT ALL ON TABLE nomenclador.v_relieve_suelo TO readonly;
