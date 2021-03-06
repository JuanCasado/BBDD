
CREATE TABLE Musicos(
	codigo_musico integer NOT NULL,
	DNI char(10) NOT NULL,
	Nombre text NOT NULL,
	Direccion text NOT NULL,
	Codigo_Postal integer NOT NULL,
	Ciudad text NOT NULL,
	Provincia text NOT NULL,
	telefono integer NOT NULL,
	Instrumentos text NOT NULL,
	Codigo_grupo_Grupo integer NOT NULL,
	CONSTRAINT Musicos_pk PRIMARY KEY (codigo_musico),
	CONSTRAINT Unique_DNI UNIQUE (DNI)

);

ALTER TABLE Musicos;

CREATE TABLE Grupo(
	Codigo_grupo integer NOT NULL,
	Nombre text NOT NULL,
	Genero_musical text NOT NULL,
	Pais text NOT NULL,
	Sitio_web text NOT NULL,
	CONSTRAINT Grupo_pk PRIMARY KEY (Codigo_grupo)

);

ALTER TABLE Grupo;

CREATE TABLE Conciertos(
	Codigo_concierto integer NOT NULL,
	Fecha_realizacion date NOT NULL,
	Pais text NOT NULL,
	Ciudad text NOT NULL,
	Recinto text NOT NULL,
	CONSTRAINT Conciertos_pk PRIMARY KEY (Codigo_concierto)

);

ALTER TABLE Conciertos;

CREATE TABLE Grupos_Tocan_Conciertos(
	Codigo_grupo_Grupo integer NOT NULL,
	Codigo_concierto_Conciertos integer NOT NULL,
	CONSTRAINT Grupos_Tocan_Conciertos_pk PRIMARY KEY (Codigo_grupo_Grupo,Codigo_concierto_Conciertos)

);

ALTER TABLE Grupos_Tocan_Conciertos ADD CONSTRAINT Grupo_toca_fk FOREIGN KEY (Codigo_grupo_Grupo)
REFERENCES Grupo (Codigo_grupo) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Grupos_Tocan_Conciertos ADD CONSTRAINT Conciertos_fk FOREIGN KEY (Codigo_concierto_Conciertos)
REFERENCES Conciertos (Codigo_concierto) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE Discos(
	Codigo_disco integer NOT NULL,
	Titulo text NOT NULL,
	Fecha_edicion date NOT NULL,
	Genero text NOT NULL,
	Formato text NOT NULL,
	Codigo_grupo_Grupo integer NOT NULL,
	CONSTRAINT Discos_pk PRIMARY KEY (Codigo_disco)

);

ALTER TABLE Discos;

ALTER TABLE Discos ADD CONSTRAINT Grupo_fk FOREIGN KEY (Codigo_grupo_Grupo)
REFERENCES Grupo (Codigo_grupo) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE Canciones(
	Codigo_cancion integer NOT NULL,
	Nombre text NOT NULL,
	Compositor text NOT NULL,
	Fecha_grabacion date NOT NULL,
	Duracion time NOT NULL,
	Codigo_disco_Discos integer NOT NULL,
	CONSTRAINT Canciones_pk PRIMARY KEY (Codigo_cancion)

);

ALTER TABLE Canciones;

ALTER TABLE Canciones ADD CONSTRAINT Discos_fk FOREIGN KEY (Codigo_disco_Discos)
REFERENCES Discos (Codigo_disco) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE Entradas(
	Codigo_entrada integer NOT NULL,
	Localidad text NOT NULL,
	Precio integer NOT NULL,
	Usuario text NOT NULL,
	Codigo_concierto_Conciertos integer NOT NULL,
	CONSTRAINT Entradas_pk PRIMARY KEY (Codigo_entrada)

);

ALTER TABLE Entradas ;

ALTER TABLE Entradas ADD CONSTRAINT Conciertos_entrada_fk FOREIGN KEY (Codigo_concierto_Conciertos)
REFERENCES Conciertos(Codigo_concierto) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Musicos ADD CONSTRAINT Grupo_musicos_fk FOREIGN KEY (Codigo_grupo_Grupo)
REFERENCES Grupo (Codigo_grupo) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
