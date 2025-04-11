CREATE VIEW funcs_depto AS
    SELECT d.sigla, COUNT(f.codigo) AS n_funcionario
    FROM funcionario f 
    RIGHT JOIN departamento d ON f.codDepto = d.codigo
    GROUP BY d.sigla;
		
SELECT fd.sigla, f.nome, fd.n_funcionario
FROM funcs_depto fd
JOIN departamento d ON d.sigla = fd.sigla
LEFT JOIN funcionario f ON d.codGerente = f.codigo;