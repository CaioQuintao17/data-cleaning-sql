CREATE TABLE clientes_limpo AS
SELECT
    id_registro, nome, TRIM(LOWER(email)) AS email,
    telefone, cidade, estado,
    data_nascimento_corrigida AS data_nascimento
FROM clientes_bruto;
