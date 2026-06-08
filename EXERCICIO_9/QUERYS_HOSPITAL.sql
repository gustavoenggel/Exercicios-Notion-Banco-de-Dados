-- 1. Liste o nome e a cidade de todos os hospitais cadastrados.
SELECT nome, cidade 
FROM Hospitais;

-- 2. Exiba o nome, CRM e salário de todos os médicos.
SELECT nome, crm, salario 
FROM Medicos;

-- 3. Liste os pacientes cadastrados com seu tipo sanguíneo.
SELECT nome, tipo_sanguineo 
FROM Pacientes;

-- 4. Exiba os medicamentos com estoque inferior a 50 unidades.
SELECT nome_medicamento, estoque 
FROM Medicamentos 
WHERE estoque < 50;

-- 5. Liste os pacientes que possuem alguma alergia registrada.
SELECT nome, alergias 
FROM Pacientes 
WHERE alergias IS NOT NULL AND alergias <> '';

-- 6. Exiba as consultas realizadas após uma data informada pelo professor.
SELECT * FROM Consultas 
WHERE data_consulta > '2026-03-01';

-- 7. Liste os exames realizados em um período informado pelo professor.
SELECT * FROM Exames 
WHERE data_exame BETWEEN '2026-01-01' AND '2026-12-31';

-- 8. Exiba os funcionários cujo salário esteja entre R$ 2.500,00 e R$ 6.000,00.
SELECT nome, salario 
FROM Funcionarios 
WHERE salario BETWEEN 2500.00 AND 6000.00;

-- 9. Liste os quartos que estão com status "Disponível".
SELECT numero_quarto, status 
FROM Quartos 
WHERE status = 'Disponível';

-- 10. Exiba os pagamentos realizados utilizando uma forma de pagamento informada pelo professor.
SELECT * FROM Pagamentos 
WHERE forma_pagamento = 'Cartão de Crédito';

-- 11. Apresente a quantidade total de pacientes cadastrados.
SELECT COUNT(*) AS total_pacientes 
FROM Pacientes;

-- 12. Exiba o valor médio das consultas realizadas.
SELECT AVG(valor) AS valor_medio 
FROM Consultas;

-- 13. Apresente o menor valor de consulta registrado no sistema.
SELECT MIN(valor) AS menor_valor 
FROM Consultas;

-- 14. Exiba a quantidade de médicos cadastrados por especialidade.
SELECT especialidade, COUNT(*) AS quantidade_medicos 
FROM Medicos 
GROUP BY especialidade;

-- 15. Apresente a quantidade de funcionários cadastrados por setor.
SELECT setor, COUNT(*) AS quantidade_funcionarios 
FROM Funcionarios 
GROUP BY setor;

-- 16. Liste o nome dos médicos e o nome de suas respectivas especialidades.
SELECT nome, especialidade 
FROM Medicos;

-- 17. Exiba o nome dos funcionários e o nome do hospital em que trabalham.
SELECT f.nome AS nome_funcionario, h.nome AS nome_hospital 
FROM Funcionarios f
JOIN Hospitais h ON f.id_hospital = h.id_hospital;

-- 18. Liste o nome dos pacientes e as datas de suas consultas.
SELECT p.nome AS nome_paciente, c.data_consulta 
FROM Pacientes p
JOIN Consultas c ON p.id_paciente = c.id_paciente;

-- 19. Exiba o(s) medicamento(s) com o maior preço cadastrado.
SELECT nome_medicamento, preco 
FROM Medicamentos 
WHERE preco = (SELECT MAX(preco) FROM Medicamentos);

-- 20. Liste os médicos cujo salário seja superior ao salário médio dos médicos cadastrados.
SELECT nome, salario 
FROM Medicos 
WHERE salario > (SELECT AVG(salario) FROM Medicos);