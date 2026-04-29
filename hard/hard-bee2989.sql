-- HARD

	/*
	Para cada departamento, mostrar o nome do departamento, o nome de suas divisões, com a respectiva média salarial 
	e maior salário de cada divisão. O resultado deve estar em ordem decrescente usando a média salarial.

	Dica: Você pode utilizar a função COALESCE(check_expression , 0) para substituir algum valor null por zero; Além disso,
	você também pode utilizar a função ROUND(value, 2) para exibir os valores com 2 casas decimais.
	*/

create schema if not exists bee2989;

-- table
create table bee2989.departamento (
    cod_dep int,
    nome varchar(50),
    endereco varchar(50)
);

create table bee2989.dependente (
	matr int, 
	nome varchar(50), 
	endereco varchar(50)
);

create table bee2989.desconto (
	cod_desc int, 
	nome varchar(50), 
	tipo varchar(10), 
	valor numeric(10,2)
);

create table bee2989.divisao (
	cod_divisao int, 
	nome varchar(50), 
	endereco varchar(50), 
	cod_dep int
);

create table bee2989.emp_desc (
	cod_desc int, 
	matr int
);

create table bee2989.emp_venc (
	cod_venc int, 
	matr int	
);

create table bee2989.empregado (
	matr int, 
	nome varchar(50), 
	endereco varchar(50), 
	data_lotacao timestamp, 
	lotacao int,
	gerencia_cod_dep int, 
	lotacao_div int, 
	gerencia_div int
);

create table bee2989.vencimento (
	cod_venc int, 
	nome varchar(50), 
	tipo varchar(10), 
	valor numeric(10,2)
);

-- data
INSERT INTO bee2989.departamento
("cod_dep", "nome", "endereco")
VALUES
(1, 'Contabilidade', 'R. X'),
(2, 'TI', 'R. Y'),
(3, 'Engenharia', 'R. Y');

INSERT INTO bee2989.dependente
(matr, nome, endereco)
VALUES
(9999, 'Francisco Jose', 'R. Z'),
(88, 'Maria da Silva', 'R. T'),
(55, 'Virgulino da Silva', 'R. 31');

INSERT INTO bee2989.desconto
(cod_desc, nome, tipo, valor)
VALUES
(91, 'IR', 'V', 400.00),
(92, 'Plano de saude', 'v', 300.00),
(93, NULL, NULL, NULL);

INSERT INTO bee2989.divisao
(cod_divisao, nome, endereco, cod_dep)
VALUES
(11, 'Ativo', 'R. X', 1),
(12, 'Passivo', 'R. X', 1),
(21, 'Desenvoilvimento de Projetos', 'R. Y', 2),
(22, 'Analise de Sistemas', 'R. Y', 2),
(23, 'Programacao', 'R. W', 2),
(31, 'Concreto', 'R Y', 3),
(32, 'Calculo Estrutural', 'R. Y', 3);

INSERT INTO bee2989.emp_desc
(cod_desc, matr)
VALUES
(91, 3),
(91, 27),
(91, 9999),
(92, 27),
(92, 71),
(92, 88),
(92, 9999);

INSERT INTO bee2989.emp_venc
(cod_venc, matr)
VALUES
(1, 27),
(1, 88),
(1, 135),
(1, 254),
(1, 431),
(2, 1),
(2, 5),
(2, 7),
(2, 13),
(2, 33),
(2, 9999),
(3, 3),
(3, 55),
(3, 71),
(3, 222),
(4, 25),
(4, 476),
(5, 371),
(6, 3),
(6, 27),
(6, 9999),
(7, 5),
(7, 33),
(7, 55),
(7, 71),
(7, 88),
(7, 254),
(7, 476),
(8, 25),
(8, 91),
(9, 1),
(9, 27),
(9, 91),
(9, 135),
(9, 371),
(9, 9999),
(10, 371),
(10, 9999),
(11, 91),
(12, 3),
(12, 27),
(12, 254),
(12, 9999),
(13, 3),
(13, 5),
(13, 7),
(13, 25),
(13, 33),
(13, 88),
(13, 135);

INSERT INTO bee2989.empregado
(matr, nome, endereco, data_lotacao, lotacao, gerencia_cod_dep, lotacao_div, gerencia_div)
VALUES
(9999, 'Jose Sampaio', 'R Z', '2006-06-06 00:00:00', 1, 1, 12, NULL),
(33, 'Jose Maria', 'R 21', '2006-03-01 00:00:00', 1, NULL, 11, 11),
(1, 'Maria Jose', 'R. 52', '2003-03-01 00:00:00', 1, NULL, 11, NULL),
(7, 'Yasmim', 'R. 13', '210-07-02 00:00:00', 1, NULL, 11, NULL),
(5, 'Rebeca', 'R. 1', '2011-04-01 00:00:00', 1, NULL, 12, 12),
(13, 'Sofia', 'R. 28', '2010-09-09 00:00:00', 1, NULL, 12, NULL),
(27, 'Andre', 'R. Z', '2005-05-01 00:00:00', 2, 2, 22, NULL),
(88, 'Yami', 'R. T', '2014-02-01 00:00:00', 2, NULL, 21, 21),
(431, 'Joao da Silva', 'R. Y', '2011-07-03 00:00:00', 2, NULL, 21, NULL),
(135, 'Ricardo Reis', 'R. 33', '2009-08-01 00:00:00', 2, NULL, 21, NULL),
(254, 'Barbara', 'R. Z', '2008-01-03 00:00:00', 2, NULL, 22, 22),
(371, 'Ines', 'R. Y', '2005-01-01 00:00:00', 2, NULL, 22, NULL),
(476, 'Flor', 'r. Z', '2015-10-28 00:00:00', 2, NULL, 23, 23),
(25, 'Lina', 'R. 67', '2014-09-01 00:00:00', 2, NULL, 23, NULL),
(3, 'Jose da Silva', 'R. 8', '2011-01-02 00:00:00', 3, 3, 31, NULL),
(71, 'Silverio dos Reis', 'r. C', '2009-01-05 00:00:00', 3, NULL, 31, 31),
(91, 'Reis da Silva', 'R. Z', '2011-11-05 00:00:00', 3, NULL, 31, NULL),
(55, 'Lucas', 'R 31', '2013-07-01 00:00:00', 3, NULL, 32, 32),
(222, 'Marina', 'R 31', '2015-01-07 00:00:00', 3, NULL, 32, NULL),
(725, 'Angelo', 'R. X', '2001-03-01 00:00:00', 2, NULL, 21, NULL);

INSERT INTO bee2989.vencimento
(cod_venc, nome, tipo, valor)
VALUES
(1, 'salario base Analista de Sistemas', 'V', 5000.00),
(2, 'Salario base Contador', 'V', 3000.00),
(3, 'Salario Base Engenheiro', 'V', 4500.00),
(4, 'Salario Base Projetista Software', 'V', 5000.00),
(5, 'Salario Base Programador de Sistemas', 'V', 3000.00),
(6, 'Gratificacao Chefia Departamento', 'V', 3750.00),
(7, 'Gratificacao Chefia Divisao', 'V', 2200.00),
(8, 'Salario Trabalhador Costrucao Civil', 'V', 800.00),
(9, 'Auxilio Salario Familia', 'V', 300.00),
(10, 'Gratificacao Tempo de servico', 'V', 350.00),
(11, 'Insalubridade', 'V', 800.00),
(12, 'Gratificacao por titulacao - Doutorado', 'V', 2000.00),
(13, 'Gratificacao por Titularidade - Mestrado', 'V', 800.00);
	


-- problem soluction
with sal_bruto as (
	select
		a.matr,
		coalesce(sum(c.valor),0) as sal_bruto
	from
		bee2989.empregado a
	left join
		bee2989.emp_venc b
		on a.matr = b.matr
	left join
		bee2989.vencimento c
		on b.cod_venc = c.cod_venc
	group by
		a.matr
),
descontos as (
	select
		a.matr,
		coalesce(sum(c.valor),0) as descontos
	from
		bee2989.empregado a
	left join
		bee2989.emp_desc b
		on a.matr = b.matr
	left join
		bee2989.desconto c
		on b.cod_desc = c.cod_desc
	group by
		a.matr
),
sal_liquido as (
	select
		a.matr,
		coalesce(a.sal_bruto,0) - coalesce(b.descontos,0) as sal_liquido
	from
		sal_bruto a
	left join
		descontos b
		on a.matr = b.matr
)
select
	a.nome as departamento,
	b.nome as divisao,
	round(avg(d.sal_liquido),2) as media,
	round(max(d.sal_liquido),2) as maior
from
	bee2989.departamento a
left join
	bee2989.divisao b
	on a.cod_dep = b.cod_dep
left join
	bee2989.empregado c
	on b.cod_divisao = c.lotacao_div
left join
	sal_liquido d
	on c.matr = d.matr
group by
	a.nome,
	b.nome
order by
	media desc;