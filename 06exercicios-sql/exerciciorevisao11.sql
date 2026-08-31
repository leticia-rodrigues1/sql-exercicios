/* Exercício 1) Crie e uma consulta que mostre 
Nome do cliente
Cidade
Quantidade total de produtos comprados 
Considere apenas:
Clientes com idade entre 25 e 45 anos
Pedidos realizados a partir de 01/04/2026
Mostre somente clientes que compraram pelo menos 5 produtos no total
Ordene pela quantidade total de produtos do maior para o menor
*/
SELECT
CLIENTES.Nome,
CLIENTES.Cidade,
SUM(PEDIDOS.Quantidade)   AS TotalProdutos
FROM CLIENTES 
INNER JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
WHERE PEDIDOS.DataPedido >= '2026-04-01'
AND CLIENTES.Idade BETWEEN 25 AND 45
GROUP BY 
CLIENTES.Nome,
CLIENTES.Cidade 
HAVING SUM(PEDIDOS.Quantidade) >= 5
ORDER BY TotalProdutos DESC;

--======================================================================================

/* Exercício 2) Mostre o nome do cliente e o valor total gasto por ele 
Considere apenas  clientes com idade maior ou igual a 30
Pedidos feitos entre 01/03/2026 e 31/07/2026
Mostre os clientes que fizeram pelo menos 2 pedidos e gastaram mais de 1.500 no total
Ordene do maior gasto para o menor
*/
SELECT 
CLIENTES.Nome,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco)   AS TotalGasto 
FROM CLIENTES 
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE CLIENTES.Idade >= 30
AND PEDIDOS.DataPedido BETWEEN '2026-03-01' AND '2026-07-31'
GROUP BY CLIENTES.Nome
HAVING SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) > 1500
AND COUNT(PEDIDOS.IdPedido) >= 2
ORDER BY TotalGasto DESC;

--====================================================================================

/* Exercício 3) Faça uma consulta mostrando:
Cidade
Quantidade de pedidos realizados
Faturamento total
Considere apenas:
Clientes entre 25 e 40 anos
Pedidos realizados a partir de 01/05/2026
Cidades que tenham pelo menos 3 pedidos
Faturamento total maior que R$ 2.000
Ordene pelo faturamento do maior para o menor
*/
SELECT 
CLIENTES.Cidade,
COUNT(DISTINCT PEDIDOS.IdPedido) AS PedidosRealizados,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) AS FaturamentoTotal
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE PEDIDOS.DataPedido >= '2026-05-01'
AND CLIENTES.Idade BETWEEN 25 AND 40
GROUP BY CLIENTES.Cidade
HAVING COUNT(DISTINCT PEDIDOS.IdPedido) >= 3
AND SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) > 2000
ORDER BY FaturamentoTotal DESC;
--================================================================================
/* Exercício 4) Mostre:
Nome do cliente
Quantidade de pedidos
Quantidade total de produtos comprados 
Regras:
Somente pedidos realizados entre 01/02/2026 e 30/06/2026
Somente clientes com idade maior que 25 anos
O cliente precisa ter feito pelo menos 2 pedidos
O cliente precisa ter comprado mais de 6 produtos no total
Ordene pela quantidade total de produtos, do maior para o menor.
*/

SELECT 
CLIENTES.Nome,
COUNT(DISTINCT PEDIDOS.IdPedido),
SUM(PEDIDOS.Quantidade) AS QuantidadeTotal
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
WHERE CLIENTES.Idade > 25
AND PEDIDOS.DataPedido BETWEEN '2026-02-01' AND '2026-06-30'
GROUP BY CLIENTES.Nome
HAVING COUNT(DISTINCT PEDIDOS.IdPedido) >= 2
AND SUM(PEDIDOS.Quantidade) > 6
ORDER BY QuantidadeTotal DESC;
--=========================================================================

/* Exercício 5) Mostre:
Cidade | QuantidadeClientes | FaturamentoTotal
Regras: considere somente pedidos realizados a partir de 01/04/2026 e clientes com idade entre 30 e 50
anos.Mostre apenas cidades que tenham pelo menos 2 clientes diferentes que realizaram pedidos e
faturamento total maior ou igual a R$ 3.000. Ordene pelo faturamento do maior para o menor.
*/
SELECT 
CLIENTES.Cidade,
COUNT(DISTINCT CLIENTES.IdCliente),
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco)  AS FaturamentoTotal
FROM CLIENTES 
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE PEDIDOS.DataPedido >= '2026-04-01'
AND CLIENTES.Idade BETWEEN 30 AND 50
GROUP BY CLIENTES.Cidade
HAVING COUNT(DISTINCT CLIENTES.IdCliente) >= 2
AND SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) >= 3000
ORDER BY FaturamentoTotal DESC;


