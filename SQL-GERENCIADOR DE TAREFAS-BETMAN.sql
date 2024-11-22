-- Criação do banco de dados
CREATE DATABASE gerenciador_tarefas;
USE gerenciador_tarefas;

-- Tabela de usuários
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de tarefas
CREATE TABLE tarefas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    descricao TEXT NOT NULL,
    setor VARCHAR(50) NOT NULL,
    prioridade ENUM('Alta', 'Média', 'Baixa') NOT NULL,
    status ENUM('A fazer', 'Fazendo', 'Pronto') DEFAULT 'A fazer',
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Inserir usuários
INSERT INTO usuarios (nome, email) VALUES
('marcela', 'marcelinha@gmail.com'),
('lindom', 'lindom@gmail.com');

-- Inserir tarefas
INSERT INTO tarefas (usuario_id, descricao, setor, prioridade, status) VALUES
(1, 'Finalizar o relatório anual', 'Financeiro', 'Alta', 'A fazer'),
(2, 'Revisar a política de segurança', 'RH', 'Média', 'Fazendo'),
(1, 'Organizar arquivos antigos', 'Administração', 'Baixa', 'Pronto');


-- Tarefas "A fazer"
SELECT * FROM tarefas WHERE status = 'A fazer';

-- Tarefas "Fazendo"
SELECT * FROM tarefas WHERE status = 'Fazendo';

-- Tarefas "Pronto"
SELECT * FROM tarefas WHERE status = 'Pronto';


UPDATE tarefas
SET descricao = 'Revisar orçamento para o próximo ano', 
    setor = 'Financeiro', 
    prioridade = 'Alta'
WHERE id = 1;

UPDATE tarefas
SET status = 'Pronto'
WHERE id = 2;

DELETE FROM tarefas
WHERE id = 3;

SELECT 
    t.id AS tarefa_id,
    u.nome AS usuario,
    t.descricao,
    t.setor,
    t.prioridade,
    t.status,
    t.data_criacao
FROM 
    tarefas t
JOIN 
    usuarios u ON t.usuario_id = u.id
ORDER BY 
    t.status, t.prioridade, t.data_criacao;


