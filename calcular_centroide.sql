-- Function: public.calcular_centroide()

-- DROP FUNCTION public.calcular_centroide();

CREATE OR REPLACE FUNCTION public.calcular_centroide()
  RETURNS trigger AS
$BODY$
DECLARE 
    consulta  character varying;
BEGIN
    consulta := 'UPDATE ' || TG_TABLE_NAME || ' set centroide = ST_Centroid(geom) WHERE gid = ''' || NEW.gid || '''';
	EXECUTE consulta;
	--raise exception '%', consulta;
 
    RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.calcular_centroide()
  OWNER TO postgres;
GRANT EXECUTE ON FUNCTION public.calcular_centroide() TO public;
GRANT EXECUTE ON FUNCTION public.calcular_centroide() TO postgres;
GRANT EXECUTE ON FUNCTION public.calcular_centroide() TO sig_readonly;
