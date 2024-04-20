create database projeto;
use projeto;

create table projeto(
idProjeto int primary key auto_increment,
nomeProjeto varchar(40),
descrição varchar(100));

create table alunos(
idAlunos int primary key auto_increment,
nome varchar(40),
telefone varchar (40), 

fkAlunos int, constraint fkAlunos foreign key (fkAlunos) references alunos(idAlunos),
fkProjeto int);

insert into projeto values
(null, 'berry.bite','projeto sobre controle de morango'),
(null,'fut.mania','projeto sobre futebol');

insert into alunos values
(null, 'lucas', 11967027625, null, 1),
(null,'gabriela',11098765432, null, 1),
(null,'julio',11999999999, null, 2),
(null,'iza',11298765432, null, 2);

drop table alunos;


update alunos set fkAlunos = 1 where idAlunos =2;
update alunos set fkAlunos = 3 where idAlunos =4;


select * from projeto;
select * from alunos;

alter table alunos add constraint fkProjetoAlunos foreign key (fkProjeto) references projeto (idProjeto);

select alunos.*,
representante.*
from alunos 
join alunos as representante 
on alunos.fkAlunos = representante.idAlunos;

select alunos.*,
projeto.* from alunos join projeto on fkProjeto = idProjeto where nomeProjeto ='berry.bite';



create database campanha;
use campanha;

create table doacao(
idDoacao int primary key auto_increment,
doacao varchar (75),
instituicao varchar(45),
DtFinal date);

create table organizador(
idOrganizador int primary key auto_increment,
nome varchar(45),
bairro varchar(45),
rua varchar(45),
email varchar(55),

fkDoacao int,
constraint fkOrganizadorDoacao foreign key (fkDoacao) references doacao(idDoacao),

fkExp int);

alter table organizador add constraint fkNovatos foreign key (fkExp) references organizador (idOrganizador);

insert into organizador values
(30, 'keder', 'sao paulo', 'sao catenao', 'keder@gmail.com', null, null),
(null, 'lucas', 'sao bernado', 'mateus', 'lucas@gmail.com', null, null),
(null, 'pedro', 'sao luiz', 'luiz', 'pedro@gmail.com', null, null),
(null, 'joao', 'sao mateus', 'joger', 'joao@gmail.com', null, null);
insert into doacao values
(500, 'bola', 'bola de presente ','2006-9-25'),
(null,'planeta', 'pelados em marte', '2023-12-15'),
(null, 'bateria ', 'Escola para musica', '2000-10-01');

update organizador set fkExp = 32 where idOrganizador= 30;
update organizador set fkExp = 34 where idOrganizador =32;

update organizador set fkDoacao = 502 where idOrganizador=31;
update organizador set fkDoacao = 506 where idOrganizador =33;
update organizador set fkDoacao = 503 where idOrganizador =34;

select * from organizador;
select * from doacao;

select organizador.* , doacao.* from organizador join doacao on fkDoacao = idDoacao; 

select organizador.nome , doacao.* from organizador join doacao on fkDoacao = idDoacao where nome = 'lucas';

SELECT novato.nome AS novato, experiente.nome AS orientador
FROM organizador novato
JOIN organizador experiente ON novato.fkExp = experiente.idOrganizador;

SELECT novato.nome AS novato, 
experiente.nome AS orientador
FROM organizador novato
JOIN organizador experiente 
ON novato.fkExp = experiente.idOrganizador
WHERE experiente.nome = 'keder';

SELECT novato.nome AS novato, d.*, experiente.nome AS orientador
FROM organizador novato
JOIN doacao d ON novato.fkDoacao = d.idDoacao
JOIN organizador experiente ON novato.fkExp = experiente.idOrganizador;

SELECT novato.nome AS novato, doacao.*, experiente.nome AS orientador
FROM organizador novato
JOIN doacao  as doacao ON novato.fkDoacao = doacao.idDoacao
JOIN organizador experiente ON novato.fkExp = experiente.idOrganizador
WHERE novato.nome ='lucas';