CREATE DATABASE IF NOT EXISTS farmacia_db
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE farmacia_db;

-- ─────────────────────────────────────────
-- 1. CLIENTE
-- ─────────────────────────────────────────
CREATE TABLE CLIENTE (
  id_cliente    INT           NOT NULL AUTO_INCREMENT,
  cpf_cliente   VARCHAR(11)   NOT NULL,
  nome_cliente  VARCHAR(100)  NOT NULL,

  PRIMARY KEY (id_cliente),
  UNIQUE KEY uq_cpf (cpf_cliente)
);

-- ─────────────────────────────────────────
-- 2. REMEDIO
-- ─────────────────────────────────────────
CREATE TABLE REMEDIO (
  id_remedio       INT            NOT NULL AUTO_INCREMENT,
  nome_remedio     VARCHAR(100)   NOT NULL,
  bula_remedio     TEXT,
  valor_remedio    DECIMAL(10,2)  NOT NULL,   -- preço de venda ao cliente
  estoque_remedio  INT            NOT NULL DEFAULT 0,

  PRIMARY KEY (id_remedio),
  CONSTRAINT chk_valor   CHECK (valor_remedio   >= 0),
  CONSTRAINT chk_estoque CHECK (estoque_remedio >= 0)
);

-- ─────────────────────────────────────────
-- 3. FORNECEDOR
-- ─────────────────────────────────────────
CREATE TABLE FORNECEDOR (
  id_fornecedor    INT          NOT NULL AUTO_INCREMENT,
  cnpj_fornecedor  VARCHAR(18)  NOT NULL,
  nome_fornecedor  VARCHAR(100) NOT NULL,

  PRIMARY KEY (id_fornecedor),
  UNIQUE KEY uq_cnpj (cnpj_fornecedor)
);

-- ─────────────────────────────────────────
-- 4. FORNECIMENTO  (Fornecedor ↔ Remédio)
--    Cada fornecedor tem seu próprio preço
--    por remédio fornecido.
-- ─────────────────────────────────────────
CREATE TABLE FORNECIMENTO (
  id_fornecedor   INT           NOT NULL,
  id_remedio      INT           NOT NULL,
  preco_custo     DECIMAL(10,2) NOT NULL,   -- preço cobrado pelo fornecedor

  PRIMARY KEY (id_fornecedor, id_remedio),

  CONSTRAINT fk_fornecimento_fornecedor
    FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR (id_fornecedor)
    ON DELETE CASCADE ON UPDATE CASCADE,

  CONSTRAINT fk_fornecimento_remedio
    FOREIGN KEY (id_remedio) REFERENCES REMEDIO (id_remedio)
    ON DELETE CASCADE ON UPDATE CASCADE,

  CONSTRAINT chk_preco_custo CHECK (preco_custo >= 0)
);

-- ─────────────────────────────────────────
-- 5. VENDA
-- ─────────────────────────────────────────
CREATE TABLE VENDA (
  id_venda       INT            NOT NULL AUTO_INCREMENT,
  id_cliente     INT            NOT NULL,
  data_venda     DATE           NOT NULL,
  valor_total    DECIMAL(10,2)  NOT NULL DEFAULT 0.00,

  PRIMARY KEY (id_venda),

  CONSTRAINT fk_venda_cliente
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ─────────────────────────────────────────
-- 6. ITEM_VENDA  (Venda ↔ Remédio)
--    Registra cada remédio de uma venda
--    e se exigiu receita.
-- ─────────────────────────────────────────
CREATE TABLE ITEM_VENDA (
  id_item_venda   INT            NOT NULL AUTO_INCREMENT,
  id_venda        INT            NOT NULL,
  id_remedio      INT            NOT NULL,
  quantidade      INT            NOT NULL DEFAULT 1,
  preco_unitario  DECIMAL(10,2)  NOT NULL,   -- preço no momento da venda
  receita         TINYINT(1)     NOT NULL DEFAULT 0,  -- 0 = não, 1 = sim

  PRIMARY KEY (id_item_venda),

  CONSTRAINT fk_item_venda
    FOREIGN KEY (id_venda) REFERENCES VENDA (id_venda)
    ON DELETE CASCADE ON UPDATE CASCADE,

  CONSTRAINT fk_item_remedio
    FOREIGN KEY (id_remedio) REFERENCES REMEDIO (id_remedio)
    ON DELETE RESTRICT ON UPDATE CASCADE,

  CONSTRAINT chk_quantidade      CHECK (quantidade     > 0),
  CONSTRAINT chk_preco_unitario  CHECK (preco_unitario >= 0)
);