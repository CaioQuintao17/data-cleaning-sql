UPDATE clientes_bruto
SET nome = TRIM(nome), cidade = TRIM(cidade),
    estado = UPPER(TRIM(estado)), email = TRIM(email);

-- alguns nomes vieram com espaço duplo no meio, tipo "carlos   santos"
UPDATE clientes_bruto
SET nome = TRIM(REPLACE(REPLACE(nome, '  ', ' '), '  ', ' '))
WHERE nome LIKE '%  %';

UPDATE clientes_bruto SET telefone = NULL WHERE telefone = 'N/A' OR telefone = '';
UPDATE clientes_bruto SET data_nascimento = NULL WHERE data_nascimento = 'N/A';
UPDATE clientes_bruto SET cidade = NULL WHERE cidade = '';

-- 4 formatos de data diferentes na base original
UPDATE clientes_bruto
SET data_nascimento_corrigida = 
    CASE
        WHEN data_nascimento LIKE '__/__/____' THEN STR_TO_DATE(data_nascimento, '%d/%m/%Y')
        WHEN data_nascimento LIKE '____-__-__' THEN STR_TO_DATE(data_nascimento, '%Y-%m-%d')
        WHEN data_nascimento LIKE '__-__-____' THEN STR_TO_DATE(data_nascimento, '%d-%m-%Y')
        WHEN data_nascimento LIKE '____/__/__' THEN STR_TO_DATE(data_nascimento, '%Y/%m/%d')
        ELSE NULL
    END
WHERE data_nascimento IS NOT NULL;

-- mantém o registro mais completo (telefone formatado, cidade com capitalização certa)
DELETE FROM clientes_bruto WHERE id_registro IN (12, 20);
