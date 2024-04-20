-- exercicio 01 --

create database pet;

use pet;


create table dono (
    idDono int primary key auto_increment,
    nome varchar(45),
    telefoneFixo varchar(45),
    telefoneCelular varchar(45),
    endereco varchar(45)
);

create table pet (
    idPet int primary key auto_increment,
    tipoAnimal varchar(45),
    nome varchar(45),
    raca varchar(45),
    dtNascimento date,
    idDono int,
    foreign key (idDono) references dono(idDono)
);

insert into dono(nome, telefoneFixo, telefoneCelular, endereco)values
('João Silva', '1234567890', '9876543210', 'Rua A, 123'),
('Maria Silva', '2345678901', '8765432109', 'Rua B, 456');

insert into pet (tipoAnimal, nome, raca, dtNascimento, idDono) values
('Cachorro', 'Rex', 'Labrador', '2018-05-10', 1),
('Gato', 'Miau', 'Gato', '2019-07-15', 1),
('Cachorro', 'Ze', 'Viralata', '2020-02-20', 2);

select * from dono;
select * from pet;

alter table dono modify column nome varchar(50);

select * from pet where tipoAnimal = 'Cachorro';
select nome, dataNascimento from pet;
select * from pet order by nome asc;
select * from dono order by endereco desc;
select * from pet where nome like 'R%';
select * from dono where nome like '% Silva';

update dono set telefoneCelular = '9876543210' where idDono =1;

select * from dono;

select dono.nome as nome_dono, pet.*
from dono
join pet on dono.idDono = pet.idDono;

select dono.nome as nome_dono, pet.*
from dono
join pet on dono.idDono = pet.idDono
where dono.nome = 'João Silva';

delete from pet where idPet = 3;

select * from pet;

drop table pet;
drop table dono;

-- Exercico 02 --
create database pessoa;
use pessoa;
create table pessoa (
    idpessoa int primary key auto_increment,
    nome varchar(45),
    data_nascimento date,
    profissao varchar(45)
);

create table gasto (
    idgasto int primary key auto_increment,
    dt date,
    valor decimal(10, 2),
    descricao varchar(45)
);

insert into pessoa (nome, data_nascimento, profissao) values
('Joao', '1990-05-15', 'Engenheiro'),
('Maria', '1985-08-20', 'Medica'),
('Carlos', '1978-03-10', 'Professor');

insert into gasto (data, valor, descricao) values
('2024-03-10', 150.50, 'Supermercado'),
('2024-03-15', 80.00, 'Restaurante'),
('2024-03-20', 200.00, 'Combustivel'),
('2024-04-05', 300.00, 'Eletronicos');

select * from pessoa;

select * from gasto;

select * from pessoa where profissao = 'Engenheiro';

select * from gasto where descricao like '%Supermercado%';

select pessoa.nome, gasto.* from pessoa
join gasto on pessoa.idpessoa = gasto.idgasto;

select pessoa.nome, gasto.* from pessoa
join gasto on pessoa.idpessoa = gasto.idgasto
where pessoa.idpessoa = 1;

update pessoa set profissao = 'Advogada' where nome = 'Maria';

alter table pessoa drop column profissao;

-- exercico03 --

create database funcionario;
use funcionario;

create table setor1(
idSetor int primary key auto_increment,
nomeSetor varchar(45),
numeroAndar varchar(20));

create table funcionario1(
idFuncionario int primary key auto_increment,
nomeFuncionario varchar(45),
telefone varchar(45),
salario varchar(45), 
fkSetor int, 
constraint fksetorFuncionario foreign key (fkSetor) references setor1 (idSetor));

create table acompanhante(
idAcompanhante int auto_increment,
nomeAcompanhante varchar (45),
tipoRelacao varchar(45),
dtNascimento date,
fkFuncionario int,
constraint pkComposta primary key( idAcompanhante, fkFuncionario),
constraint fkFuncionarioAcompanhante foreign key (fkFuncionario) references funcionario1(idFuncionario));

insert into setor1 values
(default,'setorA','1'),
(default,'setorB','2');

insert into funcionario1 values
(default,'lucas','11967027625','300',1),
(default,'eder','119575105022','200',2),
(default,'kaique','1198765432','100',1),
(default,'joao','119876545674','50',2);

insert into acompanhante values
(default,'marcos','irmao','2006-04-11',2),
(default,'maria','prima','2003-04-09', 1),
(default,'mateus','amigo','2000-01-10',2),
(default,'miguel','irmao','2002-05-15',1),
(default,'iza','amiga','2005-07-22',2),
(default,'gi','amiga','2007-12-10',1);


select * from setor1;
select * from funcionario1;
select * from acompanhante;

select * from setor1
join funcionario1 on setor1.idSetor = funcionario1.fkSetor;

SELECT * from setor1
join funcionario1 on setor1.idSetor = funcionario1.fkSetor
where setor1.nomeSetor = 'setorA';

select * from funcionario1
left join acompanhante on funcionario1.idFuncionario = acompanhante.fkFuncionario;

select * from funcionario1
left join acompanhante on funcionario1.idFuncionario = acompanhante.fkFuncionario
where funcionario1.nomeFuncionario = 'lucas';

select * from setor1
inner join funcionario1 on setor1.idSetor = funcionario1.fkSetor
left join acompanhante on funcionario1.idFuncionario = acompanhante.fkFuncionario;

-- Exercicio 04 --

create database treinador1;

use treinador;

create table nadador(
    idNadador int primary key auto_increment,
    nome varchar(100),
    estadoOrigem varchar(100),
    dtNascimento date,
    idtreinador int,
    foreign key (idtreinador) references treinador(idTreinador)
);

create table treinador (
    idTreinador int primary key auto_increment,
    nome varchar(100),
    telefone varchar(20),
    email varchar(100),
    idOrientador int,
    foreign key (idOrientador) references treinador(idTreinador)
);

insert into treinador (nome, telefone, email, idOrientador) values
('João', '123456789', 'joao@example.com', null),
('Maria', '987654321', 'maria@example.com', 1),
('Pedro', '456789123', 'pedro@example.com', 1);

insert into nadador (nome, estadoOrigem, dtNascimento, idTreinador) values
('Carlos', 'São Paulo', '1995-03-15', 2),
('Ana', 'Rio de Janeiro', '1998-07-20', 3),
('Mariana', 'Minas Gerais', '2000-12-10', 2),
('Lucas', 'Bahia', '1997-05-30', 3);

select treinador.nome as nometreinador, nadador.nome 
as nomenadador, nadador.estadoOrigem, nadador.dtNascimento from treinador
left join nadador on treinador.idTreinador = nadador.idTreinador;

select treinador.nome as nomeTreinador, nadador.nome 
as nomeNadador, nadador.estadoOrigem, nadador.dtNascimento from treinador
left join nadador on treinador.idTreinador = nadador.idTreinador
where treinador.nome = 'Maria';

select treinador1.nome as treinador, treinador2.nome as orientador from treinador treinador1
left join treinador treinador2 on treinador1.idOrientador = treinador2.idTreinador;

select treinador1.nome as treinador, treinador2.nome as orientador from treinador treinador1
left join treinador treinador2 on treinador1.idOrientador = treinador2.idTreinador
where treinador2.nome = 'João';

select treinador1.nome as treinador, nadador.nome 
as nomeNadador, nadador.estadoOrigem, nadador.dtNascimento, treinador2.nome 
as orientador from treinador treinador1
left join nadador on treinador1.idTreinador = nadador.idTreinador
left join treinador treinador2 on treinador1.idOrientador = treinador2.idTreinador;

select treinador1.nome as treinador, nadador.nome 
as nomenadador, nadador.estadoOrigem, nadador.dtNascimento, treinador2.nome 
as orientador from treinador treinador1
left join nadador on treinador1.idTreinador = nadador.idTreinador
left join treinador treinador2 on treinador1.idOrientador = treinador2.idTreinador
where treinador1.nome = 'Pedro';





