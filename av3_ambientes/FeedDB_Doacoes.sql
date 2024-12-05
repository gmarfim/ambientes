-- Inserindo Campanhas

INSERT INTO campanha (nome, meta, descricao) VALUES
('Campanha do Inverno', 5000.00, 'Arrecadação de agasalhos.'),
('Campanha Natal Solidário', 10000.00, 'Doações para ceias de Natal.'),
('Campanha Escolar', 3000.00, 'Compra de materiais escolares.');


-- Inserindo Doadores

INSERT INTO doador (nome, contato, historico) VALUES
('João Silva', 'joao@gmail.com', 'Doações recorrentes.'),
('Maria Oliveira', 'maria@gmail.com', 'Participa de campanhas anuais.'),
('Carlos Santos', 'carlos@gmail.com', 'Doações de mantimentos e roupas.');

-- Inserindo Tipos

INSERT INTO tipo (nome) VALUES
('Dinheiro'),
('Mantimentos'),
('Roupas'),
('Outros');

-- Inserindo Funcoes

INSERT INTO funcao (funcao) VALUES
('Organização'),
('Distribuição'),
('Logística'),
('Triagem de Itens'),
('Coleta de Doações');

-- Inserindo Doações

INSERT INTO doacao (valor, id_tipo, data, id_campanha, id_doador) VALUES
(200.00, '1', '2024-11-15', 1, 1),
(0.00, '2', '2024-11-16', 2, 2),
(0.00, '3', '2024-11-17', 1, 3),
(500.00, '1', '2024-11-18', 3, 1),
(100.00, '3', '2024-11-19', 2, 2);


-- Inserindo Voluntários

INSERT INTO voluntario (nome, disponibilidade, funcao, id_campanha) VALUES
('Ana Paula', 1, 'Organização', 1),
('Pedro Henrique', 1, 'Distribuição', 2),
('Lucas Almeida', 0, 'Logística', 3),
('Clara Souza', 1, 'Coleta de Doações', 1),
('Tiago Silva', 0, 'Triagem de Itens', 2);

SELECT * FROM campanha;
SELECT * FROM doador;
SELECT * FROM tipo;
SELECT * FROM doacao;
SELECT * FROM voluntario;
SELECT * FROM funcao;

