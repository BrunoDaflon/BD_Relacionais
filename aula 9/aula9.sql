
-- criação da tabela 

CREATE TABLE produto (
    id SERIAL PRIMARY KEY, 
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    categoria VARCHAR(50)             
);


--  insersação de dados

INSERT INTO produto (nome, preco, categoria) VALUES
('PS5', 3500.00, 'Videogames'),
('Mouse', 120.50, 'Periféricos'),
('Camiseta', 49.90, 'Roupas'),
('Calça Jeans', 180.00, 'Roupas'),
('Arroz (5kg)', 28.30, 'Alimentos');


-- criação de views
CREATE VIEW vw_produtos_videogames AS
SELECT id, nome, preco
FROM produto
WHERE categoria = 'Videogames';

CREATE VIEW vw_produtos_perifericos AS
SELECT id, nome, preco
FROM produto
WHERE categoria = 'Periféricos';

CREATE VIEW vw_produtos_roupas AS
SELECT id, nome, preco
FROM produto
WHERE categoria = 'Roupas';

CREATE VIEW vw_produtos_alimentos AS
SELECT id, nome, preco
FROM produto
WHERE categoria = 'Alimentos';


-- usando as views

SELECT * FROM vw_produtos_videogames;
SELECT * FROM vw_produtos_perifericos; 
SELECT * FROM vw_produtos_roupas;      
SELECT * FROM vw_produtos_alimentos;   


-- update


UPDATE produto
SET preco = 3700.00
WHERE nome = 'PS5';

-- inserindo algo novo
INSERT INTO produto (nome, preco, categoria) VALUES
('Tênis', 350.00, 'Roupas');


-- select

SELECT * FROM vw_produtos_videogames;
SELECT * FROM vw_produtos_perifericos;
SELECT * FROM vw_produtos_roupas;
SELECT * FROM vw_produtos_alimentos;