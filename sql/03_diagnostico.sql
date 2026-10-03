-- email repetido = mesma pessoa cadastrada 2x
SELECT TRIM(LOWER(email)) AS email_padronizado, COUNT(*) AS quantidade
FROM clientes_bruto
WHERE email IS NOT NULL AND email != ''
GROUP BY TRIM(LOWER(email))
HAVING COUNT(*) > 1;

SELECT *
FROM clientes_bruto
WHERE telefone IS NULL OR telefone = '' OR telefone = 'N/A'
   OR cidade = ''
   OR data_nascimento IS NULL OR data_nascimento = 'N/A';

SELECT DISTINCT estado FROM clientes_bruto;
