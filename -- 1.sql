-- 1. Criação do Banco de Dados
CREATE DATABASE RpgOnlineDB;

-- 2. Seleção do Banco de Dados
USE RpgOnlineDB;

-- =====================================================================
-- 3. CRIAÇÃO DAS TABELAS INDEPENDENTES
-- =====================================================================

-- Tabela USUARIOS
CREATE TABLE Usuarios (
    UsuarioId INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Senha VARCHAR(150) NOT NULL
);

-- Tabela CLASSES
CREATE TABLE Classes (
    ClasseId INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(120) NOT NULL UNIQUE,
    Descricao TEXT
);

-- Tabela HABILIDADES
CREATE TABLE Habilidades (
    HabilidadeId INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(120) NOT NULL UNIQUE
);

-- =====================================================================
-- 4. CRIAÇÃO DAS TABELAS DEPENDENTES (Com Chaves Estrangeiras)
-- =====================================================================

-- Tabela PERSONAGENS
CREATE TABLE Personagens (
    PersonagemId INT AUTO_INCREMENT PRIMARY KEY,
    NomePersonagem VARCHAR(120) NOT NULL UNIQUE,
    UsuarioId INT,
    ClasseId INT,
    FOREIGN KEY (UsuarioId) REFERENCES Usuarios(UsuarioId),
    FOREIGN KEY (ClasseId) REFERENCES Classes(ClasseId)
);

-- Tabela CLASSES_HABILIDADES
CREATE TABLE Classes_Habilidades (
    ClasseId INT,
    HabilidadeId INT,
    PRIMARY KEY (ClasseId, HabilidadeId),
    FOREIGN KEY (ClasseId) REFERENCES Classes(ClasseId),
    FOREIGN KEY (HabilidadeId) REFERENCES Habilidades(HabilidadeId)
);