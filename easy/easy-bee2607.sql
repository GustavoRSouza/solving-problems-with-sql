-- EASY

	/*
	Todos os meses a empresa pede um relatório das cidades que os fornecedores estão cadastrados. 
	Dessa vez não vai ser diferente, faça uma consulta no Banco de Dados que retorne todas as cidades dos fornecedores, mas em ordem alfabética.

	OBS: Você não deve mostrar cidades repetidas.	
	*/

create schema if not exists bee2607;

-- table
create table bee2607.providers(
	id int,
	name varchar(50) not null,
	street varchar(100) not null,
	city varchar(50) not null,
	state char(2) not null,
	constraint pk_id_providers primary key (id)
);

-- data
insert into bee2607.providers(
	id, name, street, city, state
)values
	(1	,'Henrique'			,'Av Brasil'		,'Rio de Janeiro'	,'RJ'),
	(2	,'Marcelo Augusto'	,'Rua Imigrantes'	,'Belo Horizonte'	,'MG'),
	(3	,'Caroline Silva'	,'Av São Paulo'		,'Salvador'			,'BA'),
	(4	,'Guilerme Staff'	,'Rua Central'		,'Porto Alegre'		,'RS'),
	(5	,'Isabela Moraes'	,'Av Juiz Grande'	,'Curitiba'			,'PR'),
	(6	,'Francisco Accerr'	,'Av Paulista'		,'São Paulo'		,'SP');


-- problem soluction
select
	distinct city
from
	bee2607.providers
order by
	city asc;