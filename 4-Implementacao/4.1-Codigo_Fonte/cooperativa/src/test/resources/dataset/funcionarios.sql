SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_with_oids = false;

SET search_path TO public;

TRUNCATE funcionario CASCADE;

INSERT INTO funcionario(
            id, created, ativo, cpf, data_nascimento, nome, 
            rg, telefone, celular)
    VALUES (1000, NOW(), true, '68377186306', '1991-06-26', 'Murilo de Freitas', 
            '10.783.555-1', '(92) 2895-5813', '(11) 98888-8889');

INSERT INTO funcionario(
            id, created, ativo, cpf, data_nascimento, nome, 
            rg, telefone, celular)
    VALUES (1001, NOW(), true, '77364392149', '1992-03-06', 'Renan César Barros', 
            '16.391.337-7', '(63) 2791-2403', '(63) 98340-0998');

INSERT INTO funcionario(
            id, created, ativo, cpf, data_nascimento, nome, 
            rg, telefone, celular)
    VALUES (1002, NOW(), true, '50834694050', '1988-01-03', 'Elias Machado Freitas', 
            '10.783.555-1', '(92) 2895-5813', '(11) 98888-8889');

INSERT INTO funcionario(
            id, created, ativo, cpf, data_nascimento, nome, 
            rg, telefone, celular)
    VALUES (1003, NOW(), true, '21845589076', '1975-11-17', 'Gustavo Gonçalves', 
            '11783000ssp', '(92) 3015-0003', '(11) 9765-8009');
