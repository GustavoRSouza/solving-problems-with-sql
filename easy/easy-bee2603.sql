-- EASY

create schema if not exists bee2603;

-- table
create table if not exists bee2603.customers(
	id int not null,
	name varchar(50) not null,
	street varchar(50) not null,
	city varchar(50) not null,
	state char(2) not null,
	credit_limit numeric(10,2),
	constraint pk_id_customers primary key (id)
);

-- data
insert into bee2603.customers(
	id, name, street, city, state, credit_limit
)
values
	(1	,'Pedro Augusto da Rocha'		,'Rua Pedro Carlos Hoffman'		,'Porto Alegre'		,'RS'	,700.00),
	(2	,'Antonio Carlos Mamel'			,'Av. Pinheiros'				,'Belo Horizonte'	,'MG'	,3500.50),
	(3	,'Luiza Augusta Mhor'			,'Rua Salto Grande'				,'Niteroi'			,'RJ'	,4000.00),
	(4	,'Jane Ester'					,'Av 7 de setembro'				,'Erechim'			,'RS'	,800.00),
	(5	,'Marcos Antônio dos Santos'	,'Av Farrapos'					,'Porto Alegre'		,'RS'	,4250.25);


-- PROBLEM
	/*
	A empresa fará um evento comemorando os 20 anos de mercado, e para isso faremos uma grande comemoração na cidade de Porto Alegre. 
	Queremos também convidar todos os nossos clientes que estão cadastrados nessa cidade.
	O seu trabalho é nos passar os nomes e os endereços dos clientes que moram em 'Porto Alegre', para entregar os convites pessoalmente.
	*/

select
	name,
	street
from
	bee2603.customers
where
	city = 'Porto Alegre';





