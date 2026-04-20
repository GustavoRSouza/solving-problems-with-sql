-- EASY

	/*
	Na empresa que você trabalha está sendo feito um levantamento sobre os valores dos produtos que são comercializados.

	Para ajudar o setor que está fazendo esse levantamento você deve calcular e exibir o valor médio do preço dos produtos.

	OBS: Mostrar o valor com dois números após o ponto.
	*/

create schema if not exists bee2610;

-- table
create table bee2610.products(
	id int not null,
	name text not null,
	amount int not null,
	price numeric(10,2) not null
);

-- data
insert into bee2610.products(
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
	trunc(avg(price),2) as price
from
	bee2610.products;