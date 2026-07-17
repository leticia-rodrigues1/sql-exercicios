
-- Exercício 1) CRIANDO UM BANCO DE DADOS 
CREATE DATABASE LojaDB

-- Exercício 2) CRIANDO AS TABELAS

-- TABELA DE CLIENTES 
CREATE TABLE CLIENTES( 
IdCliente  INT,
Nome	   VARCHAR (50),
Cidade	   VARCHAR (50),
Idade      INT
);

-- TABELA DE PRODUTOS
CREATE TABLE PRODUTOS(
IdProduto		INT, 
NomeProduto		VARCHAR(50),
Categoria		VARCHAR (50),
Preco           DECIMAL
);

-- TABELA DE PEDIDOS
CREATE TABLE PEDIDOS(
IdPedido		INT,
IdCliente		INT,
IdProduto       INT,
Quantidade      INT,
DataPedido      DATE
);

-- NÃO DEFINI PRIMARY KEY, FOREING KEY como fazer isso ??

-- Exercício 3) INSERINDO DADOS NAS TABELAS: 5 clientes/ 6 produtos e 10 pedidos
-- INSERT INTO serve para inserir novos registros(linhas) em uma tabela 
-- VALUES são os valores que eu vou colocar na tabela 

-- INSERINDO DADOS NA TABELA CLIENTES
INSERT INTO CLIENTES VALUES
		( 1, 'Alfredo' , 'Juiz de Fora', 20),
		( 2, 'Mariana', 'São Paulo', 33),
		( 3, 'Maria Carolina', 'Fortaleza', 40),
		( 4, 'Pedro', 'Rio de Janeiro', 28),
		( 5, 'Adriana', 'Lima Duarte', 38)

-- Consultando a tabela de clientes e os dados criados
SELECT *
FROM CLIENTES

-- INSERINDO DADOS NA TABELA PRODUTOS 
	INSERT INTO PRODUTOS VALUES 
	( 1, 'Microondas', 'eletrodoméstico', 400),
	( 2, 'Panelas', 'utensílios', 200),
	( 3, 'Geladeira', 'eletrodoméstico', 1000),
	( 4, 'Copos', 'utensílios', 50),
	( 5, 'Talheres', 'utensílios', 30),
	( 6, 'Fogão', 'utensílios', 800)

-- Consultando a tabela de produtos e os dados criados 
SELECT *
FROM PRODUTOS

-- INSERINDO DADOS NA TABELA PEDIDOS
 INSERT INTO PEDIDOS VALUES 
	(1, 1, 1, 10, '2026-01-10'),
	(2, 2, 2, 20, '2026-02-10'),
	(3, 3, 3, 30, '2026-03-10'),
	(4, 4, 4, 40, '2026-04-10'),
	(5, 5, 5, 50, '2026-05-10'),
	(6, 6, 6, 60, '2026-06-10'),
	(7, 7, 7, 70, '2026-07-10'),
	(8, 8, 8, 80, '2026-08-10'),
	(9, 9, 9, 90, '2026-09-10'),
	(10, 10, 10, 100, '2026-10-10')

-- 
-- Consultando a tabela de pedidos e os dados criados
SELECT *
FROM PEDIDOS

-- Exercício 4) MOSTRE TODOS OS CLIENTES 
SELECT *
FROM CLIENTES

-- Exercício 5) MOSTRE APENAS NOMES E CIDADES 
SELECT Nome, Cidade
FROM CLIENTES

-- Exercício 6) LISTE OS CLIENTES EM ORDEM ALFABÉTICA 
SELECT Nome
FROM CLIENTES
ORDER BY Nome ASC

-- Exercício 7) MOSTRE APENAS OS CLIENTES DA CIDADE DE SÃO PAULO
SELECT *
FROM CLIENTES
WHERE Cidade = 'São Paulo'

-- Exercício 8) MOSTRE OS PRODUTOS QUE CUSTAM MAIS DE 100
SELECT *
FROM PRODUTOS
WHERE Preco >= 100

-- Exercício 9) MOSTRE OS CLIENTES COM IDADE MAIOR OU IGUAL A 30 ANOS 
SELECT *
FROM CLIENTES
WHERE Idade >= 30

-- Exercício 10) LISTE OS PRODUTOS	DO MAIS CARO PARA O MAIS BARATO 
SELECT *
FROM PRODUTOS
ORDER BY Preco DESC