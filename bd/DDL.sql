CREATE DATABASE SPMEDG;

USE SPMEDG;


CREATE TABLE  TiposUsuario
(
    idTipoUsuario    INT PRIMARY KEY IDENTITY
    ,tituloTipoUsuario    VARCHAR(200) UNIQUE NOT NULL
);


CREATE TABLE Usuarios
(
    idUsuario            INT PRIMARY KEY IDENTITY
    ,idTipoUsuario        INT FOREIGN KEY REFERENCES TiposUsuario(idTipoUsuario)
    ,nomeUsuario    VARCHAR(200) NOT NULL
    ,email                VARCHAR(200) UNIQUE NOT NULL
    ,senha                VARCHAR(200) NOT NULL
);


CREATE TABLE  Pacientes
(
    idPaciente            INT PRIMARY KEY IDENTITY
    ,idUsuario            INT FOREIGN KEY REFERENCES Usuarios (idUsuario)
    ,nome                VARCHAR(200)        NOT NULL
    ,dataNascimento        SMALLDATETIME        NOT NULL
    ,telefone            VARCHAR(18)     UNIQUE NULL
    ,RG                    VARCHAR(12)     UNIQUE    NOT NULL
    ,CPF                VARCHAR(14)  UNIQUE    NOT NULL
    ,endere�o            VARCHAR(200)        NOT NULL
);


CREATE TABLE  Especialidades
(
    idEspecialidade        INT PRIMARY KEY IDENTITY
    ,nomeEspecialidade    VARCHAR(200) NOT NULL
);


CREATE TABLE  Clinicas
(
    idClinica        INT PRIMARY KEY IDENTITY
    ,clinica        VARCHAR(200) NOT NULL
    ,razaoSocial    VARCHAR(200) NOT NULL
    ,endereco        VARCHAR(200) NOT NULL
);


CREATE TABLE  Medicos
(
    idMedico            INT PRIMARY KEY IDENTITY
    ,idUsuario            INT FOREIGN KEY REFERENCES Usuarios (idUsuario)
    ,idEspecialidade    INT FOREIGN KEY REFERENCES Especialidades (idEspecialidade)
    ,CRM                VARCHAR(10)     UNIQUE    NOT NULL
    ,nome                VARCHAR(200)        NOT NULL
    ,CNPJ                VARCHAR(18)     UNIQUE    NOT NULL
    ,idClinica            INT FOREIGN KEY REFERENCES Clinicas (idClinica)
);



CREATE TABLE  Consultas
(
    idConsulta            INT PRIMARY KEY IDENTITY
    ,idPaciente            INT FOREIGN KEY REFERENCES Pacientes  (idPaciente)
    ,idMedico            INT FOREIGN KEY REFERENCES Medicos    (idMedico)
    ,horaConsulta        TIME NOT NULL
    ,dataConsulta        DATE NOT NULL
    ,situacao            VARCHAR(200)  NOT NULL
);

drop table Medicos


--Criar fun��o (Escalar)

CREATE FUNCTION  QuantidadeDeMedicos (@Especialidades VARCHAR(200))
--Tipo de dados do retorno
RETURNS INT 
--Como
AS 
    --In�cio da fun��o
    BEGIN
    --Declarar vari�vel        --Nome           --Tipo vari�vel
    DECLARE                     @Number        INT
    --Contagem de n�meros de ids     --Da tabelas M�dicos
    SELECT  @Number = COUNT(IdMedico) FROM Medicos m
    -- Add Especialidades
    INNER JOIN Especialidades e
    --Rela��o dos ids                                        --Nome da especialidade contada
    ON m.IdEspecialidade = e.IdEspecialidade WHERE e.nomeEspecialidade = @Especialidades
    --Retornar contagem 
    RETURN @Number
--Fim 
END;



CREATE PROCEDURE idadeUsuario @Pacientes varchar(30), @idadeUsuario VARCHAR
AS
SELECT  p.nome, DATEDIFF(hour,  p.dataNascimento, getdate()) / 8766 AS Idade FROM Pacientes p
WHERE  p.nome = @Pacientes AND @idadeUsuario = @idadeUsuario;
GO

---- Fim CREATES ----

SELECT * FROM Consultas

ALTER TABLE Consultas ADD VARCHAR(20) NULL, column_c INT NULL ;