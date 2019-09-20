
CREATE OR REPLACE VIEW nomenclador.v_transporte AS
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
				         INNER JOIN nomenclador.clase ON (clase.id = 6)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 6)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 6)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 6)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 6)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 6)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 6)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 6)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 6)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 6)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 6)
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
				         INNER JOIN nomenclador.clase ON (clase.id = 6);
GRANT ALL ON TABLE nomenclador.v_transporte TO admins;
GRANT ALL ON TABLE nomenclador.v_transporte TO readonly;