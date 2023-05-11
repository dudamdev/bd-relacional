
USE fatec;

CREATE TABLE Pets (
	id int PRIMARY KEY AUTO_INCREMENT,
  	nome varchar(60) not null,
  	peso decimal(5,2) CHECK (peso > 0 )
)ENGINE=INNODB;

INSERT into Pets (id, nome, peso) VALUES (Null, "Lilith", 5.2);

CREATE table Produtos (
	id int PRIMARY key AUTO_INCREMENT,
  	nome varchar(60) not null unique,
  	preco_custo decimal(9,2),
  	preco_venda decimal(9,2),
  	lucro decimal(9,2) as (preco_venda - preco_custo)
  	
  	CHECK (preco_custo < preco_venda)
)engine=INNODB;

INSERT into Produtos VALUES (Null, "Contrabaixo", 1000, 2500, null);

CREATE TABLE Cidades (
	id int PRIMARY key,
  	nome varchar(60),
  	populacao int
)ENGINE=INNODB;

INSERT INTO Cidades VALUES (NULL, "São Paulo", 12000000);
INSERT INTO Cidades VALUES (NULL, "Franca", 350000);
INSERT INTO Cidades VALUES (NULL, "Botucatu", 150000);
INSERT INTO Cidades VALUES (NULL, "Ribeirão Preto", 711000);

CREATE TABLE Alunos (
	ra int PRIMARY KEY AUTO_INCREMENT,
  	nome varchar(60),
  	cidade_id int,
  
  	FOREIGN key (cidade_id) REFERENCES Cidades(id)
);

INSERT INTO Alunos VALUES (NULL, "Eduarda", 2); -- Relaciona Franca como cidade do Aluno
INSERT INTO Alunos VALUES (NULL, "Vanessa", 1); -- Relaciona São Paulo como cidade do Aluno
INSERT INTO Alunos VALUES (NULL, "Ana", 4); -- Relaciona Botucatu como cidade do Aluno
INSERT INTO Alunos VALUES (NULL, "Marina", 3); -- Relaciona Ribeirão Preto como cidade do Aluno

CREATE table Pessoa (
	id_pessoa int PRIMARY KEY AUTO_INCREMENT,
  	nome varchar(255),
  	endereco varchar(255),
  	cidade_id int,
  	FOREIGN key (cidade_id) REFERENCES Cidades (id)
);

CREATE TABLE Carro (
	id_carro int PRIMARY KEY AUTO_INCREMENT,
  	nome varchar(255),
  	marca varchar(255),
  	id_pessoa int,
  	FOREIGN key (id_pessoa) REFERENCES Pessoa (id_pessoa)
);

SELECT * 
	from Alunos JOIN Cidades
    on Cidades.id = Alunos.cidade_id;

SELECT * 
	from Pessoa JOIN Cidades
    on Cidades.id = Pessoa.cidade_id;

drop database if exists PetShop;  -- Remove o banco de dados, caso exista
create database PetShop;          -- Cria o banco de dados
use PetShop;                      -- Seleciona o banco para os próximos comandos

create table Especies (
    id                integer             primary key auto_increment,
    nome            varchar(50)            unique  not null,
    alimentacao        varchar(20)
);

 

create table Animais (
    id                integer             primary key auto_increment,
    nome            varchar(50)         not null,
    data_nasc        date                 not null,
    peso            decimal(10,2)        check (peso > 0),
    cor                varchar(50),

 

    especie_id        int                    references Especies(id)
);

insert into Especies (id, nome, alimentacao) values (null, 'gato'            , 'carnívoro');
insert into Especies (id, nome, alimentacao) values (null, 'cachorro'        , 'carnívoro');
insert into Especies (id, nome, alimentacao) values (null, 'morcego'        , 'onívoro');
insert into Especies (id, nome, alimentacao) values (null, 'rato'            , 'onívoro');
insert into Especies (id, nome, alimentacao) values (null, 'ramister'        , 'herbívoro');
insert into Especies (id, nome, alimentacao) values (null, 'baleia'            , 'carnívoro');
insert into Especies (id, nome, alimentacao) values (null, 'sardinha'        , 'herbívoro');
insert into Especies (id, nome, alimentacao) values (null, 'bacalhau'        , 'herbívoro');
insert into Especies (id, nome, alimentacao) values (null, 'tubarão'        , 'carnívoro');
insert into Especies (id, nome, alimentacao) values (null, 'lambari'        , 'herbívoro');
insert into Especies (id, nome, alimentacao) values (null, 'corvina'        , 'herbívoro');
insert into Especies (id, nome, alimentacao) values (null, 'iguana'            , 'herbívoro');
insert into Especies (id, nome, alimentacao) values (null, 'camaleão'        , 'herbívoro');
insert into Especies (id, nome, alimentacao) values (null, 'lagarto'        , 'herbívoro');
insert into Especies (id, nome, alimentacao) values (null, 'cobra'            , 'carnívoro');
insert into Especies (id, nome, alimentacao) values (null, 'cacatua'        , 'herbívoro');
insert into Especies (id, nome, alimentacao) values (null, 'pardal'            , 'onívoro');
insert into Especies (id, nome, alimentacao) values (null, 'bentevi'        , 'herbívoro');
insert into Especies (id, nome, alimentacao) values (null, 'canario'        , 'herbívoro');
insert into Especies (id, nome, alimentacao) values (null, 'virus'            , null);
insert into Especies (id, nome, alimentacao) values (null, 'bactéria'        , null);
insert into Especies (id, nome) values (null, 'barata');
insert into Especies (id, nome) values (null, 'carcará');
insert into Especies (id, nome) values (null, 'polvo');
insert into Especies (id, nome) values (null, 'nautilus');

 

 

insert into Animais values (null, 'ágata'        , '2015-4-9', 13.9, 'branco' , 1);
insert into Animais values (null, 'félix'        , '2016-6-6', 14.3, 'preto'  , 1);
insert into Animais values (null, 'tom'            , '2013-2-8', 11.2, 'azul'   , 1);
insert into Animais values (null, 'garfield'    , '2015-7-6', 17.1, 'laranja', 1);
insert into Animais values (null, 'frajola'        , '2013-8-1', 13.7, 'preto'  , 1);
insert into Animais values (null, 'manda-chuva'    , '2012-2-3', 12.3, 'amarelo', 1);
insert into Animais values (null, 'snowball'    , '2014-4-6', 13.2, 'preto'  , 1);
insert into Animais values (null, 'ágata'        , '2015-8-3', 11.9, 'azul'      , 1);
insert into Animais values (null, 'ágata'        , '2016-3-4', 18.6, 'roxo'  , 1);
insert into Animais values (null, 'gato de botas', '2012-12-10', 11.6, 'amarelo', 1);
insert into Animais values (null, 'bola de pelo', '2020-04-06', 11.6, 'amarelo', 2);
insert into Animais values (null, 'milu'        , '2013-2-4', 17.9, 'branco'  , 2);
insert into Animais values (null, 'pluto'        , '2012-1-3', 12.3, 'amarelo' , 2);
insert into Animais values (null, 'pateta'        , '2015-5-1', 17.7, 'preto'   , 2);
insert into Animais values (null, 'snoopy'        , '2013-7-2', 18.2, 'branco'  , 2);
insert into Animais values (null, 'bidu'        , '2012-9-8', 12.4, 'azul'    , 2);
insert into Animais values (null, 'dum dum'        , '2015-4-6', 11.2, 'laranja' , 2);
insert into Animais values (null, 'muttley'        , '2011-2-3', 14.3, 'laranja' , 2);
insert into Animais values (null, 'scooby'        , '2012-1-2', 19.9, 'marrom'  , 2);
insert into Animais values (null, 'rufus'        , '2014-4-5', 19.7, 'branco'  , 2);
insert into Animais values (null, 'costelinha'    , '2016-5-2', 13.4, 'branco'  , 2);
insert into Animais values (null, 'coragem'        , '2013-7-8', 12.2, 'vermelho', 2);
insert into Animais values (null, 'jake'        , '2012-2-7', 11.6, 'vermelho', 2);
insert into Animais values (null, 'k900'        , '2012-11-25', 11.6, 'amarelo', 2);
insert into Animais values (null, 'gato de botas', '2012-11-25', 11.6, 'amarelo', 2);
insert into Animais values (null, 'jerry'        , '2010-2-4', 06.6, 'laranja', 4);
insert into Animais values (null, 'ligeirinho'    , '2011-5-3', 04.4, 'amarelo', 4);
insert into Animais values (null, 'mikey'        , '2012-7-1', 02.2, 'preto'  , 4);
insert into Animais values (null, 'minie'        , '2013-9-3', 03.2, 'preta'  , 4);
insert into Animais values (null, 'topo gigio'    , '2016-6-8', 05.5, 'amarelo', 4);
insert into Animais values (null, 'bafo de onça', '2016-6-8', 05.5, 'amarelo', null);
insert into Animais values (null, 'susan murphy', '2016-6-8', 05.5, 'amarelo', null);
insert into Animais values (null, 'insectosauro', '2016-6-8', 05.5, 'amarelo', null);
insert into Animais values (null, 'gallaxhar'   , '2016-6-8', 05.5, 'amarelo', null);
insert into Animais values (null, 'hathaway'    , '2016-6-8', 05.5, 'amarelo', null);
insert into Animais values (null, 'tutubarão'    , '2010-2-6', 101.9 , 'branca' , 9);
insert into Animais values (null, 'prof. pardal', '2012-4-4', 1.7   , 'amarelo', 17);
insert into Animais values (null, 'mobie'        , '2014-5-2', 5069.4, 'branca' , 6);
insert into Animais values (null, 'batman'        , '2013-7-1', 96.1  , 'preto'  , 3);

-- Selecione o nome e a espécie de todos os animais
SELECT Animais.nome, Especies.nome
	from Animais JOIN Especies
    on Especies.id = Animais.especie_id;

-- Traz todos os animais, mesmo os sem espécie
SELECT Animais.nome, Especies.nome
	from Animais LEFT JOIN Especies
    on Especies.id = Animais.especie_id;

-- Traz todas as espécies, mesmo as sem animais
SELECT Animais.nome, Especies.nome
	from Animais RIGHT JOIN Especies
    on Especies.id = Animais.especie_id;

-- Selecione todos os gatos laranjas
SELECT Animais.nome, Animais.cor, Especies.nome
	from Animais LEFT JOIN Especies
    on Especies.id = Animais.especie_id
    WHERE Animais.cor = "laranja" AND
    Especies.nome = "gato";

-- Selecione todos os cachorros da cor amarelo
SELECT Animais.nome, Animais.cor, Especies.nome
	from Animais LEFT JOIN Especies
    on Especies.id = Animais.especie_id
    WHERE Animais.cor = "amarelo" AND
    Especies.nome = "cachorro";

-- Selecione todos os animais aquáticos que pesam mais de 70kg
SELECT Animais.nome, Animais.peso, Especies.nome
	from Animais LEFT JOIN Especies
    on Especies.id = Animais.especie_id
    WHERE Animais.peso > 70 AND
    Especies.nome = "baleia" or Especies.nome = "sardinha" or Especies.nome = "bacalhau" or Especies.nome = "tubarão" or Especies.nome = "lambari" or Especies.nome = "corvina"

-- Selecione todos os herbívoro ordenados pelos mais pesados
SELECT a.nome "Nome do animal", a.peso "Peso", e.alimentacao "Alimentação"
    FROM Animais a LEFT JOIN Especies e
        ON a.especie_id = e.id
	WHERE e.alimentacao = 'herbívoro'
	ORDER BY a.peso DESC;


-- Selecione todos os carnívoro que são pretos e brancos
SELECT a.nome "Nome do animal", a.cor "Cor", e.alimentacao "Alimentação"
    FROM Animais a LEFT JOIN Especies e
        ON a.especie_id = e.id
	WHERE e.alimentacao = 'carnívoro'
    AND (a.cor LIKE 'branc%' OR a.cor LIKE 'pret%');
    -- AND a.cor IN ('branco', 'branca', 'preto', 'preta'); -- alternativa


-- Selecione todos os onívoros que nasceram antes de 2013
SELECT a.nome "Nome do animal", a.data_nasc "Data de nascimento", e.alimentacao "Alimentação"
    FROM Animais a LEFT JOIN Especies e
        ON a.especie_id = e.id
	WHERE e.alimentacao = 'onívoro'
    AND YEAR(a.data_nasc) < 2013; -- mysql e sqlserver
    -- AND a.data_nasc < '2013-01-01'; -- alternativa
    -- AND EXTRACT(YEAR FROM a.data_nasc) < 2013; -- postgresql


-- Selecione todos os mamiferos que pesam mais que 10 quilos e são marrons ou azul
SELECT a.nome "Nome do animal", a.peso "Peso", a.cor "Cor", e.nome "Espécie"
    FROM Animais a LEFT JOIN Especies e
        ON a.especie_id = e.id
	WHERE (e.nome = 'gato'
        OR e.nome = 'cachorro'
        OR e.nome = 'morcego'
        OR e.nome = 'rato'
        OR e.nome = 'ramister'
        OR e.nome = 'baleia')
    AND a.peso > 10
    AND (a.cor = 'azul'
        OR a.cor = 'marrom');


-- (Desafio) Selecione a quantidade total de animais
SELECT COUNT(*) AS Total FROM Animais;


-- (Desafio) Se somarmos os peso de todos os gatos, qual será o resultado?
SELECT SUM(a.peso) AS Total 
    FROM Animais a LEFT JOIN Especies e
        ON a.especie_id = e.id
    WHERE e.nome = 'gato';