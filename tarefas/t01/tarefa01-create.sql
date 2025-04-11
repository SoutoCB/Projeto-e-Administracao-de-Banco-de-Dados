SET FOREIGN_KEY_CHECKS=0; -- Desabilitar Foreign Keys

DROP TABLE IF EXISTS atividade_projeto;
DROP TABLE IF EXISTS atividade CASCADE;
DROP TABLE IF EXISTS projeto CASCADE;
DROP TABLE IF EXISTS departamento CASCADE;
DROP TABLE IF EXISTS funcionario CASCADE;

SET FOREIGN_KEY_CHECKS=1; -- Habilitando Foreign Keys

-- Criação das Tabelas no PostgreSQL

CREATE TABLE funcionario (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    sexo CHAR(1),
    dtNasc DATE,
    salario NUMERIC(10,2),
    codSupervisor INT,
    codDepto INT,
    FOREIGN KEY (codSupervisor) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE departamento (
    codigo SERIAL PRIMARY KEY,
    sigla VARCHAR(10) UNIQUE,
    descricao VARCHAR(50),
    codGerente INT,
    FOREIGN KEY (codGerente) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE projeto (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE,
    descricao VARCHAR(250),
    codResponsavel INT,
    codDepto INT,
    dataInicio DATE,
    dataFim DATE,
    FOREIGN KEY (codResponsavel) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (codDepto) REFERENCES departamento(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE atividade (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(250),
    codProjeto INT,
    dataInicio DATE,
    dataFim DATE,
    FOREIGN KEY (codProjeto) REFERENCES projeto(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabela associativa entre atividade e projeto
CREATE TABLE atividade_projeto (
    cod_projeto INT,
    cod_atividade INT,
    PRIMARY KEY (cod_projeto, cod_atividade),
    FOREIGN KEY (cod_projeto) REFERENCES projeto(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (cod_atividade) REFERENCES atividade(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Adicionando a foreign key do departamento após a criação de "funcionario"
ALTER TABLE funcionario 
ADD CONSTRAINT funcDeptoFK FOREIGN KEY (codDepto) REFERENCES departamento(codigo) ON DELETE SET NULL ON UPDATE CASCADE;
