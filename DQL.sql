SELECT descricao AS descrição
FROM Produto P
WHERE P.Estoque > 67;

SELECT descricao AS descrição
FROM Produto P
WHERE P.Estoque > 67
AND P.Preco < 300.00;

SELECT descricao AS descrição
FROM Produto P
WHERE P.Estoque > 67
OR P.Preco < 300.00;

SELECT descricao AS descrição
FROM Produto P
WHERE NOT P.Estoque > 67;


SELECT descricao AS descrição
FROM Produto P
WHERE P.Estoque > 67
AND (P.Preco < 200 OR P.Estoque > 40);

SELECT * 
FROM Produto P
WHERE P.Preco < 200
ORDER BY P.Descricao;

SELECT * 
FROM Produto P
WHERE P.Preco < 200
ORDER BY P.Descricao DESC;