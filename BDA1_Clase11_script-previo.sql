USE Negocios
GO

CREATE SCHEMA ClaseXml;
GO

CREATE TABLE ClaseXml.Usuarios (
    IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(200),
    Email VARCHAR(200),
    Celular VARCHAR(11),
    RUC VARCHAR(11),
    FechaNacimiento DATE
);

INSERT INTO ClaseXml.Usuarios (Nombre, Email, Celular, RUC, FechaNacimiento)
VALUES
('Lucas Costa', 'lucas.costa@gmail.com', '98765432101', '12345678901', '1985-02-01'),
('Gabriela Santos', 'gabriela.santos@gmail.com', '98765432102', '23456789012', '1990-07-05'),
('Rafaela Oliveira', 'rafaela.oliveira@gmail.com', '98765432103', '34567890123', '1988-11-10'),
('Leonardo Souza', 'leonardo.souza@gmail.com', '98765432104', '45678901234', '1995-04-15'),
('Isabela Rodrigues', 'isabela.rodrigues@gmail.com', '98765432105', '56789012345', '1992-09-20'),
('Pedro Ferreira', 'pedro.ferreira@gmail.com', '98765432106', '67890123456', '1987-12-25'),
('Carolina Almeida', 'carolina.almeida@gmail.com', '98765432107', '78901234567', '1994-03-30'),
('Guilherme Lima', 'guilherme.lima@gmail.com', '98765432108', '89012345678', '1989-06-03'),
('Isabella Gomes', 'isabella.gomes@gmail.com', '98765432109', '90123456789', '1996-10-08'),
('Rafaela Santos', 'rafaela.santos@gmail.com', '98765432110', '09876543210', '1991-03-12'),
('Gustavo Ferreira', 'gustavo.ferreira@gmail.com', '98765432111', '98765432109', '1986-08-17'),
('Leticia Oliveira', 'leticia.oliveira@gmail.com', '98765432112', '87654321098', '1993-01-22'),
('Marcos Silva', 'marcos.silva@gmail.com', '98765432113', '76543210987', '1988-06-27'),
('Juliana Santos', 'juliana.santos@gmail.com', '98765432114', '65432109876', '1995-11-02'),
('Daniel Almeida', 'daniel.almeida@gmail.com', '98765432115', '54321098765', '1992-04-07'),
('Patricia Lima', 'patricia.lima@gmail.com', '98765432116', '43210987654', '1987-09-12'),
('Fernando Gomes', 'fernando.gomes@gmail.com', '98765432117', '32109876543', '1994-02-17'),
('Camila Rodrigues', 'camila.rodrigues@gmail.com', '98765432118', '21098765432', '1989-07-22'),
('Gabriel Souza', 'gabriel.souza@gmail.com', '98765432119', '10987654321', '1984-12-27'),
('Sophia Alves', 'sophia.alves@gmail.com', '98765432120', '09876543212', '1991-05-31'),
('Thiago Moreira', 'thiago.moreira@gmail.com', '98765432121', '22334455667', '1983-03-01'),
('Bruna Lima', 'bruna.lima@gmail.com', '98765432122', '33445566778', '1990-09-14'),
('Vinicius Costa', 'vinicius.costa@gmail.com', '98765432123', '44556677889', '1986-06-20'),
('Amanda Rocha', 'amanda.rocha@gmail.com', '98765432124', '55667788990', '1992-12-05'),
('Luana Silva', 'luana.silva@gmail.com', '98765432125', '66778899001', '1995-01-30'),
('Enzo Oliveira', 'enzo.oliveira@gmail.com', '98765432126', '77889900112', '1991-04-18'),
('Beatriz Sousa', 'beatriz.sousa@gmail.com', '98765432127', '88990011223', '1988-08-11'),
('Felipe Ramos', 'felipe.ramos@gmail.com', '98765432128', '99001122334', '1990-02-22'),
('Larissa Gomes', 'larissa.gomes@gmail.com', '98765432129', '00112233445', '1993-05-08'),
('Eduardo Fernandes', 'eduardo.fernandes@gmail.com', '98765432130', '11223344556', '1984-06-16'),
('Natalia Alves', 'natalia.alves@gmail.com', '98765432131', '22334455661', '1996-07-13'),
('João Victor', 'joao.victor@gmail.com', '98765432132', '33445566772', '1985-10-03'),
('Aline Costa', 'aline.costa@gmail.com', '98765432133', '44556677883', '1989-03-27'),
('Cauã Martins', 'caua.martins@gmail.com', '98765432134', '55667788994', '1990-09-19'),
('Helena Rocha', 'helena.rocha@gmail.com', '98765432135', '66778899005', '1992-01-02'),
('Ricardo Souza', 'ricardo.souza@gmail.com', '98765432136', '77889900116', '1987-06-09'),
('Larissa Oliveira', 'larissa.oliveira@gmail.com', '98765432137', '88990011227', '1994-11-25'),
('Bruno Almeida', 'bruno.almeida@gmail.com', '98765432138', '99001122338', '1983-04-06'),
('Lívia Lima', 'livia.lima@gmail.com', '98765432139', '00112233449', '1989-08-30'),
('Mateus Santos', 'mateus.santos@gmail.com', '98765432140', '11223344551', '1991-12-15'),
('Yasmin Ribeiro', 'yasmin.ribeiro@gmail.com', '98765432141', '22334455662', '1986-11-11'),
('Rafael Costa', 'rafael.costa@gmail.com', '98765432142', '33445566773', '1990-04-04'),
('Ana Paula', 'ana.paula@gmail.com', '98765432143', '44556677884', '1985-07-20'),
('Diego Martins', 'diego.martins@gmail.com', '98765432144', '55667788995', '1988-02-12'),
('Julia Mendes', 'julia.mendes@gmail.com', '98765432145', '66778899006', '1993-05-28'),
('André Lima', 'andre.lima@gmail.com', '98765432146', '77889900117', '1992-09-01'),
('Valentina Rocha', 'valentina.rocha@gmail.com', '98765432147', '88990011228', '1994-03-17'),
('Henrique Ferreira', 'henrique.ferreira@gmail.com', '98765432148', '99001122339', '1986-06-23'),
('Manuela Costa', 'manuela.costa@gmail.com', '98765432149', '00112233440', '1991-10-05'),
('Samuel Souza', 'samuel.souza@gmail.com', '98765432150', '11223344552', '1987-07-09');
  --  BASE DE DATOS REALCIONADOS CON XML
DECLARE @v_Xml XML;
DECLARE @Identificador INT;

-- Leer XML como texto y convertir a XML explícitamente
SELECT @v_Xml = CONVERT(XML, BulkColumn)
FROM OPENROWSET(BULK 'C:\Users\Emilio\Downloads\Usuarios.xml', SINGLE_CLOB) AS XmlData;

-- Preparar el documento
EXEC sp_xml_preparedocument @Identificador OUTPUT, @v_Xml;

-- Consultar los nodos del XML
SELECT *
FROM OPENXML(@Identificador, '/Usuarios/Usuario', 2)
WITH (
    Nombre           VARCHAR(200),
    Email            VARCHAR(200),
    Celular          VARCHAR(11),
    RUC              VARCHAR(11),
    FechaNacimiento  VARCHAR(10)
);

-- Liberar memoria
EXEC sp_xml_removedocument @Identificador;
