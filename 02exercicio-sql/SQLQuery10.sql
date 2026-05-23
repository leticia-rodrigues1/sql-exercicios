--	QUAL CLIENTE GASTOU MAIS?
SELECT clientes.nomes, SUM(pedidos2.valores) AS total_gasto
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes
GROUP BY  clientes.nomes



-- OU ASSIM 
SELECT clientes.nomes, SUM(pedidos2.valores) AS total_gasto
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes
GROUP BY  clientes.nomes
ORDER BY total_gasto DESC;
