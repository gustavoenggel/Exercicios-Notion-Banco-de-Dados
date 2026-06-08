
CREATE DATABASE sistema_rh;
USE sistema_rh;


CREATE TABLE cargos (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);


CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);


CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    data_admissao DATE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    id_cargo INT NOT NULL,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo),
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);


CREATE TABLE historico_movimentacoes (
    id_movimentacao INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    id_cargo INT NOT NULL,
    id_departamento INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NULL, 
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario) ON DELETE CASCADE,
    FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo),
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);