
delete from "Musicos"
where "Musicos"."codigo_musico" in 
(select "Musicos"."Codigo_grupo_Grupo"
 from "Grupo"
 where "Grupo"."Codigo_grupo">100000
);

delete from "Canciones"
where "Canciones"."Codigo_disco_Discos" in 
(select "Discos"."Codigo_discos"
 from "Discos"
 inner join "Grupo" on "Discos"."Codigo_grupo_Grupo"="Grupo"."Codigo_grupo"
 where "Grupo"."Codigo_grupo">100000
);

delete from "Discos"
where "Discos"."Codigo_grupo_Grupo" in 
(select "Grupo"."Codigo_grupo"
 from "Grupo"
 where "Grupo"."Codigo_grupo">100000
);


delete from "Grupos_Tocan_Conciertos"
where "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo">100000;
delete from "Grupos_Tocan_Conciertos"
where "Grupos_Tocan_Conciertos"."Codigo_concierto_Conciertos">50000;

delete from "Conciertos"
where "Conciertos"."Codigo_concierto">50000

delete from "Entradas"
where "Entradas"."Codigo_concierto_Conciertos">50000;

delete from "Grupo"
where "Grupo"."Codigo_grupo">100000;


