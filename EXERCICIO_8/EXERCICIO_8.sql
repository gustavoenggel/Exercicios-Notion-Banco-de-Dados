-- 1. Todos os clientes
SELECT * FROM cliente;

-- 2. Nome e telefone dos clientes
SELECT nome_cliente, telefone_cliente FROM cliente;

-- 3. Todos os produtos
SELECT * FROM produto;

-- 4. Nome e preço dos produtos
SELECT nome_produto, preco_produto FROM produto;

-- 5. Todos os fornecedores
SELECT * FROM FORNECEDOR;

-- 6. Nome e status dos fornecedores (sem cargo; adaptado para FORNECEDOR)
SELECT NOME_FORNECEDOR, STATUS_FORNECEDOR FROM FORNECEDOR;

-- 7. Todas as vendas
SELECT * FROM VENDA;

-- 8. Data e total das vendas
SELECT DATA_HORA_VENDA, VALOR_TOTAL FROM VENDA;

-- 9. Descrição e preço dos produtos
SELECT descricao_produto, preco_produto FROM produto;

-- 10. Todos os estoques
SELECT * FROM ESTOQUE;

-- 11. Nome do produto e quantidade em estoque
SELECT p.nome_produto, e.QUANTIDADE_ESTOQUE
FROM produto p
JOIN ESTOQUE e ON p.id_produto = e.id_produto;

-- 1. Clientes de São Paulo (sem pontos; adaptado por cidade)
SELECT * FROM cliente WHERE cidade_cliente = 'São Paulo';

-- 2. Produtos com preço maior que 50
SELECT * FROM produto WHERE preco_produto > 50;

-- 3. Fornecedores ativos (sem salário; adaptado por status)
SELECT * FROM FORNECEDOR WHERE STATUS_FORNECEDOR = 'ATIVO';

-- 4. Produtos com estoque menor que 10
SELECT p.nome_produto, e.QUANTIDADE_ESTOQUE
FROM produto p
JOIN ESTOQUE e ON p.id_produto = e.id_produto
WHERE e.QUANTIDADE_ESTOQUE < 10;

-- 5. Vendas realizadas em uma data específica
SELECT * FROM VENDA WHERE DATE(DATA_HORA_VENDA) = '2025-01-10';

-- 6. Clientes que possuem telefone cadastrado
SELECT * FROM cliente WHERE telefone_cliente IS NOT NULL;

-- 7. Produtos da categoria 'Bebidas' (equivalente ao cargo "Caixa"; adapte a categoria)
SELECT * FROM produto WHERE categoria_produto = 'Bebidas';

-- 8. Itens de venda de uma venda específica (ID 1)
SELECT * FROM ITEM_VENDA WHERE ID_VENDA = 1;

-- 9. Vendas com total acima de 500
SELECT * FROM VENDA WHERE VALOR_TOTAL > 500;

-- 10. Fornecedor com nome específico
SELECT * FROM FORNECEDOR WHERE NOME_FORNECEDOR = 'Distribuidora Alfa';


-- 1. Produtos em ordem alfabética
SELECT * FROM produto ORDER BY nome_produto ASC;

-- 2. Produtos do mais caro para o mais barato
SELECT * FROM produto ORDER BY preco_produto DESC;

-- 3. Clientes por cidade (adaptado; sem pontos de fidelidade)
SELECT * FROM cliente ORDER BY cidade_cliente ASC;

-- 4. Fornecedores por nome (adaptado; sem salário)
SELECT * FROM FORNECEDOR ORDER BY NOME_FORNECEDOR ASC;

-- 5. Vendas da mais recente para a mais antiga
SELECT * FROM VENDA ORDER BY DATA_HORA_VENDA DESC;

-- 6. Pagamentos do maior valor para o menor
SELECT * FROM PAGAMENTO ORDER BY VALOR_PAGAMENTO DESC;

-- 7. Estoque da menor para maior quantidade
SELECT * FROM ESTOQUE ORDER BY QUANTIDADE_ESTOQUE ASC;

-- 8. Fornecedores em ordem alfabética
SELECT * FROM FORNECEDOR ORDER BY NOME_FORNECEDOR ASC;

-- 9. Estoque ordenado por localização
SELECT * FROM ESTOQUE ORDER BY LOCALIZACAO_ESTOQUE ASC;

-- 10. Fornecedores por status e nome
SELECT * FROM FORNECEDOR ORDER BY STATUS_FORNECEDOR, NOME_FORNECEDOR;

-- 11. Produtos ordenados por categoria e preço (maior para menor)
SELECT * FROM produto ORDER BY categoria_produto ASC, preco_produto DESC;

-- 1. Quantidade de produtos por categoria
SELECT categoria_produto, COUNT(*) AS qtd_produtos
FROM produto
GROUP BY categoria_produto;

-- 2. Total de vendas por forma de pagamento
SELECT FORMA_PAGAMENTO, SUM(VALOR_TOTAL) AS total_vendas
FROM VENDA
GROUP BY FORMA_PAGAMENTO;

-- 3. Quantidade de itens por venda
SELECT ID_VENDA, COUNT(*) AS qtd_itens
FROM ITEM_VENDA
GROUP BY ID_VENDA;

-- 4. Total de pagamentos por tipo
SELECT TIPO_PAGAMENTO, SUM(VALOR_PAGAMENTO) AS total
FROM PAGAMENTO
GROUP BY TIPO_PAGAMENTO;

-- 5. Média de preço por categoria
SELECT categoria_produto, AVG(preco_produto) AS media_preco
FROM produto
GROUP BY categoria_produto;

-- 6. Quantidade de vendas por cliente
SELECT id_cliente, COUNT(*) AS qtd_vendas
FROM VENDA
GROUP BY id_cliente;

-- 7. Quantidade de produtos por marca
SELECT marca_produto, COUNT(*) AS qtd_produtos
FROM produto
GROUP BY marca_produto;

-- 8. Soma do estoque por localização
SELECT LOCALIZACAO_ESTOQUE, SUM(QUANTIDADE_ESTOQUE) AS total_estoque
FROM ESTOQUE
GROUP BY LOCALIZACAO_ESTOQUE;

-- 9. Quantidade de itens vendidos por produto
SELECT id_produto, SUM(QUANTIDADE_ITEM) AS total_vendido
FROM ITEM_VENDA
GROUP BY id_produto;

-- 10. Estoque total por status
SELECT STATUS_ESTOQUE, SUM(QUANTIDADE_ESTOQUE) AS total_estoque
FROM ESTOQUE
GROUP BY STATUS_ESTOQUE;

-- 11. Maior preço por categoria
SELECT categoria_produto, MAX(preco_produto) AS maior_preco
FROM produto
GROUP BY categoria_produto;

-- 1. Categorias com mais de 5 produtos
SELECT categoria_produto, COUNT(*) AS qtd_produtos
FROM produto
GROUP BY categoria_produto
HAVING qtd_produtos > 5;

-- 2. Formas de pagamento com total de vendas acima de 10000
SELECT FORMA_PAGAMENTO, SUM(VALOR_TOTAL) AS total
FROM VENDA
GROUP BY FORMA_PAGAMENTO
HAVING total > 10000;

-- 3. Categorias com preço médio acima de 30
SELECT categoria_produto, AVG(preco_produto) AS media_preco
FROM produto
GROUP BY categoria_produto
HAVING media_preco > 30;

-- 4. Marcas com mais de 10 produtos
SELECT marca_produto, COUNT(*) AS qtd_produtos
FROM produto
GROUP BY marca_produto
HAVING qtd_produtos > 10;

-- 5. Clientes com mais de 20 vendas
SELECT id_cliente, COUNT(*) AS qtd_vendas
FROM VENDA
GROUP BY id_cliente
HAVING qtd_vendas > 20;

-- 6. Localizações de estoque com mais de 3 produtos
SELECT LOCALIZACAO_ESTOQUE, COUNT(*) AS qtd_produtos
FROM ESTOQUE
GROUP BY LOCALIZACAO_ESTOQUE
HAVING qtd_produtos > 3;

-- 7. Categorias com estoque total acima de 500
SELECT e.id_produto, SUM(e.QUANTIDADE_ESTOQUE) AS total_estoque
FROM ESTOQUE e
GROUP BY e.id_produto
HAVING total_estoque > 500;

-- 8. Tipos de pagamento com total acima de 5000
SELECT TIPO_PAGAMENTO, SUM(VALOR_PAGAMENTO) AS total
FROM PAGAMENTO
GROUP BY TIPO_PAGAMENTO
HAVING total > 5000;

-- 9. Datas com mais de 10 vendas
SELECT DATE(DATA_HORA_VENDA) AS data, COUNT(*) AS qtd_vendas
FROM VENDA
GROUP BY DATE(DATA_HORA_VENDA)
HAVING qtd_vendas > 10;

-- 10. Cidades com soma de clientes acima de 2
SELECT cidade_cliente, COUNT(*) AS qtd_clientes
FROM cliente
GROUP BY cidade_cliente
HAVING qtd_clientes > 2;

-- 11. Categorias cujo maior preço ultrapasse 100
SELECT categoria_produto, MAX(preco_produto) AS maior_preco
FROM produto
GROUP BY categoria_produto
HAVING maior_preco > 100;

-- 1. Produtos e seus estoques
SELECT p.nome_produto, e.QUANTIDADE_ESTOQUE, e.LOCALIZACAO_ESTOQUE
FROM produto p
JOIN ESTOQUE e ON p.id_produto = e.id_produto;

-- 2. Produtos e status de estoque
SELECT p.nome_produto, e.STATUS_ESTOQUE
FROM produto p
JOIN ESTOQUE e ON p.id_produto = e.id_produto;

-- 3. Vendas e clientes
SELECT v.ID_VENDA, v.DATA_HORA_VENDA, c.nome_cliente
FROM VENDA v
JOIN cliente c ON v.id_cliente = c.id_cliente;

-- 4. Itens de venda com nome do produto
SELECT iv.ID_VENDA, p.nome_produto, iv.QUANTIDADE_ITEM, iv.SUBTOTAL_ITEM
FROM ITEM_VENDA iv
JOIN produto p ON iv.id_produto = p.id_produto;

-- 5. Pagamentos e vendas
SELECT p.ID_PAGAMENTO, p.TIPO_PAGAMENTO, v.VALOR_TOTAL, v.DATA_HORA_VENDA
FROM PAGAMENTO p
JOIN VENDA v ON p.ID_VENDA = v.ID_VENDA;

-- 6. Itens de venda com nome do produto e data da venda
SELECT iv.ID_VENDA, p.nome_produto, iv.QUANTIDADE_ITEM, iv.SUBTOTAL_ITEM, v.DATA_HORA_VENDA
FROM ITEM_VENDA iv
JOIN produto p ON iv.id_produto = p.id_produto
JOIN VENDA v ON iv.ID_VENDA = v.ID_VENDA;

-- 7. Produtos com estoque e validade
SELECT p.nome_produto, e.QUANTIDADE_ESTOQUE, e.VALIDADE
FROM produto p
JOIN ESTOQUE e ON p.id_produto = e.id_produto;

-- 8. Vendas e forma de pagamento detalhada
SELECT v.ID_VENDA, c.nome_cliente, pg.TIPO_PAGAMENTO, pg.VALOR_PAGAMENTO
FROM VENDA v
JOIN cliente c ON v.id_cliente = c.id_cliente
JOIN PAGAMENTO pg ON v.ID_VENDA = pg.ID_VENDA;

-- 9. Estoque com produto e lote
SELECT p.nome_produto, e.LOTE, e.QUANTIDADE_ESTOQUE, e.VALIDADE
FROM ESTOQUE e
JOIN produto p ON e.id_produto = p.id_produto;

-- 10. Clientes e suas vendas
SELECT c.nome_cliente, v.ID_VENDA, v.VALOR_TOTAL
FROM cliente c
JOIN VENDA v ON c.id_cliente = v.id_cliente;

-- 11. Detalhes completos das vendas
SELECT v.ID_VENDA, c.nome_cliente, v.DATA_HORA_VENDA,
       p.nome_produto, iv.QUANTIDADE_ITEM, iv.SUBTOTAL_ITEM,
       pg.TIPO_PAGAMENTO, v.VALOR_TOTAL
FROM VENDA v
JOIN cliente c ON v.id_cliente = c.id_cliente
JOIN ITEM_VENDA iv ON v.ID_VENDA = iv.ID_VENDA
JOIN produto p ON iv.id_produto = p.id_produto
JOIN PAGAMENTO pg ON v.ID_VENDA = pg.ID_VENDA;


-- 1. Renomear tabela cliente
ALTER TABLE cliente RENAME TO clienteVIP;

-- 2. Adicionar coluna marca (produto já tem; adicionamos peso_embalagem)
ALTER TABLE produto ADD peso_embalagem VARCHAR(20);

-- 3. Remover coluna adicionada
ALTER TABLE produto DROP COLUMN peso_embalagem;

-- 4. Modificar tipo do telefone do cliente
ALTER TABLE cliente MODIFY telefone_cliente VARCHAR(25);

-- 5. Renomear coluna status_produto para situacao_produto
ALTER TABLE produto RENAME COLUMN status_produto TO situacao_produto;

-- 6. Alterar tamanho do nome do produto
ALTER TABLE produto MODIFY nome_produto VARCHAR(200);

-- 7. Tornar nome_cliente NOT NULL
ALTER TABLE cliente MODIFY nome_cliente VARCHAR(100) NOT NULL;

-- 8. Remover NOT NULL do sobrenome
ALTER TABLE cliente MODIFY sobrenome_cliente VARCHAR(100) NULL;

-- 9. Adicionar DEFAULT ao status do estoque
ALTER TABLE ESTOQUE MODIFY STATUS_ESTOQUE VARCHAR(20) DEFAULT 'DISPONIVEL';

-- 10. Alterar tipo de VALOR_TOTAL para BIGINT
ALTER TABLE VENDA MODIFY VALOR_TOTAL DECIMAL(10,2);

-- 11. Adicionar PK composta em ITEM_VENDA (já existe; recriando)
ALTER TABLE ITEM_VENDA DROP PRIMARY KEY;
ALTER TABLE ITEM_VENDA ADD PRIMARY KEY (ID_ITEM_VENDA);

-- 12. Adicionar FK de ESTOQUE para produto
ALTER TABLE ESTOQUE
ADD CONSTRAINT fk_estoque_produto
FOREIGN KEY (id_produto) REFERENCES produto(id_produto);

-- 13. Remover FK de ESTOQUE
ALTER TABLE ESTOQUE DROP FOREIGN KEY fk_estoque_produto;

-- 14. FK com ON DELETE CASCADE em ITEM_VENDA
ALTER TABLE ITEM_VENDA
ADD CONSTRAINT fk_item_venda_venda
FOREIGN KEY (ID_VENDA) REFERENCES VENDA(ID_VENDA)
ON DELETE CASCADE;

-- 15. FK com ON UPDATE CASCADE em ITEM_VENDA para produto
ALTER TABLE ITEM_VENDA
ADD CONSTRAINT fk_item_venda_produto
FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
ON UPDATE CASCADE;

-- 16. Adicionar UNIQUE no email do cliente
ALTER TABLE cliente ADD CONSTRAINT unique_email UNIQUE(email_cliente);

-- 17. Remover UNIQUE do email
ALTER TABLE cliente DROP INDEX unique_email;

-- 18. Adicionar CHECK no preço do produto
ALTER TABLE produto ADD CONSTRAINT chk_preco CHECK(preco_produto >= 0);

-- 19. Adicionar DEFAULT ao status do fornecedor
ALTER TABLE FORNECEDOR ALTER STATUS_FORNECEDOR SET DEFAULT 'ATIVO';

-- 20. Tornar VALOR_PAGAMENTO NOT NULL
ALTER TABLE PAGAMENTO MODIFY VALOR_PAGAMENTO DECIMAL(10,2) NOT NULL;