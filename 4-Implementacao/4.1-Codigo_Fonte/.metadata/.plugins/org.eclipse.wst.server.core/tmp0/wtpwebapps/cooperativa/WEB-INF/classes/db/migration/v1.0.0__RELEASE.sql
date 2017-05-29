CREATE TABLE pais (
 id_pais INT NOT NULL,
 pais VARCHAR(20) NOT NULL
);

ALTER TABLE pais ADD CONSTRAINT PK_pais PRIMARY KEY (id_pais);

CREATE TABLE estado (
 id_estado INT NOT NULL,
 id_pais INT NOT NULL,
 estado VARCHAR(25) NOT NULL
);

ALTER TABLE estado ADD CONSTRAINT PK_estado PRIMARY KEY (id_estado);
ALTER TABLE estado ADD CONSTRAINT FK_estado_pais FOREIGN KEY (id_pais) REFERENCES pais (id_pais);


CREATE TABLE cidade (
 id_cidade INT NOT NULL,
 id_estado INT NOT NULL,
 cidade VARCHAR(50) NOT NULL
);

ALTER TABLE cidade ADD CONSTRAINT PK_cidade PRIMARY KEY (id_cidade);
ALTER TABLE cidade ADD CONSTRAINT FK_cidade_estado FOREIGN KEY (id_estado) REFERENCES estado (id_estado);


CREATE TABLE tipo_situacao (
 id_tipo_situacao INT NOT NULL,
 situacao VARCHAR(50) NOT NULL
);

ALTER TABLE tipo_situacao ADD CONSTRAINT PK_tipo_situacao PRIMARY KEY (id_tipo_situacao);


CREATE TABLE tipo_assunto (
 id_tipo_assunto INT NOT NULL,
 id_funcionario INT NOT NULL,
 assunto VARCHAR(50) NOT NULL
);

ALTER TABLE tipo_assunto ADD CONSTRAINT PK_tipo_assunto PRIMARY KEY (id_tipo_assunto);
ALTER TABLE tipo_assunto ADD CONSTRAINT FK_tipo_assunto_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario);


CREATE TABLE usuario (
 id_funcionario INT NOT NULL,
 id_associado INT NOT NULL,
 email VARCHAR(144) NOT NULL,
 senha VARCHAR(20) NOT NULL,
 perfil CHAR(10),
 ativo BOOLEAN
);

ALTER TABLE usuario ADD CONSTRAINT PK_usuario PRIMARY KEY (id_funcionario,id_associado);
ALTER TABLE usuario ADD CONSTRAINT FK_usuario_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario);
ALTER TABLE usuario ADD CONSTRAINT FK_usuario_associado FOREIGN KEY (id_associado) REFERENCES associado (id);


CREATE TABLE associado (
 id INT NOT NULL,
 nome VARCHAR(100) NOT NULL,
 rg VARCHAR(15) NOT NULL,
 cpf CHAR(11) NOT NULL,
 data_nascimento DATE,
 telefone VARCHAR(20),
 celular VARCHAR(20),
 cep CHAR(8),
 logradouro VARCHAR(50),
 numero VARCHAR(5),
 bairro VARCHAR(20),
 complemento VARCHAR(50),
 id_cidade INT,
 data_cadastro DATE NOT NULL,
 ativo BOOLEAN
);

ALTER TABLE associado ADD CONSTRAINT PK_associado PRIMARY KEY (id);
ALTER TABLE associado ADD CONSTRAINT FK_associado_cidade FOREIGN KEY (id_cidade) REFERENCES cidade (id_cidade);


CREATE TABLE famarcia (
 id_farmacia INT NOT NULL,
 id_associado INT NOT NULL,
 razao_social VARCHAR(100) NOT NULL,
 nome_fantasia VARCHAR(100) NOT NULL,
 cnpj CHAR(10) NOT NULL,
 inscricao_estadual VARCHAR(11) NOT NULL,
 telefone VARCHAR(20),
 email VARCHAR(50),
 cep CHAR(8),
 logradouro VARCHAR(50),
 numero VARCHAR(5),
 bairro VARCHAR(20),
 complemento VARCHAR(50),
 id_cidade INT,
 info_complementar VARCHAR(255),
 data_cadastro DATE,
 ativo BOOLEAN
);

ALTER TABLE famarcia ADD CONSTRAINT PK_famarcia PRIMARY KEY (id_farmacia);
ALTER TABLE famarcia ADD CONSTRAINT FK_famarcia_associado FOREIGN KEY (id_associado) REFERENCES associado (id);
ALTER TABLE famarcia ADD CONSTRAINT FK_famarcia_cidade FOREIGN KEY (id_cidade) REFERENCES cidade (id_cidade);


CREATE TABLE funcionario (
 id_funcionario INT NOT NULL,
 nome VARCHAR(100) NOT NULL,
 rg VARCHAR(15) NOT NULL,
 cpf CHAR(11) NOT NULL,
 data_nascimento DATE,
 telefone CHAR(20),
 celular VARCHAR(20),
 data_cadastro DATE NOT NULL,
 ativo BOOLEAN
);

ALTER TABLE funcionario ADD CONSTRAINT PK_funcionario PRIMARY KEY (id_funcionario);


CREATE TABLE atendimento (
 id_atendimento INT NOT NULL,
 id_associado INT NOT NULL,
 id_funcionario INT NOT NULL,
 id_tipo_assunto INT NOT NULL,
 id_tipo_situacao INT NOT NULL,
 mensagem VARCHAR(255),
 obs_atendimento VARCHAR(255),
 data_cadastro DATE NOT NULL,
 data_previsao DATE,
 data_conclusao DATE
);

ALTER TABLE atendimento ADD CONSTRAINT PK_atendimento PRIMARY KEY (id_atendimento);
ALTER TABLE atendimento ADD CONSTRAINT FK_atendimento_usuario FOREIGN KEY (id_funcionario,id_associado) REFERENCES usuario (id_funcionario,id_associado);
ALTER TABLE atendimento ADD CONSTRAINT FK_atendimento_assunto FOREIGN KEY (id_tipo_assunto) REFERENCES tipo_assunto (id_tipo_assunto);
ALTER TABLE atendimento ADD CONSTRAINT FK_atendimento_situacao FOREIGN KEY (id_tipo_situacao) REFERENCES tipo_situacao (id_tipo_situacao);