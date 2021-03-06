SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_with_oids = false;

SET search_path TO public;

TRUNCATE "usuario" CASCADE;

INSERT INTO "usuario" (id, created, ativo, email, senha, perfil) 
     VALUES ( 9999, NOW(), true, 'admin@email.com', 'd1bd2f08fead38a982aed9d4ca060152400b1b8f', 0);
     
INSERT INTO "usuario" (id, created, ativo, email, senha, perfil) 
     VALUES ( 1000, NOW(), true, 'user001@testing.com', 'd1bd2f08fead38a982aed9d4ca060152400b1b8f', 0);
     
INSERT INTO "usuario" (id, created, ativo, email, senha, perfil) 
     VALUES ( 1001, NOW(), true, 'user002@testing.com', 'd1bd2f08fead38a982aed9d4ca060152400b1b8f', 1);
     
INSERT INTO "usuario" (id, created, ativo, email, senha, perfil) 
     VALUES ( 1002, NOW(), true, 'abc@testes.com', 'd1bd2f08fead38a982aed9d4ca060152400b1b8f', 2);