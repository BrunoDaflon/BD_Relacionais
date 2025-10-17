-- Criei uma tabela que define
-- id, nome, email
CREATE TABLE Clientes (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	email VARCHAR(100)
);

CREATE TABLE Pedidos(
	id SERIAL PRIMARY KEY,
	cliente_id INT REFERENCES Clientes(id),
	data_pedido DATE NOT NULL,
	valor DECIMAL(10,2) NOT NULL
);
-- Procedimento vamos definir
-- Qual é o procedimento ALTER TABLE
-- Vamos indicar qual é a tabela
-- Indicar qual o ptipo de alteração que queremos na tabela
-- onde na coluna queremos realizar alteração


-- Adicionando tabela telefone na tabela clientes
ALTER TABLE Clientes ADD COLUMN telefone VARCHAR(20);

-- Usando 100 registros aleatorios na tabela clientes
INSERT INTO Clientes(nome,email)
	SELECT
		LEFT(md5(random()::text), 10) AS nome,
		LEFT(md5(random()::text), 10) || '@gmail.com' AS email
	FROM generate_series(1,100);

-- Inserindo tabela pedidos
INSERT INTO Pedidos(cliente_id, data_pedido, valor)
	SELECT
		-- Usamos o id de clientes para referenciar o cliente
		id AS cliente_id,
		-- gera uma data aleatória no ultimo ano
		current_date - (random() * 365)::int AS data_pedido,
		-- gera um valor aleatório para o pedido
		(random()*1000)::decimal(10,2) AS valor
	FROM Clientes
	ORDER BY random() -- Ordena aleatoriamente para distribuir os pedidos
	LIMIT 100; -- limita a 100 registros

	
UPDATE Clientes SET email = 'joaonovo@gmail.com' WHERE id = 1

SELECT nome,email FROM Clientes WHERE email LIKE '%mail.com';

-- criando uma nova tabela
CREATE TABLE new_client AS
-- dizendo como essa tabela deve ser populada e estrudurada
	SELECT * FROM Clientes;
SELECT * FROM new_client;

SELECT Clientes.nome, Pedidos.valor
	FROM Clientes
		JOIN pedidos ON Clientes.id = Pedidos.cliente_id;

-- DROP TABLE Exclui a tabela por definitivo
DROP TABLE Clientes;
DROP TABLE Pedidos;
-- DELETE deleta apenas o que define
-- Aceita condições e é mais lento
DELETE * FROM Clientes;
	WHERE nome = 'Zé da Manga'
-- TRUNCATE não aceita condições e deleta tudo de uma vez só
-- Truncate zera o contador
TRUNCATE TABLE Clientes;

-- CHAMANDO A TABELA
SELECT * FROM Clientes;
SELECT * FROM Pedidos;
