CREATE TABLE cliente (
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
sobrenome VARCHAR(100),
cpf VARCHAR(14),
telefone VARCHAR(20),
email VARCHAR(100),
rua VARCHAR(100),
numero VARCHAR(10),
cidade VARCHAR(100),
cep VARCHAR(10)
);


CREATE TABLE produto (
id_produto INT PRIMARY KEY AUTO_INCREMENT,
nome_produto VARCHAR(100),
descricao TEXT,
preco DECIMAL(10,2),
categoria VARCHAR(50),
marca VARCHAR(50),
codigo_barras VARCHAR(50),
data_validade DATE,
peso DECIMAL(10,2),
status VARCHAR(20)
);

CREATE TABLE fornecedor (
id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
cnpj VARCHAR(20),
telefone VARCHAR(20),
email VARCHAR(100),
rua VARCHAR(100),
cidade VARCHAR(100),
cep VARCHAR(10),
contato VARCHAR(100),
status VARCHAR(20)
);

CREATE TABLE venda (
id_venda INT PRIMARY KEY AUTO_INCREMENT,
data_venda DATE,
valor_total DECIMAL(10,2),
forma_pagamento VARCHAR(50),
desconto DECIMAL(10,2),
id_cliente INT,
status VARCHAR(20),
hora TIME,
observacao TEXT,
caixa VARCHAR(20),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE item_venda (
id_item INT PRIMARY KEY AUTO_INCREMENT,
id_venda INT,
id_produto INT,
quantidade INT,
preco_unitario DECIMAL(10,2),
subtotal DECIMAL(10,2),
desconto_item DECIMAL(10,2),
imposto DECIMAL(10,2),
status VARCHAR(20),
observacao TEXT,
FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE estoque (
id_estoque INT PRIMARY KEY AUTO_INCREMENT,
id_produto INT,
quantidade INT,
quantidade_minima INT,
localizacao VARCHAR(50),
data_entrada DATE,
data_saida DATE,
lote VARCHAR(50),
validade DATE,
status VARCHAR(20),
FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE pagamento (
id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
id_venda INT,
tipo VARCHAR(50),
valor DECIMAL(10,2),
data_pagamento DATE,
status VARCHAR(20),
parcelas INT,
bandeira VARCHAR(50),
autorizacao VARCHAR(50),
observacao TEXT,
FOREIGN KEY (id_venda) REFERENCES venda(id_venda)
);
