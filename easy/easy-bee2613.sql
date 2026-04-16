-- EASY

	/*
	Antigamente a locadora fez um evento em que vários filmes estavam em promoção, queremos saber que filmes eram esses.

	Seu trabalho para nós ajudar é selecionar o ID e o nome dos filmes cujo preço for menor que 2.00.
	*/

create schema if not exists bee2613;

-- tables
create table bee2613.movies(
	id int not null,
	name varchar(100),
	id_prices int not null,
	constraint pk_id_movies primary key (id),
	constraint fk_id_prices foreign key (id_prices) references bee2613.prices(id)
);

create table bee2613.prices(
	id int not null,
	categorie varchar(100),
	value float not null,
	constraint pk_id_prices primary key (id)
);

-- data
insert into bee2613.movies(
	id,
	name,
	id_prices
)values
	(1	,'Batman'						,3),
	(2	,'The Battle of the Dark River'	,3),
	(3	,'White Duck'					,5),
	(4	,'Breaking Barriers'			,4),
	(5	,'The Two Hours'				,2);


insert into bee2613.prices(
	id,
	categorie,
	value
)values
	(1	,'Releases'	,3.50),
	(2	,'Bronze Seal'	,2.00),
	(3	,'Silver Seal'	,2.50),
	(4	,'Gold Seal'	,3.00),
	(5	,'Promotion'	,1.50);



-- problem soluction
select
	a.id,
	a.name
from
	bee2613.movies a
inner join
	bee2613.prices b
	on a.id_prices = b.id
where
	b.value < 2.00;