from dotenv import load_dotenv
import os
# import pyodbc - Para usar o ODBC, precisa baixar uns drives que acabei não conseguindo, usei o psycopg2 que a syntax não mudou quase nada
import psycopg2


# Carrega as variáveis do .env
load_dotenv()

# Conexão ODBC para o banco AtividadesBD
conn = psycopg2.connect(
    # "DRIVER={PostgreSQL Unicode};"
    # "SERVER=DB_HOST;"
    # "PORT=DB_PORT;"
    # "DATABASE=DB_NAME;"
    # "UID=DB_USER;"
    # "PWD=DB_PASSWORD;"
    host=os.getenv("DB_HOST"),
    port=os.getenv("DB_PORT"),
    database=os.getenv("DB_NAME"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD")
)

cursor = conn.cursor()

# 1) Inserir uma atividade em um projeto existente
cursor.execute("""
    INSERT INTO atividade (descricao, projeto, data_inicio, data_fim)
    VALUES (%s, %s, %s, %s)
""", (
    "Reunião de Kickoff",  # descricao
    2,                      # projeto (projeto.codigo = 2)
    "2025-05-20",           # data_inicio
    "2025-05-20"            # data_fim
))

# 2) Atualizar o responsável (líder) de um projeto
cursor.execute("""
    UPDATE projeto
    SET responsavel = %s
    WHERE codigo = %s
""", (
    5,  # funcionario.codigo que vai ser o novo responsável
    2   # projeto.codigo que será atualizado
))

# 3) Listar todos os projetos e suas atividades
cursor.execute("""
    SELECT p.codigo, p.nome AS projeto, f.nome AS responsavel,
           a.codigo AS atividade_id, a.descricao AS atividade
    FROM projeto p
    LEFT JOIN funcionario f ON p.responsavel = f.codigo
    LEFT JOIN atividade a  ON p.codigo = a.projeto
    ORDER BY p.codigo, a.codigo
""")

# Pegando os nomes das colunas
col_names = [desc[0] for desc in cursor.description]

# Pegando os dados
rows = cursor.fetchall()

# Exibindo como uma tabela (estilo SQL)
print("\nResultados da consulta:\n")
print(" | ".join(col_names))
print("-" * 80)

for row in rows:
    print(" | ".join([str(col) if col is not None else "NULL" for col in row]))

# Confirma as alterações e fecha
conn.commit()
cursor.close()
conn.close()
