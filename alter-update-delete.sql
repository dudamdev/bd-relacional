UPDATE Pessoas SET idade = 23;
UPDATE Pessoas SET idade = 23 WHERE id = 4;

DELETE FROM Pessoas;
DELETE FROM Pessoas WHERE idade < 18;

DROP DATABASE Loja;
DROP TABLE Produtos;

DELETE  -- deleta o conteúdo mas mantém a estrutura
DROP    -- apaga o conteúdo e a estrutura

--

ALTER TABLE -- add campos, restrições, definição de um campo, remoções


-- Altere o nome do Pateta para Goofy.

UPDATE Animais SET nome = 'goofy' WHERE nome = 'pateta';

-- Altere o peso do Garfield para 10 kilogramas.
UPDATE Animais SET peso = 10 WHERE nome = 'garfield';

-- Altere a cor de todos os gatos para laranja.
UPDATE Animais SET cor = 'laranja' WHERE especie_id = 1;

-- Crie um campo altura para os animais.
ALTER TABLE Animais ADD COLUMN altura DECIMAL(5,2) CHECK (altura > 0);

-- Crie um campo observação para os animais.
ALTER TABLE Animais ADD COLUMN observacao VARCHAR(255);
	
-- Remova todos os animais que pesam mais que 200 kilogramas.
DELETE FROM Animais WHERE peso > 200;

-- Remova todos os animais que o nome inicie com a letra ‘C’.
SELECT * FROM Animais WHERE nome LIKE 'c%';
DELETE FROM Animais WHERE nome LIKE 'c%';

-- Remova o campo cor dos animais.
ALTER TABLE Animais DROP COLUMN cor;

-- Aumente o tamanho do campo nome dos animais para 80 caracteres.
ALTER TABLE Animais MODIFY nome VARCHAR(80);
SELECT * FROM information_schema.COLUMNS;

-- Remova todos os gatos e cachorros.
DELETE FROM Animais WHERE especie_id IN (1, 2);
-- SELECT * FROM Animais join Especies ON
-- Animais.id = Especies.id WHERE
-- Especies.id in (1, 2);

-- Remova o campo data de nascimento dos animais.
ALTER TABLE Animais DROP COLUMN data_nasc;

-- Remova a tabela especies.
DROP TABLE Especies;

-- Remova todos os animais.
DELETE FROM Animais;
