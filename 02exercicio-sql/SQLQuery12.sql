-- QUERO VER APENAS CLIENTES QUE FIZERAM DOIS OU MAIS PEDIDOS
SELECT clientes.nomes, COUNT(pedidos2.valores)
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes
GROUP BY clientes.nomes
HAVING COUNT(pedidos2.valores) >= 2;

-- QUERO VER O TICKET MÉDIO POR CLIENTE
-- TICKET MÉDIO É A MÉDIA DO VALOR GASTO POR PEDIDO 

SELECT *
FROM pedidos2

SELECT clientes.nomes, AVG(pedidos2.valores) AS ticket_médio
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes
GROUP BY  clientes.nomes