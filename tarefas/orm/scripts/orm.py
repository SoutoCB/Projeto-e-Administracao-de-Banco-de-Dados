from sqlalchemy import create_engine, Column, Integer, String, ForeignKey, Date
from sqlalchemy.orm import sessionmaker, relationship, declarative_base
from dotenv import load_dotenv
import os

# 1. Carregar variáveis de ambiente
load_dotenv()
DB_USER     = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_HOST     = os.getenv("DB_HOST")
DB_PORT     = os.getenv("DB_PORT")
DB_NAME     = os.getenv("DB_NAME")

# 2. Criar engine e sessão
DATABASE_URL = f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)
session = Session()

Base = declarative_base()

# 3. Definir modelos com nomes exatos das colunas
class Projeto(Base):
    __tablename__ = 'projeto'
    codigo = Column(Integer, primary_key=True)
    nome = Column(String)
    descricao = Column(String)
    responsavel = Column(Integer, ForeignKey('funcionario.codigo'))
    depto = Column(Integer)
    data_inicio = Column(Date)
    data_fim = Column(Date)

    atividades = relationship("Atividade", back_populates="projeto_rel")


class Atividade(Base):
    __tablename__ = 'atividade'
    codigo = Column(Integer, primary_key=True)
    descricao = Column(String)
    projeto = Column(Integer, ForeignKey('projeto.codigo'))  # ainda é a FK
    data_inicio = Column(Date)
    data_fim = Column(Date)

    projeto_rel = relationship("Projeto", back_populates="atividades")  # relacionamento de volta

class Funcionario(Base):
    __tablename__ = 'funcionario'
    codigo = Column(Integer, primary_key=True)
    nome = Column(String)

# 4. Inserir nova atividade em projeto existente
nova_atividade = Atividade(
    descricao="Reunião de BrainStorm",
    projeto=3,  # aqui também usa o nome correto
    data_inicio="2025-05-20",
    data_fim="2025-05-20"
)
session.add(nova_atividade)

# 5. Atualizar o líder (responsável) de um projeto
projeto = session.query(Projeto).filter_by(codigo=3).first()
if projeto:
    projeto.responsavel = 6

# 6. Listar todos os projetos com suas atividades
projetos = session.query(Projeto).all()
for p in projetos:
    print(f"Projeto: {p.nome} (Responsável: {p.responsavel})")
    for a in p.atividades:
        print(f"  - Atividade: {a.descricao}")

# 7. Finalizar
session.commit()
session.close()
