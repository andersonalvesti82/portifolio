CREATE DATABASE IF NOT EXISTS universidadebd
	DEFAULT CHARSET = utf8
    DEFAULT COLLATE = utf8_general_ci;

USE universidadebd;

CREATE TABLE IF NOT EXISTS pessoa(
	id_pessoa INT(6) AUTO_INCREMENT PRIMARY KEY,
    Funcao ENUM("Professor", "Aluno")NOT NULL,
    Nome VARCHAR(25) NOT NULL,
    Sobrenome VARCHAR(20)NOT NULL,
    Nascimento DATE,
    Email VARCHAR(45) NOT NULL,
    Telefone INT(8) NOT NULL,
    Celular INT(9) NOT NULL,
    Endereço VARCHAR(60)NOT NULL,
    Numero INT(6)NOT NULL,
    CEP INT(6) NOT NULL,
    Cidade VARCHAR(40) NOT NULL,
    Estado ENUM( "AC","AL","AP", "AM", "BA", "CE", "ES", "GO", "MA",
    "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS",
    "RO", "RR", "SC", "SP", "SE", "TO", "DF")NOT NULL DEFAULT "SP",
     Curso_idCurso INT
 );

CREATE TABLE IF NOT EXISTS aluno (
	idAluno INT(6) AUTO_INCREMENT PRIMARY KEY,
    Status_semestre ENUM( "Aprovado", "Reprovado") NOT NULL,
    Semestre_atual INT(10) NOT NULL,
    Curso_idCurso INT,
    Pessoa_idPessoa INT
);
  
SHOW TABLES;
SHOW COLUMNS FROM pessoa;

CREATE TABLE IF NOT EXISTS curso (
	idcurso INT(6) AUTO_INCREMENT PRIMARY KEY,
    Nome_do_curso ENUM ("Analise de Sistemas", "Matemática",
	"Pedagogia", "História", "Medicina", "Psicologia", "Administração", "Zoologia")NOT NULL,
    mensalidade DECIMAL(10,2)NOT NULL, 
    Semestres INT(10) NOT NULL,
    Área ENUM("Humanas", "Exatas", "Biológicas") NOT NULL,
	Modalidade ENUM("Presencial", "Semi-presencial", "A distância")NOT NULL, 
    Tipos_de_Curso ENUM("Bacharelado", "Tecnólogo", "Licenciatura")NOT NULL
);

	DESCRIBE aluno;
	ALTER TABLE curso DROP Nome_do_curso;
    ALTER TABLE disciplina DROP idDisciplina;
    ALTER TABLE pessoa ADD FOREIGN KEY(Curso_idCurso) REFERENCES curso (idcurso);
    ALTER TABLE aluno ADD FOREIGN KEY(Curso_idCurso) REFERENCES curso (idcurso);
    ALTER TABLE aluno ADD FOREIGN KEY(Pessoa_idPessoa) REFERENCES pessoa (id_pessoa);
    ALTER TABLE disciplina ADD FOREIGN KEY (Curso_idCurso) REFERENCES curso (idcurso);
    ALTER TABLE professor ADD FOREIGN KEY (Curso_idCurso) REFERENCES curso (idcurso);
    ALTER TABLE professor ADD FOREIGN KEY (Pessoa_idPessoa) REFERENCES pessoa (id_pessoa);
    ALTER TABLE professor ADD FOREIGN KEY (Disciplina_idDisciplina) REFERENCES disciplina (idDisciplina);
    
CREATE TABLE IF NOT EXISTS professor (
	idProfessor INT(6)AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Curso_idCurso INT,
    Pessoa_idPessoa INT(6),
    Disciplina_idDisciplina INT(6)
);

CREATE TABLE IF NOT EXISTS disciplina(
	idDisciplina INT(6) AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Nome VARCHAR (45),
    Quantidade_de_Alunos INT(20),
    Semestre_Disciplina INT(10),
    Curso_idCurso INT
);
 DROP DATABASE universidadebd;
 DROP TABLE disciplina;
       
  ALTER TABLE pessoa
    ADD CONSTRAINT fk_idcurso FOREIGN KEY (curso_idcurso) REFERENCES curso(idcurso)
    
    
SELECT pessoa, nome FROM pessoa;