--DQL - Data Query Language

SELECT * FROM TiposDeUsuario
SELECT * FROM Especialidade
SELECT * FROM Clinica
SELECT * FROM Usuario
SELECT * FROM Paciente
SELECT * FROM Medico
SELECT * FROM Consulta
SELECT * FROM FeedBack

--Criar script que exiba os seguintes dados:

	-- Id Consulta
	-- Data da Consulta
	-- Horario da Consulta
	-- Nome da Clinica
	-- Nome do Paciente
	-- Nome do Medico
	-- Especialidade do Medico
	-- CRM
	-- Prontuário ou Descricao
	-- FeedBack(Comentario da consulta)

USE HealthClinic

SELECT
	Consulta.IdConsulta,
	Consulta.DataConsulta,
	Consulta.HorarioConsulta,
	Clinica.NomeFantasia,
	P.Nome AS Paciente,
	M.Nome AS Medico,
	Especialidade.Titulo,
	Medico.CRM,
	Consulta.Descricao,
	FeedBack.Comentario

FROM Consulta
	INNER JOIN Medico ON Consulta.IdConsulta = Medico.IdMedico
	INNER JOIN Especialidade ON Especialidade.IdEspecialidade = Medico.IdEspecialidade
	INNER JOIN Clinica ON Clinica.IdClinica = Medico.IdClinica
	INNER JOIN FeedBack ON FeedBack.IdConsulta = Consulta.IdConsulta
	INNER JOIN Paciente ON Paciente.IdPaciente = Consulta.IdPaciente
	INNER JOIN Usuario M ON Medico.IdUsuario = M.IdUsuario
	INNER JOIN Usuario P ON Paciente.IdUsuario = P.IdUsuario

--Criar função para retornar a quantidade de médicos de uma determinada especialidade

create function BuscaMedico
(
	@Especialidade varchar(50)
)
returns table
as
return
(
	select
		Usuario.Nome as Médico, 
		Especialidade.Titulo as Especialidade
	
	from Especialidade
	inner join Medico on Medico.IdEspecialidade = Especialidade.IdEspecialidade
	inner join Usuario as MedicoUsuario on Medico.IdUsuario = MedicoUsuario.IdUsuario
	where Especialidade.Titulo = @Especialidade
);

select * from BuscaMedico ('Urologia');
select * from BuscaMedico ('Cardiologia');

SELECT COUNT(IdMedico) AS [Numero de Medicos] FROM Medico
WHERE Especialidade.IdEspecialidade = Medico.IdEspecialidade AND Especialidade.Titulo = 'Cardiologista'

--Criar procedure para retornar a idade de um determinado usuário específico
GO
CREATE PROCEDURE BuscaIdade
@BuscaIdade VARCHAR(20)
AS
SELECT Paciente.Idade FROM Paciente
SELECT Usuario.Nome FROM Usuario
WHERE @BuscaIdade = Usuario.Nome

EXECUTE BuscaIdade 'Carlos Costa';