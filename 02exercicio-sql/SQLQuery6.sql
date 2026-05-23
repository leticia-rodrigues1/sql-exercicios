 /*MOSTRE O NOME DO CLIENTE E QUANTOS PEDIDOS CADA CLIENTE FEZ?
	 JOIN
	COUNT
	GROUP BY
*/

SELECT clientes.nomes, COUNT(pedidos2.id_pedidos) AS total_pedidos
FROM CLIENTES
LEFT JOIN  pedidos2
ON clientes.id_clientes = pedidos2.id_clientes
GROUP BY clientes.nomes;

SELECT*
FROM pedidos2

--- MOSTRE O NOME DOS CLIENTES E O VALOR TOTAL GASTO POR CADA CLIENTE
SELECT clientes.nomes, SUM(pedidos2.valores) AS Total_Gasto
FROM clientes
LEFT JOIN pedidos2
ON clientes.id_clientes = pedidos2.id_clientes
GROUP BY clientes.nomes;


