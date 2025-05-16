## Scripts:

[Script ODBC](./scripts/odbc.py)

[Script ORM](./scripts/orm.py)

## Resumo sobre ODBC

#### ODBC (Open Database Connectivity)
ODBC é uma interface padrão que permite que aplicativos acessem diferentes sistemas de gerenciamento de banco de dados (SGBDs) usando uma API comum. Foi criado pela Microsoft para promover a interoperabilidade entre bancos e aplicações.

- Objetivo: Facilitar a comunicação entre linguagens de programação e diferentes bancos de dados.

- Funcionamento: Utiliza um driver ODBC específico para cada banco de dados, que traduz comandos SQL genéricos para instruções que o banco específico compreende.

- Vantagem: Portabilidade – o mesmo código pode funcionar com diferentes bancos apenas trocando o driver.

- Exemplo de uso: Aplicações em C, Python, ou Excel acessando SQL Server, MySQL, PostgreSQL, etc.

## Resumo sobre ORM

#### ORM (Object-Relational Mapping)
ORM é uma técnica de programação que permite mapear objetos da linguagem (como classes em Python ou Java) para tabelas de um banco de dados relacional.

- Objetivo: Evitar que o desenvolvedor escreva SQL manualmente, interagindo com o banco de forma orientada a objetos.

- Funcionamento: Cada classe representa uma tabela, cada instância um registro, e cada atributo um campo.

- Vantagem: Reduz código repetitivo e facilita a manutenção.

- Exemplo de uso: SQLAlchemy (Python), Hibernate (Java), Entity Framework (C#), Django ORM.