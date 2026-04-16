-- EASY

	/*
	O setor financeiro encontrou alguns problemas na entrega de um dos nossos fornecedores, a entrega dos produtos não condiz com a nota fiscal.

	Seu trabalho é exibir o nome dos produtos e o nome do fornecedor, para os produtos fornecidos pelo fornecedor ‘Ajax SA’.
	*/

create schema if not exists bee2617;

-- tables
create table bee2617.providers(
	id int not null,
	name varchar(100) not null,
	street varchar(100) not null,
	city varchar(100) not null,
	state char(2) not null,
	constraint pk_id_providers primary key (id)
);

create table bee2617.products(
	id int not null,
	name varchar(100) not null,
	amount numeric(10,2) not null,
	price numeric(10,2) not null,
	id_providers int not null,
	constraint pk_id_products primary key (id),
	constraint fk_id_providers foreign key (id_providers) references bee2617.providers(id)
);

-- data
insert into bee2617.providers(
	id,
	name,
	street,
	city,
	state
)values
	(1	,'Ajax SA'		,'Presidente Castelo Branco'	,'Porto Alegre'		,'RS'),
	(2	,'Sansul SA'	,'Av Brasil'					,'Rio de Janeiro'	,'RJ'),
	(3	,'South Chairs'	,'Av Moinho'					,'Santa Maria'		,'RS'),
	(4	,'Elon Electro'	,'Apolo'						,'São Paulo'		,'SP'),
	(5	,'Mike Electro'	,'Pedro da Cunha'				,'Curitiba'			,'PR');	

insert into bee2617.products(
	id,
	name,
	amount,
	price,
	id_providers
)values
	(1	,'Blue Chair'		,30		,300.00		,5),
	(2	,'Red Chair'		,50		,2150.00	,1),
	(3	,'Disney Wardrobe'	,400	,829.50		,4),
	(4	,'Blue Toaster'		,20		,9.90		,3),
	(5	,'Solar Panel'		,30		,3000.25	,4);


-- problem soluction
select
	b.name as descricao_produto,
	a.name as fornecedor
from
	bee2617.providers a
inner join
	bee2617.products b
	on a.id = b.id_providers
where
	a.name = 'Ajax SA';