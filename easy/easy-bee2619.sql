-- EASY

	/*
	A nossa empresa está querendo fazer um novo contrato para o fornecimento de novos produtos superluxuosos, e para isso precisamos de alguns dados dos nossos produtos.

	Seu trabalho é exibir o nome dos produtos, nome dos fornecedores e o preço, para os produtos cujo preço seja maior que 1000 e sua categoria seja ‘Super Luxury.
	*/

create schema if not exists bee2619;

-- tables
create table bee2619.providers(
	id int not null,
	name varchar(100) not null,
	street varchar(100) not null,
	city varchar(100) not null,
	state char(2) not null
);

create table bee2619.products(
	id int not null,
	name varchar(100) not null,
	amount int not null,
	price numeric(10,2),
	id_providers int not null,
	id_categories int not null
);

create table bee2619.categories(
	id int not null,
	name varchar(100) not null
);


-- data
insert into bee2619.providers(
	id,
	name,
	street,
	city,
	state
)values
	(1	,'Ajax SA'		,'Rua Presidente Castelo Branco'	,'Porto Alegre'		,'RS'),
	(2	,'Sansul SA'	,'Av Brasil'						,'Rio de Janeiro'	,'RJ'),
	(3	,'South Chairs'	,'Rua do Moinho'					,'Santa Maria'		,'RS'),
	(4	,'Elon Electro'	,'Rua Apolo'						,'São Paulo'		,'SP'),
	(5	,'Mike electro'	,'Rua Pedro da Cunha'				,'Curitiba'			,'PR');

insert into bee2619.products(
	id,
	name,
	amount,
	price,
	id_providers,
	id_categories
)values
	(1	,'Blue Chair'		,30		,300.00		,5	,5),
	(2	,'Red Chair'		,50		,2150.00	,2	,1),
	(3	,'Disney Wardrobe'	,400	,829.50		,4	,1),
	(4	,'Blue Toaster'		,20		,9.90		,3	,1),
	(5	,'TV'				,30		,3000.25	,2	,2);

insert into bee2619.categories(
	id,
	name
)values
	(1	,'Super Luxury'),
	(2	,'Imported'),
	(3	,'Tech'),
	(4	,'Vintage'),
	(5	,'Supreme');
	
-- problem soluction
select
	a.name,
	b.name,
	a.price
from
	bee2619.products a
inner join
	bee2619.providers b
	on a.id_providers = b.id
inner join
	bee2619.categories c
	on a.id_categories = c.id
where
	a.price > 1000
	and c.name = 'Super Luxury';