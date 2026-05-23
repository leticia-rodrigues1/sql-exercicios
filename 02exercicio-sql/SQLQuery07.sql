-- MOSTRE APENAS OS CLIENTES QUE GASTARAM MAIS DE 500 NO TOTAL
SELECT clientes.nomes, SUM(pedidos2.valores) AS total_gasto
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes
GROUP BY clientes.nomes
HAVING SUM(pedidos2.valores) > 500;