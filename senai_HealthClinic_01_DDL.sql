-- DDL - Data Definition Language
--Criar Banco de Dados
CREATE DATABASE HealthClinic

--Usar Banco de Dados
USE HealthClinic

--Criar Tabelas do Banco de Dados
CREATE TABLE TiposDeUsuario
(
	IdTiposDeUsuario INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Especialidade
(
	IdEspecialidade INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Clinica
(
	IdClinica INT PRIMARY KEY IDENTITY,
	NomeFantasia VARCHAR(50) NOT NULL,
	CNPJ VARCHAR(50) NOT NULL UNIQUE,
	RazaoSocial VARCHAR(50) NOT NULL UNIQUE,
	HoraAbertura TIME NOT NULL,
	HoraFechamento TIME NOT NULL,
	Endereco VARCHAR(50) NOT NULL
);

CREATE TABLE Usuario
(
	IdUsuario INT PRIMARY KEY IDENTITY,
	IdTiposDeUsuario INT FOREIGN KEY REFERENCES TiposDeUsuario(IdTiposDeUsuario) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL UNIQUE,
	Senha VARCHAR(50) NOT NULL
);

CREATE TABLE Paciente
(
	IdPaciente INT PRIMARY KEY IDENTITY,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL,
	Idade VARCHAR(50) NOT NULL,
	Telefone VARCHAR(50) NOT NULL UNIQUE,
	RG VARCHAR(50) NOT NULL UNIQUE,
	CPF VARCHAR(50) NOT NULL UNIQUE,
	CEP VARCHAR(20) NOT NULL,
	Endereco VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Medico
(
	IdMedico INT PRIMARY KEY IDENTITY,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL,
	IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade(IdEspecialidade) NOT NULL,
	IdClinica INT FOREIGN KEY REFERENCES Clinica(IdClinica) NOT NULL,
	CRM VARCHAR(50) NOT NULL UNIQUE,
	Estado BIT DEFAULT(0)
);

CREATE TABLE Consulta
(
	IdConsulta INT PRIMARY KEY IDENTITY,
	IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente) NOT NULL,
	IdMedico INT FOREIGN KEY REFERENCES Medico(IdMedico) NOT NULL,
	Situacao BIT DEFAULT(0),
	Descricao VARCHAR(50) NOT NULL,
	DataConsulta DATE NOT NULL,
	HorarioConsulta TIME NOT NULL
);

CREATE TABLE FeedBack
(
	IdFeedBack INT PRIMARY KEY IDENTITY,
	IdConsulta INT FOREIGN KEY REFERENCES Consulta(IdConsulta) NOT NULL,
	Comentario VARCHAR(50) NOT NULL
);