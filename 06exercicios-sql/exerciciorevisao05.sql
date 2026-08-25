-- Exercício 1) Mostre: O nome do produto e a quantidade total vendida de cada produto
-- FROM PRODUTOS
-- Quantidade vendida esta em PEDIDOS
-- LEFT JOIN para mostrar todos os produtos mesmo o que não tenha sido vendido

SELECT 
PRODUTOS.NomeProduto,
SUM(PEDIDOS.Quantidade) AS TotalVendido
FROM PRODUTOS
LEFT JOIN PEDIDOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
GROUP BY PRODUTOS.NomeProduto;


-- Exercício 2) Mostre o nome do cliente e o nome do produto que ele comprou
SELECT
CLIENTES.Nome,
PRODUTOS.NomeProduto
FROM CLIENTES
LEFT JOIN PEDIDOS
ON CLIENTES.IdCliente = PEDIDOS.IdCliente
LEFT JOIN PRODUTOS
ON PEDIDOS.IdProduto = PRODUTOS.IdProduto;


--- Exercício 3) Mostre o nome do cliente, nome do produto e a quantidade comprada.
SELECT 
CLIENTES.Nome,
PRODUTOS.NomeProduto,
PEDIDOS.Quantidade
FROM CLIENTES
LEFT JOIN PEDIDOS
ON CLIENTES.IdCliente = PEDIDOS.IdCliente
LEFT JOIN PRODUTOS
ON PEDIDOS.IdProduto = PRODUTOS.IdProduto;



--- Exercício 4) Mostre o nome do cliente e o valor total da compra de cada pedido 
SELECT 
CLIENTES.Nome,
PRODUTOS.Preco,
PRODUTOS.NomeProduto,
PEDIDOS.Quantidade,
PEDIDOS.Quantidade * PRODUTOS.Preco AS ValorTotal
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto;

-- Exercício 5) Mostre o nome dos clientes que nunca fizeram um pedido
-- FROM CLIENTES
-- LEFT JOIN 
-- IdPedido

SELECT 
CLIENTES.Nome,
PEDIDOS.IdPedido
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
WHERE PEDIDOS.IdPedido IS NULL;

-- Exercício 6) Mostre os produtos que nunca foram vendidos
SELECT
PRODUTOS.NomeProduto
FROM PRODUTOS
LEFT JOIN PEDIDOS
ON PEDIDOS.IdProduto = PRODUTOS.IdProduto
WHERE PEDIDOS.IdPedido IS NULL

-- Exercício 7) Qual cliente que mais gastou dinheiro?
SELECT 
CLIENTES.Nome, 
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco)  AS TotalGasto
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
GROUP BY CLIENTES.Nome
ORDER BY TotalGasto DESC;

-- Exercício 8) Qual cliente top 1 que mais gastou?
SELECT TOP 1
CLIENTES.Nome,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco)  AS TotalGasto
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
GROUP BY CLIENTES.Nome
ORDER BY TotalGasto DESC;

-- Exercício 9) Mostre o faturamento total por cidade, do maior para o menor
SELECT 
CLIENTES.Cidade,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco)  AS FaturamentoTotal
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
GROUP BY CLIENTES.Cidade
ORDER BY FaturamentoTotal DESC;


-- Exercício 10) Mostre a cidade top 1 que mais faturou
SELECT TOP 1
CLIENTES.Cidade,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco)  AS FaturamentoTotal
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
GROUP BY CLIENTES.Cidade
ORDER BY FaturamentoTotal DESC;





