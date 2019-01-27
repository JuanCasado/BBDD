--ON mysq
ALTER TABLE Grupos_Tocan_Conciertos ADD CONSTRAINT Grupo_toca_fk FOREIGN KEY (Codigo_grupo_Grupo)
REFERENCES Grupo (Codigo_grupo) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Grupos_Tocan_Conciertos ADD CONSTRAINT Conciertos_fk FOREIGN KEY (Codigo_concierto_Conciertos)
REFERENCES Conciertos (Codigo_concierto) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Discos ADD CONSTRAINT Grupo_fk FOREIGN KEY (Codigo_grupo_Grupo)
REFERENCES Grupo (Codigo_grupo) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Canciones ADD CONSTRAINT Discos_fk FOREIGN KEY (Codigo_disco_Discos)
REFERENCES Discos (Codigo_disco) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Entradas ADD CONSTRAINT Conciertos_entrada_fk FOREIGN KEY (Codigo_concierto_Conciertos)
REFERENCES Conciertos(Codigo_concierto) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Musicos ADD CONSTRAINT Grupo_musicos_fk FOREIGN KEY (Codigo_grupo_Grupo)
REFERENCES Grupo (Codigo_grupo) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

--ON postgres
ALTER TABLE "Grupos_Tocan_Conciertos" ADD CONSTRAINT "Grupo_fk" FOREIGN KEY ("Codigo_grupo_Grupo")
REFERENCES "Grupo" ("Codigo_grupo") MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "Grupos_Tocan_Conciertos" ADD CONSTRAINT "Conciertos_fk" FOREIGN KEY ("Codigo_concierto_Conciertos")
REFERENCES "Conciertos" ("Codigo_concierto") MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "Discos" ADD CONSTRAINT "Grupo_fk" FOREIGN KEY ("Codigo_grupo_Grupo")
REFERENCES "Grupo" ("Codigo_grupo") MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "Canciones" ADD CONSTRAINT "Discos_fk" FOREIGN KEY ("Codigo_disco_Discos")
REFERENCES "Discos" ("Codigo_disco") MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "Entradas" ADD CONSTRAINT "Conciertos_fk" FOREIGN KEY ("Codigo_concierto_Conciertos")
REFERENCES "Conciertos"("Codigo_concierto") MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "Musicos" ADD CONSTRAINT "Grupo_fk" FOREIGN KEY ("Codigo_grupo_Grupo")
REFERENCES "Grupo" ("Codigo_grupo") MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;

--OFF mysql
alter table Grupos_Tocan_Conciertos drop FOREIGN KEY Grupo_toca_fk;

alter table Grupos_Tocan_Conciertos drop FOREIGN KEY Conciertos_fk;

alter table Discos drop FOREIGN KEY Grupo_fk;

alter table Canciones drop FOREIGN KEY Discos_fk;

alter table Entradas drop FOREIGN KEY Conciertos_entrada_fk;

alter table Musicos drop FOREIGN KEY Grupo_musicos_fk;

--OFF postgres
alter table "Grupos_Tocan_Conciertos" drop constraint "Grupo_fk";

alter table "Grupos_Tocan_Conciertos" drop constraint "Conciertos_fk";

alter table "Discos" drop constraint "Grupo_fk";

alter table "Canciones" drop constraint "Discos_fk";

alter table "Entradas" drop constraint "Conciertos_fk";

alter table "Musicos" drop constraint "Grupo_fk";