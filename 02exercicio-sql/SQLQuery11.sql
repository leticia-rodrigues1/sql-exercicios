-- QUAIS FORAM OS DOIS CLIENTES QUE MAIS GASTARAM?

SELECT TOP 2 clientes.nomes, SUM(pedidos2.valores) AS Clientes_Gataram_Mais
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes
GROUP BY clientes.nomes
ORDER BY Clientes_Gataram_Mais DESC;

-- QUANTOS PEDIDOS CADA CLIENTE FEZ E QUAL O VALOR TOTAL GASTO?

SELECT clientes.nomes, SUM(pedidos2.valores) AS SOMA_TOTAL, COUNT(pedidos2.id_pedidos) AS TOTAL_GASTO
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes
GROUP BY clientes.nomes;