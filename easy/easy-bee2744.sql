-- EASY

	/*
	Você foi contratado para dar consultoria a uma empresa. Analisando o banco de dados você notou que as senhas gravadas dos usuários estão em formato de texto, sendo que isso pode gerar uma falha de segurança, uma vez que elas não estão criptografadas.

	Por tanto você deve selecionar o id, a senha atual e a senha transformada em MD5 de cada usuário na tabela account.
	*/

create schema if not exists bee2744;

-- table
create table bee2744.account(
	id int not null,
	name varchar(100) not null,
	login varchar(100) not null,
	password text not null,
	constraint pk_id_account primary key (id)
);

-- data
insert into bee2744.account(
	id,
	name,
	login,
	password
)values
	(1	,'Joyce P. Parry'		,'Promeraw'		,'noh1Oozei'),
	(2	,'Michael T. Gonzalez'	,'Phers1942'	,'Iath3see9bi'),
	(3	,'Heather W. Lawless'	,'Hankicht'		,'diShono4'),
	(4	,'Otis C. Hitt'			,'Conalothe'	,'zooFohH7w'),
	(5	,'Roger N. Brownfield'	,'Worseente'	,'fah7ohNg');


-- problem soluction
select
	id,
	password,
	md5(password)
from
	bee2744.account;