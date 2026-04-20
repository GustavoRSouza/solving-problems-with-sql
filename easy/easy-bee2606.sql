-- EASY

	/*
	Quando os dados foram migrados de Banco de Dados, houve um pequeno mal-entendido por parte do antigo DBA.

	Seu chefe precisa que você exiba o código e o nome dos produtos, cuja categoria inicie com 'super'.
	*/

create schema if not exists bee2606;

-- table

create table bee2606.categories(
	id int not null,
	name text not null
);

create table bee2606.products(
	id int not null,
	name text not null,
	amount text not null,
	price text not null,
	id_categories int not null
);

-- data
insert into bee2606.categories(
	id,
	name
)values
	(1	,'old stock'),	
	(2	,'new stock'),	
	(3	,'modern'),
	(4	,'commercial'),
	(5	,'recyclable'),
	(6	,'executive'),
	(7	,'superior'),
	(8	,'wood'),
	(9	,'super luxury'),
	(10 ,'vintage');

insert into bee2606.products(
	id,
	name,
	amount,
	price,
	id_categories 
)values
	(1	,'Lampshade'			,100	,800	,4),
	(2	,'Table for painting'	,1000	,560	,9),
	(3	,'Notebook desk'		,10000	,25.50	,9),
	(4	,'Computer desk'		,350	,320.50	,6),
	(5	,'Chair'				,3000	,210.64	,9),
	(6	,'Home alarm'			,750	,460	,4);

-- problem soluction
select
	a.id,
	a.name
from
	bee2606.products a
inner join
	bee2606.categories b
	on a.id_categories = b.id
where
	b.name like 'super%';