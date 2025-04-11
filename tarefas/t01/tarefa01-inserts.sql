insert into departamento
(sigla, descricao, codGerente)
values ('DHC', 'Dep História', null);

insert into departamento
(sigla, descricao, codGerente)
values ('DCT', 'Dep Computação', null);

insert into departamento
(sigla, descricao, codGerente)
values ('DGC', 'Dep Geografia', null);

insert into departamento
(sigla, descricao, codGerente)
values ('DXT', null, null);

insert into departamento (sigla, descricao, codGerente)
values ('DEP', 'Dep Eletrônica e Programação', null);


-- Adicionando Gerentes

insert into funcionario
(nome, sexo, dtNasc, salario, codSupervisor, codDepto)
values ('Ana', 'F', '1988-05-07', 2500.00, null, 1);

insert into funcionario
(nome, sexo, dtNasc, salario, codSupervisor, codDepto)
values ('Taciano', 'M', '1980-01-25', 2500.00, null, 2);

update departamento set codGerente = 1 where sigla = 'DHC';
update departamento set codGerente = 2 where sigla = 'DCT';

-- Adicionando Funcionários

insert into funcionario
(nome, sexo, dtNasc, salario, codSupervisor, codDepto)
values ('Maria', 'F', '1981-07-01', 2500.00, 1, 1);

insert into funcionario
(nome, sexo, dtNasc, salario, codSupervisor, codDepto)
values ('Josefa', 'F', '1986-09-17', 2500.00, 1, 1);

insert into funcionario
(nome, sexo, dtNasc, salario, codSupervisor, codDepto)
values ('Carlos', 'M', '1985-11-21', 2500.00, 1, 1);

insert into funcionario
(nome, sexo, dtNasc, salario, codSupervisor, codDepto)
values ('Humberto', 'M', '1970-05-07', 1500.00, 2, 2);

insert into funcionario
(nome, sexo, dtNasc, salario, codSupervisor, codDepto)
values ('José', 'M', '1979-07-12', 3500.00, 2, 2);

insert into funcionario
(nome, sexo, dtNasc, salario, codSupervisor, codDepto)
values ('Xuxa', 'F', '1970-03-28', 13500.00, null, null);

insert into funcionario
(nome, sexo, dtNasc, salario, codSupervisor, codDepto)
values ('Sasha', 'F', '1970-03-28', 1500.00, 3, 1);

insert into funcionario
(nome, sexo, dtNasc, salario, codSupervisor, codDepto)
values ('Victor', 'M', '1970-03-28', 500.00, 4, 1);

insert into funcionario
(nome, sexo, dtNasc, salario, codSupervisor, codDepto)
values ('Doisberto', 'M', '1980-07-14', 2500.00, 3, 3);

insert into funcionario
(nome, sexo, dtNasc, salario, codSupervisor, codDepto)
values ('Tresberta', 'F', '1992-09-01', 3000.00, 4, 3);

-- Adicionando Projetos

insert into projeto(nome, descricao, codDepto, codResponsavel, dataInicio, dataFim)
values ('APF', 'Analisador de Ponto de Função', 2, 2, '2018-02-26', '2019-06-30');

insert into projeto(nome, descricao, codDepto, codResponsavel, dataInicio, dataFim)
values ('Monitoria', 'Projeto de Monitoria 2019.1', 1, 6, '2019-02-26', '2019-12-30');

insert into projeto(nome, descricao, codDepto, codResponsavel, dataInicio, dataFim)
values ('BD', 'Projeto de Banco de Dados', 3, 5, '2018-02-26', '2018-06-30');

insert into projeto(nome, descricao, codDepto, codResponsavel, dataInicio, dataFim)
values ('ES', 'Projeto de Engenharia de Software', 1, 1, '2018-02-26', '2018-06-30');

insert into projeto (nome, descricao, codDepto, codResponsavel, dataInicio, dataFim)
values ('IoT', 'Projeto de Internet das Coisas', 5, 3, '2020-01-15', '2020-12-20');

-- Adcionando Atividades 
insert into atividade(descricao, dataInicio, dataFim)
values ('APF - Atividade 1', '2018-02-26', '2018-06-30'); -- ID 1

insert into atividade(descricao, dataInicio, dataFim)
values ('APF - Atividade 2', '2018-06-26', '2018-07-30'); -- ID 2

insert into atividade(descricao, dataInicio, dataFim)
values ('APF - Atividade 3', '2018-08-26', '2018-09-30'); -- ID 3

insert into atividade(descricao, dataInicio, dataFim)
values ('APF - Atividade 4', '2018-08-26', '2018-09-30'); -- ID 4

insert into atividade(descricao, dataInicio, dataFim)
values ('APF - Atividade 5', '2018-09-30', '2018-10-30'); -- ID 5

insert into atividade(descricao, dataInicio, dataFim)
values ('Monitoria - Atividade 1', '2018-06-26', '2018-07-30'); -- ID 6

insert into atividade(descricao, dataInicio, dataFim)
values ('BD - Atividade 1', '2018-06-26', '2018-07-30'); -- ID 7

insert into atividade(descricao, dataInicio, dataFim)
values ('BD - Atividade 2', '2018-08-26', '2018-09-30'); -- ID 8

insert into atividade(descricao, dataInicio, dataFim)
values ('BD - Atividade 3', '2018-08-26', '2018-09-30'); -- ID 9

insert into atividade(descricao, dataInicio, dataFim)
values ('ES - Atividade 1', '2018-09-30', '2018-10-30'); -- ID 10

insert into atividade(descricao, dataInicio, dataFim)
values ('ES - Atividade 2', '2018-06-26', '2018-07-30'); -- ID 11

-- Adcionando Atividades Projeto

-- Projeto 1 = APF
insert into atividade_projeto(cod_projeto, cod_atividade) values (1, 1);
insert into atividade_projeto(cod_projeto, cod_atividade) values (1, 2);
insert into atividade_projeto(cod_projeto, cod_atividade) values (1, 3);
insert into atividade_projeto(cod_projeto, cod_atividade) values (1, 4);
insert into atividade_projeto(cod_projeto, cod_atividade) values (1, 5);

-- Projeto 2 = Monitoria
insert into atividade_projeto(cod_projeto, cod_atividade) values (2, 6);

-- Projeto 3 = BD
insert into atividade_projeto(cod_projeto, cod_atividade) values (3, 7);
insert into atividade_projeto(cod_projeto, cod_atividade) values (3, 8);
insert into atividade_projeto(cod_projeto, cod_atividade) values (3, 9);

-- Projeto 4 = ES
insert into atividade_projeto(cod_projeto, cod_atividade) values (4, 10);
insert into atividade_projeto(cod_projeto, cod_atividade) values (4, 11);
