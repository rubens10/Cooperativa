SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_with_oids = false;

SET search_path TO public;

/* Inicio - Dependencias */
TRUNCATE associado CASCADE;

INSERT INTO associado(
            id, created, ativo, nome, rg, cpf, logradouro, numero, bairro, cep, complemento, 
            data_nascimento, telefone, celular, cidade_id)
    VALUES (2000, NOW(), true, 'Teste da Silva', '8998981 ssp', '50864151012', 'Av. Teste', '123', 'Centro', '98000111', 'Esquina',
    		'1990-01-10', '(45) 3025-2020', '(45) 9998-8999', '801');
    		
INSERT INTO associado(
            id, created, ativo, nome, rg, cpf, logradouro, numero, bairro, cep, complemento, 
            data_nascimento, telefone, celular, cidade_id)
    VALUES (2001, NOW(), true, 'João Lima de Souza', '39.224.002-6', '75587597067', 'Alameda Angelim', '934', 'Vila G', '66815205', '',
    		'1980-10-05', '(91) 3619-4729', '(91) 99601-5880', '226');
    		
TRUNCATE funcionario CASCADE;

INSERT INTO funcionario(
            id, created, ativo, cpf, data_nascimento, nome, 
            rg, telefone, celular)
    VALUES (2000, NOW(), true, '68377186306', '1991-06-26', 'Murilo de Freitas', 
            '10.783.555-1', '(92) 2895-5813', '(11) 98888-8889');

INSERT INTO funcionario(
            id, created, ativo, cpf, data_nascimento, nome, 
            rg, telefone, celular)
    VALUES (2001, NOW(), true, '77364392149', '1992-03-06', 'Renan César Barros', 
            '16.391.337-7', '(63) 2791-2403', '(63) 98340-0998');
/* Fim - Dependencias */

TRUNCATE atendimento CASCADE;            

INSERT INTO atendimento(
            id, created, assunto, ativo, data_conclusao, data_previsao, 
            mensagem, observacao_interna, situacao, associado_id, funcionario_id)
    VALUES (1000, NOW(), 0, true, NULL, '2017-06-20', 
            'Preciso que resolvam essa situação urgentemente', '', 0, 2000, 2001);

INSERT INTO atendimento(
            id, created, assunto, ativo, data_conclusao, data_previsao, 
            mensagem, observacao_interna, situacao, associado_id, funcionario_id)
    VALUES (1001, NOW(), 2, true, NULL, '2017-07-01', 
            'Falta resolver essa pendencia', '', 1, 2001, 2000);
            
INSERT INTO atendimento(
            id, created, assunto, ativo, data_conclusao, data_previsao, 
            mensagem, observacao_interna, situacao, associado_id, funcionario_id)
    VALUES (1002, NOW(), 1, true, NULL, NULL, 
            'Estou precisando', '', 0, 2001, 2001);
            
INSERT INTO atendimento(
            id, created, assunto, ativo, data_conclusao, data_previsao, 
            mensagem, observacao_interna, situacao, associado_id, funcionario_id)
    VALUES (1003, NOW(), 1, true, NULL, '2017-07-05', 
            'Fico no aguardo da resposta', '', 1, 2000, 2000);