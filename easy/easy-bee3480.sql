-- EASY

	/*
	Encontre as cadeiras adjacentes e disponíveis de cada fila da sala de aula. A primeira coluna do resultado deve conter o identificador da fila, 
	a segunda coluna o número da cadeira da esquerda e a terceira o número da cadeira da direita. O resultado deve estar ordenado pelo valor da segunda 
	coluna do resultado (left).
	*/

create schema if not exists bee3480;

-- table
create table bee3480.chairs(
	id int not null,
	queue int  not null,
	available boolean  not null
);

-- data
insert into bee3480.chairs(
	id,
	queue,
	available is TRUE
)values
	(1	,1	,FALSE),
	(2	,1	,FALSE),
	(3	,1	,TRUE),
	(4	,1	,FALSE),
	(5	,1	,FALSE),
	(6	,1	,FALSE),
	(7	,1	,TRUE),
	(8	,1	,TRUE),
	(9	,2	,TRUE),
	(10	,2	,FALSE),
	(11	,2	,TRUE),
	(12	,2	,TRUE),
	(13	,2	,FALSE),
	(14	,2	,TRUE),
	(15	,2	,TRUE),
	(16	,2	,FALSE),
	(17	,3	,TRUE),
	(18	,3	,FALSE),
	(19	,3	,TRUE),
	(20	,3	,FALSE),
	(21	,3	,TRUE),
	(22	,3	,TRUE),
	(23	,3	,FALSE),
	(24	,3	,FALSE),
	(25	,4	,TRUE),
	(26	,4	,FALSE),
	(27	,4	,FALSE),
	(28	,4	,TRUE),
	(29	,4	,TRUE),
	(30	,4	,FALSE),
	(31	,4	,FALSE),
	(32	,4	,TRUE);
	
	
-- problem soluction
select
	a.queue,
	a.id as left,
	b.id as right
from
	bee3480.chairs a
inner join
	bee3480.chairs b
	on a.queue = b.queue
	and a.id + 1 = b.id
where
	a.available is TRUE
	and b.available is TRUE
order by
	a.queue;