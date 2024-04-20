create database sprint01;
use sprint01;

-- EXERCÍCIO 01 --

create table professor (
idProfessor int primary key auto_increment,
nome varchar(50),
sobrenome varchar(30),
especialidade1 varchar(40),
especialidade2 varchar(40));

insert into professor values
(default, 'JP', 'Vivian', 'Algoritimos', 'BD'),
(default, 'Nadia', 'Marise', 'BD', 'Arq Comp'),
(default, 'Fernanda', 'Brain', 'P.I', 'Algoritimos'),
(default, 'Marcos', 'Alex', 'T.I', 'Arq Comp'),
(default, 'Luana', 'Mateus', 'Arq Comp', 'S.O'),
(default, 'Pedro', 'Marcos', 'S.O', 'T.I');

create table disciplina (
idDisc int primary key auto_increment,
nomeDisc varchar(45));

insert into disciplina values
(default, 'Arquetetura Computacional'),
(default, 'Banco de Dados'),
(default, 'Algoritimos');

alter table professor add column fkDisciplina int,
	add constraint fkProfessorDisciplina foreign key (fkDisciplina)
		references disciplina(idDisc);
        
update professor set fkDisciplina = 1 where idProfessor = 1;
update professor set fkDisciplina = 2 where idProfessor = 2;
update professor set fkDisciplina = 3 where idProfessor = 3;
update professor set fkDisciplina = 1 where idProfessor = 4;
update professor set fkDisciplina = 2 where idProfessor = 6;
update professor set fkDisciplina = 3 where idProfessor = 5;

alter table professor modify column fkDisciplina int not null;
describe disciplina;

select * from professor join disciplina
	on idDisc = fkDisciplina;
    
select professor.nome, disciplina.nomeDisc from professor join disciplina
	on idDisc = fkDisciplina;
    
select * from professor join disciplina
	on idDisc = fkDisciplina where sobrenome = 'Souza';
    
select professor.especialidade1, disciplina.nomeDisc from professor join disciplina
 on idDisc = fkDisciplina where nome = 'Vivian' order by especialidade1;

-- EXERCÍCIO 02 --

create database sprint2;
use sprint2;
drop database sprint2;

create table curso (
idCurso int primary key auto_increment,
nome varchar(50),
sigla varchar(3),
coordenador varchar(45));

insert into curso values
(default, 'Javascript', 'Js', 'juan'),
(default, 'Css', 'Css', 'Pedro'),
(default, 'Html', 'Html', 'Marcos');

create table professor (
idProfessor int primary key auto_increment,
nome varchar(45));

insert into professor values
(default, 'Lucas'),
(default, 'Joao'),
(default, 'Miguel'),
(default, 'Mateus');

alter table professor add column fkCurso int,
	add constraint fkProfessorCurso foreign key (fkCurso)
		references curso(idCurso);
        
update professor set fkCurso = 1 where idProfessor = 1;
update professor set fkCurso = 1 where idProfessor = 3;
update professor set fkCurso = 2 where idProfessor = 2;
update professor set fkCurso = 3 where idProfessor = 4;

select * from professor join curso 
	on fkCurso = idCurso;
    
select * from professor join curso 
	on fkCurso = idCurso where coordenador like '%i%';
    
alter table curso add constraint chkNome
check (nome in('Css', 'Html', 'JavaScript'));

 
-- DESAFIO 01 --
                 
create table notebook (
idNote int primary key auto_increment,
modelo varchar(45),
marca varchar(45),
preco decimal (10,2));

insert into notebook values
(default, 'mcbook', 'apple', 1800),
(default, 'nitro', 'Acer', 2400),
(default, 'book2', 'Samsung', 2200);

create table loja (
idLoja int primary key auto_increment,
nome varchar(45));

insert into loja values
(default, 'kabum'),
(default, 'pichau'),
(default, 'lojas americanas'),
(default, 'Casas Bahia');

alter table loja add column fkNotebook int,
	add constraint fkLojaNotebook foreign key (fkNotebook)
		references notebook(idNote);

update loja set fkNotebook = 1 where idLoja = 2;
update loja set fkNotebook = 2 where idLoja = 3;
update loja set fkNotebook = 1 where idLoja = 1;
update loja set fkNotebook = 3 where idLoja = 4;

select * from loja join notebook on fkNotebook = idNote;


                                        -- DESAFIO 02 --


create table carro (
idCarro int primary key auto_increment,
modelo varchar(45),
marca varchar(45),
preco decimal(10,2));

insert into carro values 
(default, 'A45', 'mercedes', 45000),
(default, 'M4', 'bmw', 34000),
(default, 'Gt3rs', 'porsche', 58000);

create table dono(
idDono int primary key auto_increment,
nome varchar(45));

insert into dono values
(default, 'lucas'),
(default, 'marcos'),
(default, 'joao');

alter table carro add column fkDono int,
	add constraint fkCarroDono foreign key (fkDono)
		references dono(idDono);
        
update carro set fkDono = 1 where idCarro = 1;
update carro set fkDono = 2 where idCarro = 2;
update carro set fkDono = 3 where idCarro = 3;

select * from carro join dono on fkDono = idDono;
