-- EASY

	/*
	O setor de vendas quer fazer uma promoção para todos os clientes que são pessoas jurídicas. 
	Para isso você deve exibir o nome dos clientes que sejam pessoa jurídica.
	*/

create schema if not exists bee2622;

-- tables
create table bee2622.customers(
	id int not null,
	name varchar(100) not null,
	street varchar(100) not null,
	city varchar(100) not null,
	state char(2) not null,
	credit_limit numeric(10,2),
	constraint pk_id_customers primary key (id)
);

create table bee2622.legal_person(
	id_customers int not null,
	cnpj text not null,
	contact text not null,
	constraint fk_id_customers foreign key (id_customers) references bee2622.customers(id)
);

-- data
insert into bee2622.customers(
	id,
	name,
	street,
	city,
	state,
	credit_limit
)values
	(1	,'Nicolas Diogo Cardoso'					,'Acesso Um'								,'Porto Alegre'		,'RS'	,475),
	(2	,'Cecília Olivia Rodrigues'					,'Rua Sizuka Usuy'							,'Cianorte'			,'PR'	,3170),
	(3	,'Augusto Fernando Carlos Eduardo Cardoso'	,'Rua Baldomiro Koerich'					,'Palhoça'			,'SC'	,1067),
	(4	,'Nicolas Diogo Cardoso'					,'Acesso Um'								,'Porto Alegre'		,'RS'	,475),
	(5	,'Sabrina Heloisa Gabriela Barros'			,'Rua Engenheiro Tito Marques Fernandes'	,'Porto Alegre'		,'RS'	,4312),
	(6	,'Joaquim Diego Lorenzo Araújo'				,'Rua Vitorino'								,'Novo Hamburgo'	,'RS'	,2314);

	
insert into bee2622.legal_person(
	id_customers,
	cnpj,
	contact
)values
	(4	,'85883842000191'	,'99767-0562'),
	(5	,'47773848000117'	,'99100-8965');



-- problem soluction
select
	a.name
from
	bee2622.customers a
inner join
	bee2622.legal_person b
	on a.id = b.id_customers;