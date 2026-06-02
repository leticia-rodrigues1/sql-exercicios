/* .
EXERCITANDO ANÁLISE DE DADOS NO SQL

Exercício 1: Você é responsável por controlar os dados de clientes e de produtos da sua empresa.
O que você precisará fazer é confirmar se:

a) Existem 5 produtos cadastrados no estoque e, se não tiver você deverá reportar ao seu gestor para saber
se existe alguma defasagem no controle dos produtos. 

-- Existe 5 produtos cadastrados no estoque 

b) Até o mês passado, a empresa tinha um total de 3 clientes na base de controle.
Verifique se esse número aumentou ou reduziu.

-- Aumentou para 5 clientes 

*/

-- a)
-- Consultando a tabela ESTOQUE 
SELECT *
FROM dbo.ESTOQUE

-- Usando o DISTINCT para para eliminar os valores duplicados
SELECT DISTINCT ID
FROM dbo.ESTOQUE

-- b)
SELECT *
FROM dbo.CLIENTES

-- Exercício 2: Filtrar as colunas de NOME, CIDADE, ENDERECO e renomeá - las usando o AS
SELECT 
	NOME AS 'NOVO NOME',
	CIDADE AS 'CIDADES ATUALIZAS', 
	ENDERECO AS 'CORRESPONDENCIA'
FROM dbo.CLIENTES;

-- Exercício 3: Utilize um comando para filtrar os 3 primeiros clientes
-- Trazendo todas as colunas
SELECT TOP 3 *
FROM dbo.CLIENTES

-- Filtrando o top 3 por nome e cidade
SELECT TOP (3) nome, cidade
FROM dbo.CLIENTES

-- Filtando os top 3 nomes e os ordenando por ordem alfabética
SELECT TOP (3) nome
FROM dbo.CLIENTES
ORDER BY Nome;

-- Filtrando as top 3 cidades e as ordenando por ordem alfabética 
SELECT TOP (3) cidade
FROM dbo.CLIENTES
ORDER BY cidade;

-- Exercício 4: Fazer uma lista dos produtos em estoque 
SELECT nome_prod
FROM dbo.ESTOQUE
	