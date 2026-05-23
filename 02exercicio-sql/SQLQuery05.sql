-- QUANTOS PEDIDOS EXISTEM POR STATUS?
SELECT status_pedidos, COUNT(*) AS Quantidades
FROM pedidos2
GROUP BY status_pedidos;

-- MOSTRE O NOME DO CLIENTE E O VALOR DO PEDIDO USANDO O INNER JOIN 
SELECT *
FROM pedidos2

SELECT *
FROM clientes

SELECT nomes, valores
FROM clientes
INNER JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes

-- MOSTRA TODOS OS CLIENTES MESMO SE NÃO TIVER PEDIDO
SELECT *
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes

-- CLIENTES QUE NÃO FIZERAM PEDIDOS 
SELECT *
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes 
WHERE pedidos2.id_clientes IS NULL

