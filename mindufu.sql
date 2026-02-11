DROP DATABASE IF EXISTS mind_ufu;
CREATE DATABASE mind_ufu CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE mind_ufu;

CREATE TABLE disciplinas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE pastas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    disciplina_id INT,
    nome VARCHAR(100) NOT NULL,
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id) ON DELETE CASCADE
);

CREATE TABLE paginas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pasta_id INT,
    titulo VARCHAR(255) DEFAULT 'Nova Página',
    conteudo TEXT,
    FOREIGN KEY (pasta_id) REFERENCES pastas(id) ON DELETE CASCADE
);

INSERT INTO disciplinas (nome) VALUES ('Cálculo I');
INSERT INTO pastas (disciplina_id, nome) VALUES (1, 'Unidade 1');
INSERT INTO paginas (pasta_id, titulo, conteudo) VALUES (1, 'Limites Intuitivos', 'Conteúdo da aula...');

SELECT * FROM disciplinas;
SELECT * FROM pastas;
SELECT * FROM paginas;

CREATE TABLE comunidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(10) NOT NULL UNIQUE, 
    cor VARCHAR(7) DEFAULT '#0d6efd',
    icone VARCHAR(20) DEFAULT 'bi-people-fill',
    criador_id INT DEFAULT 1 
);

CREATE TABLE membros_comunidade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comunidade_id INT,
    usuario_id INT DEFAULT 1,
    data_entrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (comunidade_id) REFERENCES comunidades(id) ON DELETE CASCADE
);

USE mind_ufu;

CREATE TABLE questionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comunidade_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (comunidade_id) REFERENCES comunidades(id) ON DELETE CASCADE
);

INSERT INTO questionarios (comunidade_id, titulo, descricao) 
VALUES (1, 'Prova 1: Derivadas', 'Resolva as questões sobre regras de derivação.');

CREATE TABLE IF NOT EXISTS perguntas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    questionario_id INT NOT NULL,
    enunciado TEXT NOT NULL,
    pontos INT DEFAULT 1,
    FOREIGN KEY (questionario_id) REFERENCES questionarios(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS alternativas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pergunta_id INT NOT NULL,
    texto VARCHAR(255) NOT NULL,
    e_correta BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (pergunta_id) REFERENCES perguntas(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

INSERT INTO usuarios (id, nome, email) VALUES (1, 'Prof. Silva', 'silva@ufu.br') 
ON DUPLICATE KEY UPDATE nome='Prof. Silva';


ALTER TABLE questionarios ADD COLUMN criador_id INT DEFAULT 1;
ALTER TABLE questionarios ADD COLUMN publicado BOOLEAN DEFAULT FALSE; 

ALTER TABLE questionarios ADD FOREIGN KEY (criador_id) REFERENCES usuarios(id);

CREATE TABLE IF NOT EXISTS quizzes_salvos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    questionario_id INT NOT NULL,
    data_salvo DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (questionario_id) REFERENCES questionarios(id) ON DELETE CASCADE,
    UNIQUE(usuario_id, questionario_id) 
);