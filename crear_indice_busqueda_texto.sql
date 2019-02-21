CREATE OR REPLACE FUNCTION public.crear_indice_para_busqueda_por_texto(nombre_tabla character varying)
  RETURNS void AS
$BODY$
	DECLARE
        retval character varying;
    BEGIN
        IF to_regclass(('public.ix_fna_' || nombre_tabla)::cstring) IS NULL THEN
			EXECUTE 'SELECT column_name FROM information_schema.columns
					 WHERE table_name = $1 and column_name in (''fna'')'
			INTO retval
			USING nombre_tabla;
			IF (retval) IS NOT NULL THEN
				RAISE NOTICE 'LLEGO 02';
				EXECUTE 'CREATE INDEX ix_fna_' || nombre_tabla || ' ON public.' || nombre_tabla || ' (fna)';
			END IF;
		END IF;
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.crear_indice_para_busqueda_por_texto(character varying)
  OWNER TO postgres;
GRANT EXECUTE ON FUNCTION public.crear_indice_para_busqueda_por_texto(character varying) TO public;
GRANT EXECUTE ON FUNCTION public.crear_indice_para_busqueda_por_texto(character varying) TO postgres;
GRANT EXECUTE ON FUNCTION public.crear_indice_para_busqueda_por_texto(character varying) TO sig_operator;
GRANT EXECUTE ON FUNCTION public.crear_indice_para_busqueda_por_texto(character varying) TO sig_readonly;
