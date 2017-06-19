SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_with_oids = false;

SET search_path TO public;

TRUNCATE farmacia CASCADE;

INSERT INTO farmacia(
            id, created, ativo, razao_social, nome_fantasia, cnpj, complemento, 
            email, info_complementar, inscricao_estadual, logradouro, bairro, cep,  
            numero, telefone, cidade_id)
    VALUES (1000, NOW(), true, 'Farmacias Jota e De LTDA', 'Farmacia J&D', '88080050000177', '', 
            'teste@farmaciajed.com.br', '', '64289088030', 'Rua Adalgisa', 'Vila Nilo', '02278050', 
            '465', '1136527083', 120);
            
INSERT INTO farmacia(
            id, created, ativo, razao_social, nome_fantasia, cnpj, complemento, 
            email, info_complementar, inscricao_estadual, logradouro, bairro, cep,  
            numero, telefone, cidade_id)
    VALUES (1001, NOW(), true, 'Farmacias ABC LTDA', 'Farmacia ABC', '71133423000128', 'Esquina', 
            'teste@farmaciaabc.com.br', '', '13625695744', 'Rua Prof. José Eraclico', 'Parque do Sol', '12518210', 
            '518', '12997896991', 220);
            
INSERT INTO farmacia(
            id, created, ativo, razao_social, nome_fantasia, cnpj, complemento, 
            email, info_complementar, inscricao_estadual, logradouro, bairro, cep,  
            numero, telefone, cidade_id)
    VALUES (1002, NOW(), true, 'Farmacias Atacadao', 'Farmacia Atacadão', '55238076000141', '', 
            'teste@farmaciaatacadao.com.br', '', '60293458562', 'Alameda XV', 'Vila S', '50078050', 
            '601', '1135308085', 320);
            
INSERT INTO farmacia(
            id, created, ativo, razao_social, nome_fantasia, cnpj, complemento, 
            email, info_complementar, inscricao_estadual, logradouro, bairro, cep,  
            numero, telefone, cidade_id)
    VALUES (1003, NOW(), true, 'Farmacia XYZ', 'Farmacia XYZ', '18507991000169', '', 
            'teste@farmaciaxyz.com.br', '', '07304308411', 'Rua São Manoel', 'Jardim Ana Estela', '06364540', 
            '11', '4526962741', 420);
            