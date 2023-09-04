create database Universidade;
use Universidade;

create table Alunos (
	ra			int				primary key,
	nome		varchar(60)		not null,
	email		varchar(80),
	endereco	varchar(200)
);

create table Areas (
	id			int 			primary key 	AUTO_INCREMENT,
	nome		varchar(60)		not null		unique,
	descricao	varchar(200)
);

create table Cursos (
	id			int 			primary key 	AUTO_INCREMENT,
	nome		varchar(60)		not null,
	carga_h		int,

	area_id		int,

	foreign key (area_id) references Areas(id)
);

create table Matriculas (
	id			int				primary key		AUTO_INCREMENT,
	data		date			not null,	
	status		int				not null,  --  1=Ativo, 2=Concluído -1=Trancado -2=Jubilado
	aluno_ra	int,
	curso_id	int,

	foreign key (aluno_ra) references Alunos(ra),
	foreign key (curso_id) references Cursos(id)
);


create table Professores (
	id			int 			primary key 	AUTO_INCREMENT,
	nome		varchar(60)		not null,
	titulacao	varchar(20)

);

create table Disciplinas (
	id			int 			primary key 	AUTO_INCREMENT,
	nome		varchar(60)		not null,
	carga_h		int,
	curso_id	int,

	foreign key (curso_id) references Cursos(id)
);


create table Matricula_Disciplina (
	matr_id		int,
	disc_id		int,

	data		date,
	situacao	int,	-- 0=Reprovado, 1=Aprovado

	foreign key (matr_id) references Matriculas(id),
	foreign key (disc_id) references Disciplinas(id)
);

create table Prof_Disciplina (
	id			int 			primary key 	AUTO_INCREMENT,

	ano			int,
	semestre	int,

	prof_id		int,
	disc_id		int,

	foreign key (prof_id) references Professores(id),
	foreign key (disc_id) references Disciplinas(id)
);

--1– Crie uma função que ao inserir um aluno deve ter seu endereço gerado automaticamente no seguinte formato: nome.sobrenome@dominio.com

CREATE FUNCTION inserirAluno
(
    ra        INT,
    nome      VARCHAR(60), 
    sobrenome VARCHAR(60), 
    endereco  VARCHAR(200)    
)
    RETURNS VARCHAR(80)
    DETERMINISTIC
    READS SQL DATA
BEGIN
    DECLARE email VARCHAR (80);
    SET email = CONCAT(REPLACE(LOWER(nome), " ", ""), ".", REPLACE(LOWER(sobrenome), " ", ""), "@dominio.com");
    INSERT INTO Alunos VALUES (ra, nome, email, endereco);
    RETURN email;
END;

SELECT inserirAluno(1, "Eduarda", "Matos", "Rua dos Bobos");
SELECT inserirAluno(2, "João Paulo", "Falcuci", "Rua das Casas")

-- 2- Crie uma função que recebe o nome de um curso e sua área, em seguida retorna o id do curso.
CREATE FUNCTION 





-- 3- Crie uma procedure que recebe o os dados do aluno e de um curso e faz sua matrícula. Caso o aluno já esteja matriculado em um curso, essa matrícula não pode ser realizada.



