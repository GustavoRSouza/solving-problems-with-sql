-- EASY

	/*
	Os vírus estão evoluindo, porém uma nova pesquisa tem provado que trocando algumas proteínas a vacina se torna imbatível. 
	A proteína H1 (Hemaglutinina) quando é substituída pela proteína X (Xenomorphina) tem efeitos interessantes no combate de quase todas as doenças virais. 
	Alguns conspiracionistas dizem que após a descoberta dessa vacina algumas criaturas de 3 metros de altura foram vistas perto do laboratório, mas claro, 
	isso é mentira.

	Portanto você deve substituir todo caractere 'H1' ( Hemaglutinina ) por 'X' ( Xenomorphina ).
	*/

create schema if not exists bee2746;

-- table
create table bee2746.virus(
	id int not null,
	name text not null,
	constraint pk_id_virus primary key (id)
);

-- data
insert into bee2746.virus(
	id,
	name
)values
	(1	,'H1RT'),
	(2	,'H7H1'),
	(3	,'HUN8'),
	(4	,'XH1HX'),
	(5	,'XXXX');


-- problem soluction
select
	replace(name, 'H1', 'X')
from
	bee2746.virus;