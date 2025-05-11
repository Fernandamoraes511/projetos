CREATE SCHEMA Empresa;

CREATE TABLE Empresa.Funcionario (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    salario NUMERIC DEFAULT 2000 CHECK (salario >= 1000),
    data_nascimento DATE,
    email VARCHAR(100)
);

CREATE TABLE Empresa.Departamento (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE,
    gerente CHAR(11),
    FOREIGN KEY (gerente) REFERENCES Empresa.Funcionario(cpf)
);

INSERT INTO Empresa.Funcionario (cpf, nome, salario, data_nascimento, email) VALUES 
('12345678901', 'João Silva', 2000, '1985-06-15', 'joao.silva@email.com'),
('12345678902', 'Maria Oliveira', 2000, '1990-03-20', 'maria.oliveira@email.com'),
('12345678903', 'Carlos Pereira', 2000, '1988-12-05', 'carlos.pereira@email.com');

UPDATE Empresa.Funcionario SET salario = 2500 WHERE salario = 2000;

DELETE FROM Empresa.Funcionario WHERE cpf = '12345678900';

INSERT INTO Empresa.Departamento (nome, gerente) VALUES 
('Recursos Humanos', '12345678901'), 
('Desenvolvimento', '12345678902');

CREATE TABLE Empresa.Projeto (
    id_projeto SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    local VARCHAR(50),
    id_departamento INTEGER,
    FOREIGN KEY (id_departamento) REFERENCES Empresa.Departamento(id)
);

INSERT INTO Empresa.Projeto (nome, local, id_departamento) VALUES 
('Projeto A', 'São Paulo', 1), 
('Projeto B', 'Rio de Janeiro', 2);

SELECT 
    p.nome AS nome_projeto,
    d.nome AS nome_departamento,
    f.nome AS nome_gerente
FROM 
    Empresa.Projeto p
JOIN 
    Empresa.Departamento d ON p.id_departamento = d.id
JOIN 
    Empresa.Funcionario f ON d.gerente = f.cpf;