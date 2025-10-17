--criação de tabelas

CREATE TABLE professores (
    id_professor INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    departamento VARCHAR(50)
)

CREATE TABLE salas(
    id_sala INT PRIMARY KEY,
    numero_sala VARCHAR(3),
    capacidade INT,
    localizacao VARCHAR(50)
)

CREATE TABLE disciplinas(
    id_curso INT PRIMARY KEY,
    nome_curso VARCHAR(100),
    codigo VARCHAR(10),
    disciplina VARCHAR(50),
    periodo VARCHAR(50),
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
)

CREATE TABLE ensalamento(
    id_ensalamento INT PRIMARY KEY,
    id_curso INT,
    id_sala INT,
    id_professor INT,
    FOREIGN KEY (id_curso) REFERENCES disciplinas(id_curso),
    FOREIGN KEY (id_sala) REFERENCES salas(id_sala),
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor),
    data_hora DATE
)

CREATE TABLE alunos(
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    matricula VARCHAR(10),
    email VARCHAR(100),
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES disciplinas(id_curso)
)

--inserir os dados

INSERT INTO professores (id_professor, nome, email, departamento)
VALUES (6, 'Lucas', 'lucas@universassouras.br', 'PEI');


INSERT INTO disciplinas (id_curso, nome_curso, codigo, disciplina, periodo, id_professor)
VALUES (10, 'Engenharia de Software', 'ENG10', 'PEI IV', '4º Período', 6);


INSERT INTO salas (id_sala, numero_sala, capacidade, localizacao)
VALUES (9, '100', 50, 'Bloco 2 - Gravatá');


INSERT INTO ensalamento (id_ensalamento, id_curso, id_sala, id_professor, data_hora)
VALUES (1001, 10, 9, 6, '2024-07-01 18:50:00');


INSERT INTO alunos (id_aluno, nome, matricula, email, id_curso)
VALUES (2568, 'Bruno Batista', '202411344', '202411344@univassouras.com', 10);



-- consultar

SELECT*FROM professores;
SELECT*FROM salas;
SELECT*FROM ensalamento;
SELECT*FROM alunos;
SELECT*FROM disciplinas;


