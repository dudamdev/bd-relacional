USE Empresa;

-- Crie uma SP que exibe o preço médio dos produtos.
CREATE PROCEDURE averagePrice()
    SELECT ROUND(AVG(valor), 2) AS "Preço Médio" FROM produtos;

CALL averagePrice();

-- Crie uma SP que ao passar uma marca como parâmetro retorna todos os produtos daquela marca
CREATE PROCEDURE brandProduct(marca VARCHAR(50))
    SELECT nome_prod, nome_marca 
    FROM produtos JOIN marcas
    ON produtos.marca_id = marcas.marca_id
    WHERE marcas.nome_marca LIKE marca;

CALL brandProduct("labra");
DROP PROCEDURE brandProduct;

-- Crie uma SP que receba dois valores (um menor e outro maior) como parâmetro e retorne todos os produtos com a quantidade dentro do intervalo dos dois valores fornecidos como parâmetros.
CREATE PROCEDURE productAmount(min int, max int)
    SELECT nome_prod, qtd_estoque
    FROM produtos
    WHERE qtd_estoque >= min AND qtd_estoque <= max;

CALL productAmount(1, 100);

DELIMITER //
-- Crie uma SP onde após um novo registro na tabela produto_fornecedor for criado, ele exibe o nome do produto e o nome do fornecedor que acabou de ser registrado.
CREATE PROCEDURE productSupplier(idProd int, idForn int )
    BEGIN
        INSERT INTO produto_fornecedor VALUES (idProd, idForn);
        SELECT produtos.nome_prod, fornecedores.nome_forn
        FROM produtos 
        JOIN produto_fornecedor
            ON produtos.prod_id = produto_fornecedor.prod_id
        JOIN fornecedores
            ON produto_fornecedor.prod_id = fornecedores.forn_id
        WHERE produtos.prod_id = idProd;
    END

CALL productSupplier(7, 7);
DROP PROCEDURE productSupplier;

-- Crie uma SP que receba como parâmetro o nome de um fornecedor e insira automaticamente o nome do fornecedor e um e-mail no formato nome_fornecedor@nome_fornecedor.com.br na tabela fornecedores.

CREATE PROCEDURE insertSupplier(fornName VARCHAR(50))
    BEGIN
        DECLARE fornEmail VARCHAR(50);
        SET fornEmail = CONCAT(REPLACE(LOWER(fornName), ' ', ''), '@', REPLACE(LOWER(fornName), ' ', ''), '.com.br');
        INSERT INTO fornecedores (nome_forn, email) VALUES (fornName, fornEmail);

        SELECT CONCAT('Usuário ', fornName, ' inserido com o email ', fornEmail) AS Mensagem;
    END




