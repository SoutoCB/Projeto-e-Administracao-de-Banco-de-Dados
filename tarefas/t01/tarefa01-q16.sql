CREATE VIEW respon_projetos as
	SELECT DISTINCT
	f.codigo, f.nome, f.salario, f.codDepto
	FROM funcionario f
	JOIN projeto p ON f.codigo = p.codResponsavel;
  
CREATE VIEW gerentes_dep as
	SELECT f.codigo, f.salario, f.codDepto
	FROM funcionario f, departamento d
	WHERE f.codigo = d.codGerente;

SELECT DISTINCT rp.nome
FROM respon_projetos rp, 
gerentes_dep gd
WHERE rp.codigo IN(SELECT codigo FROM gerentes_dep) OR rp.salario > (
	SELECT gd.salario
	FROM gerentes_dep gd
	WHERE rp.codDepto = gd.codDepto)