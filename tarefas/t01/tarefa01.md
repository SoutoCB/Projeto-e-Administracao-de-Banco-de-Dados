# Scripts:

### Esquema Relacional:

[Criação do Esquema Relacional](/tarefas/t01/tarefa01-create.sql)

[Povoamento do Esquema Relacional](/tarefas/t01/tarefa01-inserts.sql)

### Questões:

[Questão 01](./tarefa01-q01.sql)

[Questão 04](./tarefa01-q04.sql)

[Questão 07](./tarefa01-q07.sql)

[Questão 10](./tarefa01-q10.sql)

[Questão 16](./tarefa01-q16.sql)

## Um pouco sobre NATURAL JOIN e CROSS JOIN:

### **NATURAL JOIN**
É uma operação no SQL que faz a junção das tabelas utilizando as colunas que têm o mesmo nome em ambas as tabelas.

*Características:*
- Não exige que especifique quais as colunas que serão usadas na junção, pois ele decide automaticamente
- Se houver mais de uma coluna com o mesmo nome em ambas as tabelas, serão todas utilizadas para realizar a junção.
- Ele elimina as colunas duplicadas 

*Exemplo:*

Temos duas tabelas: **funcionario** e **departament**, e ambas possuem a coluna **codDepto**.

**Tabela Funcionário**:

|codigo|nome|sexo|codDepto|
|---|---|---|---|
|1|Maria|F|1|
|2|João|M|2|
|3|Carla|F|1|

**Tabela departamento**:

| codigo | sigla | descricao      | codDepto |
| ------ | ----- | -------------- | -------- |
| 1      | DHC   | Departamento A | 1        |
| 2      | DCT   | Departamento B | 2        |

Consulta usando NATURAL JOIN entre as duas tabelas:

```
SELECT *
FROM funcionario
NATURAL JOIN departamento
```

*Resultado:*

|codigo|nome|sexo|codDepto|sigla|descricao|
|---|---|---|---|---|---|
|1|Maria|F|1|DHC|Departamento A|
|2|João|M|2|DCT|Departamento B|
|3|Carla|F|1|DHC|Departamento A|

### **CROSS JOIN** 
É uma operação SQL que retorna o produto cartesiano entre duas ou mais tabelas. Ou seja, ele combina cada linha de uma tabela com todas as linhas da outra tabela.

*Característica:*
- Não é necessário uma condição de junção

 *Exemplo:*

Usando as mesmas tabelas **funcionario** e **departamento**:

Tabela **funcionario**:

|codigo|nome|
|---|---|
|1|Maria|
|2|João|

Tabela **departamento**:

|codigo|sigla|
|---|---|
|1|DHC|
|2|DCT|

Consulta usando CROSS JOIN entre as duas tabelas:

```
SELECT *
FROM funcionario
CROSS JOIN departamento
```

Resultado:

|codigo|nome|codigo|sigla|
|---|---|---|---|
|1|Maria|1|DHC|
|1|Maria|2|DCT|
|2|João|1|DHC|
|2|João|2|DCT|

## Um pouco sobre Windows Functions no PostgreSQL

Permitem realizar cálculos sobre um conjunto de linhas relacionado, sem agrupar os resultados. 

**Windows Functions mais usadas:**

1. **`ROW_NUMBER()`**: Atribui um número único e sequencial para cada linha, conforme a ordenação definida.
    
2. **`RANK()`**: Atribui uma classificação, considerando empates. Quando há empate, as linhas seguintes recebem números com lacunas.
    
3. **`DENSE_RANK()`**: Atribui uma classificação sem lacunas, mesmo com empates.
    
4. **`NTILE(n)`**: Divide as linhas em `n` grupos (por exemplo, quartis ou percentis).
    
5. **`SUM()`, `AVG()`, `MIN()`, `MAX()`**: Funções de agregação que podem ser usadas como funções de janela para calcular somas, médias, mínimos ou máximos, sem agrupar os dados.
    
6. **`LEAD()`**: Acessa o valor de uma linha posterior à linha atual.
    
7. **`LAG()`**: Acessa o valor de uma linha anterior à linha atual.

**Sintaxe básica de uma Window Function:**
```
SELECT 
  coluna1,
  coluna2,
  window_function() OVER (PARTITION BY coluna_particao ORDER BY coluna_ordem) AS resultado
FROM tabela;

```   

Essas funções são aplicadas usando a cláusula `OVER()` com opções de **partição** (`PARTITION BY`) e **ordenação** (`ORDER BY`) para determinar o conjunto de dados sobre o qual a função será aplicada.