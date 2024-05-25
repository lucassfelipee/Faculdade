create database pratica09;

use pratica09;

create table grupo (
  idgrupo int primary key auto_increment,
  nome varchar(45),
  descricao varchar(45)
);

create table aluno (
  ra int primary key,
  nome varchar(45),
  email varchar(45),
  fkgrupo int,
  constraint fk_aluno_grupo foreign key (fkgrupo) references grupo(idgrupo)
);

create table professor (
  idprofessor int primary key auto_increment,
  nome varchar(45),
  disciplina1sem varchar(45)
) auto_increment = 10000;

create table professor_avalia_grupo (
  fkprofessor int,
  fkgrupo int,
  dtinicio datetime,
  nota float,
  constraint fk_professor_avalia foreign key (fkprofessor) references professor (idprofessor),
  constraint fk_grupo_avaliado foreign key (fkgrupo) references grupo (idgrupo),
	primary key (fkprofessor, fkgrupo)
);

insert into grupo (nome, descricao) values
('ben10', 'Relogio magico'),
('desimpedidos', 'Canal de futebol');

insert into aluno (ra, nome, email, fkgrupo) values
(1, 'lucas', 'lucas@gmail.com', 1),
(2, 'kaique', 'kaique@gmail.com', 1),
(3, 'eder', 'eder@gmail.com', 2),
(4, 'rafa', 'rafa@gmail.com', 2);

insert into professor (nome, disciplina1sem) values
('vivian', 'bd'),
('jp', 'algoritmos');

insert into professor_avalia_grupo (fkprofessor, fkgrupo, dtinicio, nota) values
(10000, 1, '2024-05-18 14:00:00', 9.5),
(10001, 2, '2024-05-05 20:00:00', 6.0);

insert into professor_avalia_grupo (fkprofessor, fkgrupo, dtinicio, nota) values
(10000, 2, '2024-05-17 12:00:00', 6.5),
(10001, 1, '2024-05-20 09:00:00', 3.0);

select * from grupo;
select * from aluno;
select * from professor;
select * from professor_avalia_grupo;

select * from aluno
join grupo
on aluno.fkgrupo = grupo.idgrupo;

select * from aluno
join grupo
on aluno.fkgrupo = grupo.idgrupo
where grupo.nome = 'ben10';


select avg(nota) as 'média das notas' from professor_avalia_grupo;
select max(nota) as 'maior nota' from professor_avalia_grupo;
select min(nota) as 'menor nota' from professor_avalia_grupo;
select sum(nota) as 'soma das notas' from professor_avalia_grupo;

select pag.dtinicio, pag.nota, g.*, p.* from grupo as g
join professor_avalia_grupo as pag
on g.idgrupo = pag.fkgrupo
join professor as p
on pag.fkprofessor = p.idprofessor;

select pag.dtinicio, pag.nota, g.*, p.* from grupo as g
join professor_avalia_grupo as pag
on g.idgrupo = pag.fkgrupo
join professor as p
on pag.fkprofessor = p.idprofessor
where g.nome = 'desimpedidos';

select g.*, a.*, p.*, pag.dtinicio from grupo as g
join aluno as a 
on a.fkgrupo = g.idgrupo
join professor_avalia_grupo as pag
on pag.fkgrupo = g.idgrupo
join professor as p
on pag.fkprofessor = p.idprofessor;

select count(distinct nota) as 'notas distintas' from professor_avalia_grupo;

select fkprofessor, avg(nota) as media, sum(nota) from professor_avalia_grupo
group by fkprofessor;

select fkgrupo, avg(nota) as media, sum(nota) from professor_avalia_grupo
group by fkgrupo;

select fkprofessor, max(nota), min(nota) from professor_avalia_grupo
group by fkprofessor;

select fkgrupo, max(nota), min(nota) from professor_avalia_grupo
group by fkgrupo;