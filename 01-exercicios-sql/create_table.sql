-- Criei uma DATABASE com o nome de MERCADO
CREATE DATABASE MERCADO

/* Criando as tabelas 
ID nome da coluna
INT número inteiro
NOME nome da coluna 
VARCHAR até 50 caracteres 
*/
-- Criando a tabela de fornecedores 
CREATE TABLE fornecedores(
			id INT,
			nome VARCHAR (50),
			);

-- Criando a tabela de compradores 
CREATE TABLE pedidos (
		id INT ,
		cliente_id INT,
		fornecedores_id INT,
		amount DECIMAL (10,2)
		);

-- Criando a tabela de clientes
CREATE TABLE clientes(
		id INT,
		nome VARCHAR (50)
		);


/* Inserindo os dados na tabela FORNECEDORES
INSERT INTO vou inserir dados na tabela 
VALUES são os valores que eu quero colocar 
*/
INSERT INTO fornecedores VALUES 
		(1, 'Bahamas'),
		(2, 'Sales'),
		(3, 'Pais e Filhos'),
		(4, 'Super'),
		(5, 'Rede Unida')
		
-- Inserindo os dados na tabela PEDIDOS
/* Traduzindo:
1 ? id do pedido
1 ? cliente_id ? cliente 1
1 ? fornecedor_id ? fornecedor 1
100.00 ? valor do pedido
*/
INSERT INTO pedidos VALUES 
(1,1,1, 100.00),
(2,2,2, 50.00),
(3,3,3, 20.00),
(4,4,4, 90.00),
(5,5,5, 30.00);

-- Inserindo os dados na tabela CLIENTES
		INSERT INTO clientes VALUES 
		(1, 'Alfredo'),
		(2, 'Joaquim'),
		(3, 'Maria Izabel'),
		(4, 'Charlote'),
		(5, 'Miguel')

-- Consultando todas as 3 tabelas
SELECT *
FROM fornecedores

SELECT *
FROM pedidos

SELECT *
FROM clientes

--===================================
--JOIN DAS 3 TABELAS
SELECT 
	clientes.nome AS Cliente, 
	fornecedores.nome AS Fornecedor, 
	pedidos.Amount  AS Valores
	FROM pedidos
	JOIN clientes
	ON pedidos.cliente_id = cliente_id
	JOIN fornecedores
	ON pedidos.fornecedores_id = fornecedores_id;


--GROUP BY serve para agrupar dados iguais 
-- Quanto cada cliente gastou?

SELECT
	clientes.nome,
	SUM(pedidos.amount) AS Total_Gasto
	FROM pedidos 
	JOIN clientes
	ON pedidos.cliente_id = clientes.id
	GROUP BY clientes.nome;

--== Usando o ORDER BY 
SELECT
	clientes.nome,
	SUM(pedidos.amount) AS Total_Gasto
	FROM pedidos
	JOIN clientes
	ON pedidos.cliente_id = clientes.id
	GROUP BY clientes.nome
	ORDER BY Total_Gasto DESC; 

--Qual fornecedor faturou mais?
SELECT TOP 1
	fornecedores.nome,
	SUM(pedidos.amount) AS Total_Faturado
	FROM pedidos
	JOIN fornecedores
	ON pedidos.fornecedores_id = fornecedores.id
	GROUP BY fornecedores.nome	
	ORDER BY Total_Faturado DESC;
-- Bahamas foi o fornecedor que mais faturou.
