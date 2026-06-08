-- 1)liste todos os alunos cadastrados
select*
from Alunos;


-- 2)Nome de todos os alunos
select nome
from Alunos;


-- 3)Liste todos os cursos
from cursos




-- 4)Alunos que moram em São Paulo
select*
from Alunos
where cidade= 'são paulo';


-- 5)Liste alunos com mais idade que 20 anos
select*
from Alunos
where idade > 20;


-- 6)Exiba os cursos com carga horaria maior que 50 horas
select*
from Cursos
where carga_horaria > 50


-- 7)Mostre os alunos com idade entre 18 e 22 anos.


select nome, idade
from Alunos
where idade BETWEEN 18 AND 22;


-- 8)Liste os alunos da cidade de Curitiba.
select*
from Alunos
where cidade='Curitiba'


-- 9)Exiba os alunos cuja idade seja menor que 21 anos.
select*
from Alunos
where idade < 21


-- 10)Liste todas as matrículas cadastradas.
select id_matricula
from Matriculas;


-- 11)Mostre os alunos que possuem nota maior que 8.
SELECT Alunos.nome, Matriculas.nota
from Alunos
JOIN Matriculas ON Alunos.id_aluno = Matriculas.id_aluno
where Matriculas.nota > 8


-- 12)Liste os alunos que tiveram mais de 5 faltas.
select Alunos.nome , Matriculas.faltas
from Alunos
JOIN Matriculas ON  Alunos.id_aluno = Matriculas.id_aluno
Where Matriculas.faltas > 5;


-- 13)Exiba os cursos com carga horária igual a 80 horas.
select carga_horaria,nome_curso
from Cursos
where carga_horaria = 80


-- 14)Mostre os alunos que NÃO moram em São Paulo.
select nome,cidade
from Alunos
where cidade !=  'São Paulo';


-- 15)Liste os alunos cujo nome começa com a letra “A”.
select nome
from Alunos
where nome like'A%';


-- 16)Exiba os alunos cujo nome termina com a letra “a”.
select nome
from Alunos
where nome like '%a';


-- 17)Liste os cursos cujo nome contenha a palavra “Dados”.
select nome_curso
from Cursos
where nome_curso like '%Dados%';


-- 18)Mostre as matrículas com nota entre 7 e 9.
select Alunos.nome, Matriculas.nota
from Alunos
JOIN Matriculas ON Alunos.id_aluno = Matriculas.id_aluno
where nota BETWEEN 7 AND 9;


-- 19)Liste os alunos que possuem exatamente 20 anos.
select nome, idade
from Alunos
where idade = 20


-- 20)Exiba os cursos com carga horária menor ou igual a 60 horas.
select nome_curso,carga_horaria
from Cursos
where carga_horaria <= 60;


-- 21)Mostre quantos alunos existem em cada cidade.
select cidade, count(*) as Total_alunos
from Alunos
group by cidade;


-- 22)Exiba a média de idade dos alunos agrupada por cidade.
select cidade,AVG(idade) as Media_de_idade
from Alunos
group by cidade;


-- 23)Mostre a quantidade de matrículas por curso.
select Cursos.nome_curso,COUNT(Matriculas.id_matricula) AS matriculas
From Matriculas
Join Cursos ON Matriculas.id_curso = Cursos.id_curso
group by Cursos.nome_curso


-- 24)Exiba a média das notas por curso.
select Cursos.nome_curso,AVG(Matriculas.nota) as notas_cursos
From Matriculas
join Cursos ON Matriculas.id_curso = Cursos.id_curso
group by Cursos.nome_curso;


-- 25)Mostre o total de faltas agrupado por curso.
select Cursos.nome_curso,SUM(Matriculas.faltas) as Total_faltas
from Matriculas
join Cursos ON Matriculas.id_curso = Cursos.id_curso
group by Cursos.nome_curso


-- 26)Liste a maior nota obtida em cada curso.
select Cursos.nome_curso,MAX(Matriculas.nota) as Maior_nota
from Matriculas
join Cursos ON Matriculas.id_curso = Cursos.id_curso
group by Cursos.nome_curso
 
-- 27)Exiba a menor nota registrada em cada curso.
select Cursos.nome_curso,MIN(Matriculas.nota) as Menor_nota
from Matriculas
join Cursos ON Matriculas.id_curso = Cursos.id_curso
group by Cursos.nome_curso


-- 28)Mostre a soma total das faltas agrupadas por aluno.
select Alunos.nome,SUM(Matriculas.faltas) as Total_faltas
from Matriculas
join Alunos ON Matriculas.id_aluno = Alunos.id_aluno
group by Alunos.nome


-- 29)Exiba a média de notas agrupada por aluno.
select Alunos.nome, AVG(Matriculas.nota) as Media_notas
from Matriculas
join Alunos ON Matriculas.id_aluno = Alunos.id_aluno
group by Alunos.nome


-- 30)Mostre quantos alunos existem em cada faixa etária.
select idade, COUNT(*) as quantidade_alunos
from Alunos
GROUP by idade


-- 31)Liste as cidades que possuem mais de 2 alunos.
select cidade
from Alunos
group by cidade
HAVING COUNT(*)>2;


-- 32)Exiba os cursos cuja média de notas seja maior que 8.
select Cursos.nome_curso, AVG(Matriculas.nota) as Media_notas
from Matriculas
join Cursos on Matriculas.id_curso = Cursos.id_curso
group by nome_curso
HAVING Media_notas > 8;


-- 33) Mostre os cursos que possuem mais de 2 matrículas.
select Cursos.nome_curso,COUNT(Matriculas.id_matricula) as total_matriculas
from Matriculas
join Cursos ON Matriculas.id_curso = Cursos.id_curso
group by nome_curso
HAVING total_matriculas > 2;


-- 34)Liste os alunos cuja soma de faltas seja maior que 5.
select Alunos.nome,SUM(Matriculas.faltas) as Total_faltas
from Matriculas
Join Alunos ON Matriculas.id_aluno = Alunos.id_aluno
group by nome
HAVING Total_faltas > 5


-- 35)Exiba os cursos cuja menor nota seja maior que 6.
select Cursos.nome_curso,MIN(Matriculas.nota) as Menor_nota
from Matriculas
join Cursos ON Matriculas.id_curso = Cursos.id_curso
group by Cursos.nome_curso
HAVING MIN(Matriculas.nota) > 6;


-- 36)Mostre os cursos ordenados pela carga horária em ordem decrescente.
select Cursos.nome_curso,Cursos.carga_horaria
from Cursos
order by carga_horaria DESC;


-- 37)Liste os alunos ordenados por idade do maior para o menor.
select Alunos.nome, Alunos.idade
from Alunos
order by idade desc


-- 38)Exiba a média de notas por curso ordenada da maior para a menor.
select Cursos.nome_curso, AVG(Matriculas.nota) as Media_notas
from Matriculas
join Cursos ON Matriculas.id_curso = Cursos.id_curso
group by Cursos.nome_curso
order by Media_notas desc


-- 39)Mostre as cidades ordenadas pela quantidade de alunos.
SELECT cidade, COUNT(*) AS quantidade_alunos
FROM Alunos
GROUP BY cidade
ORDER BY quantidade_alunos ASC;


-- 40)Liste os alunos com média de notas maior que 7 ordenados pela média decrescente.
select Alunos.nome,AVG(Matriculas.nota) as Media_notas
from Matriculas
join Alunos ON Matriculas.id_aluno = Alunos.id_aluno
group by Alunos.id_aluno
order by Media_notas desc












-- GROUP BY 7 e 8

