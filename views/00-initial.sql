CREATE SCHEMA nomenclador;

CREATE TABLE nomenclador.clase (
    id integer NOT NULL,
    nombre character varying NOT NULL
);


insert into nomenclador.clase (id, nombre) values 
(4,'Industria y servicios'),
(7,'Vegetación natural y cultivo'),
(1,'Geodesia y demarcación'),
(2,'Hábitat e infraestructura social'),
(3,'Hidrografía y oceonografía'),
(6,'Transporte'),
(5,'Relieve y suelo');

ALTER TABLE ONLY nomenclador.clase
    ADD CONSTRAINT clase_pkey PRIMARY KEY (id);

GRANT ALL ON TABLE nomenclador.clase TO admins;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE nomenclador.clase TO readonly;
GRANT SELECT ON TABLE nomenclador.clase TO readonly WITH GRANT OPTION;
SET SESSION AUTHORIZATION readonly;
RESET SESSION AUTHORIZATION;
