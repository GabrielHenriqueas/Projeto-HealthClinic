--DML - Data  Manipulation Language

--USAR O BANCO CRIADO
USE HealthClinic

--INSERIR DADOS NA TABELA

INSERT INTO TiposDeUsuario(Titulo)
VALUES
	('Administrador'),
	('Medico'),
	('Paciente');
-------------------------------------------------------------------------------------
INSERT INTO Especialidade(Titulo)
VALUES
	('Urologia'),
	('Clínica médica'),
	('Cardiologia');
-------------------------------------------------------------------------------------
INSERT INTO Clinica(NomeFantasia, CNPJ, RazaoSocial, HoraAbertura, HoraFechamento, Endereco)
VALUES
	('HealthClinic', '05.309.589/0001-28', 'HealthClinic', '09:00:00', '18:00:00','Rua Niteroi, 180 - São Caetano do Sul')
-------------------------------------------------------------------------------------
INSERT INTO Usuario(IdTiposDeUsuario, Nome, Email, Senha)
VALUES
	(1, 'Gabriel Henrique', 'gabrielhenrique@email.com', '123456'),
	(2, 'Eduardo Roque', 'eduardoroque@email.com', '123456'),
	(3, 'Carlos Costa', 'carloscosta@email.com', '123456');
-------------------------------------------------------------------------------------
INSERT INTO Paciente(IdUsuario, Idade, Telefone, RG, CPF, CEP, Endereco)
VALUES
	(3, '38', '(11) 98808-0008', '50.255.255-7', '122.122.122-58', '04858-030', 'Rua Itaberuna, 128 - São José do Rio Preto');
-------------------------------------------------------------------------------------
INSERT INTO Medico(IdUsuario, IdEspecialidade, IdClinica, CRM, Estado)
VALUES
	(2, 1, 1, '04850-08', 1);
-------------------------------------------------------------------------------------
INSERT INTO Consulta(IdPaciente, IdMedico, Situacao, Descricao, DataConsulta, HorarioConsulta)
VALUES
	(1, 1, 1, 'Paciente examinado!', '2023-10-10', '11:30:00');
-------------------------------------------------------------------------------------
INSERT INTO FeedBack(IdConsulta, Comentario)
VALUES
	(1, 'Ótima consulta!');
-------------------------------------------------------------------------------------


SELECT * FROM TiposDeUsuario
SELECT * FROM Especialidade
SELECT * FROM Clinica
SELECT * FROM Usuario
SELECT * FROM Paciente
SELECT * FROM Medico
SELECT * FROM Consulta
SELECT * FROM FeedBack