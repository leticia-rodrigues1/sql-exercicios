
-- Nome do cliente ?
-- Valor do pedido ? somente pedidos á cima de 100 ( > 100)

-- Consultando as tabelas
SELECT *
FROM CLIENTE

SELECT *
FROM PEDIDOS

-- Resolvendo o exercício
SELECT 
	cliente.nome AS Nome_Cliente,
	pedidos.valor AS Valores
	FROM PEDIDOS
	JOIN CLIENTE
	ON pedidos.cliente_id = cliente.id 
	WHERE pedidos.valor  >100;

	-- Cliente que fez o pedido á cima de 100 foi o João com 300.