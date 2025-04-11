SELECT f.nome
FROM funcionario f
WHERE f.salario > (
	SELECT MAX(salario)
	FROM funcionario
	WHERE codDepto = 2
)