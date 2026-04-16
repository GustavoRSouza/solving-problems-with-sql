-- EASY

	/*
	O setor financeiro da empresa precisa de um relatório que mostre o código e o nome dos produtos cujo preço são menores que 10 ou maiores que 100.
	*/

create schema if not exists bee2604;

-- table
create table bee2604.products(
	id int not null,
	name varchar(100) not null,
	amount int not null,
	price numeric(10,2),
	constraint pk_id_products primary key (id)
);

-- data
insert into bee2604.products(
	id,
	name,
	amount,
	price
)values
	(1	,'Two-door wardrobe'	,100	,80),
	(2	,'Dining table'			,1000	,560),
	(3	,'Towel holder'			,10000	,5.50),
	(4	,'Computer desk'		,350	,100),
	(5	,'Chair'				,3000	,210.64),
	(6	,'Single bed'			,750	,99);


-- problem soluction
select
	id,
	name
from
	bee2604.products
where
	price < 10 or price >100;