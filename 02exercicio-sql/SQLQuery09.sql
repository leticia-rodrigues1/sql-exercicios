-- MOSTRE O NOME DO CLIENTE E A QUANTIDADE DE PEDIDOS QUE ELE FEZ, INCLUINDO CLIENTES QUE FIZERAM ZERO PEDIDOS.

SELECT clientes.nomes, COUNT(pedidos2.data_pedidos) AS total_pedidos
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes
GROUP BY clientes.nomes

-- MOSTRE APENAS CLIENTES QUE FIZERAM MAIS DE 1 PEDIDO
SELECT clientes.nomes, COUNT(pedidos2.data_pedidos) AS Pedidos
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes
GROUP BY clientes.nomes
HAVING COUNT (pedidos2.data_pedidos) > 1


-- OU ASSIM
SELECT clientes.nomes, COUNT(pedidos2.id_pedidos) AS Pedidos
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes
GROUP BY clientes.nomes
HAVING COUNT (pedidos2.id_pedidos) > 1



SELECT*
FROM pedidos2