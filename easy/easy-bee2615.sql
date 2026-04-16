-- EASY

	/*
	A locadora tem objetivos de criar várias franquias espalhadas pelo Brasil. 
	Para isso queremos saber em quais cidades nossos clientes moram.

	Para você nos ajudar selecione o nome de todas as cidades onde a locadora tem clientes. 
	Mas por favor, não repita o nome da cidade.
	*/

create schema if not exists bee2615;

-- table
create table bee2615.customers(
	id int,
	name varchar(50) not null,
	street varchar(100) not null,
	city varchar(50) not null,
	constraint pk_id_customers primary key (id)
);

-- data
insert into bee2615.customers(
	id,
	name,
	street,
	city
)values
	(1	,'Giovanna Goncalves Oliveira'	,'Rua Mato Grosso'					,'Canoas'),
	(2	,'Kauã Azevedo Ribeiro'			,'Travessa Ibiá'					,'Uberlândia'),
	(3	,'Rebeca Barbosa Santos'		,'Rua Observatório Meteorológico'	,'Salvador'),
	(4	,'Sarah Carvalho Correia'		,'Rua Antônio Carlos da Silva'		,'Uberlândia'),
	(5	,'João Almeida Lima'			,'Rua Rio Taiuva'					,'Ponta Grossa'),
	(6	,'Diogo Melo Dias'				,'Rua Duzentos e Cinqüenta'			,'Várzea Grande');


-- problem soluction
select
	distinct city
from
	bee2615.customers;