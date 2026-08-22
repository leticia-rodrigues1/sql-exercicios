
/* Exercício 1) Faça uma consulta que mostre Cidade, Faturamento Total chamado FaturamentoTotal
Considere somente clientes com idade entre 25 e 40 anos
E depois de calcular o faturamento, mostre somente as cidades cujo faturamento seja maior ou igual a R$3.000,00
Ordene do maior faturamento para o menor. 
*/

SELECT
CLIENTES.Cidade,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco)  AS FaturamentoTotal
FROM CLIENTES 
INNER JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
INNER JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE CLIENTES.Idade BETWEEN 25 AND 40
GROUP BY CLIENTES.Cidade
HAVING SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) >= 3000
ORDER BY FaturamentoTotal DESC;


/* Exercício 2) Faça uma consulta que mostre Nome do Cliente, Quantidade Total de Produtos Comprados chamada TotalProdutos
Considere somente pedidos realizados entre: 01/03/2026 e 31/07/2026
Mostre apenas clientes que, somando todos os seus pedidos nesse período, compraram 5 ou mais unidades de produtos.
Ordene o cliente que comprou mais unidades para o que comprou menos.
*/

SELECT
CLIENTES.Nome,
SUM(PEDIDOS.Quantidade) AS TotalProdutos
FROM CLIENTES
INNER JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
INNER JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE PEDIDOS.DataPedido BETWEEN '2026/03/01' AND '2026/07/31'
GROUP BY CLIENTES.Nome
HAVING SUM(PEDIDOS.Quantidade) >= 5
ORDER BY TotalProdutos DESC;

/* Exercício 3) Mostre o nome de cada cliente e o valor total gasto por ele 

Considere apenas: 
Clientes com idade entre 25 e 40 anos;
Pedidos realizados a partir de 01/042026;
Clientes que tenham gasto R$1.500 ou mais no total 

Ordene o resultado do maior valor gasto para o menor.
*/
SELECT 
CLIENTES.Nome,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) AS TotalGasto
FROM CLIENTES
INNER JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
INNER JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE PEDIDOS.DataPedido >= '2026/04/04'
AND CLIENTES.Idade BETWEEN 25 AND 40
GROUP BY CLIENTES.Nome
HAVING SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) >= 1500
ORDER BY TotalGasto DESC;



/* Exercício 4) Mostre a cidade, a quantidade total de pedidos e o faturamento total de cada cidade
Considere apenas pedidos feitos entre 01/02/2026 e 31/07/2026
Mostre somente as cidades que tiveram 3 ou mais pedidos e ordene pelo maior faturamento total
*/

SELECT 
CLIENTES.Cidade,
COUNT(PEDIDOS.IdPedido)AS TotalPedido,
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) AS FaturamentoTotal
FROM CLIENTES 
LEFT JOIN PEDIDOS 
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE PEDIDOS.DataPedido BETWEEN '2026/02/01' AND '2026/07/31'
GROUP BY CLIENTES.Cidade
HAVING COUNT(PEDIDOS.IdPedido)  >= 3
ORDER BY FaturamentoTotal DESC;

/* Exercício 5) Mostre o Nome do Cliente, Quantidade de Pedidos Realizados e o Valor Total Gasto por cada cliente

Considere apenas: 
Clientes com 30 anos ou mais;
Peidos realizados entre 01/01/2026 e 30/06/2026;
Cliente que fizeram 2 ou mais pedidos;
Que gastaram R$2.000,00 ou mais no total.

Ordene pelo maior valor gasto para o menor.
*/

SELECT 
CLIENTES.Nome,
COUNT(PEDIDOS.IdPedido),
SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) AS ValorTotalGasto
FROM CLIENTES
LEFT JOIN PEDIDOS
ON PEDIDOS.IdCliente = CLIENTES.IdCliente
LEFT JOIN PRODUTOS
ON PRODUTOS.IdProduto = PEDIDOS.IdProduto
WHERE CLIENTES.Idade >= 30
AND PEDIDOS.DataPedido BETWEEN '2026/01/01' AND '2026/06/30'
GROUP BY CLIENTES.Nome
HAVING COUNT(PEDIDOS.Quantidade) >= 2
AND SUM(PEDIDOS.Quantidade * PRODUTOS.Preco) >= 2000
ORDER BY ValorTotalGasto DESC;

