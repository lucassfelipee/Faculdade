create database sprint2;
use sprint2;

                                      
                                      
create table atletas1 (
idAtleta int primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int );

insert into atleta values 
(1, 'Lucas', 'volei', 5),
(2, 'João', 'futebol', 4),
(3, 'Marcos', 'basquete', 3),
(4, 'Gbriela', 'volei', 2),
(5, 'Rafael', 'basquete', 1);

create table pais (
idPais int primary key,
nome varchar(30),
capital varchar(40));

insert into pais values
(1, 'brasil', 'brasilia'),
(2, 'prtugal', 'lisboa'),
(3, 'argentina', 'buenos aries'),
(4, 'russia', 'moscou');


alter table atletas1 add column fkPais int ,
	add constraint fkAtletaPais foreign key (fkPais)
		references pais(idPais);
        
describe atletas1;


update atletas1 set fkPais = 3 where idAtleta = 1;
update atletas1 set fkPais = 1 where idAtleta = 2;
update atletas1 set fkPais = 2 where idAtleta = 3;
update atletas1 set fkPais = 1 where idAtleta = 4;
update atletas1 set fkPais = 4 where idAtleta = 5;


select * from atletas1 join pais
on idPais = fkPais;


select atleta.nome, pais.nome from atletas1 join pais
on idPais = fkPais;


select * from atletas1 join pais
on idPais = fkPais where capital = 'brasilia';


                                    

create table musica (
idMusica int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40));

insert into musica values
(1, 'Congratulations','Post Malone','Trapp'),
(2, 'Heartless','Post Malone','Trapp'),
(3,'Vida loka pt1','Racionais Mcs','Rap'),
(4, 'Dias de luta dias de gloria','Chorão','Rap');

create table album (
idAlbum int primary key,
nome varchar(40),
tipo varchar(40),
constraint tipo check (tipo in ('digital', 'fisico')),
dtLancamento date);

insert into album values 
(1, 'life', 'digital', '2020-04=28'),
(2, 'loka', 'digital', '2014-04-28'),
(3, 'viva', 'fisico', '2000-04-28');


select * from musica;
select * from album;


alter table musica add column fkAlbum int,
	add constraint fkMusicaAlbum foreign key (fkAlbum)
		references album(idAlbum);


update musica set fkAlbum = 1 where idMusica = 1;
update musica set fkAlbum = 1 where idMusica = 2;
update musica set fkAlbum = 2 where idMusica = 3;
update musica set fkAlbum = 3 where idMusica = 4;


select * from musica join album
	on idAlbum = fkAlbum;


select musica.titulo, album.nome from musica join album
	on idAlbum = fkAlbum;


select * from musica join album
	on idAlbum = fkAlbum where tipo = 'digital';



ALTER TABLE Atletas1 ADD COLUMN idPais INT;


ALTER TABLE Atletas1 ADD CONSTRAINT fk_atleta_pais FOREIGN KEY (idPais) REFERENCES Pais(idPais);


UPDATE Atletas1 SET idPais = 1; 

SELECT Atletas1.nome AS Nome_Atleta, Pais.nome AS País
FROM Atletas1
INNER JOIN Pais ON Atletas1.idPais = Pais.idPais;

SELECT Atletas1.nome AS Nome_Atleta, Pais.nome AS País
FROM Atletas1
INNER JOIN Pais ON Atletas1.idPais = Pais.idPais;


SELECT Atletas1.nome AS Nome_Atleta, Pais.nome AS País
FROM Atletas1
INNER JOIN Pais ON Atletas1.idPais = Pais.idPais
WHERE Pais.capital = 'Lisboa'; 
