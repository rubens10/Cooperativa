SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_with_oids = false;

SET search_path TO public;

TRUNCATE associado CASCADE;

INSERT INTO associado(
            id, created, ativo, nome, rg, cpf, logradouro, numero, bairro, cep, complemento, 
            data_nascimento, telefone, celular, cidade_id)
    VALUES (1000, NOW(), true, 'Teste da Silva', '8998981 ssp', '50864151012', 'Av. Teste', '123', 'Centro', '98000111', 'Esquina',
    		'1990-01-10', '(45) 3025-2020', '(45) 9998-8999', '801');
    		
INSERT INTO associado(
            id, created, ativo, nome, rg, cpf, logradouro, numero, bairro, cep, complemento, 
            data_nascimento, telefone, celular, cidade_id)
    VALUES (1001, NOW(), true, 'João Lima de Souza', '39.224.002-6', '75587597067', 'Alameda Angelim', '934', 'Vila G', '66815205', '',
    		'1980-10-05', '(91) 3619-4729', '(91) 99601-5880', '226');
    		
INSERT INTO associado(
            id, created, ativo, nome, rg, cpf, logradouro, numero, bairro, cep, complemento, 
            data_nascimento, telefone, celular, cidade_id)
    VALUES (1002, NOW(), true, 'Augusto Lima', '150223195', '84702102117', 'Av. Brasil', '674', 'Zona Norte', '72252097', 'Casa dos fundos',
    		'1979-05-20', '(61) 3532-6835', '(61) 98830-0794', '501');
    		
INSERT INTO associado(
            id, created, ativo, nome, rg, cpf, logradouro, numero, bairro, cep, complemento, 
            data_nascimento, telefone, celular, cidade_id)
    VALUES (1003, NOW(), true, 'Ricardo Gomes', '139630879', '98269683582', 'Alameda Teste', '103', 'Zona Sul', '51152097', '',
    		'1984-04-21', '8126656579', '81991129918', '501');
