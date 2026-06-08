- - =========================
- - PETFELIZ - NORMALIZADO
- - =========================

CREATE DATABASE clinica_veterinaria;

USE clinica_veterinaria;

- - =========================
- - CLIENTE (TUTOR)
- - =========================

CREATE TABLE cliente (

id_cliente INT AUTO_INCREMENT PRIMARY KEY,

cpf VARCHAR(14) NOT NULL UNIQUE,

nome VARCHAR(100) NOT NULL,

telefone VARCHAR(20),

email VARCHAR(100) UNIQUE,

status ENUM('ativo','inativo') DEFAULT 'ativo'

);

- - =========================
- - ESPÉCIE
- - =========================

CREATE TABLE especie (

id_especie INT AUTO_INCREMENT PRIMARY KEY,

descricao VARCHAR(50) NOT NULL UNIQUE

);

- - =========================
- - RAÇA
- - =========================

CREATE TABLE raca (

id_raca INT AUTO_INCREMENT PRIMARY KEY,

descricao VARCHAR(100) NOT NULL,

id_especie INT NOT NULL,

UNIQUE (descricao, id_especie),

FOREIGN KEY (id_especie) REFERENCES especie(id_especie)

);

- - =========================
- - ANIMAL (PACIENTE)
- - =========================

CREATE TABLE animal (

id_animal INT AUTO_INCREMENT PRIMARY KEY,

nome VARCHAR(100) NOT NULL,

data_nascimento DATE,

sexo ENUM('M','F'),

observacoes TEXT,

id_raca INT NOT NULL,

id_cliente INT NOT NULL,

status ENUM('ativo','falecido') DEFAULT 'ativo',

FOREIGN KEY (id_raca) REFERENCES raca(id_raca),

FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)

);

- - =========================
- - VETERINÁRIO
- - =========================

CREATE TABLE veterinario (

id_vet INT AUTO_INCREMENT PRIMARY KEY,

nome VARCHAR(100) NOT NULL,

cfmv VARCHAR(20) NOT NULL UNIQUE,

telefone VARCHAR(20),

email VARCHAR(100)

);

- - =========================
- - ESPECIALIDADE
- - =========================

CREATE TABLE especialidade (

id_espec INT AUTO_INCREMENT PRIMARY KEY,

descricao VARCHAR(100) NOT NULL UNIQUE

);

- - =========================
- - RELAÇÃO VET x ESPECIALIDADE
- - =========================

CREATE TABLE especialidade_vet (

id_vet INT,

id_espec INT,

PRIMARY KEY (id_vet, id_espec),

FOREIGN KEY (id_vet) REFERENCES veterinario(id_vet),

FOREIGN KEY (id_espec) REFERENCES especialidade(id_espec)

);

- - =========================
- - CONSULTA (PRONTUÁRIO)
- - =========================

CREATE TABLE consulta (

id_consulta INT AUTO_INCREMENT PRIMARY KEY,

data_consulta DATETIME DEFAULT CURRENT_TIMESTAMP,

anotacoes TEXT,

id_animal INT NOT NULL,

id_vet INT NOT NULL,

status ENUM('agendada','realizada','cancelada') DEFAULT 'agendada',

FOREIGN KEY (id_animal) REFERENCES animal(id_animal),

FOREIGN KEY (id_vet) REFERENCES veterinario(id_vet)

);

- - =========================
- - EXAME
- - =========================

CREATE TABLE exame (

id_exame INT AUTO_INCREMENT PRIMARY KEY,

descricao VARCHAR(100) NOT NULL UNIQUE,

valor DECIMAL(10,2) NOT NULL CHECK (valor >= 0)

);

- - =========================
- - MEDICAÇÃO
- - =========================

CREATE TABLE medicacao (

id_medicacao INT AUTO_INCREMENT PRIMARY KEY,

descricao VARCHAR(100) NOT NULL UNIQUE,

valor DECIMAL(10,2) NOT NULL CHECK (valor >= 0)

);

- - =========================
- - EXAMES REALIZADOS
- - =========================

CREATE TABLE exame_realizado (

id_consulta INT,

id_exame INT,

quantidade INT NOT NULL CHECK (quantidade > 0),

valor_unitario DECIMAL(10,2) NOT NULL,

PRIMARY KEY (id_consulta, id_exame),

FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta),

FOREIGN KEY (id_exame) REFERENCES exame(id_exame)

);

- - =========================
- - MEDICAÇÕES FORNECIDAS
- - =========================

CREATE TABLE medicacao_fornecida (

id_consulta INT,

id_medicacao INT,

quantidade INT NOT NULL CHECK (quantidade > 0),

valor_unitario DECIMAL(10,2) NOT NULL,

PRIMARY KEY (id_consulta, id_medicacao),

FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta),

FOREIGN KEY (id_medicacao) REFERENCES medicacao(id_medicacao)

);