---- INSERTS ----

-- Tipos de Perfis --
INSERT INTO TiposUsuario (tituloTipoUsuario)
VALUES                    ('Administrador')
                        ,('M�dico')
                        ,('Paciente');

-- PerfiS --
INSERT INTO Usuarios(idTipoUsuario, nomeUsuario, email, senha)
VALUES                (1, 'Fernando Strada',   'fernando.strada@spmedicalgroup.com.br', 'senha@123')
                    ,(2, 'Ricardo Lemos',    'ricardo.lemos@spmedicalgroup.com.br',   'senha@124')
                    ,(2, 'Roberto Possarle', 'roberto.possarle@spmedicalgroup.com.br','senha@125')
                    ,(2, 'Helena Strada',    'helena.souza@spmedicalgroup.com.br ',   'senha@126')
                    ,(3, 'Ligia',              'ligia@gmail.com',     'senha@127')
                    ,(3, 'Alexandre',          'alexandre@gmail.com', 'senha@128')
                    ,(3, 'Fernando',          'fernando@gmail.com',  'senha@129')
                    ,(3, 'Henrique',          'henrique@gmail.com',  'senha@130')
                    ,(3, 'Jo�o',              'joao@hotmail.com',     'senha@131')
                    ,(3, 'Bruno',              'bruno@gmail.com',     'senha@132')
                    ,(3, 'Mariana',              'mariana@outlook.com', 'senha@133');



-- Paciente Teste --
INSERT INTO Pacientes (idUsuario, nome, dataNascimento, telefone, RG, CPF, endere�o)
VALUES                     (5,    'Ligia',        '13/10/1983', '11 3456-7654',   '43522543-5',  '948.398.590-00',    'Rua Estado de Israel 240, S�o Paulo, Estado de S�o Paulo, 04022-000')                            
                        ,(6, 'Alexandre',    '23/07/2001', '11 98765-6543',    '32654345-7',  '735.569.440-57',    'Av. Paulista, 1578 - Bela Vista, S�o Paulo - SP, 01310-200')
                        ,(7, 'Fernando',    '10/10/1978', '11 97208-4453',    '54636525-3',  '168.393.380-02',    'Av. Ibirapuera - Indian�polis, 2927,  S�o Paulo - SP, 04029-200' )
                        ,(8, 'Henrique',    '13/10/1985', '11 3456-6543',    '54366362-5',  '143.326.547-65',    'R. Vit�ria, 120 - Vila Sao Jorge, Barueri - SP, 06402-030')
                        ,(9, 'Jo�o',          '27/08/1975', '11 7656-6377',    '53254444-1',  '913.053.480-10',    'R. Ver. Geraldo de Camargo, 66 - Santa Luzia, Ribeir�o Pires - SP, 09405-380')
                        ,(10, 'Bruno',          '21/03/1972', '11 95436-8769',    '54566266-7',  '797.992.990-04',    'Alameda dos Arapan�s, 945 - Indian�polis, S�o Paulo - SP, 04524-001')
                        ,(11, 'Mariana',        '05/03/2018', '             ',    '54566266-8',  '137.719.130-39',    'R Sao Antonio, 232 - Vila Universal, Barueri - SP, 06407-140');


-- Especialidades --
INSERT INTO Especialidades (nomeEspecialidade)
VALUES                        ('Acupuntura')
                            ,('Anestesiologia')
                            ,('Angiologia')
                            ,('Cardiologia')
                            ,('Cirurgia Cardiovascular')
                            ,('Cirurgia da M�o')
                            ,('Cirurgia do Aparelho Digestivo')
                            ,('Cirurgia Geral')
                            ,('Cirurgia Pedi�trica')
                            ,('Cirurgia Pl�stica')
                            ,('Cirurgia Tor�cica')
                            ,('Cirurgia Vascular')
                            ,('Dermatologia')
                            ,('Radioterapia')
                            ,('Urologia')
                            ,('Pediatria')
                            ,('Psiquiatria');


-- Cl�nicas --
INSERT INTO Clinicas(clinica, razaoSocial, endereco)
VALUES                ('Clinica Possarle', 'SP Medical Group', 'Av. Bar�o Limeira, 532, S�o Paulo, SP' );

SELECT * FROM Consultas WHERE idMedico = 6

SELECT * FROM Usuarios

SELECT * FROM Pacientes

SELECT * FROM Medicos

-- M�dico --
INSERT INTO Medicos (idUsuario, idEspecialidade, CRM, nome, CNPJ, idClinica)
VALUES                (2, 2,   '54356-SP', 'Ricardo Lemos',    '86.400.902/0001-30', 1)
                    ,(3, 17, '53452-SP', 'Roberto Possarle', '86.400.903/0001-30', 1)
                    ,(4, 16, '65463-SP', 'Helena Strada',    '86.400.904/0001-30', 1);


--Consulta Teste --

INSERT INTO Consultas (idPaciente, idMedico, dataConsulta, horaConsulta, situacao)
VALUES                   (7, 3, '20/01/2020', '15:00', 'Realizada' )
                       ,(2, 2, '06/01/2020', '10:00', 'Cancelada' )
                       ,(3, 2, '07/02/2020', '11:00', 'Realizada' )
                       ,(2, 2, '06/02/2018', '10:00', 'Realizada' )
                       ,(4, 1, '07/02/2019', '11:00', 'Cancelada' )
                       ,(7, 3, '08/03/2020', '15:00', 'Agendada' )
                       ,(4, 1, '09/03/2020', '11:00', 'Agendada' );

---- FIM INSERTS ----
� 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About