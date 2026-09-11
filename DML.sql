INSERT INTO Cliente(Nome, Cpf, Email, Telefone)
VALUES ('Bruno Lima','96385214775','bruno@gmail.com','+5511958032176'),
('Carla Souza','12345678900','carla.souza@gmail.com','+5511987654321'),
('Diego Fernandes','23456789011','diego.fernandes@hotmail.com','+5521998765432'),
('Fernanda Costa','34567890122','fernanda.costa@outlook.com','+5531987654123'),
('Gustavo Ribeiro','45678901233','gustavo.ribeiro@gmail.com','+5541996543210'),
('Helena Martins','56789012344','helena.martins@yahoo.com','+5551987651234'),
('Igor Oliveira','67890123455','igor.oliveira@gmail.com','+5561998234567'),
('Juliana Alves','78901234566','juliana.alves@hotmail.com','+5571987456123'),
('Lucas Pereira','89012345677','lucas.pereira@gmail.com','+5581996345678'),
('Mariana Rocha','90123456788','mariana.rocha@outlook.com','+5591987234567');

SELECT * 
FROM Cliente;

INSERT INTO Produto (Descricao,Preco,Estoque,Ativo)
VALUES 
('Notebook Dell Inspiron 15',3500.00,75,1),
('Mouse Sem Fio Logitech M170',45.90,320,1),
('Teclado Mecânico Redragon Kumara',189.00,150,1),
('Monitor LG 24" Full HD',699.00,60,1),
('SSD Kingston 480GB',249.90,200,1),
('Impressora HP DeskJet 2774',329.00,40,1),
('Fone de Ouvido JBL Tune 510BT',199.90,180,1),
('Webcam Logitech C920',379.00,90,1),
('HD Externo Seagate 1TB',329.90,110,1),
('Cadeira Gamer ThunderX3',899.00,25,0);

SELECT * 
FROM Produto;

INSERT INTO Pedido (idCliente, Status, ValorTotal)
VALUES 
(2,'Aberto',3709.90),
(1,'Concluído',1250.00),
(3,'Cancelado',899.00),
(4,'Aberto',249.90),
(2,'Enviado',699.00);

SELECT *
FROM Pedido;

INSERT INTO ItemPedido (idPedido, idProduto, Quantidade, ValorUnitario, ValorTotal)
VALUES 
(1,1,3,3500.00,10500.00),
(2,3,1,189.00,189.00),
(3,9,1,329.90,329.90),
(4,5,2,249.90,499.80),
(5,4,1,699.00,699.00);

SELECT *
FROM ItemPedido;

UPDATE Cliente
SET Email = 'ana.souza@gmail.com'
WHERE idCliente = 1;

UPDATE Cliente
SET Email = 'bruno.lima@gmail.com'
WHERE idCliente = 2;

SELECT * 
FROM Cliente;

UPDATE Produto
SET Preco = Preco * 1.10,
Estoque = 67,
Ativo = 1
WHERE idProduto = 10;

SELECT * 
FROM Produto;

DELETE 
FROM Produto
WHERE idProduto = 9;