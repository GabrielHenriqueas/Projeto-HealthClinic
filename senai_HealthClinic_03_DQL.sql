--DQL - Data Query Language

SELECT * FROM TiposDeUsuario
SELECT * FROM Especialidade
SELECT * FROM Clinica
SELECT * FROM Usuario
SELECT * FROM Paciente
SELECT * FROM Medico
SELECT * FROM Consulta
SELECT * FROM FeedBack

/*
SELECT
	Usuario.Nome AS [Nome do Usu�rio],
	TiposDeUsuario.TituloTipoUsuario AS [Tipo do Usu�rio],
	Evento.DataEvento AS [Data do Evento],
	Evento.HorarioEvento AS [Hor�rio do Evento],
	CONCAT (Instituicao.NomeFantasia, ' - ', Instituicao.Endereco) AS [Endere�o],
	TiposDeEvento.TituloTipoEvento AS [Tipo de Evento],
	Evento.Nome AS [Nome do Evento],
	Evento.Descricao AS [Descri��o do evento],
	CASE WHEN PresencasEventos.Situacao = 1 THEN 'CONFIRMADO' ELSE 'N�O CONFIRMADO' END AS [Presen�a],
	ComentarioEvento.Descricao AS [Comet�rio]
*/

--Criar script que exiba os seguintes dados:

	-- Id Consulta
	-- Data da Consulta
	-- Horario da Consulta
	-- Nome da Clinica
	-- Nome do Paciente
	-- Nome do Medico
	-- Especialidade do Medico
	-- CRM
	-- Prontu�rio ou Descricao
	-- FeedBack(Comentario da consulta)

USE HealthClinic

SELECT
	Consulta.IdConsulta,
	Consulta.DataConsulta,
	Consulta.HorarioConsulta,
	Clinica.NomeFantasia,
	Usuario.IdTiposDeUsuario [Nome Paciente],
	Usuario.IdTiposDeUsuario [Nome Medico],
	Especialidade.Titulo,
	Medico.CRM,
	Consulta.Descricao,
	FeedBack.Descricao

FROM Medico
	inner join Clinica ON Clinica.IdClinica = Medico.IdClinica
	inner join Consulta ON Medico.IdMedico = Consulta.IdConsulta
	inner join Paciente ON Paciente.IdPaciente = Consulta.IdPaciente
	inner join Usuario ON Usuario.IdUsuario = Medico.IdMedico
	inner join Especilidade ON Especialidade.IdEspecialidade = Medico.IdEspecialidade
	left join FeedBack ON FeedBack.IdConsulta = Consulta.IdConsulta

--Criar fun��o para retornar a quantidade de m�dicos de uma determinada especialidade
SELECT COUNT(IdMedico) AS [Numero de Medicos] FROM Medico
WHERE Medico.Especialidade = 'Cardiologista'

--Criar procedure para retornar a idade de um determinado usu�rio espec�fico
GO
CREATE PROCEDURE BuscaIdade
@BuscaIdade VARCHAR(20)
AS
SELECT Paciente.Idade FROM Paciente
SELECT Usuario.NomeUsuario FROM Usuario
WHERE @BuscaIdade = Usuario.NomeUsuario

execute BuscaIdade 'Bona';

drop procedure BuscaIdade

/*
FROM Evento
	INNER JOIN TiposDeEvento
	ON Evento.IdTipoDeEvento = TiposDeEvento.IdTipoDeEvento
	INNER JOIN Instituicao
	ON Evento.IdInstituicao = Instituicao.IdInstituicao
	INNER JOIN PresencasEventos
	ON Evento.IdEvento = PresencasEventos.IdEvento
	INNER JOIN Usuario
	ON Usuario.IdUsuario = PresencasEventos.IdUsuario
	INNER JOIN TiposDeUsuario
	ON TiposDeUsuario.IdTipoDeUsuario = Usuario.IdTipoDeUsuario
	LEFT JOIN ComentarioEvento
	ON ComentarioEvento.IdUsuario = Usuario.IdUsuario
*/