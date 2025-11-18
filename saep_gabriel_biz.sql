-- ================================================
-- SCRIPT DE CRIAÇÃO DO BANCO DE DADOS: saep_db
-- Sistema: Controle de Estoque Vault-Tech
-- Tecnologias: PHP, MySQL, HTML, CSS
-- ================================================

-- Remove o banco existente (para recriar do zero)
DROP DATABASE IF EXISTS saep_db;

-- Cria o banco
CREATE DATABASE saep_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE saep_db;

-- ================================================
-- TABELA DE USUÁRIOS
-- ================================================
CREATE TABLE usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  senha VARCHAR(255) NOT NULL
);

-- Usuários iniciais
INSERT INTO usuarios (nome, email, senha) VALUES
('Administrador', 'admin@serjao.com', MD5('12345')),
('Jalam', 'jalam@serjao.com', MD5('12345')),
('Maria Souza', 'maria@serjao.com', MD5('12345')),
('Aluno', 'aluno@serjao.com', MD5('123')),
('Sergio Luiz', 'sergio@serjao.com', MD5('123'));

-- ================================================
-- TABELA DE PRODUTOS
-- ================================================
CREATE TABLE produtos (
  id_produto INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  cor VARCHAR (10) NOT NULL,
  codigo VARCHAR(50) NOT NULL,
  fabricante VARCHAR(20) NOT NULL,
  preco DECIMAL NOT NULL,
  processador VARCHAR(50) NULL,
  ram VARCHAR (10) NULL,
  armazenamento VARCHAR(50) NULL,
  tamanho_tela VARCHAR(50) NULL,
  resolucao VARCHAR(50) NULL,
  sistema_ope VARCHAR(50) NULL,
  quantidade_minima INT DEFAULT 0,
  quantidade_atual INT DEFAULT 0
);

-- Produtos iniciais
INSERT INTO produtos (nome, descricao, cor, codigo, fabricante, preco, processador, ram, armazenamento, tamanho_tela, resolucao, sistema_ope, quantidade_minima, quantidade_atual) VALUES
('Headset Gamer G733', 'Tecnologia sem fio LIGHTSPEED de 2,4 GHz com alcance de até 20 metros, conexão estável e baixa latência', 'Preta', '981-000863', 'Logitech', 899.99, '', '', '', '', '', '', 5, 15),
('Smartphone ', 'O smartphone Asus Rog Phone 6 Pro na cor branca é a versão evoluída do Rog Phone 6, com ainda mais recursos e desempenho para os jogadores mais exigentes.', 'Branca', '981-670863', 'Asus', 7919, 'Qualcomm Snapdragon 8+ Gen 1', '18GB', '512GB', '6,78', '1080x2448', 'Android', 5, 4),
('Monitor Gamer 34', 'Prepare-se para a verdadeira imersão com o Monitor Gamer LED Curvo HQ 34.', 'Preta', '981-004563', 'HQ Premium', 1319, '', '', '', '34', 'UltraWide (QHD) - 3440x1440', '', 5, 9);

-- ================================================
-- TABELA DE MOVIMENTAÇÕES
-- ================================================
CREATE TABLE movimentacoes (
  id_movimentacao INT AUTO_INCREMENT PRIMARY KEY,
  id_produto INT NOT NULL,
  tipo ENUM('entrada', 'saida') NOT NULL,
  quantidade INT NOT NULL,
  data_movimentacao DATE NOT NULL,
  id_usuario INT NOT NULL,
  FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Movimentações iniciais
INSERT INTO movimentacoes (id_produto, tipo, quantidade, data_movimentacao, id_usuario) VALUES
(1, 'entrada', 10, '2025-09-01', 1),
(1, 'saida', 5, '2025-09-05', 2),
(2, 'entrada', 3, '2025-09-03', 3),
(2, 'saida', 1, '2025-09-06', 2),
(3, 'entrada', 4, '2025-09-04', 1),
(3, 'saida', 2, '2025-09-07', 3);