-- Criação do Banco de Dados
CREATE DATABASE oficina;
USE oficina;

-- Criação da tabela de Clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);

-- Criação da tabela de Veículos
CREATE TABLE veiculos (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano_fabricacao INT,
    placa VARCHAR(10),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Criação da tabela de Funcionários
CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10, 2),
    telefone VARCHAR(20)
);

-- Criação da tabela de Serviços
CREATE TABLE servicos (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    nome_servico VARCHAR(100),
    descricao TEXT,
    preco DECIMAL(10, 2)
);

-- Criação da tabela de Ordens de Serviço
CREATE TABLE ordens_servico (
    id_ordem_servico INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_veiculo INT,
    data_inicio DATE,
    data_fim DATE,
    status VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES veiculos(id_veiculo)
);

-- Tabela de Relacionamento entre Ordens de Serviço e Serviços
CREATE TABLE ordem_servico_servicos (
    id_ordem_servico INT,
    id_servico INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    PRIMARY KEY (id_ordem_servico, id_servico),
    FOREIGN KEY (id_ordem_servico) REFERENCES ordens_servico(id_ordem_servico),
    FOREIGN KEY (id_servico) REFERENCES servicos(id_servico)
);

-- Criação da tabela de Pagamentos
CREATE TABLE pagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_ordem_servico INT,
    data_pagamento DATE,
    valor_pago DECIMAL(10, 2),
    metodo_pagamento VARCHAR(50),
    FOREIGN KEY (id_ordem_servico) REFERENCES ordens_servico(id_ordem_servico)
);
