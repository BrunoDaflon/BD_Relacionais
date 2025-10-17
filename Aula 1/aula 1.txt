-- Criando uma tabela
CREATE TABLE aluno (
	id SERIAL,
	nome VARCHAR(20),
	cod_curso CHAR(2)
);

-- Inserção de informação em Tabela de Aluno
INSERT INTO aluno(nome, cod_curso) VALUES
	('Zé da Manga', 'CC'),
	('Zé das Couves', 'CE');

-- Consulta a tabela aluno
SELECT * FROM aluno;

-- Tabela curso
-- colunas: id, cod_curso,
-- curso, carga_horária
CREATE TABLE curso (
	id SERIAL,
	curso VARCHAR(20),
	cod_curso CHAR(2),
	carga_horaria INT
);

-- Inserção de informação em tabela curso
INSERT INTO curso(curso, cod_curso, carga_horaria) VALUES
	('Ciências Contábeis','CC',120),
	('Ciências da Eng','CE',120);
-- Consulta a tabela curso
SELECT * FROM curso,aluno;
