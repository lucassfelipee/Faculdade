create database animal;
use animal;

create table pet(
idPet int primary key auto_increment,
nome varchar(50),
pedigree varchar(3),
raça varchar(45),
fkPai int,
constraint fkPai foreign key (fkPai) references pet(idPet),
fkMae int,
constraint fkMae foreign key (fkMae) references pet(idPet));

insert into pet (idPet, nome, pedigree, raça) values
(default, 'bob','sim','Husky siberiano'),
(default, 'billy','sim','Husky siberiano'),
(default, 'Ze','sim','Husky siberiano '),
(default, 'megie','nao','golden'),
(default, 'milly','nao','Pastor alemão'),
(default, 'hulk','sim','golden');

describe pet;

select * from pet;

create table dono(
idDono int primary key auto_increment,
nome varchar (50),
bairro varchar(50),
telefone char(14));

insert into dono values
	(default, 'lucas','Jd patente', '(11)99708-0061'),
	(default, 'maria','sao caetnao','(11)99143-9544');
    
alter table pet add column fkDono int,
	add constraint fkDonoPet foreign key (fkDono)
		references dono (idDono);

update pet set fkDono = 1 where idPet = 1;
update pet set fkDono = 2 where idPet = 2;
update pet set fkDono = 3 where idPet = 3;
update pet set fkDono = 1 where idPet = 4;
update pet set fkDono = 2 where idPet = 5;
update pet set fkDono = 3 where idPet = 6;

select * from pet join dono on idPet = fkDono;

select filho.nome as NomeFilho,
	pai.nome as NomePai,
    mae.nome as NomeMae
    from pet as filho
		join pet as pai
        on filho.fkPai = pai.idPet
        join pet as mae
        on filho.fkMae = mae.idPet;









Create table motorista(
idMotora int primary key auto_increment,
nome varchar(50),
CNH char(11),
dtValidade date,
fkMotoraReserva int);


select * from motorista;

insert into motorista (idMotora, nome, CNH, dtValidade) Values
(1, 'pedro', '90876567821', '2028-04-10'),
(default, 'julia', '92839401023', '2035-05-23'),
(default, 'roberto', '02930481723', '2026-07-31'),
(default, 'gabi', '01928394051', '2026-10-22');

update motorista set fkMotoraReserva = 1 where idMotora = 2;

update motorista set fkMotoraReserva = 2 where idMotora = 4;

select * from motorista;



create table carro(
idCarro int primary key auto_increment,
nome varchar(50),
placa char(7),
marca varchar(45));

insert into carro values
(null,'911','8AC3GC2','porshe'),
(null,'gla','P8R23E6','Mercedez-benz');

alter table motorista add column fkCarro int,
	add constraint fkCarroMotora foreign key (fkCarro)
		references carro(idCarro);

update motorista set fkCarro = 1 where idMotora = 1;
update motorista set fkCarro = 2 where idMotora = 2;
update motorista set fkCarro = 1 where idMotora = 3;
update motorista set fkCarro = 2 where idMotora = 4;

select * from motorista join carro on fkCarro;


-- --------------------- -- 


create table empresa(
idEmp int primary key auto_increment,
nome varchar(50),
cnpj char(18),
fkMatriz int,
constraint fkMatrizEmp foreign key (fkMatriz) references empresa (idEmp));

insert into empresa (idEmp, nome, cnpj) values
(default, 'Safra', '12.222.888.0001-88'),
(default, 'Safra matriz', '12.223.283.0001-99'),
(default, 'Itau', '12.244.898.0001-83'),
(default, 'Itau matriz', '12.222.876.0001-82');

update empresa set fkMatriz = 2 where idEmp = 1;
update empresa set fkMatriz = 4 where idEmp = 2;









































