-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: public."Musicos" | type: TABLE --
-- DROP TABLE IF EXISTS public."Musicos" CASCADE;
CREATE TABLE public."Musicos"(
	codigo_musico integer NOT NULL,
	"DNI" char(10) NOT NULL,
	"Nombre" text NOT NULL,
	"Direccion" text NOT NULL,
	"Codigo_Postal" integer NOT NULL,
	"Ciudad" text NOT NULL,
	"Provincia" text NOT NULL,
	telefono integer NOT NULL,
	"Instrumentos" text NOT NULL,
	"Codigo_grupo_Grupo" integer NOT NULL,
	CONSTRAINT "Musicos_pk" PRIMARY KEY (codigo_musico),
	CONSTRAINT "Unique_DNI" UNIQUE ("DNI")

);
-- ddl-end --
ALTER TABLE public."Musicos" OWNER TO postgres;
-- ddl-end --

-- object: public."Grupo" | type: TABLE --
-- DROP TABLE IF EXISTS public."Grupo" CASCADE;
CREATE TABLE public."Grupo"(
	"Codigo_grupo" integer NOT NULL,
	"Nombre" text NOT NULL,
	"Genero_musical" text NOT NULL,
	"Pais" text NOT NULL,
	"Sitio_web" text NOT NULL,
	CONSTRAINT "Grupo_pk" PRIMARY KEY ("Codigo_grupo")

);
-- ddl-end --
ALTER TABLE public."Grupo" OWNER TO postgres;
-- ddl-end --

-- object: public."Conciertos" | type: TABLE --
-- DROP TABLE IF EXISTS public."Conciertos" CASCADE;
CREATE TABLE public."Conciertos"(
	"Codigo_concierto" integer NOT NULL,
	"Fecha_realizacion" date NOT NULL,
	"Pais" text NOT NULL,
	"Ciudad" text NOT NULL,
	"Recinto" text NOT NULL,
	CONSTRAINT "Conciertos_pk" PRIMARY KEY ("Codigo_concierto")

);
-- ddl-end --
ALTER TABLE public."Conciertos" OWNER TO postgres;
-- ddl-end --

-- object: public."Grupos_Tocan_Conciertos" | type: TABLE --
-- DROP TABLE IF EXISTS public."Grupos_Tocan_Conciertos" CASCADE;
CREATE TABLE public."Grupos_Tocan_Conciertos"(
	"Codigo_grupo_Grupo" integer NOT NULL,
	"Codigo_concierto_Conciertos" integer NOT NULL,
	CONSTRAINT "Grupos_Tocan_Conciertos_pk" PRIMARY KEY ("Codigo_grupo_Grupo","Codigo_concierto_Conciertos")

);
-- ddl-end --

-- object: "Grupo_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Grupos_Tocan_Conciertos" DROP CONSTRAINT IF EXISTS "Grupo_fk" CASCADE;
ALTER TABLE public."Grupos_Tocan_Conciertos" ADD CONSTRAINT "Grupo_fk" FOREIGN KEY ("Codigo_grupo_Grupo")
REFERENCES public."Grupo" ("Codigo_grupo") MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --

-- object: "Conciertos_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Grupos_Tocan_Conciertos" DROP CONSTRAINT IF EXISTS "Conciertos_fk" CASCADE;
ALTER TABLE public."Grupos_Tocan_Conciertos" ADD CONSTRAINT "Conciertos_fk" FOREIGN KEY ("Codigo_concierto_Conciertos")
REFERENCES public."Conciertos" ("Codigo_concierto") MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --

-- object: public."Discos" | type: TABLE --
-- DROP TABLE IF EXISTS public."Discos" CASCADE;
CREATE TABLE public."Discos"(
	"Codigo_disco" integer NOT NULL,
	"Titulo" text NOT NULL,
	"Fecha_edicion" date NOT NULL,
	"Genero" text NOT NULL,
	"Formato" text NOT NULL,
	"Codigo_grupo_Grupo" integer NOT NULL,
	CONSTRAINT "Discos_pk" PRIMARY KEY ("Codigo_disco")

);
-- ddl-end --
ALTER TABLE public."Discos" OWNER TO postgres;
-- ddl-end --

-- object: "Grupo_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Discos" DROP CONSTRAINT IF EXISTS "Grupo_fk" CASCADE;
ALTER TABLE public."Discos" ADD CONSTRAINT "Grupo_fk" FOREIGN KEY ("Codigo_grupo_Grupo")
REFERENCES public."Grupo" ("Codigo_grupo") MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --

-- object: public."Canciones" | type: TABLE --
-- DROP TABLE IF EXISTS public."Canciones" CASCADE;
CREATE TABLE public."Canciones"(
	"Codigo_cancion" integer NOT NULL,
	"Nombre" text NOT NULL,
	"Compositor" text NOT NULL,
	"Fecha_grabacion" date NOT NULL,
	"Duracion" time NOT NULL,
	"Codigo_disco_Discos" integer NOT NULL,
	CONSTRAINT "Canciones_pk" PRIMARY KEY ("Codigo_cancion")

);
-- ddl-end --
ALTER TABLE public."Canciones" OWNER TO postgres;
-- ddl-end --

-- object: "Discos_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Canciones" DROP CONSTRAINT IF EXISTS "Discos_fk" CASCADE;
ALTER TABLE public."Canciones" ADD CONSTRAINT "Discos_fk" FOREIGN KEY ("Codigo_disco_Discos")
REFERENCES public."Discos" ("Codigo_disco") MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --

-- object: public."Entradas" | type: TABLE --
-- DROP TABLE IF EXISTS public."Entradas" CASCADE;
CREATE TABLE public."Entradas"(
	"Codigo_entrada" integer NOT NULL,
	"Localidad" text NOT NULL,
	"Precio" money NOT NULL,
	"Usuario" text NOT NULL,
	"Codigo_concierto_Conciertos" integer NOT NULL,
	CONSTRAINT "Entradas_pk" PRIMARY KEY ("Codigo_entrada")

);
-- ddl-end --
ALTER TABLE public."Entradas" OWNER TO postgres;
-- ddl-end --

-- object: "Conciertos_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Entradas" DROP CONSTRAINT IF EXISTS "Conciertos_fk" CASCADE;
ALTER TABLE public."Entradas" ADD CONSTRAINT "Conciertos_fk" FOREIGN KEY ("Codigo_concierto_Conciertos")
REFERENCES public."Conciertos" ("Codigo_concierto") MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --

-- object: "Grupo_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Musicos" DROP CONSTRAINT IF EXISTS "Grupo_fk" CASCADE;
ALTER TABLE public."Musicos" ADD CONSTRAINT "Grupo_fk" FOREIGN KEY ("Codigo_grupo_Grupo")
REFERENCES public."Grupo" ("Codigo_grupo") MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --


