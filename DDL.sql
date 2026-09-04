CREATE DATABASE dbVendas;

USE dbVendas;
GO

CREATE TABLE Cliente(
	idCliente INT IDENTITY (1,1) NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Cpf VARCHAR(14) NOT NULL,
	Email VARCHAR(150),
	Telefone VARCHAR(20),
	DataCadastro DATETIME NOT NULL DEFAULT GETDATE(),

	CONSTRAINT PK_Cliente
		PRIMARY KEY (idCliente),

	CONSTRAINT UQ_Cliente_CPF
		UNIQUE (Cpf),
);

CREATE TABLE Produto(
	idProduto INT IDENTITY (1,1) NOT NULL,
	Descricao VARCHAR(150) NOT NULL,
	Preco DECIMAL(10,2) NOT NULL,
	Estoque INT NOT NULL DEFAULT 0,
	Ativo BIT NOT NULL DEFAULT 1,

	CONSTRAINT PK_Produto
		PRIMARY KEY (idProduto),

	CONSTRAINT CK_Produto_Preco
		CHECK (Preco > 0),

		CONSTRAINT CK_Produto_Estoque
		CHECK (Estoque >= 0),
);

CREATE TABLE Pedido(
	idPedido INT IDENTITY (1,1) NOT NULL,
	idCliente INT NOT NULL,
	DataPedido DATETIME NOT NULL DEFAULT GETDATE(),
	Status VARCHAR(20) NOT NULL DEFAULT 'ABERTO',
	ValorTotal DECIMAL(10,2) NOT NULL DEFAULT 0,

	CONSTRAINT PK_Pedido
		PRIMARY KEY (idPedido),

	CONSTRAINT FK_Pedido_Cliente
		FOREIGN KEY (idCliente)
		REFERENCES Cliente (idCliente),

	CONSTRAINT CK_Pedido_ValorTotal
		CHECK (ValorTotal > 0),
);

CREATE TABLE ItemPedido(
	idPedido INT NOT NULL,
	idProduto INT NOT NULL,
	Quantidade INT NOT NULL,
	ValorUnitario DECIMAL(10,2) NOT NULL,
	ValorTotal DECIMAL(10,2) NOT NULL,

	CONSTRAINT PK_ItemPedido
		PRIMARY KEY (idPedido,idProduto),

	CONSTRAINT FK_ItemPedido_Pedido
		FOREIGN KEY (idPedido)
		REFERENCES Pedido (idPedido),

	CONSTRAINT FK_ItemPedido_Produto
		FOREIGN KEY (idProduto)
		REFERENCES Produto (idProduto),

	CONSTRAINT CK_ItemPedido_Quantidade
		CHECK (Quantidade > 0),

	CONSTRAINT CK_ItemPedido_ValorUnitario
		CHECK (ValorUnitario > 0),

	CONSTRAINT CK_ItemPedido_ValorTotal
		CHECK (ValorTotal > 0),
);

CREATE INDEX IX_Cliente_Nome
ON Cliente(nome);
GO

CREATE INDEX IX_Produto_Descricao
ON Produto(descricao)
GO

CREATE INDEX IX_Pedido_idCliente
ON Pedido(idCliente)
GO

CREATE INDEX IX_Pedido_DataPedido
ON Pedido(DataPedido)
GO

CREATE INDEX IX_ITemPedido_idProduto
ON ItemPedido(idProduto)
GO