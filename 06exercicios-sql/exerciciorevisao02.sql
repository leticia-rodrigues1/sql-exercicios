-- Exercício 11) MOSTRE TODAS AS CATEGORIAS SEM REPETIR 
-- DISTINCT que remove os dados duplicados 
SELECT DISTINCT Categoria 
FROM PRODUTOS 

-- Exercício 12) CONTE QUANTOS CLIENTES EXISTEM 
-- COUNT para contar os registros 
-- COUNT (*) faz a contagem total da tabela 

SELECT COUNT (*)
FROM CLIENTES
-- 5 clientes 

-- Exercício 13) CONTE QUANTOS PRODUTOS EXISTEM 
-- COUNT para contar os registros
-- COUNT (*) faz a contagem total da tabela 

SELECT COUNT (*)
FROM PRODUTOS
-- 6 produtos 

-- Exercício 14) QUAL É O PRODUTO MAIS CARO?
SELECT *
FROM PRODUTOS 
WHERE Preco >= 1000

-- OU ASSIM
SELECT *
FROM PRODUTOS
ORDER BY Preco DESC
-- O produto mais caro é a geladeira R$1000,00

-- Exercício 15) QUAL É O PRODUTO MAIS BARATO?
SELECT *
FROM PRODUTOS
ORDER BY Preco ASC
-- O produto mais barato é os talheres R$30,00

-- Exercício 16) QUAL É O PREÇO MÉDIO DOS PRODUTOS ?
SELECT AVG(Preco) AS Media_Precos
FROM PRODUTOS
-- A média dos preços dos produtos é R$413.333333

-- Exercício 17) QUAL É O VALOR TOTAL DE TODOS OS PRODUTOS ?
SELECT SUM(Preco)
FROM PRODUTOS
-- O valor total de todos os produtos é R$2.480


