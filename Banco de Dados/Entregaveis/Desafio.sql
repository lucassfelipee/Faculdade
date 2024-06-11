create database exercicio11;

use exercicio11;

create table departamento (
idDepto int primary key,
nomeDepto varchar(45),
fkGerente int, 
dtInicioGer date
);

create table funcionario (
idFunc int primary key,
nomeFunc varchar(30),
salario float,
sexo varchar(45),
fkSupervisor int,
dataNasc date,
fkDepto int,
foreign key (fkDepto) references departamento(idDepto)
);

create table projeto (
idProj int primary key, 
nomeProj varchar(45), 
localProj varchar(45),
fkDepto int,
foreign key (fkDepto) references departamento(idDepto)
);

create table funcProjeto (
fkFunc int, 
fkProj int,
horas decimal(3,1),
primary key (fkFunc, fkProj),
foreign key (fkFunc) references Funcionario(idFunc),
foreign key (fkProj) references Projeto(idProj)
);

insert into departamento values 
(105, 'Pesquisa', 2, '2008-05-22'),
(104, 'Administração', 7, '2015-01-01'),
(101, 'Matriz', 8, '2001-06-19');

insert into funcionario values 
(1, 'João Silva', 3500, 'm', 2, '1985-01-09', 105),
(2, 'Fernando Wong', 4500, 'm', 8, '1975-12-08', 105),
(3, 'Alice Sousa', 2500, 'f', 7, '1988-01-19', 104),
(4, 'Janice Morais', 4300, 'f', 8, '1970-06-20', 104),
(5, 'Ronaldo Lima', 3800, 'm', 1, '1982-09-15', 105),
(6, 'Joice Leite', 2500, 'f', 1, '1992-07-31', 105),
(7, 'Antonio Pereira', 2500, 'm', 4, '1989-03-29', 104),
(8, 'Juliano Brito', 5500, 'm', NULL, '1957-11-10', 101);

INSERT INTO projeto VALUES 
(1, 'Produto X', 'Santo André', 105),
(2, 'Produto Y', 'Itu', 105),
(3, 'Produto Z', 'São Paulo', 105),
(10, 'Informatização', 'Mauá', 104),
(20, 'Reorganização', 'São Paulo', 101),
(30, 'Benefícios', 'Mauá', 104);


INSERT INTO funcProjeto VALUES 
(1, 1, 32.5),
(1, 2, 7.5),
(5, 3, 40.0),
(6, 1, 20.0),
(6, 2, 20.0),
(2, 2, 10.0),
(2, 3, 10.0),
(2, 10, 10.0),
(2, 20, 10.0),
(3, 30, 30.0),
(3, 10, 10.0),
(7, 10, 35.0),
(7, 30, 5.0),
(4, 30, 20.0),
(4, 20, 15.0),
(8, 20, NULL);

alter table departamento modify column fkGerente int, add constraint fkGerente foreign key (fkGerente) references funcionario (idFunc); 

alter table funcionario modify column fkSupervisor int, add constraint fkSupervisorFunc foreign key (fkSupervisor) references funcionario (idFunc); 

select * from departamento;

select * from funcionario;

select * from Projeto;

select * from funcProjeto;

insert into funcionario values
(null, 'Cecília Ribeiro', 2800, 'F', null, '1980-04-05', 104);

-- Não é possível, visto que o campo idFunc é uma chave primária e, portanto, não pode aceitar valores nulos.

INSERT INTO funcionario VALUES 
(3, 'Alice Sousa', 2800, 'f', 4, '1980-04-05', 104);

-- Não é possível, pois o campo idFunc está apresentando repetições, o que é proibido para uma chave primária.

INSERT INTO funcionario VALUES 
(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 107);

-- Não é viável, uma vez que o número 107 na fkDepto não corresponde a nenhum departamento existente, resultando em uma referência inválida.

INSERT INTO funcionario VALUES 
(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 104);

-- Correto, pois o ID é exclusivo, as chaves estrangeiras estão referenciando IDs existentes, e as aspas e vírgulas foram inseridas corretamente.


delete from  funcProjeto where fkFunc = 3 and fkProj = 10;
-- Verdadeiro, pois há uma entrada na tabela onde fkFunc é igual a 3 e fkProj é igual a 10.


delete from funcionario where idFunc = 4;
-- Não é possível, pois a chave está sendo utilizada como referência em outras tabelas.


delete from funcionario where idFunc = 2;

-- Não, pois o ID 2 está sendo utilizado como referência em outras tabelas.


update funcionario set salario = 2800 where idFunc = 3;
-- Correto, pois o ID 3 existe na tabela e a coluna "funcionario" também está presente.


update funcionario set fkDepto = 101 where idFunc = 3;
-- Correto, pois há um ID disponível para ser referenciado na coluna fkDepto e o ID 3 está presente na tabela.


update funcionario set fkDepto = 107 where idFunc = 3;



select dataNasc, salario from funcionario
where nomeFunc = 'João Silva';


select salario from funcionario;


select distinct(salario) from funcionario;


select * from funcionario
order by nomeFunc;


select * from funcionario
order by salario desc;


select * from funcionario 
where salario > 2000 and salario < 4000;


select nomeFunc, salario from funcionario 
where nomeFunc like 'J%';


select nomeFunc, salario from funcionario
where nomeFunc like '%a';


select nomeFunc from funcionario 
where nomeFunc like '__n%';


select nomeFunc, dataNasc from funcionario
where nomeFunc like '%s____';


select funcionario.* from funcionario 
join departamento 
on funcionario.fkDepto = departamento.idDepto
where departamento.nomeDepto = 'Pesquisa';


select funcionario.* from funcionario 
join departamento
on departamento.idDepto = funcionario.fkDepto
where departamento.nomeDepto = 'Pesquisa' and salario > 3500;

select funcionario.* from funcionario
join departamento 
on departamento.idDepto = funcionario.fkDepto
where departamento.nomeDepto = 'Pesquisa' and funcionario.nomeFunc like 'J%';


select funcionario.idFunc as 'Idfuncionario', 
funcionario.nomeFunc as 'Nome funcionario', 
supervisor.idFunc as 'Idsupervisor',
supervisor.nomeFunc as 'Nome supervisor'
from funcionario
join funcionario as supervisor
on funcionario.fkSupervisor = supervisor.idFunc;


select projeto.idProj, departamento.idDepto, funcionario.nomeFunc, funcionario.dataNasc
from projeto
join departamento
on projeto.fkDepto = departamento.idDepto
join funcionario
on funcionario.idFunc = departamento.fkGerente;


select funcionario.idFunc, funcionario.nomeFunc, projeto.idProj, projeto.nomeProj, funcProjeto.horas
from funcionario
join funcProjeto
on funcionario.idFunc = funcProjeto.fkFunc
join projeto
on funcProjeto.fkProj = projeto.idProj;


select funcionario.nomeFunc from funcionario
where dataNasc < '1980-01-01';


select count(distinct salario) from funcionario;


select count(distinct localProj) from projeto;


select sum(salario), avg(salario) from funcionario;


select min(salario), max(salario) from funcionario;


select sum(salario), avg(salario), departamento.idDepto from funcionario
join departamento
on departamento.idDepto = funcionario.fkDepto
group by departamento.idDepto;


select departamento.idDepto, min(salario), max(salario)  from funcionario
join departamento
on departamento.idDepto = funcionario.fkDepto
group by departamento.idDepto;


INSERT INTO funcionario VALUES 
(10, 'José da Silva', 1800, 'm', 3, '2000-10-12', NULL),
(11, 'Benedito Almeida', 1200, 'm', 5, '2001-09-01', NULL);


INSERT INTO departamento VALUES 
(110, 'RH', 3, '2018-11-10');

