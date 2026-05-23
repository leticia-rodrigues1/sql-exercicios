
-- Mostrar nome do cliente e valor do pedido, ordenando do maior para o menor.”

SELECT 
	cliente.nome AS Nome_Cliente,
	pedidos.valor AS Valor_Pedido
	FROM PEDIDOS
	JOIN CLIENTE
	ON pedidos.cliente_id = cliente.id
	ORDER BY pedidos.valor DESC; 

-- Resposta: João 300, Ana 100 e Ana 50.