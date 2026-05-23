-- CRIANDO UM DATABASE 
CREATE DATABASE BANCOTESTE

-- CRIANDO TABELA CLIENTES 
CREATE TABLE clientes(
		id_clientes INT PRIMARY KEY,
		nomes VARCHAR (100),
		cidades VARCHAR (100),
		segmentos VARCHAR (100)
		);

-- CRIANDO TABELA PEDIDOS
 CREATE TABLE pedidos2(
	id_pedidos INT PRIMARY KEY,
	id_clientes INT,
	valores DECIMAL(10,2),
	data_pedidos DATE,
	status_pedidos VARCHAR (50)
		
	FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes)

	);


-- ISENRIDO DADOS TABELA CLIENTES
 INSERT INTO clientes(id_clientes,nomes, cidades,segmentos)
 VALUES 
 (1,'Ana', 'São Paulo', 'Premium'),
 (2,'Carlos', 'Rio de Janeiro', 'Standard'),
 (3, 'Beatriz', 'São Paulo', 'Premium'),
 (4,'João', 'Belo Horizonte', 'Standard');

 
 -- INSERINDO DADOS TABELA PEDIDOS
 INSERT INTO pedidos2(id_pedidos,id_clientes,valores,data_pedidos,status_pedidos)
 VALUES
 (101, 1, 500.00,'2026-05-01','Pago'),
 (102, 1, 300.00,'2026-05-03','Pago'),
 (103, 2, 150.00, '2026-05-05', 'Pendente'),
 (104, 3,  900.00, '2026-05-07', 'Pago'),
 (105, 4, 200.00, '2026-05-10', 'Cancelado');


 -- CONSULTANDO A TABELA CLIENTES 
 SELECT *
 FROM clientes

 -- CONSULTANDO A TABELA PEDIDOS
 SELECT *
 FROM pedidos2

