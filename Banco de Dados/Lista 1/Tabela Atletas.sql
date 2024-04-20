CREATE DATABASE Sprint1;

USE Sprint1;

CREATE TABLE Atletas(
idAtletas INT PRIMARY KEY,
nome varchar(40),
modalidade varchar(40),
qntMedalha int); 
 
INSERT INTO Atletas VALUES 
(10001,'Lucas',' Futebol', 5),
(10002,'Pedro','Volei', 10),
(10003,'Samuel','Truco', 7),
(10004,'Ricardo','Natação', 3),
(10005,'Marcos','Basquete', 1),
(10006,'Isabella','Golf', 6);

SELECT * FROM Atletas;
SELECT nome, qntMedalha FROM Atletas;
SELECT * from Atletas 
	WHERE modalidade ='Futebol';
SELECT nome FROM Atletas
	WHERE nome LIKE '%s%';
Select nome FROM Atletas 
	WHERE nome LIKE 'i%';
SELECT nome FROM Atletas 
	WHERE nome LIKE '%o';
SELECT nome FROM Atletas 
	WHERE nome LIKE '%r_';

