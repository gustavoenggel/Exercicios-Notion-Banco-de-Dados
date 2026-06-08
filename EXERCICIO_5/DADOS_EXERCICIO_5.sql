-
INSERT INTO cargos (descricao) VALUES ('Desenvolvedor Júnior'), ('Desenvolvedor Pleno'), ('Gerente de RH');


INSERT INTO departamentos (nome) VALUES ('Tecnologia'), ('Recursos Humanos');

INSERT INTO funcionarios (nome, data_admissao, salario, id_cargo, id_departamento) VALUES 
('Gustavo Engel', '2024-01-01', 5500.00, 2, 1), 
('Aline Silva', '2025-03-15', 8000.00, 3, 2);

INSERT INTO historico_movimentacoes (id_funcionario, id_cargo, id_departamento, data_inicio, data_fim) VALUES 
(1, 1, 1, '2024-01-01', '2025-01-01'), 
(1, 2, 1, '2025-01-01', NULL);          

INSERT INTO historico_movimentacoes (id_funcionario, id_cargo, id_departamento, data_inicio, data_fim) VALUES 
(2, 3, 2, '2025-03-15', NULL);