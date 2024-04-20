CREATE DATABASE Sprint1;

USE Sprint1;

CREATE TABLE Atleta(
idAtleta INT PRIMARY KEY,
nome varchar(40),
modalidade varchar(40),
qntMedalha int); 
 
INSERT INTO Atleta VALUES 
(1,'Lucas',' Futebol', 5),
(2,'Pedro','Volei', 10),
(3,'Samuel','Volei', 7),
(4,'Ricardo','Futebol', 3),
(5,'Marcos','Basquete', 1),
(6,'Isabella','Basquete', 6);

SELECT * FROM Atleta;

update Atleta set qntMedalha = '1000' 
	where idAtleta = 1;
    
update Atleta set qntMedalha = '11'	
where idAtleta in (2, 3);
    
update Atleta set nome = 'Iza' 
	where idAtleta = 4;
    
alter table Atleta add column dataNascimento date;
	update Atleta set dataNascimento = '2006-04-28' where idAtleta = 1;
    update Atleta set dataNascimento = '2005-06-20' where idAtleta = 2;
    update Atleta set dataNascimento = '2004-05-07' where idAtleta = 3;
    update Atleta set dataNascimento = '2003-03-14' where idAtleta = 4;
    update Atleta set dataNascimento = '2002-02-22' where idAtleta = 5;
    update Atleta set dataNascimento = '2001-01-30' where idAtleta = 6;
    
delete from Atleta where idAtleta = 5;

select * from Atleta;

select * from Atleta where modalidade <> 'natacação';

select * from Atleta where qntMedalha >='3';

alter table Atleta modify column modalidade varchar (60);

describe Atleta;

truncate table Atleta;
select * from Atleta;


create database sprint1;

use sprint1;

CREATE TABLE musica( 
idmusica VARCHAR (40) PRIMARY KEY,
titulo varchar(40),
artista varchar(40),
genero varchar(40));

INSERT INTO musica VALUES 
('musica 1','Congratulations','Post Malone','Trapp'),
('musica 2','When i was your man','Bruno Mars','Pop'),
('musica 3','Heartless','Kenye West','Trapp'),
('musica 4','Camisa 10','Turma do Pagode','Pagode'),
('musica 5','Deixa acontecer','Grupo Revelação','Pagode'),
('musica 6','Gods plan','Drake','Pop'),
('musica 7','Vida loka pt1','Racionais Mcs','Rap'),
('musica 8','Dias de luta dias de gloria','Chorão','Rap');

SELECT * FROM musica;

alter table musica add column curtidas int; 

	update musica set curtidas =1000000 where idMusica = 'musica 1';
    update musica set curtidas =2030304 where idMusica = 'musica 2';
    update musica set curtidas =5959959 where idMusica = 'musica 3'; 
    update musica set curtidas =12345 where idMusica = 'musica 4'; 
    update musica set curtidas =23454 where idMusica = 'musica 5'; 
    update musica set curtidas =13345 where idMusica = 'musica 6'; 
    update musica set curtidas =120000 where idMusica = 'musica 7'; 
    update musica set curtidas =58755 where idMusica = 'musica 8'; 
    
alter table musica modify column artista varchar (80);

update musica set curtidas = '2000000'
	where idMusica = 'musica 1';
    
    select * from musica;
    
update musica set curtidas = '3000000'	
	where idMusica in ('musica 2' , 'musica 3');
    
update musica set titulo ='Pais do Futebol '
	where idMusica = 'musica 5';
    
delete from Musica where idMusica = 'musica 4';

select * from musica where genero <> 'funk';

select * from musica where curtidas >='20';

describe musica;

truncate table musica;

select * from musica;




create database sprint1;

use sprint1;

CREATE TABLE filme2( 
	idfilme VARCHAR (50) PRIMARY KEY,
	titulo varchar(50),
	diretor varchar(40),
	genero varchar(40));

insert into filme2 values
('filme 1','Um espiao e meio','Rawson Marshall Thurber','Ação'),
('filme 2','Alerta Vermelho','Rawson Marshall Thurber','Ação'),
('filme 3','Annabelle','John R. Leonetti','Terror'),
('filme 4','O silencio','John R. Leonetti','Terror'),
('filme 5','Gente Grande','Dennis Dugan', 'Comedia' ),
('filme 6','Esposa de mentira','Dennis Dugan','Comedia'),
('filme 7',' A 5 passos de voce','Justin Baldoni','Romance'),
('filme 8','Clouds','Justin Baldoni','Romance');

select * from filme2;


alter table filme2 add column protagonista varchar(50);

update filme2 set protagonista = 'Cristiano Ronaldo'
	where idFilme = 'Filme 1';
    update filme2 set protagonista = 'Neymar'
	where idFilme = 'Filme 2';

update filme2 set protagonista = 'Roger Guedes'
	where idFilme = 'Filme 3';

update filme2 set protagonista = 'Fagner'
	where idFilme = 'Filme 4';

update filme2 set protagonista = 'Renato Algusto'
	where idFilme = 'Filme 5';

update filme2 set protagonista = 'Yuri Alberto'
	where idFilme = 'Filme 6';

update filme2 set protagonista = 'Rojas'
	where idFilme = 'Filme 7';
    
update filme2 set protagonista = 'Garro'
	where idFilme = 'Filme 8';
    
    select * from filme2;

alter table filme2 modify column diretor varchar(150);

update filme2 set diretor = 'Kaique'
	where idFilme = 'filme 5';
    
update filme2 set diretor = 'Maycon'
	where idFilme in ('filme 2','filme 7');
    
update filme2 set titulo = 'Um espião e meio'
	where idFilme = 'filme 6';
    
delete from filme2 where idFilme = 'filme 3';

select * from filme2 where genero <> 'drama';

select * from filme2 where genero <> 'suspense';

describe filme2;

truncate table filme2;

select * from filme2;




create database sprint1;

use sprint1;

CREATE TABLE professor2( 
	idProfessor VARCHAR (50) PRIMARY KEY,
	nome varchar(50),
	especialidade varchar(40),
	dtNasc date
    );

insert into professor2 values
	('p1','Jp','Algoritimo','1999-08-28'),
    ('p2','Braian','Algoritimo','2000-05-08'),
    ('p3','Vivian','Banco de dados','1001-07-02'),
    ('p4','Kaline','Socio Emocional','1980-01-08'),
    ('p5','Rayssa','Socio Emocional','2001-04-09'),
    ('p6','Chico','Banco de dados','1700-09-12');

select * from professor2;

alter table professor2 add column funcao varchar(50);

alter table professor2 add constraint chkFuncao
   check ( funcao in('monitor', 'assistente' , 'titular'));
   
	update professor2 set funcao = 'titular' where idProfessor = '1';
   
	update professor2 set funcao = 'titular' where idProfessor = '2';
    
	update professor2 set funcao = 'titular' where idProfessor = '3';
     
	update professor2 set funcao = 'monitor' where idProfessor = '4';
      
	update professor2 set funcao = 'assistente' where idProfessor = '5';
       
	update professor2 set funcao = 'monitor' where idProfessor = '6';
        
	update professor2 set funcao = 'assistente' where idProfessor = '2';
         
insert into professor2 values
	(7, 'Toretto', 'piloto', '1567-01-23','titular');
      
	delete from professor2 where idProfessor = '5';
    
    select * from professor2 where funcao ='titular';
    
    select * from professor2 where funcao = 'monitor';
	 
update professor2 set dtNasc = '1000-04-28' where idProfessor = '3';

truncate table professor2;



create database sprint1;

use sprint1;

create table curso4(
	idCurso varchar (50) primary key,
    nome varchar (50),
    sigla varchar (3),
    coordenador varchar (50));
    
	insert into curso4 values
    ('C1','Admistração','ADM', 'Julia'),
    ('C2','Analise e desenvolvimento de sistemas','ADS','Maria'), 
	('C3','Ciencias da computação','CCO','Guilherme'),
	('C4','Sistema da informação','SIS','Kaue');

select * from curso4;  
	
select coordenador from curso4;

select * from curso4 
	where sigla = 'ADS';

select * from curso4 order by nome; 
 
select * from curso4 order by nome desc;

Select nome FROM curso4
	WHERE nome LIKE 'A%';
    
Select nome FROM curso4
	WHERE nome LIKE '%s';

select nome from curso4
	where nome like '_i%';

select nome from curso4
	where nome like '%a_';
    
drop table curso4;






use sprint1;

create table Revista10(
idRevista int primary key auto_increment,
nome varchar (40),
categoria varchar(30));

insert into Revista10 values 
(1, 'Recreio', null),
(null,'Veja', null),
(null,'Quatro Rodas',null),
(null,'Marvel',null);

select * from Revista10;

update Revista10 set categoria = 'Desenho'
	where idRevista = '1';
update Revista10 set categoria = 'Moda'
	where idRevista = '2';
update Revista10 set categoria = 'Carros'
	where idRevista = '3';
update Revista10 set categoria = 'Herois'
	where idRevista = '4';


insert into Revista10 values
(null, 'FutebolHoras', null),
(null,'MuiscaLove', null),
(null,'Pets',null);

select * from Revista10; 

describe Revista10;

alter table Revista10 modify column categoria varchar(40);

describe Revista10;

alter table Revista10 add column periodicidade varchar(15);

select * from Revista10;

alter table Revista10 drop column periodicidade;
  





 	


    



 

