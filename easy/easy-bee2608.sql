-- EASY

	/*
	O setor financeiro da nossa empresa, está querendo saber os menores e maiores valores dos produtos, que vendemos.

	Para isso exiba somente o maior e o menor preço da tabela produtos.
	*/

create schema if not exists bee2608;

-- table
create table bee2608.products(
	id int,
	name varchar(50) not null,
	amount int not null,
	price numeric(10,2) not null,
	constraint pk_id_products primary key (id)
);

-- data
insert into bee2608.products(
	id,
	name,
	amount,
	price
)values
	(1	,'Two-doors wardrobe'	,100	,800),
	(2	,'Dining table'			,1000	,560),
	(3	,'Towel holder'			,10000	,25.50),
	(4	,'Computer desk'		,350	,320.50),
	(5	,'Chair'				,3000	,210.64),
	(6	,'Single bed'			,750	,460);

-- problem soluction
select
	max(price) as maior_valor,
	min(price) as menor_valor
from
	bee2608.products;