CREATE DATABASE IF NOT EXISTS consultoriomedico
	DEFAULT CHARSET = utf8
    DEFAULT COLLATE = utf8_general_ci;
    
USE consultoriomedico;

CREATE TABLE IF NOT EXISTS medico(
	idMedico INT(6) AUTO_INCREMENT PRIMARY KEY,
    CRM INT(6) NOT NULL,
    nome VARCHAR(25) NOT NULL,
    sobrenome VARCHAR(25) NOT NULL,
    telefone INT(9) NOT NULL,
    email VARCHAR(50) NOT NULL,
    especialidade ENUM("CLÍNICO GERAL", "GASTROENTEROLOGIA",
    "PEDIATRA", "ENDROCINOLOGISTA") NOT NULL
);

CREATE TABLE IF NOT EXISTS paciente(
	idPaciente INT(6) AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(25) NOT NULL,
    sobrenome VARCHAR(25) NOT NULL,
    telefone INT(9) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS consultorio(
	idConsultorio INT(6) AUTO_INCREMENT PRIMARY KEY,
    horario_marcado DATETIME NOT NULL,
    especialidade ENUM("CLÍNICO GERAL", "GASTROENTEROLOGIA",
    "PEDIATRA", "ENDROCINOLOGISTA") NOT NULL,
    Medico_idMedico INT,
    FOREIGN KEY (Medico_idMedico) REFERENCES medico(idMedico),
    Paciente_idPaciente INT,
    FOREIGN KEY (Paciente_idPaciente) REFERENCES paciente(idPaciente) 
);

SELECT FROM medico INNER JOIN paciente INNER JOIN consultorio;