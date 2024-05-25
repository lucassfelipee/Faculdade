create database venda;

use venda;

create table cliente (
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
cep char(9),
complemento varchar(45),
numero varchar(10),
fkCliente int,
constraint fkClienteIndicado foreign key (fkCliente) references cliente(idCliente)
);

insert into cliente values
(default, 'Felipe', 'felipe@gmail.com', '04240-150', '70', 'Casa', null),
(default, 'Rafael', 'rafael@gmail.com', '04240-151', '71', 'Casa', 1),
(default, 'Lucas', 'lucas@gmail.com', '04240-152', '72', 'Casa', 1);

create table venda (
idVenda int primary key auto_increment,
dtVenda date,
valor decimal (5,2),
fkCliente int,
constraint fkCliente foreign key (fkCliente) references cliente(idCliente)
);

insert into venda values
(default, '2024-05-10', 0.99, 1),
(default, '2024-05-11', 1.99, 1),
(default, '2024-05-12', 2.99, 2),
(default, '2024-05-13', 3.99, 2),
(default, '2024-05-14', 4.99, 3),
(default, '2024-05-15', 5.99, 3);

create table produto (
idProduto int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
valor decimal(5,2));

insert into produto values 
(default, 'miojo', 'miojo de carne', 3.99),
(default, 'fruta', 'maça*', 1.99),
(default, 'jarra', 'jarra de suco', 5.99),
(default, 'Molho', 'Molho de tomate', 7.99);

create table registro (
idRegistro int,
fkVenda int,
fkProduto int,
primary key (idRegistro, fkVenda, fkProduto),
quantidade int, 
desconto decimal(5,2),
constraint fkVenda foreign key (fkVenda) references venda(idVenda),
constraint fkProduto foreign key (fkProduto) references produto(idProduto));

insert into registro values
(1, 1, 1, 2, 0.99),
(1, 1, 2, 1, 1.99),
(1, 1, 3, 1, 0.49),
(1, 2, 4, 3, 0),
(2, 1, 2, 5, 2.49),
(2, 1, 1, 3, 0.99),
(2, 2, 4, 1, 0),
(2, 3, 3, 2, 1.49),
(3, 1, 4, 3, 0.99),
(3, 2, 3, 1, 0),
(3, 3, 2, 4, 1.99),
(3, 4, 1, 2, 0.49);


select * from cliente join venda on idVenda = venda.fkCliente;

select * from cliente join venda on idVenda = venda.fkCliente where cliente.nome = 'Rafael';

select * from cliente as indicado join cliente as cliente on indicado.fkCliente = cliente.idCliente;
       
select * from cliente as indicado join cliente as cliente on indicado.fkCliente = cliente.idCliente where indicado.nome = 'Lucas';

select * from cliente as indicado join cliente as cliente on indicado.fkCliente = cliente.idCliente join venda on venda.fkCliente = cliente.idCliente join registro on fkVenda = fkProduto = idRegistro;

select venda.dtVenda, produto.nome, registro.quantidade from produto join registro on registro.idRegistro = registro.fkProduto join venda on registro.fkVenda = registro.idRegistro;

select produto.nome, produto.valor, sum(quantidade) as QtdProdutos from produto join registro on produto.idProduto = registro.fkProduto group by produto.nome, produto.valor;

insert into cliente values
(default, 'Felipe', 'felipe@gmail.com', '04240-150', '72', 'Casa', null);
select * from cliente left join venda on venda.idVenda = venda.fkCliente;


select min(valor), max(valor) from produto;


select sum(valor), avg(valor) from produto;


select count(*) as "Quantidade de preços acima da média" from produto where valor > (select avg(valor) from produto);


select sum(distinct produto.valor) as "Soma dos preços distintos" from produto;


select venda.idVenda, SUM(produto.valor) as "Soma dos preços" from venda join registro on venda.idVenda = registro.fkVenda join produto on produto.idProduto = registro.fkProduto where venda.idVenda = 1;











