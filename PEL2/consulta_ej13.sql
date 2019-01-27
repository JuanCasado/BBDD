select distinct "Musicos"."Nombre","Grupo"."Nombre"
from (select "Musicos"."Codigo_grupo_Grupo", count (*) as "Cantidad_musicos"
		from "Musicos" 
		group by "Musicos"."Codigo_grupo_Grupo") as "Grupo_C"
	inner join "Musicos" on "Grupo_C"."Codigo_grupo_Grupo" = "Musicos"."Codigo_grupo_Grupo"
	inner join "Grupos_Tocan_Conciertos" on "Grupo_C"."Codigo_grupo_Grupo"="Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
	inner join "Conciertos" on "Grupos_Tocan_Conciertos"."Codigo_concierto_Conciertos"="Conciertos"."Codigo_concierto"
	inner join "Discos" on "Grupo_C"."Codigo_grupo_Grupo" = "Discos"."Codigo_grupo_Grupo"
	inner join "Canciones" on "Discos"."Codigo_disco" = "Canciones"."Codigo_disco_Discos"
	inner join "Grupo" on "Grupo_C"."Codigo_grupo_Grupo" = "Grupo"."Codigo_grupo"
	inner join "Entradas" on "Conciertos"."Codigo_concierto"="Entradas"."Codigo_concierto_Conciertos"
where "Conciertos"."Pais" = 'España' and
	"Discos"."Genero"='rock' and 
	"Canciones"."Duracion" > '00:03:00' and 
	"Grupo_C"."Cantidad_musicos" > 3 and
	"Entradas"."Precio" > 20::money and "Entradas"."Precio" < 50::money
order by "Grupo"."Nombre";

select distinct Musicos.Nombre,Grupo.Nombre
from (select Musicos.Codigo_grupo_Grupo, COUNT(*) AS Cantidad_musicos
			from Musicos 
            group by Musicos.Codigo_grupo_Grupo) AS Grupo_C
            inner join Musicos on Grupo_C.Codigo_grupo_Grupo = Musicos.Codigo_grupo_Grupo
            inner join Grupos_Tocan_Conciertos on Grupo_C.Codigo_grupo_Grupo=Grupos_Tocan_Conciertos.Codigo_grupo_Grupo
            inner join Conciertos on Grupos_Tocan_Conciertos.Codigo_concierto_Conciertos=Conciertos.Codigo_concierto
            inner join Discos on Grupo_C.Codigo_grupo_Grupo = Discos.Codigo_grupo_Grupo
            inner join Canciones on Discos.Codigo_disco = Canciones.Codigo_disco_Discos
            inner join Grupo on Grupo_C.Codigo_grupo_Grupo = Grupo.Codigo_grupo
			inner join Entradas on Conciertos.Codigo_concierto=Entradas.Codigo_concierto_Conciertos
where Conciertos.Pais='España' and
		Discos.Genero='rock' and 
        Canciones.Duracion > '00:03:00' and 
        Grupo_C.Cantidad_musicos > 3 and
		Entradas.Precio > 20 and Entradas.Precio < 50
order by Grupo.Nombre;

-- RAMA: Discos_Canciones
-- BIEN 
select count(*)
from (select "Musicos"."Codigo_grupo_Grupo", count (*) as "Cantidad_musicos"
		from "Musicos" 
		group by "Musicos"."Codigo_grupo_Grupo") as "Grupo_C"
	inner join "Grupo" on "Grupo_C"."Codigo_grupo_Grupo" = "Grupo"."Codigo_grupo"
	inner join "Musicos" on "Grupo_C"."Codigo_grupo_Grupo" = "Musicos"."Codigo_grupo_Grupo"
	inner join "Discos" on "Grupo_C"."Codigo_grupo_Grupo" = "Discos"."Codigo_grupo_Grupo"
where 
	"Grupo_C"."Cantidad_musicos" > 3 and
	"Discos"."Genero"='rock';
		
-- MAL
select count(*)
from (select "Musicos"."Codigo_grupo_Grupo", count (*) as "Cantidad_musicos"
		from "Musicos" 
		group by "Musicos"."Codigo_grupo_Grupo") as "Grupo_C"
	inner join "Grupo" on "Grupo_C"."Codigo_grupo_Grupo" = "Grupo"."Codigo_grupo"
	inner join "Musicos" on "Grupo_C"."Codigo_grupo_Grupo" = "Musicos"."Codigo_grupo_Grupo"
	inner join "Discos" on "Grupo_C"."Codigo_grupo_Grupo" = "Discos"."Codigo_grupo_Grupo"
	inner join "Canciones" on "Discos"."Codigo_disco" = "Canciones"."Codigo_disco_Discos"
where 
	"Grupo_C"."Cantidad_musicos" > 3 and
	"Discos"."Genero"='rock'and
	"Canciones"."Duracion" > '00:03:00';
	
-- RAMA: Conciertos entradas
--BIEN
select count(*)
from (select "Musicos"."Codigo_grupo_Grupo", count (*) as "Cantidad_musicos"
		from "Musicos" 
		group by "Musicos"."Codigo_grupo_Grupo") as "Grupo_C"
	inner join "Grupo" on "Grupo_C"."Codigo_grupo_Grupo" = "Grupo"."Codigo_grupo"
	inner join "Musicos" on "Grupo_C"."Codigo_grupo_Grupo" = "Musicos"."Codigo_grupo_Grupo"
	inner join "Grupos_Tocan_Conciertos" on "Grupo_C"."Codigo_grupo_Grupo"="Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
	inner join "Conciertos" on "Grupos_Tocan_Conciertos"."Codigo_concierto_Conciertos"="Conciertos"."Codigo_concierto"
where 
	"Grupo_C"."Cantidad_musicos" > 3 and
	"Conciertos"."Pais"='España';
--MAL
select count(*)
from (select "Musicos"."Codigo_grupo_Grupo", count (*) as "Cantidad_musicos"
		from "Musicos" 
		group by "Musicos"."Codigo_grupo_Grupo") as "Grupo_C"
	inner join "Grupo" on "Grupo_C"."Codigo_grupo_Grupo" = "Grupo"."Codigo_grupo"
	inner join "Musicos" on "Grupo_C"."Codigo_grupo_Grupo" = "Musicos"."Codigo_grupo_Grupo"
	inner join "Grupos_Tocan_Conciertos" on "Grupo_C"."Codigo_grupo_Grupo"="Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
	inner join "Conciertos" on "Grupos_Tocan_Conciertos"."Codigo_concierto_Conciertos"="Conciertos"."Codigo_concierto"
	inner join "Entradas" on  "Conciertos"."Codigo_concierto"="Entradas"."Codigo_concierto_Conciertos"
where 
	"Grupo_C"."Cantidad_musicos" > 3 and
	"Conciertos"."Pais"='España'and
	"Entradas"."Precio" > 20::money and "Entradas"."Precio" < 50::money;

--MEZCLA RAMAS:
select count(*)
from (select "Musicos"."Codigo_grupo_Grupo", count (*) as "Cantidad_musicos"
		from "Musicos" 
		group by "Musicos"."Codigo_grupo_Grupo") as "Grupo_C"
	inner join "Grupo" on "Grupo_C"."Codigo_grupo_Grupo" = "Grupo"."Codigo_grupo"
	inner join "Musicos" on "Grupo_C"."Codigo_grupo_Grupo" = "Musicos"."Codigo_grupo_Grupo"
	inner join "Grupos_Tocan_Conciertos" on "Grupo_C"."Codigo_grupo_Grupo"="Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
	inner join "Conciertos" on "Grupos_Tocan_Conciertos"."Codigo_concierto_Conciertos"="Conciertos"."Codigo_concierto"
	inner join "Discos" on "Grupo_C"."Codigo_grupo_Grupo" = "Discos"."Codigo_grupo_Grupo"
where 
	"Grupo_C"."Cantidad_musicos" > 3 and
	"Conciertos"."Pais"='España'and
	"Discos"."Genero"='rock';
	
--NO CAST
select distinct count(*)
from (select "Musicos"."Codigo_grupo_Grupo",count(*) as "numMusicos"
from "Musicos" group by "Musicos"."Codigo_grupo_Grupo") as "grupoMusicos"
inner join "Musicos" on "grupoMusicos"."Codigo_grupo_Grupo" = "Musicos"."Codigo_grupo_Grupo"
inner join "Grupo" on "grupoMusicos"."Codigo_grupo_Grupo" = "Grupo"."Codigo_grupo"
inner join "Grupos_Tocan_Conciertos" on "Grupo"."Codigo_grupo" = "Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
inner join "Conciertos" on "Grupos_Tocan_Conciertos"."Codigo_concierto_Conciertos" = "Conciertos"."Codigo_concierto"
inner join "Discos" on "Grupo"."Codigo_grupo" = "Discos"."Codigo_grupo_Grupo"
inner join "Canciones" on "Discos"."Codigo_disco" = "Canciones"."Codigo_disco_Discos"
inner join "Entradas" on "Conciertos"."Codigo_concierto" = "Entradas"."Codigo_concierto_Conciertos"
where "Conciertos"."Pais"='España' and
"grupoMusicos"."numMusicos" > 3 and
"Discos"."Genero"='rock' and
"Canciones"."Duracion">'00:03:00' and
"Entradas"."Precio" > '20' and "Entradas"."Precio" < '50';

select distinct "Musicos"."Nombre","Grupo"."Nombre"
from (select "Musicos"."Codigo_grupo_Grupo", count (*) as "Cantidad_musicos"
		from "Musicos" 
		group by "Musicos"."Codigo_grupo_Grupo") as "Grupo_C"
	inner join "Musicos" on "Grupo_C"."Codigo_grupo_Grupo" = "Musicos"."Codigo_grupo_Grupo"
	inner join "Grupos_Tocan_Conciertos" on "Grupo_C"."Codigo_grupo_Grupo"="Grupos_Tocan_Conciertos"."Codigo_grupo_Grupo"
	inner join "Conciertos" on "Grupos_Tocan_Conciertos"."Codigo_concierto_Conciertos"="Conciertos"."Codigo_concierto"
	inner join "Discos" on "Grupo_C"."Codigo_grupo_Grupo" = "Discos"."Codigo_grupo_Grupo"
	inner join "Canciones" on "Discos"."Codigo_disco" = "Canciones"."Codigo_disco_Discos"
	inner join "Grupo" on "Grupo_C"."Codigo_grupo_Grupo" = "Grupo"."Codigo_grupo"
	inner join "Entradas" on "Conciertos"."Codigo_concierto"="Entradas"."Codigo_concierto_Conciertos"
where "Conciertos"."Pais" = 'España' and
	"Discos"."Genero"='rock' and 
	"Canciones"."Duracion" > '00:03:00' and 
	"Grupo_C"."Cantidad_musicos" > 3 and
	"Entradas"."Precio" > 20::money and "Entradas"."Precio" < 50::money
order by "Grupo"."Nombre";
	
	
	
	
	
create index canciones_index_b on "Canciones"  using btree ("Codigo_cancion");
create index conciertos_index_b on "Conciertos"  using btree ("Pais");
create index discos_index_b on "Discos"  using btree ("Genero");
create index entradas_index_b on "Entradas"  using btree ("Precio");
create index grupo_index_b on "Grupo"  using btree ("Codigo_grupo");
create index musicos_index_b on "Musicos"  using btree ("codigo_musico");
create index tocan_index_b on "Grupos_Tocan_Conciertos"  using btree ("Codigo_grupo_Grupo");
cluster "Canciones" using canciones_index_b;