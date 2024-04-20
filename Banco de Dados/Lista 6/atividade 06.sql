-- Prática 06 --
-- 	Exercico 1 --

create database alunoProjeto;

use alunoProjeto;
 
 create table projeto(
 idProjeto int primary key auto_increment,
 nome varchar(45),
 descricao varchar(45));
 
 create table aluno(
 RA char(8) primary key,
 nome varchar (45),
 telefone varchar(45),
 
 fkProjeto int,
 constraint fkProjetoAluno foreign key (fkProjeto) references projeto(idProjeto));
 
alter table aluno add column fkAlunoRep char(8), 
add constraint fkAlunoRepresentante foreign key (fkAlunoRep) references aluno(RA); 

create table acompanhante(
idAcompanhante int,
nome varchar (45),
relacao varchar(45),

fkAluno char(8),
constraint pkJunto primary key (fkAluno, idAcompanhante), 
constraint fkAcompanhanteAluno foreign key (fkAluno) references aluno(RA)
);


insert into projeto values
(default,'berry.bite','monitoramento de estufa'),
(default,'AGtech','monitoramento de cafe');

describe aluno;
insert into aluno values
('01241188','lucas','11967027625', 1, null),
('01241100','kaique','1192345667', 2, '01241188'),
('01241070','eder','1198765432', 1, '01241100'),
('01241112','guilherme','11967023456', 2,'01241070');

insert into acompanhante values
(1,'iza','amiga','01241188' ),
(2,'julia','amiga','01241100' ),
(3,'beatriz','ex', '01241070'),
(4,'mariana','namorada','01241112' );

select * from projeto;
select * from aluno;
select * from acompanhante;


select * from aluno 
join projeto on aluno.fkProjeto = projeto.idProjeto;

select * from aluno 
join aluno as representante on aluno.fkAlunoRep = representante.RA;

select * from aluno 
join projeto on aluno.fkProjeto = projeto.idProjeto
where projeto.nome = 'berry.bite';

select * from aluno
join projeto on aluno.fkProjeto = idProjeto
join aluno as representante on aluno.fkAlunoRep = representante.RA;

-- exercicio 2 --

create database Campanha1;

use campanha1;

create table organizador(
idOrganizador int primary key auto_increment,
nome varchar(45),
rua varchar(45),
bairro varchar(45),
email varchar (45),

fkOrgaExp int,
constraint fkOrganizadorExp foreign key (fkOrgaExp) references organizador (idOrganizador));

alter table organizador auto_increment = 30;

create table campanha(
idCamp int primary key auto_increment,
categoria varchar(45),
instituicao1 varchar(45),
instituicao2 varchar(45),
dtFinal  date,

fkOrganizador int,
constraint fkOrgaCamp foreign key (fkOrganizador) references organizador (idOrganizador));

alter table campanha auto_increment = 500;

insert into organizador values
(default,'lucas','carlos mauro','sao joao climaco','lucas@gmail.com', null ),
(default,'gabi','anny','sao paulo', 'gabi@gmail.com', 30 ),
(default,'joao','mario kart','santo andre','joao@outlook.com', null ),
(default,'roberto','terracota','sao caetano', 'gabi@sptech.school', 32);


insert into campanha values 
(default,'alimento','alimentos para necessitados', 'alimetar moradores de rua' ,'2024-04-15', 30),
(default,'higiene','higiene necessaria', null ,'2024-04-28', 31 ),
(default,'mascara','saude é protecao', 'todos contra o corona' ,'2026-07-20', 32 ),
(default,'alimento','alimentar ', null ,'2025-02-11', 33 ),
(default,'higiene','anti-virus ', null  ,'2030-12-10', 30 );

select * from organizador;
select * from campanha;

select * from organizador 
join campanha on  campanha.fkOrganizador = organizador.idOrganizador;
 
select * from organizador 
join campanha on campanha.fkOrganizador = organizador.idOrganizador
where organizador.nome = 'lucas';

select * from organizador 
join organizador as orientador on organizador.fkOrgaExp = orientador.idOrganizador;

select * from organizador 
join organizador as orientador on organizador.fkOrgaExp = orientador.idOrganizador
where orientador.nome = 'lucas';

select * from organizador 
join organizador as orientador on organizador.fkOrgaExp = orientador.idOrganizador 
join campanha on campanha.fkOrganizador = organizador.idOrganizador;

select * from organizador as novato 
join organizador as orientador on novato.fkOrgaExp = orientador.idOrganizador
join campanha on campanha.fkOrganizador = novato.idOrganizador
where novato.nome = 'roberto';