--Exames
CREATE TABLE exame (rowid bigint auto_increment, nm_exame VARCHAR(255));
INSERT INTO exame (nm_exame) VALUES ('Acuidade Visual'), ('Urina'), ('Clinico'), ('Toxicologico');

-- Funcionarios
CREATE TABLE funcionario (rowid BIGINT AUTO_INCREMENT, nm_funcionario VARCHAR(255));
INSERT INTO funcionario (nm_funcionario) VALUES ('Alfredo'), ('Celso'), ('Dilma');
