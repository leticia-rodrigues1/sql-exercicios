/* EXERCÍCIO 1) Faça uma consulta que mostre:
Nome do cliente
Quantidade total de produtos pedidos por cada cliente
Considere somente clientes com 30 anos ou mais 
Ordene da maior quantidade para menor 
*/
SELECT 
CLIENTES.Nome,
SUM(PEDIDOS.Quantidade) AS QuantidadeTotal
FROM CLIENTES 
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
WHERE CLIENTES.Idade >= 30
GROUP BY CLIENTES.Nome
ORDER BY QuantidadeTotal DESC;

--==================================================================================
/* Exercício 2) Mostre o nome do cliente 
Quantidade de pedidos realizados por cada cliente 
Somente clientes com idade maior ou igual a 30
Somente clientes que fizeram 2 ou mais pedidos
Ordene pela quantidade de pedidos do maior para o menor		
*/
SELECT CLIENTES.Nome,
COUNT(PEDIDOS.Quantidade)  AS TotalPedidos
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
WHERE CLIENTES.Idade >= 30
GROUP BY CLIENTES.Nome
HAVING COUNT(PEDIDOS.Quantidade) >= 2
ORDER BY TotalPedidos DESC;

--==============================================================
/* Exercício 3) Faça uma consulta que mostre:
Cidade
Quantidade de pedidos realizados em cada cidade
Considere somente clientes com idade entre 25 e 45 anos 
Considere somente pedidos feitos a partir 01/03/2026
Mostre apenas cidades que tenham 2 ou mais pedidos 
Ordene da cidade com mais pedidos para com menos pedidos.
*/
SELECT 
CLIENTES.Cidade,
COUNT(PEDIDOS.IdPedido) AS TotalPedidos
FROM CLIENTES 
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
WHERE PEDIDOS.DataPedido >= '2026-03-01'
AND CLIENTES.Idade BETWEEN 25 AND 45
GROUP BY CLIENTES.Cidade
HAVING COUNT(PEDIDOS.IdPedido) >= 1
ORDER BY TotalPedidos DESC;

--===================================================================================
/* Exercício 4)
Quero uma consulta que mostre o nome de cada cliente e o valor total gasto por ele.
Regras:
Somente clientes com 30 anos ou mais 
Somente pedidos entre 01/03/2026 e 31/08/2026
Mostrar apenas clientes que gastaram R$1.000,00 ou mais 
Ordenar do maior valor gasto  para o menor 
*/
SELECT
CLIENTES.Nome,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) AS TotalGasto
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE CLientes.Idade >= 30
AND PEDIDOS.DataPedido BETWEEN '2026-03-01' AND '2026-08-31'
GROUP BY CLIENTES.Nome
HAVING SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) >= 1000
ORDER BY TotalGasto DESC; 

--=====================================================================================
/* Exercício 5) A empresa quer identificar as cidades com melhor desempenho de vendas.
Crie uma consulta que mostre:
Cidade | TotalClientes | FaturamentoTotal
Regras:
Considere somente clientes entre 25 e 45 anos
Considere pedidos realizados a partir de 01/04/2026
Calcule o faturamento total de cada cidade
Mostre somente cidades com faturamento maior que R$ 2.000
Mostre somente cidades que tenham pelo menos 2 clientes diferentes que realizaram pedidos
Ordene pelo FaturamentoTotal do maior para o menor
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
AND CLIENTES.Idade BETWEEN 25 AND 45
GROUP BY CLIENTES.Cidade
HAVING COUNT(DISTINCT CLIENTES.IdCliente) >	= 2
AND SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) > 2000
ORDER BY FaturamentoTotal DESC;

--=============================================================================
/* Exercício 6) A empresa quer analisar o comportamento de compra por cidade.
Monte uma consulta que mostre:
CIDADE | TOTALPEDIDOS | MEDIAQUANTIDADE
Regras:
Considere somente clientes com idade maior ou igual a 25 anos.
Considere somente pedidos realizados entre 01/02/2026 e 31/07/2026.
Calcule a quantidade de pedidos de cada cidade.
Calcule a média da quantidade de produtos por pedido de cada cidade.
Mostre somente cidades que tenham 3 ou mais pedidos.
Mostre somente cidades cuja média da quantidade de produtos seja maior que 2.
Ordene pela MediaQuantidade da maior para a menor.
*/
SELECT 
CLIENTES.Cidade,
COUNT(DISTINCT PEDIDOS.IdPedido),
AVG(PEDIDOS.Quantidade) AS MediaTotal 
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
WHERE CLIENTES.Idade >= 25
AND PEDIDOS.DataPedido BETWEEN '2026-02-01' AND '2026-07-31'
GROUP BY CLIENTES.Cidade
HAVING COUNT(DISTINCT PEDIDOS.IdPedido) >= 3
AND AVG(PEDIDOS.Quantidade) > 2
ORDER BY MediaTotal DESC;

--=====================================================================================
/* Exercício 7) A empresa quer descobrir quais produtos estão gerando mais faturamento.
Sua consulta deve mostrar:
NOMEPRODUTO | TOTALVENDIDO | FATURAMENTOTOTAL
Regras:
Considere somente pedidos realizados a partir de 01/03/2026.
TotalVendido deve representar a quantidade total de unidades vendidas de cada produto.
FaturamentoTotal deve representar Quantidade × Preço.
Mostre somente produtos que venderam 10 unidades ou mais no total.
Mostre somente produtos cujo faturamento total seja maior que R$ 1.000.
Ordene pelo FaturamentoTotal do maior para o menor.
*/ 
SELECT 
PRODUTOS.NomeProduto,
SUM(PEDIDOS.Quantidade)  AS QuantidadeVendida,  
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco)  AS FaturamentoTotal 
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE PEDIDOS.DataPedido >= '2026-03-01'
GROUP BY PRODUTOS.NomeProduto
HAVING SUM(PEDIDOS.Quantidade) >= 10
AND SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) > 1000
ORDER BY FaturamentoTotal DESC;

--==================================================================

/* Exercício 8) Quero que você encontre os clientes que NÃO realizaram nenhum pedido
Mostre apenas:
NOME | CIDADE
*/
SELECT 
CLIENTES.Nome,
CLIENTES.Cidade
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
WHERE PEDIDOS.IdPedido IS NULL; 

--========================================================================================

/* Exercício 9) Agora quero uma consulta que mostre:
NOME| TOTALPEDIDOS | FATURAMENTOTOTAL
Regras:
Considere somente clientes com idade entre 25 e 45 anos.
Considere somente pedidos realizados entre 01/03/2026 e 31/07/2026.
TotalPedidos = quantidade de pedidos realizados por cada cliente.
FaturamentoTotal = valor total gasto por cada cliente.
Mostre somente clientes que tenham realizado 2 ou mais pedidos.
Mostre somente clientes cujo faturamento seja maior ou igual a R$ 1.500.
Ordene pelo FaturamentoTotal do maior para o menor.
*/
SELECT 
CLIENTES.Nome,
COUNT(PEDIDOS.IdPedido)  AS QuantidadePedido,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) AS FaturamentoTotal 
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE CLIENTES.Idade BETWEEN 25 AND 45
AND PEDIDOS.DataPedido BETWEEN '2026-03-01' AND '2026-07-31'
GROUP BY CLIENTES.Nome
HAVING COUNT(PEDIDOS.IdPedido) >= 2
AND SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) >= 1500
ORDER BY FaturamentoTotal DESC;

--================================================================
/* Exercício 10)
Mostre:
Nome | Cidade | Idade
Regras:
Apenas clientes com idade entre 30 e 40 anos
Apenas clientes da cidade de São Paulo
Ordene do cliente mais velho para o mais novo
*/
SELECT
CLIENTES.Nome,
CLIENTES.Cidade,
CLIENTES.Idade
FROM CLIENTES
WHERE CLIENTES.Idade BETWEEN 30 AND 40
AND CLIENTES.Cidade = 'São Paulo'
ORDER BY CLIENTES.Idade DESC; 

--=================================================================