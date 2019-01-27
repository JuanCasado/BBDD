--CREATE ROLES
CREATE ROLE administrador login superuser;
CREATE ROLE musico login;
CREATE ROLE usuario login;
CREATE ROLE puede_ver;

--GRANT PRIVILEGES
GRANT select ON "Canciones","Conciertos","Discos","Entradas","Grupo","Grupos_Tocan_Conciertos","Musicos" TO puede_ver;
GRANT puede_ver to musico,usuario;

GRANT ALL PRIVILEGES ON "Canciones","Conciertos","Discos","Entradas","Grupo","Grupos_Tocan_Conciertos","Musicos" TO administrador;

GRANT DELETE ON "Entradas" TO usuario;

GRANT DELETE ON "Entradas" TO musico;
GRANT INSERT ON "Entradas" TO musico;
GRANT UPDATE ON "Entradas" TO musico;
GRANT DELETE ON "Conciertos" TO musico;
GRANT INSERT ON "Conciertos" TO musico;
GRANT UPDATE ON "Conciertos" TO musico;
GRANT DELETE ON "Grupos_Tocan_Conciertos" TO musico;
GRANT INSERT ON "Grupos_Tocan_Conciertos" TO musico;
GRANT UPDATE ON "Grupos_Tocan_Conciertos" TO musico;
GRANT DELETE ON "Musicos" TO musico;
GRANT INSERT ON "Musicos" TO musico;
GRANT UPDATE ON "Musicos" TO musico;
GRANT DELETE ON "Discos" TO musico;
GRANT INSERT ON "Discos" TO musico;
GRANT UPDATE ON "Discos" TO musico;
GRANT DELETE ON "Canciones" TO musico;
GRANT INSERT ON "Canciones" TO musico;
GRANT UPDATE ON "Canciones" TO musico;

--ROW LEVEL SECURITY
ALTER TABLE "Entradas" ENABLE ROW LEVEL SECURITY;
	
CREATE POLICY usuario_entradas ON "Entradas"
	FOR DELETE
	TO usuario
	USING("Usuario" = CURRENT_USER);
	
CREATE POLICY musicos_entradas_insert ON "Entradas"
	FOR INSERT
	TO musico
	WITH CHECK ("Entradas"."Codigo_entrada" IN (SELECT "Entradas"."Codigo_entrada" FROM "Musicos"
							 INNER JOIN "Grupos_Tocan_Conciertos" ON "Musicos"."Codigo_grupo_Grupo" = "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
							 INNER JOIN "Conciertos" ON "Grupos_Tocan_Conciertos"."Codigo_concierto_Conciertos" = "Conciertos"."Codigo_concierto"
							 INNER JOIN "Entradas" ON "Entradas"."Codigo_concierto_Conciertos" = "Conciertos"."Codigo_concierto"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

CREATE POLICY musicos_entradas_delete ON "Entradas"
	FOR DELETE
	TO musico
	USING ("Entradas"."Codigo_entrada" IN (SELECT "Entradas"."Codigo_entrada" FROM "Musicos"
							 INNER JOIN "Grupos_Tocan_Conciertos" ON "Musicos"."Codigo_grupo_Grupo" = "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
							 INNER JOIN "Conciertos" ON "Grupos_Tocan_Conciertos"."Codigo_concierto_Conciertos" = "Conciertos"."Codigo_concierto"
							 INNER JOIN "Entradas" ON "Entradas"."Codigo_concierto_Conciertos" = "Conciertos"."Codigo_concierto"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

CREATE POLICY musicos_entradas_update ON "Entradas"
	FOR UPDATE
	TO musico
	USING (true)
	WITH CHECK ("Entradas"."Codigo_entrada" IN (SELECT "Entradas"."Codigo_entrada" FROM "Musicos"
							 INNER JOIN "Grupos_Tocan_Conciertos" ON "Musicos"."Codigo_grupo_Grupo" = "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
							 INNER JOIN "Conciertos" ON "Grupos_Tocan_Conciertos"."Codigo_concierto_Conciertos" = "Conciertos"."Codigo_concierto"
							 INNER JOIN "Entradas" ON "Entradas"."Codigo_concierto_Conciertos" = "Conciertos"."Codigo_concierto"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

ALTER TABLE "Conciertos" ENABLE ROW LEVEL SECURITY;

CREATE POLICY musicos_conciertos_insert ON "Conciertos"
	FOR INSERT
	TO musico
	WITH CHECK ("Conciertos"."Codigo_concierto" IN (SELECT "Conciertos"."Codigo_concierto" FROM "Musicos"
							 INNER JOIN "Grupos_Tocan_Conciertos" ON "Musicos"."Codigo_grupo_Grupo" = "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
							 INNER JOIN "Conciertos" ON "Grupos_Tocan_Conciertos"."Codigo_concierto_Conciertos" = "Conciertos"."Codigo_concierto"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

CREATE POLICY musicos_conciertos_delete ON "Concieros"
	FOR DELETE
	TO musico
	USING ("Conciertos"."Codigo_concierto" IN (SELECT "Conciertos"."Codigo_concierto" FROM "Musicos"
							 INNER JOIN "Grupos_Tocan_Conciertos" ON "Musicos"."Codigo_grupo_Grupo" = "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
							 INNER JOIN "Conciertos" ON "Grupos_Tocan_Conciertos"."Codigo_concierto_Conciertos" = "Conciertos"."Codigo_concierto"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

CREATE POLICY musicos_conciertos_update ON "Concieros"
	FOR UPDATE
	TO musico
	USING (true)
	WITH CHECK ("Conciertos"."Codigo_concierto" IN (SELECT "Conciertos"."Codigo_concierto" FROM "Musicos"
							 INNER JOIN "Grupos_Tocan_Conciertos" ON "Musicos"."Codigo_grupo_Grupo" = "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
							 INNER JOIN "Conciertos" ON "Grupos_Tocan_Conciertos"."Codigo_concierto_Conciertos" = "Conciertos"."Codigo_concierto"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

ALTER TABLE "Grupos_Tocan_Conciertos" ENABLE ROW LEVEL SECURITY;

CREATE POLICY musicos_tocan_insert ON "Grupos_Tocan_Conciertos"
	FOR INSERT
	TO musico
	WITH CHECK ("Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo" IN (SELECT "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo" FROM "Musicos"
							 INNER JOIN "Grupos_Tocan_Conciertos" ON "Musicos"."Codigo_grupo_Grupo" = "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

CREATE POLICY musicos_tocan_delete ON "Grupos_Tocan_Conciertos"
	FOR DELETE
	TO musico
	USING ("Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo" IN (SELECT "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo" FROM "Musicos"
							 INNER JOIN "Grupos_Tocan_Conciertos" ON "Musicos"."Codigo_grupo_Grupo" = "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

CREATE POLICY musicos_tocan_update ON "Grupos_Tocan_Conciertos"
	FOR UPDATE
	TO musico
	USING (true)
	WITH CHECK ("Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo" IN (SELECT "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo" FROM "Musicos"
							 INNER JOIN "Grupos_Tocan_Conciertos" ON "Musicos"."Codigo_grupo_Grupo" = "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

ALTER TABLE "Canciones" ENABLE ROW LEVEL SECURITY;

CREATE POLICY musicos_canciones_insert ON "Canciones"
	FOR INSERT
	TO musico
	WITH CHECK ("Canciones"."Codigo_cancion" IN (SELECT "Canciones"."Codigo_cancion" FROM "Musicos"
							 INNER JOIN "Discos" ON "Musicos"."Codigo_grupo_Grupo" = "Discos"."Codigo_grupo_Grupo"
							 INNER JOIN "Canciones" ON "Discos"."Codigo_disco" = "Canciones"."Codigo_disco_Discos"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

CREATE POLICY musicos_canciones_delete ON "Canciones"
	FOR DELETE
	TO musico
	USING ("Canciones"."Codigo_cancion" IN (SELECT "Canciones"."Codigo_cancion" FROM "Musicos"
							 INNER JOIN "Discos" ON "Musicos"."Codigo_grupo_Grupo" = "Discos"."Codigo_grupo_Grupo"
							 INNER JOIN "Canciones" ON "Discos"."Codigo_disco" = "Canciones"."Codigo_disco_Discos"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

CREATE POLICY musicos_canciones_update ON "Canciones"
	FOR UPDATE
	TO musico
	USING (true)
	WITH CHECK ("Canciones"."Codigo_cancion" IN (SELECT "Canciones"."Codigo_cancion" FROM "Musicos"
							 INNER JOIN "Discos" ON "Musicos"."Codigo_grupo_Grupo" = "Discos"."Codigo_grupo_Grupo"
							 INNER JOIN "Canciones" ON "Discos"."Codigo_disco" = "Canciones"."Codigo_disco_Discos"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

ALTER TABLE "Discos" ENABLE ROW LEVEL SECURITY;

CREATE POLICY musicos_discos_insert ON "Discos"
	FOR INSERT
	TO musico
	WITH CHECK ("Discos"."Codigo_disco" IN (SELECT "Discos"."Codigo_disco" FROM "Musicos"
							 INNER JOIN "Discos" ON "Musicos"."Codigo_grupo_Grupo" = "Discos"."Codigo_grupo_Grupo"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

CREATE POLICY musicos_discos_delete ON "Discos"
	FOR DELETE
	TO musico
	USING ("Discos"."Codigo_disco" IN (SELECT "Discos"."Codigo_disco" FROM "Musicos"
							 INNER JOIN "Discos" ON "Musicos"."Codigo_grupo_Grupo" = "Discos"."Codigo_grupo_Grupo"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

CREATE POLICY musicos_discos_update ON "Discos"
	FOR UPDATE
	TO musico
	USING (true)
	WITH CHECK ("Discos"."Codigo_disco" IN (SELECT "Discos"."Codigo_disco" FROM "Musicos"
							 INNER JOIN "Discos" ON "Musicos"."Codigo_grupo_Grupo" = "Discos"."Codigo_grupo_Grupo"
							 WHERE "Musicos"."Nombre" = CURRENT_USER));

ALTER TABLE "Musicos" ENABLE ROW LEVEL SECURITY;

CREATE POLICY musicos_musicos_insert ON "Musicos"
	FOR INSERT
	TO musico
	WITH CHECK (CURRENT_USER IN (SELECT "Musicos"."Nombre" FROM "Musicos"));

CREATE POLICY musicos_musicos_delete ON "Musicos"
	FOR DELETE
	TO musico
	USING (CURRENT_USER IN (SELECT "Musicos"."Nombre" FROM "Musicos"));

CREATE POLICY musicos_musicos_update ON "Musicos"
	FOR UPDATE
	TO musico
	USING (true)
	WITH CHECK (CURRENT_USER IN (SELECT "Musicos"."Nombre" FROM "Musicos"));


