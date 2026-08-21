
-- Exercício 1) Mostre: Nome do cliente , Nome do produto, Quantidade comprada e Preço do produto
-- Mostre somente os pedidos com quantidade maior ou igual a 2.
-- Ordene pelo nome do cliente em ordem alfabética.

SELECT 
CLIENTES.Nome,
PRODUTOS.NomeProduto,
PRODUTOS.Preco,
PEDIDOS.Quantidade
FROM CLIENTES
INNER JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
INNER JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE PEDIDOS.Quantidade >= 2
ORDER BY CLIENTES.Nome ASC;

-- Exercício 2) Usando as mesmas tabelas CLIENTES, PEDIDOS e PRODUTOS, faça uma consulta que mostre:
-- Nome do cliente , Cidade do cliente, Nome do produto, Quantidade comprada, Preço do produto
-- Regras:
-- Mostre somente clientes com idade entre 25 e 40 anos.
-- Mostre somente pedidos com quantidade maior ou igual a 2.
-- Ordene do produto mais caro para o mais barato.

SELECT 
CLIENTES.Nome,
CLIENTES.Cidade,
PRODUTOS.NomeProduto,
PEDIDOS.Quantidade,
PRODUTOS.Preco
FROM CLIENTES
INNER JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
INNER JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE PEDIDOS.Quantidade >= 2 
AND CLIENTES.Idade BETWEEN 25 AND 40
ORDER BY PRODUTOS.Preco DESC;

-- Exercício 3) Faça uma consulta que mostre Nome do CLiente, Valor Total Gasto por esse cliente com o nome TotalGasto
SELECT 
CLIENTES.Nome, 
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) AS TotalGasto
FROM CLIENTES
INNER JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
INNER JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
GROUP BY Clientes.Nome
ORDER BY TotalGasto DESC;

-- Exercício 4) Faça uma consulta que mostre Cidade, Faturamento total daquela cidade, com o nome FaturamentoTotal,
-- Depois somar todas as vendas de cada cidade, ordene da cidade com maior faturamento para a de menor faturamento.
	
SELECT 
CLIENTES.Cidade,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) AS FaturamentoTotal
FROM CLIENTES
INNER JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
INNER JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
GROUP BY CLIENTES.Cidade
ORDER BY FaturamentoTotal DESC;


-- EXERCÍCIO 5) Mostre a Cidade, Faturamento Total 
-- Mostre somente as cidades cujo faturamento total seja maior ou igual a R$4.000
-- Ordene do maior faturamento para o menor

SELECT 
CLIENTES.Cidade,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco)  AS FaturamentoTotal
FROM CLIENTES
INNER JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
INNER JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
GROUP BY CLIENTES.Cidade
HAVING SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) >= 4000
ORDER BY FaturamentoTotal DESC;
