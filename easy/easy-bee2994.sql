-- EASY

	/*
	Você trabalha no setor de TI de um Hospital e precisa calcular a receita de pagamento de cada um dos médicos. 
	Cada médico ganha 150$ por hora mais uma porcentagem dependendo do turno de trabalho, por exemplo, 
	o médico Wellington trabalhou 1 hora no turno do dia, e 2 horas no turno da noite, logo seu salário semanal será: 
	( ( 1 * 150 ) + 1% ) + ( ( 2 * 150 ) + 15% ) = 496.5. 
	Além disso, você pode usar a função round(value,1) para exibir os salários com 1 casa decimal e ordene o resultado do maior para o menor salário.
	*/

create schema if not exists bee2994;

-- tables
create table bee2994.doctors(
	id int not null,
	name varchar(100) not null
);

create table bee2994.work_shifts(
	id int not null,
	name varchar(100) not null,
	bonus float not null
);

create table bee2994.attendances(
	id int not null,
	id_doctor int not null,
	hours int not null,
	id_work_shift int not null
);

-- data
insert into bee2994.doctors(
	id,
	name
)values
	(1	,'Arlino'),
	(2	,'Tiago'),
	(3	,'Amanda'),
	(4	,'Wellington');

insert into bee2994.work_shifts(
	id,
	name,
	bonus
)values
	(1	,'nocturnal'	,15),
	(2	,'afternoon'	,2),
	(3	,'day'			,1);

insert into bee2994.attendances(
	id,
	id_doctor,
	hours,
	id_work_shift 
)values
	(1	,1	,5	,1),
	(2	,3	,2	,1),
	(3	,3	,3	,2),
	(4	,2	,2	,3),
	(5	,1	,5	,3),
	(6	,4	,1	,3),
	(7	,4	,2	,1),
	(8	,3	,2	,2),
	(9	,2	,4	,2);

	
-- problem soluction
select
	a.name,
	round(sum(b.hours * 150 * (1 + c.bonus/100.0))::numeric,1) as salary
from
	bee2994.doctors a
inner join
	bee2994.attendances b
	on a.id = b.id_doctor
inner join
	bee2994.work_shifts c
	on b.id_work_shift = c.id
group by
	a.name
order by
	salary desc;
