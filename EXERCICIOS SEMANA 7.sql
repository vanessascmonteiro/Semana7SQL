CREATE DATABASE EXERCICIOS7

--EXERC�CIO 1
CREATE TABLE CLIENTES
(
   ID INT, 
   NOME VARCHAR(20),
   TELEFONE VARCHAR(11),
   ENDERECO VARCHAR(50)
)

--EXERC�CIO 2

INSERT INTO CLIENTES (ID, NOME, TELEFONE, ENDERECO) VALUES (1, 'Vinicius Silva', '987654', 'Rua Girassol')
INSERT INTO CLIENTES (ID, NOME, TELEFONE, ENDERECO) VALUES (2, 'Maria Antonia', '123456', 'Rua Rosas')
INSERT INTO CLIENTES (ID, NOME, TELEFONE, ENDERECO) VALUES (3, 'Marcus Vinicius', '654123', 'Itajai')


--EXERC�CIO 3 

SELECT * FROM CLIENTES 

--EXERC�CIO 4

SELECT ID FROM CLIENTES 

--EXERC�CIO 5

SELECT * FROM CLIENTES
WHERE NOME LIKE 'V%'

--EXERC�CIO 6

UPDATE CLIENTES
SET ENDERECO = 'Rua do Lim�o'
WHERE ID = 3

--EXERC�CIO 7

DELETE CLIENTES 
WHERE ID = 2

--EXERC�CIO 8 
--TABEL�O
CREATE TABLE FUNCIONARIO
(
   ID INT PRIMARY KEY,
   NOME VARCHAR(50),
   CARGO VARCHAR(50),
   TELEFONE1 VARCHAR(11),
   TELEFONE2 VARCHAR(11)
)
--DROP TABLE FUNCIONARIO


--PRIMEIRA FORMA NORMAL

CREATE TABLE FUNCIONARIO_FN1
(
   ID INT PRIMARY KEY,
   NOME VARCHAR(50),
   CARGO VARCHAR(50),
)

CREATE TABLE TELEFONE_FN1
(
ID INT REFERENCES FUNCIONARIO_FN1 (ID) NOT NULL, TELEFONE VARCHAR(11) NOT NULL
)

ALTER TABLE TELEFONE_FN1 ADD PRIMARY KEY(ID, TELEFONE)

--DROP TABLE TELEFONE_FN1 
--DROP TABLE FUNCIONARIO_FN1


--TERCEIRA FORMA NORMAL

CREATE TABLE CARGO_FN3
(
   ID INT IDENTITY (1,1) PRIMARY KEY, 
   CARGO VARCHAR(50)
)


CREATE TABLE FUNCIONARIO_FN3
(
ID INT PRIMARY KEY,
NOME VARCHAR(50),
CARGO_ID INT REFERENCES CARGO_FN3(ID)
)

CREATE TABLE TELEFONE_FN3
(
ID INT REFERENCES FUNCIONARIO_FN3 (ID) NOT NULL, 
TELEFONE VARCHAR(11) NOT NULL
)

ALTER TABLE TELEFONE_FN3 ADD PRIMARY KEY(ID, TELEFONE)

CREATE TABLE TELEFONE_FN4
(
ID INT REFERENCES FUNCIONARIO_FN3 (ID) NOT NULL, 
TELEFONE VARCHAR(11) NOT NULL
)

ALTER TABLE TELEFONE_FN4 ADD PRIMARY KEY(ID, TELEFONE)

INSERT INTO CARGO_FN3 VALUES('ATENDENTE'), ('GERENTE'), ('ATENDENTE')
INSERT INTO FUNCIONARIO_FN3  VALUES(1,'MARCUS',1), (2,'MARIA',2), (3,'J�LIA',3)
INSERT INTO TELEFONE_FN3 VALUES (1, '365489'), (2,'3654698'), (3, '3654962')
INSERT INTO TELEFONE_FN4 VALUES (1, '3654897'), (2,'36524569'), (3, '12365458')

SELECT * FROM FUNCIONARIO_FN3
SELECT * FROM CARGO_FN3
SELECT * FROM TELEFONE_FN3
SELECT * FROM TELEFONE_FN4

















