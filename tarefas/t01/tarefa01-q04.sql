SELECT f.nome, f.salario, f.codDepto
FROM funcionario f
WHERE f.codigo NOT IN (
	SELECT codGerente 
	FROM departamento 
	WHERE codGerente IS NOT NULL
)
ORDER BY f.codDepto;