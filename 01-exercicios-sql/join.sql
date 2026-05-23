
-- Feito por mim sozinha 
-- Exercício descobrir quanto cada cliente gastou?

-- Criei DATABASE 
CREATE DATABASE CLIENTES

--Criei tabbela CLIENTE 
-- ID int identity para se precher sozinho contando um a um 
CREATE TABLE CLIENTE (
		ID int identity(1,1),
		Nome VARCHAR (50)
)

--Consultando tabela CLIENTE
SELECT *
FROM CLIENTE

-- Inserindo valores na tabela CLIENTE 
INSERT INTO CLIENTE (Nome)
		VALUES 
		('Ana'),
		('João')

--Criando a tabela PEDIDOS
CREATE TABLE PEDIDOS (
		ID int identity(1,1),
		Cliente_id DECIMAL,
		VALOR NUMERIC (10,2)
)

-- Consultando tabela PEDIDOS 
SELECT *
FROM PEDIDOS 

-- Inserindo dados na tabela PEDIDOS
INSERT INTO PEDIDOS ( Cliente_id, VALOR)
VALUES
(1,100),
(1,50),
(2,300)

-- JOIN: FAZENDO A JUNÇÃO DAS TABELAS 
SELECT 
		cliente.nome		 AS Nome_Cliente,
		SUM(pedidos.valor)  AS Total_Gasto
		FROM PEDIDOS
		JOIN CLIENTE
		ON pedidos.cliente_id = cliente.id
		GROUP BY cliente.nome
		ORDER BY Total_Gasto DESC;


-- Quem gastou mais foi João com 300,00 e em segundo lugar Ana 150,00



-- Uma versão mais profissional corrigida 
CREATE DATABASE CLIENTES;
GO

USE CLIENTES;
GO

CREATE TABLE CLIENTE (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(50)
);

CREATE TABLE PEDIDOS (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Cliente_id INT,
	VALOR NUMERIC(10,2)
);

INSERT INTO CLIENTE (Nome)
VALUES
('Ana'),
('João');

INSERT INTO PEDIDOS (Cliente_id, VALOR)
VALUES
(1, 100),
(1, 50),
(2, 300);

SELECT 
	CLIENTE.Nome AS Nome_Cliente,
	SUM(PEDIDOS.Valor) AS Total_Gasto
FROM PEDIDOS
JOIN CLIENTE
	ON PEDIDOS.Cliente_id = CLIENTE.ID
GROUP BY CLIENTE.Nome
ORDER BY Total_Gasto DESC;


