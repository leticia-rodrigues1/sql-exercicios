-- 1) Selecione a tabela clientes do banco de dados contole_geral
SELECT *
FROM dbo.CLIENTES

-- 2) Crie duas consultas nesta mesma janela Query 
-- A consulta 1 deve retornar a tabela clientes
-- A consulta 2 deve retornar a tabela estoque 
SELECT *
FROM dbo.CLIENTES

SELECT *
FROM dbo.ESTOQUE

-- 3) Qual o total de produtos vendidos pela empresa?
-- Consultando tabela vendas 
SELECT *
FROM venda

SELECT COUNT(QUANTIDADE) AS Total_Produtos
FROM venda
-- Resposta 5 produtos

-- 4) Quais cidades são vendidos os produtos?
-- Usei a função DISTINCT para remover as cidades duplicadas 
SELECT DISTINCT FILIAL
FROM venda
-- Minas Gerais, Rio de Janeiro e São Paulo

-- 5) Quais são os 3 maiores preços dos produtos?
-- Usei o TOP para selecionar só os 3 maiores
-- ORDER BY para ordenar o maior valor de forma decrescente
SELECT TOP (3) valor
FROM venda
ORDER BY valor DESC;

-- OU
SELECT *
FROM venda
ORDER BY valor DESC;

-- 50,50 e 40.

-- 6) Faça uma lista das afiliais de São Paulo
-- Usei o WHERE para filtrar a lista FILIAL as cidades de 'SAO PAULO'
SELECT *
FROM venda
WHERE filial = 'SAO PAULO';

-- 7) Afiliais do Rio de Janeiro
-- WHERE para filtar 
SELECT *
FROM venda
WHERE filial = 'Rio de Janeiro'

-- 8) Clientes que compram a quantidade maior que 10 >10
-- WHERE para filtrar
SELECT *
FROM venda
WHERE quantidade > 10;

-- 9) IN permite colocar quantos filtros precisamos, vários valores , otimiza o código ao invés de usar o OR
-- OR é o ou um e o outro 
-- Filtramos WHERE a coluna prod/produtos
-- Usando o OR para mostrar o 'vestido' ou/OR 'regata'
SELECT *
FROM venda
WHERE prod = 'vestido' OR prod = 'regata'

-- WHERE eu estou filtrando a coluna PROD/PRODUTOS
-- Usando o IN eu coloco a lista que eu quero que mostre dentro de um único parêntese
SELECT *
FROM venda
WHERE prod IN ('CAMISA', 'REGATA', 'SHORT');

-- 10) Quantos clientes existem na base ?
SELECT COUNT(*) AS total_clientes
FROM clientes

-- 11) Qual é o maior valor do produto? E o menor?
SELECT MAX(valor)
FROM venda
-- Maior valor é 50

SELECT MIN(valor)
FROM venda
-- Menor valor é 30

SELECT*
FROM venda

-- 12)