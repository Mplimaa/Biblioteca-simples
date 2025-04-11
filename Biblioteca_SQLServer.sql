--Criação do Banco
CREATE DATABASE Biblioteca

-- Criação das tabelas
CREATE TABLE Livros (
    IdLivro INT IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(255),
    Autor NVARCHAR(100),
    AnoPublicacao INT,
    Genero NVARCHAR(50)
);

CREATE TABLE Usuarios (
    IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100),
    Email NVARCHAR(100),
    DataCadastro DATE
);

CREATE TABLE Emprestimos (
    IdEmprestimo INT IDENTITY(1,1) PRIMARY KEY,
    IdUsuario INT,
    IdLivro INT,
    DataEmprestimo DATE,
    DataDevolucao DATE,
    CONSTRAINT FK_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario),
    CONSTRAINT FK_Livro FOREIGN KEY (IdLivro) REFERENCES Livros(IdLivro)
);

-- Inserção de dados
INSERT INTO Livros (Titulo, Autor, AnoPublicacao, Genero)
VALUES 
('Dom Casmurro', 'Machado de Assis', 1899, 'Romance'),
('O Cortiço', 'Aluísio Azevedo', 1890, 'Naturalismo'),
('A Hora da Estrela', 'Clarice Lispector', 1977, 'Drama');

INSERT INTO Usuarios (Nome, Email, DataCadastro)
VALUES 
('João Silva', 'joao@email.com', GETDATE()),
('Maria Souza', 'maria@email.com', GETDATE());

INSERT INTO Emprestimos (IdUsuario, IdLivro, DataEmprestimo, DataDevolucao)
VALUES 
(1, 2, '2025-04-01', '2025-04-10'),
(2, 1, '2025-04-05', NULL);
