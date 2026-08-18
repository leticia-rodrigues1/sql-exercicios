-- Exercício 1) Usando a tabela CLIENTES e PEDIDOS mostre: NOME e DATAPEDIDO
-- Regras: mostre somente pedidos realizados entre 2026-03-01 e 2026-07-31 e organize pela DataPedido da mais recente para a mais antiga.

SELECT 
CLIENTES.Nome, 
PEDIDOS.DataPedido
FROM CLIENTES 
LEFT JOIN PEDIDOS 
ON PEDIDOS.IdCliente = CLIENTES.IdCliente	
WHERE PEDIDOS.DataPedido BETWEEN ' 2026-03-01' AND '2026-07-31'
ORDER BY DataPedido DESC;


-- Exercício 2)Usando a tabela PRODUTOS, faça uma consulta que mostre: NomeProduto | Preco
-- Regras: Mostre somente produtos com preço entre R$ 50 e R$ 200 e ordene os produtos do mais caro para o mais barato.

SELECT 
PRODUTOS.NomeProduto,
PRODUTOS.Preco
FROM PRODUTOS 
WHERE PRODUTOS.Preco BETWEEN 50 AND 200 
ORDER BY PRODUTOS.Preco DESC;

-- Exercício 3) Usando CLIENTES + PEDIDOS + PRODUTOS, mostre: Nome do cliente | NomeProduto | Quantidade | Preco
-- Regras: considere somente produtos com preço entre R$ 100 e R$ 500 e organize pelo preço do mais caro para o mais barato.

SELECT 
CLIENTES.Nome,
PRODUTOS.NomeProduto,
PEDIDOS.Quantidade,
PRODUTOS.Preco
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE PRODUTOS.Preco BETWEEN 100 AND 500
ORDER BY PRODUTOS.Preco DESC;

-- Exercício 4) Usando CLIENTES + PEDIDOS + PRODUTOS, mostre: Cidade | FaturamentoTotal
-- Regras: Considere apenas clientes com idade entre 25 e 40 anos, calcule o faturamento de cada cidade (Quantidade × Preco), mostre somente cidades cujo faturamento total seja maior ou igual a R$ 3.000 e ordene do maior faturamento para o menor.
-- Vou usar as 3 tabelas

SELECT 
CLIENTES.Cidade,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco)  AS FaturamentoTotal
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE CLIENTES.Idade BETWEEN 25 AND 40
GROUP BY CLIENTES.Cidade
HAVING SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) >= 3000
ORDER BY FaturamentoTotal DESC;


