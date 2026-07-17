-- Exercício 18) Mostre: Nome do cliente e Produto comprado 
-- INNER JOIN é o que mostra apenas os registros que existem nas duas tabelas 
-- Para descobrir o produto comprado pelo cliente precisamos conectar as três tabelas CLIENTES, PRODUTOS e PEDIDOS.
-- CLientes possui o nome do cliente, Produtos possui o nome do pruduto e Pedidos informa qual cliente comprou qual produto


SELECT 
	CLIENTES.Nome,
	PRODUTOS.NomeProduto
FROM PEDIDOS
INNER JOIN CLIENTES 
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
INNER JOIN PRODUTOS
ON PEDIDOS.IdProduto = PRODUTOS.IdProduto;

-- Exercício 19) Mostre: Nome, Produto, Quantidade 
-- ( JOIN envolvendo as três tabelas ) JOIN junta informações que estão separadas em tabelas diferentes 
SELECT 
CLIENTES.Nome,
PRODUTOS.NomeProduto,
PEDIDOS.Quantidade
FROM PEDIDOS
JOIN CLIENTES
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
JOIN PRODUTOS 
ON PEDIDOS.IdProduto = PRODUTOS.IdProduto;


-- Exercício 20) Mostre os clientes que ainda não fizeram pedidos 
-- O LEFT JOIN mantém todos os registros da tabela que está á esquerda 
SELECT 
CLIENTES.IdCliente,
CLIENTES.Nome
FROM CLIENTES
LEFT JOIN PEDIDOS
ON CLIENTES.IdCliente = PEDIDOS.IdCliente
WHERE PEDIDOS.IdPedido IS NULL;
