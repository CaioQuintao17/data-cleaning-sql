-- dados simulando uma migração de sistema real: duplicata, espaço, N/A, etc
INSERT INTO clientes_bruto (nome, email, telefone, cidade, estado, data_nascimento)
VALUES
('joão silva', 'joao@email.com', '(61) 99999-1111', 'Brasília', 'DF', '10/01/1990'),
('JOÃO SILVA', 'joao@email.com ', '61999991111', 'brasilia', 'df', '1990-01-10'),
('Maria Oliveira ', ' maria@email.com', '(62) 98888-2222', 'Goiânia', 'GO', '15/02/1988'),
('carlos   santos', 'CARLOS@EMAIL.COM', 'N/A', 'São Paulo', 'SP', '20-03-1995'),
('Ana Costa', 'ana@email.com', '(31) 97777-3333', '', 'MG', '05/04/1992'),
('Pedro Souza', '', '(41) 96666-4444', 'Curitiba', 'PR', 'N/A'),
('juliana alves', 'juliana@email.com', '(61)95555-5555', 'Brasília', 'DF', '1993/06/20'),
('Roberto  Lima', 'roberto@email.com', '(11) 94444-6666', 'São Paulo', 'sp', NULL),
('FERNANDA DIAS', 'fernanda@email.com  ', '(21) 93333-7777', 'Rio de Janeiro', 'RJ', '12/08/1991'),
('fernanda dias', 'fernanda@email.com', '21933337777', 'rio de janeiro', 'RJ', '12/08/1991');
