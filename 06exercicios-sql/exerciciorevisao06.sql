-- Exercício 1) Faça uma consulta que mostre Nome do Cliente, Quantidade total de produtos pedidos

SELECT
CLIENTES.Nome,
SUM(PEDIDOS.Quantidade) AS QuantidadeTotal
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
GROUP BY CLIENTES.Nome;


-- Exercício 2) Mostre o Nome do Cliente e a Quantidade Total mas somente os clientes com a soma das quantidades maior que 20
SELECT
CLIENTES.Nome,
SUM(PEDIDOS.Quantidade)  AS QuantidadeTotal
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
GROUP BY CLIENTES.Nome
HAVING SUM(PEDIDOS.Quantidade) > 20;

-- Exercício 3) 
SELECT 
CLIENTES.Nome, 
SUM(PEDIDOS.Quantidade)  AS QuantidadeTotal
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
WHERE PEDIDOS.DataPedido > '2026-02-01'
GROUP BY CLIENTES.Nome
HAVING SUM(PEDIDOS.Quantidade) > 30;


-- Exercício 4)
SELECT 
CLIENTES.Cidade,
SUM(PEDIDOS.Quantidade) AS QuantidadeTotal
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
WHERE CLIENTES.Idade > 25 
GROUP BY CLIENTES.Cidade
HAVING SUM(PEDIDOS.Quantidade) > 30; 


-- Exercício 5) 
SELECT
CLIENTES.Nome, 
SUM(PEDIDOS.Quantidade) AS QuantidadeTotal 
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
WHERE PEDIDOS.DataPedido >= '2026-03-01'
GROUP BY CLIENTES.Nome
HAVING SUM(PEDIDOS.Quantidade) >= 40
ORDER BY QuantidadeTotal DESC 

-- Exercício 6)
SELECT
CLIENTES.Nome,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) AS FaturamentoTotal
FROM CLIENTES 
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
GROUP BY CLIENTES.Nome
HAVING SUM(PEDIDOS.Quantidade * PRODUTOS.Preco)> 1000
ORDER BY FaturamentoTotal DESC;


-- Exercício 7)
SELECT 
CLIENTES.Cidade,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) AS FaturamentoTotal
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE PEDIDOS.DataPedido >= '2026-03-01'
GROUP BY Clientes.Cidade
HAVING SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) > 3000
ORDER BY FaturamentoTotal DESC;

-- Exercício 8) 
SELECT 
CLIENTES.Cidade,
COUNT(PEDIDOS.IdPedido) AS TotalPedidos
FROM CLIENTES
LEFT JOIN PEDIDOS 
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
WHERE CLIENTES.Idade >= 30
GROUP BY CLIENTES.Cidade
HAVING COUNT(PEDIDOS.IdPedido) >= 2
ORDER BY TotalPedidos DESC;


-- Exercício 9)
SELECT 
CLIENTES.Cidade,
COUNT(PEDIDOS.IdPedido) AS TotalPedidos 
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
WHERE CLIENTES.Idade >= 30
GROUP BY CLIENTES.Cidade
HAVING COUNT(PEDIDOS.IdPedido) >=1
ORDER BY TotalPedidos DESC;



