-- MOSTRE CLIENTES QUE NÃO POSSUEM PEDIDOS
SELECT clientes.nomes
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes
WHERE pedidos2.id_clientes IS NULL;
