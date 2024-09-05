
--Exames
CREATE TABLE exame (rowid bigint auto_increment, nm_exame VARCHAR(255), PRIMARY KEY (rowid)); 
INSERT INTO exame (nm_exame) VALUES ('Acuidade Visual'), ('Urina'), ('Clinico'), ('Toxicologico');

-- Funcionarios
CREATE TABLE funcionario (rowid bigint auto_increment, nm_funcionario VARCHAR(255), PRIMARY KEY (rowid)); 
INSERT INTO funcionario (nm_funcionario) VALUES ('Alfredo'), ('Celso'), ('Dilma');

--Tabela FICHA, relacionando-se com a tabela EXAMES e a tabela FUNCIONARIO
CREATE TABLE ficha (id_ficha bigint auto_increment, id_funcionario bigint, id_exame bigint, data_exame date,
PRIMARY KEY (id_exame, id_funcionario, data_exame),
CONSTRAINT fk_ficha_exame FOREIGN KEY (id_exame) REFERENCES exame(rowid),
CONSTRAINT fk_ficha_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(rowid) ON DELETE CASCADE
);

--Inserção de 7 fichas
INSERT INTO ficha (id_funcionario, id_exame, data_exame) VALUES 
	(1, 1, '2023-03-15'), (1, 2, '2023-03-01'), (1, 3, '2023-02-27'),
 	(2, 2, '2023-02-27'), (2, 3, '2023-03-30'), (2, 4, '2023-01-15'), (2, 3, '2023-02-07');
 	
--ARRUMA ISSO CARA