-- Aluno: Gabriel Marfim; 2322672

-- 1. Cadastro de campanhas com metas de arrecadação e descrição
USE doacoes;
SELECT 
    id_campanha,
    nome,
    meta,
    descricao
FROM 
    campanha;


-- 2. Registro de doadores com histórico de doações e recibos emitidos
USE doacoes;
SELECT 
    doador.id_doador,
    doador.nome AS nome_doador,
    doador.contato,
    doador.historico,
    doacao.id_doacao,
    doacao.valor,
    doacao.tipo,
    doacao.data
FROM 
    doador
LEFT JOIN 
    doacao ON doador.id_doador = doacao.id_doador
ORDER BY 
    doador.nome, doacao.data;


-- 3. Controle de doações por valor e tipo
USE doacoes;
SELECT 
    doacao.id_doacao,
    doacao.valor,
    doacao.tipo,
    doacao.data,
    campanha.nome AS nome_campanha
FROM 
    doacao
INNER JOIN 
    campanha ON doacao.id_campanha = campanha.id_campanha
ORDER BY 
    doacao.data, doacao.tipo;


-- 4. Cadastro de voluntários com disponibilidade e funções em cada campanha
USE doacoes;
SELECT 
    voluntario.id_voluntario,
    voluntario.nome AS nome_voluntario,
    CASE 
        WHEN voluntario.disponibilidade = 1 THEN 'Disponível'
        ELSE 'Indisponível'
    END AS disponibilidade,
    funcao.funcao,
    campanha.nome AS nome_campanha
FROM 
    voluntario
INNER JOIN 
    funcao ON voluntario.id_funcao = funcao.id_funcao
INNER JOIN 
    campanha ON voluntario.id_campanha = campanha.id_campanha
ORDER BY 
    campanha.nome, voluntario.nome;



-- 5. Relatórios de arrecadação por campanha

-- 5.1. Relatório de arrecadação por campanha
USE doacoes;
SELECT 
    campanha.id_campanha,
    campanha.nome AS nome_campanha,
    campanha.meta,
    IFNULL(SUM(doacao.valor), 0) AS total_arrecadado,
    (campanha.meta - IFNULL(SUM(doacao.valor), 0)) AS valor_restante
FROM 
    campanha
LEFT JOIN 
    doacao ON campanha.id_campanha = doacao.id_campanha
GROUP BY 
    campanha.id_campanha, campanha.nome, campanha.meta
ORDER BY 
    campanha.nome;

-- 5.2. Lista dos maiores doadores
USE doacoes;
SELECT 
    doador.id_doador,
    doador.nome AS nome_doador,
    IFNULL(SUM(doacao.valor), 0) AS total_doado
FROM 
    doador
LEFT JOIN 
    doacao ON doador.id_doador = doacao.id_doador
GROUP BY 
    doador.id_doador, doador.nome
ORDER BY 
    total_doado DESC
LIMIT 3;


