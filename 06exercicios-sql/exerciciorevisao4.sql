
-- Exercício 1) Mostre o nome do cliente, cidade, produto e quantidade comprada.
SELECT  
CLIENTES.Nome,
CLIENTES.Cidade,
PRODUTOS.NomeProduto,
PEDIDOS.Quantidade
FROM PEDIDOS
INNER JOIN CLIENTES
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
INNER JOIN PRODUTOS
ON PEDIDOS.IdProduto = PRODUTOS.IdProduto;


-- Exercício 2) Liste TODOS os clientes e, se eles tiverem pedido, mostre o número do pedido.
SELECT 
CLIENTES.Nome,
PEDIDOS.Quantidade,
PEDIDOS.IdPedido,
CLIENTES.IdCliente
FROM CLIENTES
LEFT JOIN PEDIDOS
ON CLIENTES.IdCliente = PEDIDOS.IdCliente;

-- CORREÇÃO DO EXERCÍCIO 
SELECT 
CLIENTES.Nome,
PEDIDOS.IdPedido
FROM CLIENTES
LEFT JOIN PEDIDOS
ON CLIENTES.IdCliente = PEDIDOS.IdCliente;


-- EXERCÍCIO 3) Quero ver todos os produtos cadastrados. Se algum produto já foi vendido, mostre também a quantidade vendida 

SELECT 
CLIENTES.Nome,
PRODUTOS.NomeProduto,
PEDIDOS.Quantidade
FROM PRODUTOS
LEFT JOIN PEDIDOS
ON PEDIDOS.IdProduto = PRODUTOS.IdProduto
LEFT JOIN CLIENTES
ON CLIENTES.IdCliente = PEDIDOS.IdCliente;

-- CORREÇÃO DO EXERCÍCIO 
-- Pediu apenas todos os produtos e quantidade vendida, quando houver

SELECT 
PRODUTOS.NomeProduto,
PEDIDOS.Quantidade
FROM PRODUTOS
LEFT JOIN PEDIDOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto;


-- EXERCÍCIO 4) Quero listar todos os clientes e os produtos comprados. Os clientes que nunca compraram também devem aparecer.
SELECT 
CLIENTES.Nome, 
PRODUTOS.NomeProduto
FROM CLIENTES
LEFT JOIN PEDIDOS
ON CLIENTES.IdCliente = PEDIDOS.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto;


-- Exercício 5) Quero saber quantos pedidos cada cliente fez.
SELECT 
CLIENTES.Nome,
COUNT(PEDIDOS.IdPedido) AS QuantidadePedidos
FROM CLIENTES 
LEFT JOIN PEDIDOS
ON CLIENTES.IdCliente = PEDIDOS.IdCliente 
GROUP BY CLIENTES.Nome;


-- Exercício 6) Quero saber quantos pedidos existem para cada produto.
SELECT 
PRODUTOS.NomeProduto,
COUNT(PEDIDOS.IdPedido) AS QuantidadePedidos
FROM PRODUTOS
LEFT JOIN PEDIDOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
GROUP BY PRODUTOS.NomeProduto;