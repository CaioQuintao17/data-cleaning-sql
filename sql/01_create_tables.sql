CREATE TABLE clientes_bruto (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150),
    email VARCHAR(150),
    telefone VARCHAR(30),
    cidade VARCHAR(100),
    estado VARCHAR(20),
    data_nascimento VARCHAR(20) -- veio como texto mesmo, bagunçado
);

ALTER TABLE clientes_bruto
ADD COLUMN data_nascimento_corrigida DATE;
