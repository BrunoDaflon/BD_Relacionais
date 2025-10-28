-- Cria o usuário
CREATE USER bruno_batista WITH PASSWORD '123senha';
CREATE USER lorena_reis WITH PASSWORD '123senha';

-- Dar permissão de conexão ao banco de dados
GRANT CONNECT ON DATABASE aula10 TO bruno_batista;

-- Permitir uso do schema "public"
GRANT USAGE ON SCHEMA public TO bruno_batista;

-- Permissão de leitura no schema "new"
GRANT USAGE ON SCHEMA new_table TO bruno_batista;

-- Permissão de leitura em todas as tabelas do schema "new"
GRANT SELECT ON ALL TABLES IN SCHEMA new_table TO bruno_batista;

-- Definindo permissão de inserção na tabela bruno_batista
-- no schema new_table
GRANT SELECT ON TABLE new_table.bruno_batista TO bruno_batista;

-- Se quiser liberar apenas uma tabela específica, por exemplo new.tabela_exemplo:
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE new_table.bruno_batista TO bruno_batista;

-- Revogando o select
REVOKE SELECT ON TABLE new_table.bruno_batista FROM bruno_batista;

-- Tirar poderes de superusuário (caso tenha)
ALTER USER bruno_batista WITH NOSUPERUSER;

-- Ajustando o schema padrão do usuário para new_table
ALTER USER bruno_batista SET search_path = new_table, public;

SELECT * FROM new_table.bruno_batista;
