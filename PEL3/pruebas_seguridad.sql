--CREATE USERS
CREATE USER entrada1_usu WITH
	ENCRYPTED PASSWORD 'entrada1_usu'
	IN ROLE usuario;

CREATE USER musico1 WITH
	ENCRYPTED PASSWORD 'musico1'
	IN ROLE musico;

CREATE USER entrada1_usu WITH
	ENCRYPTED PASSWORD 'entrada1_usu'
	IN ROLE usuario;

CREATE USER administrador1 WITH
	ENCRYPTED PASSWORD 'administrador1'

GRANT administrador1 TO administrador;

--DATOS INICIALES CREADOS
INSERT INTO public."Grupo"(
	"Codigo_grupo", "Nombre", "Genero_musical", "Pais", "Sitio_web")
	VALUES (1, 'g1', 'musica', 'p1', 'web1');

INSERT INTO public."Musicos"(
	codigo_musico, "DNI", "Nombre", "Direccion", "Codigo_Postal", "Ciudad", "Provincia", telefono, "Instrumentos", "Codigo_grupo_Grupo")
	VALUES (6, '6', 'musico1', 'dir1', 1, 'ciu1', 'pro1', 1, 'inst1', 1);

INSERT INTO public."Conciertos"(
	"Codigo_concierto", "Fecha_realizacion", "Pais", "Ciudad", "Recinto")
	VALUES (1, '12-21-21', 'p1', 'c1', 'r1');

INSERT INTO public."Grupos_Tocan_Conciertos"(
	"Codigo_grupo_Grupo", "Codigo_concierto_Conciertos")
	VALUES (1, 1);

INSERT INTO public."Entradas"(
	"Codigo_entrada", "Localidad", "Precio", "Usuario", "Codigo_concierto_Conciertos")
	VALUES (6, 'loc6', 6, 'musico1', 1);

INSERT INTO public."Entradas"(
	"Codigo_entrada", "Localidad", "Precio", "Usuario", "Codigo_concierto_Conciertos")
	VALUES (5, 'loc5', 5, 'entrada1_usu', 1);

INSERT INTO public."Discos"(
	"Codigo_disco", "Titulo", "Fecha_edicion", "Genero", "Formato", "Codigo_grupo_Grupo")
	VALUES (1, 't1', '1-1-1', 'g1', 'f1', 1);

INSERT INTO public."Canciones"(
	"Codigo_cancion", "Nombre", "Compositor", "Fecha_grabacion", "Duracion", "Codigo_disco_Discos")
	VALUES (1, 'n1', 'c1', '12-22-1', '00:03:00', 1);



INSERT INTO public."Grupo"(
	"Codigo_grupo", "Nombre", "Genero_musical", "Pais", "Sitio_web")
	VALUES (22, 'g22', 'musica', 'p22', 'web22');

INSERT INTO public."Musicos"(
	codigo_musico, "DNI", "Nombre", "Direccion", "Codigo_Postal", "Ciudad", "Provincia", telefono, "Instrumentos", "Codigo_grupo_Grupo")
	VALUES (22, '22', 'musico22', 'dir22', 1, 'ciu22', 'pro22', 22, 'inst1', 22);
	
INSERT INTO public."Conciertos"(
	"Codigo_concierto", "Fecha_realizacion", "Pais", "Ciudad", "Recinto")
	VALUES (22, '12-22-22', 'p22', 'c22', 'r22');

INSERT INTO public."Grupos_Tocan_Conciertos"(
	"Codigo_grupo_Grupo", "Codigo_concierto_Conciertos")
	VALUES (22, 22);

INSERT INTO public."Entradas"(
	"Codigo_entrada", "Localidad", "Precio", "Usuario", "Codigo_concierto_Conciertos")
	VALUES (22, 'loc22', 22, 'musico22', 22);

INSERT INTO public."Discos"(
	"Codigo_disco", "Titulo", "Fecha_edicion", "Genero", "Formato", "Codigo_grupo_Grupo")
	VALUES (22, 't22', '12-22-22', 'g22', 'f22', 22);

INSERT INTO public."Canciones"(
	"Codigo_cancion", "Nombre", "Compositor", "Fecha_grabacion", "Duracion", "Codigo_disco_Discos")
	VALUES (22, 'n22', 'c22', '12-22-22', '00:03:00', 22);

--EL MUSICO 1 PUEDE HACER :
SELECT * from "Canciones";
SELECT * from "Conciertos";
SELECT * from "Discos";
SELECT * from "Entradas";
SELECT * from "Grupo";
SELECT * from "Grupos_Tocan_Conciertos";
SELECT * from "Musicos";

UPDATE public."Musicos"
	SET "Nombre"='n33'
	WHERE "Musicos"."codigo_musico" = 1;

UPDATE public."Entradas"
	SET "Precio"=88
	WHERE "Entradas"."Codigo_entrada"= 1;

UPDATE public."Discos"
	SET "Titulo"='t33'
	WHERE "Discos"."Codigo_disco" = 1;

UPDATE public."Conciertos"
	SET "Pais"='p33'
	WHERE "Conciertos"."Codigo_concierto"= 1;

UPDATE public."Canciones"
	SET "Nombre"='n33'
	WHERE "Canciones"."Codigo_cancion"= 1;

INSERT INTO public."Musicos"(
	codigo_musico, "DNI", "Nombre", "Direccion", "Codigo_Postal", "Ciudad", "Provincia", telefono, "Instrumentos", "Codigo_grupo_Grupo")
	VALUES (99, '6', 'musico1', 'dir1', 1, 'ciu1', 'pro1', 1, 'inst1', 1);

INSERT INTO public."Conciertos"(
	"Codigo_concierto", "Fecha_realizacion", "Pais", "Ciudad", "Recinto")
	VALUES (99, '12-21-21', 'p1', 'c1', 'r1');

INSERT INTO public."Grupos_Tocan_Conciertos"(
	"Codigo_grupo_Grupo", "Codigo_concierto_Conciertos")
	VALUES (99, 1);

INSERT INTO public."Entradas"(
	"Codigo_entrada", "Localidad", "Precio", "Usuario", "Codigo_concierto_Conciertos")
	VALUES (99, 'loc6', 6, 'musico1', 1);

INSERT INTO public."Discos"(
	"Codigo_disco", "Titulo", "Fecha_edicion", "Genero", "Formato", "Codigo_grupo_Grupo")
	VALUES (99, 't1', '1-1-1', 'g1', 'f1', 1);

INSERT INTO public."Canciones"(
	"Codigo_cancion", "Nombre", "Compositor", "Fecha_grabacion", "Duracion", "Codigo_disco_Discos")
	VALUES (99, 'n1', 'c1', '12-22-1', '00:03:00', 1);

DELETE FROM public."Entradas"
	WHERE "Entradas"."Codigo_entrada" = 99;

DELETE FROM public."Canciones"
	WHERE "Canciones"."Codigo_cancion" = 99;

DELETE FROM public."Discos"
	WHERE "Discos"."Codigo_disco" = 99;

DELETE FROM public."Musicos"
	WHERE "Musicos"."codigo_musico" = 99;

DELETE FROM public."Grupos_Tocan_Conciertos"
	WHERE "Grupos_Tocan_Conciertos"."Codigo_concierto" = 99;

DELETE FROM public."Conciertos"
	WHERE "Concieros"."Codigo_concierto" = 99;


--EL MUSICO 1 NO PUEDE HACER (ESTAS FINAL NO LE PERTENECEN):
UPDATE public."Musicos"
	SET "Nombre"='n33'
	WHERE "Musicos"."codigo_musico" = 22;

UPDATE public."Entradas"
	SET "Precio"=88
	WHERE "Entradas"."Codigo_entrada"= 22;

UPDATE public."Discos"
	SET "Titulo"='t33'
	WHERE "Discos"."Codigo_disco" = 22;

UPDATE public."Conciertos"
	SET "Pais"='p33'
	WHERE "Conciertos"."Codigo_concierto"= 22;

UPDATE public."Canciones"
	SET "Nombre"='n33'
	WHERE "Canciones"."Codigo_cancion"= 22;

INSERT INTO public."Grupo"(
	"Codigo_grupo", "Nombre", "Genero_musical", "Pais", "Sitio_web")
	VALUES (25, 'g22', 'musica', 'p22', 'web22');

INSERT INTO public."Musicos"(
	codigo_musico, "DNI", "Nombre", "Direccion", "Codigo_Postal", "Ciudad", "Provincia", telefono, "Instrumentos", "Codigo_grupo_Grupo")
	VALUES (25, '22', 'musico22', 'dir22', 1, 'ciu22', 'pro22', 22, 'inst1', 22);
	
INSERT INTO public."Conciertos"(
	"Codigo_concierto", "Fecha_realizacion", "Pais", "Ciudad", "Recinto")
	VALUES (25, '12-22-22', 'p22', 'c22', 'r22');

INSERT INTO public."Grupos_Tocan_Conciertos"(
	"Codigo_grupo_Grupo", "Codigo_concierto_Conciertos")
	VALUES (25, 22);

INSERT INTO public."Entradas"(
	"Codigo_entrada", "Localidad", "Precio", "Usuario", "Codigo_concierto_Conciertos")
	VALUES (25, 'loc22', 22, 'musico22', 22);

INSERT INTO public."Discos"(
	"Codigo_disco", "Titulo", "Fecha_edicion", "Genero", "Formato", "Codigo_grupo_Grupo")
	VALUES (25, 't22', '12-22-22', 'g22', 'f22', 22);

INSERT INTO public."Canciones"(
	"Codigo_cancion", "Nombre", "Compositor", "Fecha_grabacion", "Duracion", "Codigo_disco_Discos")
	VALUES (25, 'n22', 'c22', '12-22-22', '00:03:00', 22);
--NO TIENE PERMISOS PARA HACERLO
INSERT INTO public."Grupo"(
	"Codigo_grupo", "Nombre", "Genero_musical", "Pais", "Sitio_web")
	VALUES (99, 'g1', 'musica', 'p1', 'web1');

DELETE FROM public."Grupo"
	WHERE "Grupo"."Codigo_grupo" = 99;

--EL USUARIO 1 PUEDE HACER:
SELECT * from "Canciones";
SELECT * from "Conciertos";
SELECT * from "Discos";
SELECT * from "Entradas";
SELECT * from "Grupo";
SELECT * from "Grupos_Tocan_Conciertos";
SELECT * from "Musicos";

DELETE FROM public."Entradas" --ESTA ENTRADA LE PERTENECE Y PUEDE BORRARLA
	WHERE "Entradas"."Codigo_entrada" = 5;


--EL USUARIO 1 NO PUEDE HACER (NO TIENE PERMISOS SUFICIENTE):
INSERT INTO public."Grupo"(
	"Codigo_grupo", "Nombre", "Genero_musical", "Pais", "Sitio_web")
	VALUES (25, 'g22', 'musica', 'p22', 'web22');

INSERT INTO public."Musicos"(
	codigo_musico, "DNI", "Nombre", "Direccion", "Codigo_Postal", "Ciudad", "Provincia", telefono, "Instrumentos", "Codigo_grupo_Grupo")
	VALUES (25, '22', 'musico22', 'dir22', 1, 'ciu22', 'pro22', 22, 'inst1', 22);
	
INSERT INTO public."Conciertos"(
	"Codigo_concierto", "Fecha_realizacion", "Pais", "Ciudad", "Recinto")
	VALUES (25, '12-22-22', 'p22', 'c22', 'r22');

INSERT INTO public."Grupos_Tocan_Conciertos"(
	"Codigo_grupo_Grupo", "Codigo_concierto_Conciertos")
	VALUES (25, 22);

INSERT INTO public."Entradas"(
	"Codigo_entrada", "Localidad", "Precio", "Usuario", "Codigo_concierto_Conciertos")
	VALUES (25, 'loc22', 22, 'musico22', 22);

INSERT INTO public."Discos"(
	"Codigo_disco", "Titulo", "Fecha_edicion", "Genero", "Formato", "Codigo_grupo_Grupo")
	VALUES (25, 't22', '12-22-22', 'g22', 'f22', 22);

INSERT INTO public."Canciones"(
	"Codigo_cancion", "Nombre", "Compositor", "Fecha_grabacion", "Duracion", "Codigo_disco_Discos")
	VALUES (25, 'n22', 'c22', '12-22-22', '00:03:00', 22);

INSERT INTO public."Grupo"(
	"Codigo_grupo", "Nombre", "Genero_musical", "Pais", "Sitio_web")
	VALUES (1, 'g1', 'musica', 'p1', 'web1');

INSERT INTO public."Musicos"(
	codigo_musico, "DNI", "Nombre", "Direccion", "Codigo_Postal", "Ciudad", "Provincia", telefono, "Instrumentos", "Codigo_grupo_Grupo")
	VALUES (6, '6', 'musico1', 'dir1', 1, 'ciu1', 'pro1', 1, 'inst1', 1);

INSERT INTO public."Conciertos"(
	"Codigo_concierto", "Fecha_realizacion", "Pais", "Ciudad", "Recinto")
	VALUES (99, '12-21-21', 'p1', 'c1', 'r1');

INSERT INTO public."Grupos_Tocan_Conciertos"(
	"Codigo_grupo_Grupo", "Codigo_concierto_Conciertos")
	VALUES (99, 1);

INSERT INTO public."Entradas"(
	"Codigo_entrada", "Localidad", "Precio", "Usuario", "Codigo_concierto_Conciertos")
	VALUES (99, 'loc6', 6, 'musico1', 1);

INSERT INTO public."Discos"(
	"Codigo_disco", "Titulo", "Fecha_edicion", "Genero", "Formato", "Codigo_grupo_Grupo")
	VALUES (99, 't1', '1-1-1', 'g1', 'f1', 1);

INSERT INTO public."Canciones"(
	"Codigo_cancion", "Nombre", "Compositor", "Fecha_grabacion", "Duracion", "Codigo_disco_Discos")
	VALUES (99, 'n1', 'c1', '12-22-1', '00:03:00', 1);

DELETE FROM public."Entradas"
	WHERE "Entradas"."Codigo_entrada" = 1;

DELETE FROM public."Canciones"
	WHERE "Canciones"."Codigo_cancion" = 1;

DELETE FROM public."Discos"
	WHERE "Discos"."Codigo_disco" = 1;

DELETE FROM public."Musicos"
	WHERE "Musicos"."codigo_musico" = 1;

DELETE FROM public."Grupos_Tocan_Conciertos"
	WHERE "Grupos_Tocan_Conciertos"."Codigo_concierto" = 1;

DELETE FROM public."Grupo"
	WHERE "Grupo"."Codigo_grupo" = 1;

DELETE FROM public."Conciertos"
	WHERE "Concieros"."Codigo_concierto" = 1;

UPDATE public."Musicos"
	SET "Nombre"='n33'
	WHERE "Musicos"."codigo_musico" = 1;

UPDATE public."Entradas"
	SET "Precio"=88
	WHERE "Entradas"."Codigo_entrada"= 1;

UPDATE public."Discos"
	SET "Titulo"='t33'
	WHERE "Discos"."Codigo_disco" = 1;

UPDATE public."Conciertos"
	SET "Pais"='p33'
	WHERE "Conciertos"."Codigo_concierto"= 1;

UPDATE public."Canciones"
	SET "Nombre"='n33'
	WHERE "Canciones"."Codigo_cancion"= 1;