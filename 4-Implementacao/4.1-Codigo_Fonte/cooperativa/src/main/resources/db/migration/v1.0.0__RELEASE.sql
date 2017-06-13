--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.1

-- Started on 2017-03-07 12:37:22 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 37480)
-- Name: auditing; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA IF NOT EXISTS public;


--
-- TOC entry 2 (class 3079 OID 12623)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1 (class 3079 OID 17001)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA pg_catalog;

/*
CREATE TABLE pais (
 id_pais bigint NOT NULL,
 pais VARCHAR(20) NOT NULL
);

ALTER TABLE pais ADD CONSTRAINT PK_pais PRIMARY KEY (id_pais);

CREATE TABLE estado (
 id_estado bigint NOT NULL,
 id_pais bigint NOT NULL,
 estado VARCHAR(25) NOT NULL
);

ALTER TABLE estado ADD CONSTRAINT PK_estado PRIMARY KEY (id_estado);
ALTER TABLE estado ADD CONSTRAINT FK_estado_pais FOREIGN KEY (id_pais) REFERENCES pais (id_pais);


CREATE TABLE cidade (
 id_cidade bigint NOT NULL,
 id_estado bigint NOT NULL,
 cidade VARCHAR(50) NOT NULL
);

ALTER TABLE cidade ADD CONSTRAINT PK_cidade PRIMARY KEY (id_cidade);
ALTER TABLE cidade ADD CONSTRAINT FK_cidade_estado FOREIGN KEY (id_estado) REFERENCES estado (id_estado);


CREATE TABLE tipo_situacao (
 id_tipo_situacao bigint NOT NULL,
 situacao VARCHAR(50) NOT NULL
);

ALTER TABLE tipo_situacao ADD CONSTRAINT PK_tipo_situacao PRIMARY KEY (id_tipo_situacao);


CREATE TABLE tipo_assunto (
 id_tipo_assunto bigint NOT NULL,
 id_funcionario bigint NOT NULL,
 assunto VARCHAR(50) NOT NULL
);



CREATE TABLE associado (
 id bigint NOT NULL,
 nome VARCHAR(100) NOT NULL,
 rg VARCHAR(15) NOT NULL,
 cpf CHAR(11) NOT NULL,
 data_nascimento DATE,
 telefone VARCHAR(20),
 celular VARCHAR(20),
 cep VARCHAR(8),
 logradouro VARCHAR(50),
 numero VARCHAR(5),
 bairro VARCHAR(20),
 complemento VARCHAR(50),
 id_cidade INT,
 data_cadastro timestamp with time zone NOT NULL,
 ativo BOOLEAN,
 created timestamp with time zone,
 updated timestamp with time zone
);


CREATE TABLE farmacia (
 id bigint NOT NULL,
 id_associado bigint NOT NULL,
 razao_social VARCHAR(100) NOT NULL,
 nome_fantasia VARCHAR(100) NOT NULL,
 cnpj CHAR(10) NOT NULL,
 inscricao_estadual VARCHAR(11) NOT NULL,
 telefone VARCHAR(20),
 email VARCHAR(50),
 cep VARCHAR(8),
 logradouro VARCHAR(50),
 numero VARCHAR(5),
 bairro VARCHAR(20),
 complemento VARCHAR(50),
 id_cidade INT,
 info_complementar VARCHAR(255),
 data_cadastro DATE,
 data_atualizacao DATE,
 ativo BOOLEAN,
 created timestamp with time zone,
 updated timestamp with time zone
);

CREATE TABLE funcionario (
 id bigint NOT NULL,
 nome VARCHAR(100) NOT NULL,
 rg VARCHAR(15) NOT NULL,
 cpf CHAR(11) NOT NULL,
 data_nascimento DATE,
 telefone CHAR(20),
 celular VARCHAR(20),
 data_cadastro DATE NOT NULL,
 ativo BOOLEAN,
 created timestamp with time zone,
 updated timestamp with time zone
);

CREATE TABLE atendimento (
 id bigint NOT NULL,
 id_associado bigint NOT NULL,
 id_funcionario bigint NOT NULL,
 id_tipo_assunto bigint NOT NULL,
 id_tipo_situacao bigint NOT NULL,
 mensagem VARCHAR(255),
 obs_atendimento VARCHAR(255),
 data_cadastro DATE NOT NULL,
 data_previsao DATE,
 data_conclusao DATE,
 created timestamp with time zone,
 updated timestamp with time zone
);

CREATE TABLE usuario (
 id bigint NOT NULL,
 id_funcionario bigint NOT NULL,
 id_associado bigint NOT NULL,
 email VARCHAR(144) NOT NULL,
 senha VARCHAR(20) NOT NULL,
 perfil CHAR(10),
 ativo BOOLEAN,
 created timestamp with time zone,
 updated timestamp with time zone
);


ALTER TABLE tipo_assunto ADD CONSTRAINT PK_tipo_assunto PRIMARY KEY (id_tipo_assunto);
ALTER TABLE tipo_assunto ADD CONSTRAINT FK_tipo_assunto_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario (id);

ALTER TABLE usuario ADD CONSTRAINT PK_usuario PRIMARY KEY (id);
ALTER TABLE usuario ADD CONSTRAINT FK_usuario_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario (id);
ALTER TABLE usuario ADD CONSTRAINT FK_usuario_associado FOREIGN KEY (id_associado) REFERENCES associado (id);

ALTER TABLE associado ADD CONSTRAINT PK_associado PRIMARY KEY (id);
ALTER TABLE associado ADD CONSTRAINT FK_associado_cidade FOREIGN KEY (id_cidade) REFERENCES cidade (id_cidade);

ALTER TABLE farmacia ADD CONSTRAINT PK_farmacia PRIMARY KEY (id);
ALTER TABLE farmacia ADD CONSTRAINT FK_farmacia_associado FOREIGN KEY (id_associado) REFERENCES associado (id);
ALTER TABLE farmacia ADD CONSTRAINT FK_farmacia_cidade FOREIGN KEY (id_cidade) REFERENCES cidade (id);

ALTER TABLE funcionario ADD CONSTRAINT PK_funcionario PRIMARY KEY (id);

ALTER TABLE atendimento ADD CONSTRAINT PK_atendimento PRIMARY KEY (id);
ALTER TABLE atendimento ADD CONSTRAINT FK_atendimento_usuario FOREIGN KEY (id_funcionario,id_associado) REFERENCES usuario (id_funcionario,id_associado);
ALTER TABLE atendimento ADD CONSTRAINT FK_atendimento_assunto FOREIGN KEY (id_tipo_assunto) REFERENCES tipo_assunto (id_tipo_assunto);
ALTER TABLE atendimento ADD CONSTRAINT FK_atendimento_situacao FOREIGN KEY (id_tipo_situacao) REFERENCES tipo_situacao (id_tipo_situacao);

----------------------- 
-- DEFAULT DATA
-----------------------
INSERT INTO "public"."usuario"(
            id, created, updated, email, ativo, senha, perfil)
    VALUES (1, NOW(), null, 'admin@admin.com', TRUE, '$2a$10$bAdAVLvM.k3DqPaPYi0gnO1OffPSHLref8MElAk.u.fFQ17v9YKC2', 0);*/