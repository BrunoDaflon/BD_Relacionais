-- Criando tabela de cursos
CREATE TABLE cursos (
	id_curso SERIAL PRIMARY KEY,
	nome_curso VARCHAR(100),
	departamento VARCHAR(100)
);

-- Criando tabela de professores
CREATE TABLE professores (
	id_professor SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	departamento VARCHAR(100)
);

-- Criando tabela de alunos
CREATE TABLE alunos (
	id_aluno SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	idade INT,
	curso_id INT REFERENCES cursos(id_curso)
);

-- Criando usuário
CREATE USER usuario_uni WITH PASSWORD '123senha';

-- Dar permissão de conexão ao banco
GRANT CONNECT ON DATABASE "Universidade" TO usuario_uni;

-- Definir permissões por tabela
-- Usuario só pode ler professores e cursos
GRANT SELECT ON professores TO usuario_uni;
GRANT SELECT ON cursos TO usuario_uni;

-- Usuario pode alterar alunos
GRANT SELECT, INSERT, UPDATE, DELETE ON alunos TO usuario_uni;

-- Inserções (mínimo 5 registros)
INSERT INTO cursos (nome_curso, departamento) VALUES
('Engenharia de Software', 'Ciências Exatas'),
('História', 'Ciências Humanas'),
('Medicina', 'Saúde');

INSERT INTO professores (nome, departamento) VALUES
('João Silva', 'Ciências Exatas'),
('Maria Oliveira', 'Ciências Humanas');

INSERT INTO alunos (nome, idade, curso_id) VALUES
('Bruno Batista', 31, 1),
('Lorena Reis', 26, 2);

-- Updates (2 registros)
UPDATE alunos SET idade = 32 WHERE nome = 'Bruno Batista';
UPDATE alunos SET curso_id = 1 WHERE nome = 'Lorena Reis';

-- Delete (1 registro)
DELETE FROM alunos WHERE nome = 'Lorena Reis';

-- Revogar permissões de alteração
REVOKE INSERT, UPDATE, DELETE ON alunos FROM usuario_uni;

-- Consultas finais
SELECT * FROM alunos;
SELECT * FROM professores;
SELECT * FROM cursos;