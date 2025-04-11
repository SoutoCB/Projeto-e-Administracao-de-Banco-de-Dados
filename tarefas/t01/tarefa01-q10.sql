SELECT 
	p.nome as nome_projeto, 
	dp.sigla as nome_departamento, 		
	f.nome as func_responsavel, 
	df.sigla as func_departamento
FROM projeto p
JOIN departamento dp ON p.codDepto = dp.codigo
LEFT JOIN funcionario f ON p.codResponsavel = f.codigo
LEFT JOIN departamento df ON f.codDepto = df.codigo