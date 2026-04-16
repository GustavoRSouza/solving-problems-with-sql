-- EASY
	
	/*
	A Secretaria de Turismo do Ceará está desenvolvendo um ranking de cidades turísticas. 
	Eles querem um relatório que mostre não apenas quantos pontos turísticos cada cidade possui, mas também:
	
		O nome da cidade e sua região (ex.: Litoral, Sertão, Cariri).
		A quantidade total de pontos turísticos cadastrados.
		A média de avaliações dos pontos turísticos daquela cidade (cada ponto turístico recebe notas de visitantes, de 1 a 5).
		Uma coluna chamada ranking_regional, que mostre a posição da cidade dentro da sua própria região, ordenada pela média de avaliações (decrescente).
		Somente cidades com pelo menos 2 pontos turísticos cadastrados devem aparecer no relatório.
		O resultado deve estar ordenado pela região e pelo ranking_regional
	*/

create schema if not exists bee3492;

-- table
create table bee3492.cidades(
	cidade_id int not null,
	nome_cidade varchar(100) not null,
	regiao varchar(100) not null,
	constraint pk_cidade_id primary key (cidade_id)
);

create table bee3492.pontosTuristicos(
	ponto_id int not null,
	nome_ponto varchar(100) not null,
	cidade_id int not null,
	constraint pk_ponto_id primary key (ponto_id),
	constraint fk_ponto_cidade_id foreign key (cidade_id) references bee3492.cidades(cidade_id)
);

create table bee3492.avaliacoes(
	avaliacao_id int not null,
	ponto_id int not null,
	nota float,
	constraint pk_avaliacao_id primary key (avaliacao_id),
	constraint fk_avaliacoes_ponto_id foreign key (ponto_id) references bee3492.pontosTuristicos(ponto_id)
);

-- data
insert into bee3492.cidades(
	cidade_id,
	nome_cidade,
	regiao
)values
	(1	,'Fortaleza'	,'Litoral'),
	(2	,'Jericoacoara'	,'Litoral'),
	(3	,'Juazeiro'		,'Cariri'),
	(4	,'Sobral'		,'Sertão');

insert into bee3492.pontosTuristicos(
	ponto_id,
	nome_ponto,
	cidade_id
)values
	(1	,'Praia de Iracema'			,1),
	(2	,'Beira Mar'				,1),
	(3	,'Pedra Furada'				,2),
	(4	,'Lagoa Azul'				,2),
	(5	,'Horto do Padre Cícero'	,3),
	(6	,'Museu Dom José'			,4);


insert into bee3492.avaliacoes(
	avaliacao_id,
	ponto_id,
	nota
)values
	(1	,1	,5),
	(2	,1	,4),
	(3	,2	,3),
	(4	,3	,5),
	(5	,3	,4),
	(6	,4	,4),
	(7	,5	,5),
	(8	,5	,5);


-- problem soluction
select
	a.nome_cidade,
	a.regiao,
	count(distinct b.ponto_id) as qtd_pontos,
	avg(c.nota) as media_avaliacoes,
	dense_rank() over(partition by a.regiao order by avg(c.nota) desc) as ranking_regional
from
	bee3492.cidades a
left join
	bee3492.pontosTuristicos b
	on a.cidade_id = b.cidade_id
left join
	bee3492.avaliacoes c
	on b.ponto_id = c.ponto_id		
group by
	a.nome_cidade,
	a.regiao
having
	count(distinct b.ponto_id) >= 2
order by
	a.regiao,
	ranking_regional;

