-- Criação da tabela de Máquinas
CREATE TABLE Maquinas (
    id_maquina INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    setor VARCHAR(50) NOT NULL,
    data_aquisicao DATE NOT NULL
);

-- Criação da tabela de Técnicos
CREATE TABLE Tecnicos (
    id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100)
);

-- Criação da tabela de Peças (Estoque)
CREATE TABLE Pecas (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    quantidade_disponivel INT NOT NULL DEFAULT 0,
    estoque_minimo INT NOT NULL DEFAULT 0
);

-- Criação da tabela de Ordens de Serviço (OS)
CREATE TABLE OrdensServico (
    id_os INT AUTO_INCREMENT PRIMARY KEY,
    id_maquina INT NOT NULL,
    id_tecnico_abertura INT NOT NULL,
    data_abertura DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_fechamento DATETIME NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Aberta',
    CONSTRAINT fk_os_maquina FOREIGN KEY (id_maquina) REFERENCES Maquinas(id_maquina),
    CONSTRAINT fk_os_tecnico_abertura FOREIGN KEY (id_tecnico_abertura) REFERENCES Tecnicos(id_tecnico),
    CONSTRAINT chk_status CHECK (status IN ('Aberta', 'Em andamento', 'Concluída'))
);

-- Tabela de relacionamento: Técnicos Responsáveis pela OS (N para N)
CREATE TABLE OrdensServico_Tecnicos (
    id_os INT NOT NULL,
    id_tecnico INT NOT NULL,
    PRIMARY KEY (id_os, id_tecnico),
    CONSTRAINT fk_ost_os FOREIGN KEY (id_os) REFERENCES OrdensServico(id_os) ON DELETE CASCADE,
    CONSTRAINT fk_ost_tecnico FOREIGN KEY (id_tecnico) REFERENCES Tecnicos(id_tecnico)
);

-- Tabela de relacionamento: Peças Utilizadas na OS (N para N com atributos)
CREATE TABLE OrdensServico_Pecas (
    id_os INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade_utilizada INT NOT NULL CHECK (quantidade_utilizada > 0),
    custo_momento DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_os, id_peca),
    CONSTRAINT fk_osp_os FOREIGN KEY (id_os) REFERENCES OrdensServico(id_os) ON DELETE CASCADE,
    CONSTRAINT fk_osp_peca FOREIGN KEY (id_peca) REFERENCES Pecas(id_peca)
);

-- Criação da tabela de Registros de Manutenção
CREATE TABLE RegistrosManutencao (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_os INT NOT NULL,
    descricao_servico TEXT NOT NULL,
    tempo_gasto_horas DECIMAL(5, 2) NOT NULL CHECK (tempo_gasto_horas > 0),
    CONSTRAINT fk_rm_os FOREIGN KEY (id_os) REFERENCES OrdensServico(id_os) ON DELETE CASCADE
);