-- ###################################################################### --
-- ========= SE PREPARANDO PARA UMA PROVA P/ ANALISTA DE DADOS SQL =========
-- ###################################################################### --


-- Exercício 1. Você é Analista de Customer Experience (Experiência do Colaborado) e precisa criar um relatório com os 100 primeiros colaboradores da história da empresa. Esses colaboradores receberão uma placa em reconhecimento à confiança dada.

-- Você precisa levantar essa lista de colaboradores dentro do banco de dados, em 10 minutos, pois o seu gestor solicitou essa informação para apresentar em uma reunião.

-- Consultando a tabela 
SELECT *
FROM person.colaboradores

-- Selecionando os 100 primeiros da tabela toda
SELECT TOP (100)*
FROM Person.Colaboradores

-- Selecionando os 100 primeiros especificando as colunas que quero que mostre 
-- Ordenando de forma crescente 
SELECT TOP (100) FirstName, LastName, BusinessEntityID,ModifiedDate
FROM Person.Colaboradores
ORDER BY ModifiedDate ASC;


-- Exercício 2. Você é Analista e precisa levantar algumas informações sobre os preços, como:
-- Quantidade 
-- Soma total dos preços
-- Preço médio
-- Maior preço
-- Menor preço

-- Utilize seus conhecimentos em SQL para fazer essas análises dentro do Banco de Dados.

-- Consultando a tabela 
SELECT *
FROM Production.Product

-- Contagem / Quantidade
SELECT COUNT(ListPrice)
FROM Production.Product
-- 504 

--Soma 
SELECT SUM(ListPrice)
FROM Production.Product
-- 221087.79

-- Média 
SELECT AVG(ListPrice)
FROM Production.Product
-- 438.6662

-- Maior preço
SELECT MAX(ListPrice)
FROM Production.Product
-- 3578.27

-- Menor preço
SELECT MIN(ListPrice)
FROM Production.Product
-- 0.00

-- OU ASSIM
SELECT
	COUNT(ListPrice) AS 'Quantidade',
	AVG(ListPrice)   AS  'Média' ,
	SUM(ListPrice)	 AS   'Soma',
	MAX(ListPrice)   AS   'Maior',
	MIN(ListPrice)   AS   'Menor'
FROM Production.Product



