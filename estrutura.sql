-- Tabela: Usuario
CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Tabela: Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    endereco TEXT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- Tabela: Entregador
CREATE TABLE Entregador (
    idEntregador INT AUTO_INCREMENT PRIMARY KEY,
    cargo VARCHAR(50) NOT NULL,
    veiculo VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL
);

-- Tabela: Cozinheiro
CREATE TABLE Cozinheiro (
    idCozinheiro INT AUTO_INCREMENT PRIMARY KEY,
    cargo VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL
);

-- Tabela: Prato
CREATE TABLE Prato (
    idPrato INT AUTO_INCREMENT PRIMARY KEY,
    nomePrato VARCHAR(100) NOT NULL,
    descricaoPrato TEXT,
    tipoPrato VARCHAR(50) NOT NULL,
    valorPrato DECIMAL(10, 2) NOT NULL,
    variante VARCHAR(50)
);

-- Tabela: Carrinho
CREATE TABLE Carrinho (
    idCarrinho INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    valorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- Tabela intermediária: Carrinho_Prato (Relacionamento muitos-para-muitos)
CREATE TABLE Carrinho_Prato (
    idCarrinho INT NOT NULL,
    idPrato INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (idCarrinho, idPrato),
    FOREIGN KEY (idCarrinho) REFERENCES Carrinho(idCarrinho),
    FOREIGN KEY (idPrato) REFERENCES Prato(idPrato)
);

-- Tabela: Pedidos
CREATE TABLE Pedidos (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    idEntregador INT,
    idCozinheiro INT,
    valorTotal DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEntregador) REFERENCES Entregador(idEntregador),
    FOREIGN KEY (idCozinheiro) REFERENCES Cozinheiro(idCozinheiro)
);

-- Tabela: Pagamento
CREATE TABLE Pagamento (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT NOT NULL,
    tipoPagamento VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    valorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido)
);

-- Dados para Usuario
INSERT INTO Usuario (userName, password, email) VALUES
('john_doe', 'senha123', 'john@example.com'),
('jane_doe', 'senha456', 'jane@example.com');

-- Dados para Cliente
INSERT INTO Cliente (idUsuario, endereco) VALUES
(1, '123 Main St'),
(2, '456 Oak St');

-- Dados para Entregador
INSERT INTO Entregador (cargo, veiculo, status) VALUES
('Motociclista', 'Moto XYZ', 'Disponível'),
('Motorista', 'Carro ABC', 'Em Entrega');

-- Dados para Cozinheiro
INSERT INTO Cozinheiro (cargo, status) VALUES
('Chef Executivo', 'Disponível'),
('Auxiliar', 'Ocupado');

-- Dados para Prato
INSERT INTO Prato (nomePrato, descricaoPrato, tipoPrato, valorPrato, variante) VALUES
('Pizza Margherita', 'Massa fina com molho de tomate e mussarela', 'Pizza', 30.50, 'Grande'),
('Hambúrguer Clássico', 'Carne bovina, alface, tomate e queijo', 'Lanche', 15.90, NULL);

-- Dados para Carrinho
INSERT INTO Carrinho (idUsuario, valorTotal) VALUES
(1, 46.40),
(2, 15.90);

-- Dados para Carrinho_Prato
INSERT INTO Carrinho_Prato (idCarrinho, idPrato, quantidade) VALUES
(1, 1, 1), -- Pizza Margherita
(1, 2, 2), -- Hambúrguer Clássico
(2, 2, 1); -- Hambúrguer Clássico

-- Dados para Pedidos
INSERT INTO Pedidos (idCliente, idEntregador, idCozinheiro, valorTotal, status) VALUES
(1, 1, 1, 46.40, 'Entregue'),
(2, 2, 2, 15.90, 'Em Preparação');

-- Dados para Pagamento
INSERT INTO Pagamento (idPedido, tipoPagamento, status, valorTotal) VALUES
(1, 'Cartão de Crédito', 'Pago', 46.40),
(2, 'Dinheiro', 'Aguardando Pagamento', 15.90);





