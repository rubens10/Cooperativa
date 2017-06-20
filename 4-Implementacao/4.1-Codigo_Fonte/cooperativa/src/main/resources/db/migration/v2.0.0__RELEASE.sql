--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- Started on 2017-06-19 21:00:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1 (class 3079 OID 25456)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA pg_catalog;


--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 25421)
-- Name: associado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE associado (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone,
    ativo boolean NOT NULL,
    bairro character varying(20),
    celular character varying(20),
    cep character varying(8),
    complemento character varying(50),
    cpf character varying(11) NOT NULL,
    data_nascimento date,
    logradouro character varying(50),
    nome character varying(100) NOT NULL,
    numero character varying(5),
    rg character varying(15) NOT NULL,
    telefone character varying(20),
    cidade_id bigint NOT NULL
);


ALTER TABLE associado OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 25419)
-- Name: associado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE associado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE associado_id_seq OWNER TO postgres;

--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 182
-- Name: associado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE associado_id_seq OWNED BY associado.id;


--
-- TOC entry 192 (class 1259 OID 26035)
-- Name: atendimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE atendimento (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone,
    ativo boolean NOT NULL,
    data_conclusao timestamp without time zone,
    data_previsao timestamp without time zone,
    mensagem character varying(500) NOT NULL,
    observacao_interna character varying(500),
    situacao integer NOT NULL,
    associado_id bigint,
    funcionario_id bigint,
    assunto integer NOT NULL
);


ALTER TABLE atendimento OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 26033)
-- Name: atendimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE atendimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE atendimento_id_seq OWNER TO postgres;

--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 191
-- Name: atendimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE atendimento_id_seq OWNED BY atendimento.id;


--
-- TOC entry 194 (class 1259 OID 26064)
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cidade (
    id bigint NOT NULL,
    created timestamp without time zone,
    updated timestamp without time zone,
    nome character varying(250),
    id_estado bigint NOT NULL
);


ALTER TABLE cidade OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 26062)
-- Name: cidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cidade_id_seq OWNER TO postgres;

--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 193
-- Name: cidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cidade_id_seq OWNED BY cidade.id;


--
-- TOC entry 196 (class 1259 OID 26075)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estado (
    id bigint NOT NULL,
    created timestamp without time zone,
    updated timestamp without time zone,
    nome character varying(250),
    sigla character varying(2),
    id_pais bigint NOT NULL
);


ALTER TABLE estado OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 26073)
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estado_id_seq OWNER TO postgres;

--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 195
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_id_seq OWNED BY estado.id;


--
-- TOC entry 185 (class 1259 OID 25429)
-- Name: farmacia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE farmacia (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone,
    ativo boolean NOT NULL,
    bairro character varying(20) NOT NULL,
    cep character varying(8) NOT NULL,
    cnpj character varying(14) NOT NULL,
    complemento character varying(50),
    email character varying(50) NOT NULL,
    info_complementar character varying(255),
    inscricao_estadual character varying(11) NOT NULL,
    logradouro character varying(50) NOT NULL,
    nome_fantasia character varying(100) NOT NULL,
    numero character varying(5) NOT NULL,
    razao_social character varying(100) NOT NULL,
    telefone character varying(20) NOT NULL,
    cidade_id bigint NOT NULL
);


ALTER TABLE farmacia OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 25427)
-- Name: farmacia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE farmacia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE farmacia_id_seq OWNER TO postgres;

--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 184
-- Name: farmacia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE farmacia_id_seq OWNED BY farmacia.id;


--
-- TOC entry 187 (class 1259 OID 25440)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcionario (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone,
    ativo boolean NOT NULL,
    celular character varying(20),
    cpf character varying(11) NOT NULL,
    data_nascimento date,
    nome character varying(100) NOT NULL,
    rg character varying(15) NOT NULL,
    telefone character varying(20)
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 25438)
-- Name: funcionario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funcionario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funcionario_id_seq OWNER TO postgres;

--
-- TOC entry 2218 (class 0 OID 0)
-- Dependencies: 186
-- Name: funcionario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funcionario_id_seq OWNED BY funcionario.id;


--
-- TOC entry 198 (class 1259 OID 26090)
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pais (
    id bigint NOT NULL,
    created timestamp without time zone,
    updated timestamp without time zone,
    nome character varying(250),
    sigla character varying(2)
);


ALTER TABLE pais OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 26088)
-- Name: pais_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pais_id_seq OWNER TO postgres;

--
-- TOC entry 2219 (class 0 OID 0)
-- Dependencies: 197
-- Name: pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pais_id_seq OWNED BY pais.id;


--
-- TOC entry 190 (class 1259 OID 25980)
-- Name: schema_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schema_version (
    version_rank integer NOT NULL,
    installed_rank integer NOT NULL,
    version character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE schema_version OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 25448)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone,
    ativo boolean NOT NULL,
    email character varying(144) NOT NULL,
    perfil integer NOT NULL,
    senha character varying(100) NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 25446)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO postgres;

--
-- TOC entry 2220 (class 0 OID 0)
-- Dependencies: 188
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- TOC entry 2037 (class 2604 OID 25424)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY associado ALTER COLUMN id SET DEFAULT nextval('associado_id_seq'::regclass);


--
-- TOC entry 2042 (class 2604 OID 26038)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atendimento ALTER COLUMN id SET DEFAULT nextval('atendimento_id_seq'::regclass);


--
-- TOC entry 2043 (class 2604 OID 26067)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade ALTER COLUMN id SET DEFAULT nextval('cidade_id_seq'::regclass);


--
-- TOC entry 2044 (class 2604 OID 26078)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado ALTER COLUMN id SET DEFAULT nextval('estado_id_seq'::regclass);


--
-- TOC entry 2038 (class 2604 OID 25432)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY farmacia ALTER COLUMN id SET DEFAULT nextval('farmacia_id_seq'::regclass);


--
-- TOC entry 2039 (class 2604 OID 25443)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario ALTER COLUMN id SET DEFAULT nextval('funcionario_id_seq'::regclass);


--
-- TOC entry 2045 (class 2604 OID 26093)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais ALTER COLUMN id SET DEFAULT nextval('pais_id_seq'::regclass);


--
-- TOC entry 2040 (class 2604 OID 25451)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- TOC entry 2190 (class 0 OID 25421)
-- Dependencies: 183
-- Data for Name: associado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO associado (id, created, updated, ativo, bairro, celular, cep, complemento, cpf, data_nascimento, logradouro, nome, numero, rg, telefone, cidade_id) VALUES (5, '2017-06-19 00:32:09.586', '2017-06-19 11:21:33.327', true, 'Jd. Panorama', '45 99983030', '85856560', NULL, '06701762905', '1993-11-05', 'Rua Manoel Moreira Andrion', 'Rubens Tavares Lopes', '560', '97823190 ssp', '45 30253030', 261);
INSERT INTO associado (id, created, updated, ativo, bairro, celular, cep, complemento, cpf, data_nascimento, logradouro, nome, numero, rg, telefone, cidade_id) VALUES (6, '2017-06-19 04:05:34.998', '2017-06-19 16:06:36.134', false, 'Centro', '45 99983030', '19181919', NULL, '11528410092', '1990-11-13', 'Av. Teste', 'Teste de Souza', '3030', '51651651', '45 30303030', 827);
INSERT INTO associado (id, created, updated, ativo, bairro, celular, cep, complemento, cpf, data_nascimento, logradouro, nome, numero, rg, telefone, cidade_id) VALUES (8, '2017-06-19 16:08:00.479', '2017-06-19 16:09:00.992', false, 'Centro', '45 99983030', '81819198', NULL, '06701762905', '1974-12-10', 'Rua XYZ', 'Associado teste', '321', '681191', '45 30253030', 1545);
INSERT INTO associado (id, created, updated, ativo, bairro, celular, cep, complemento, cpf, data_nascimento, logradouro, nome, numero, rg, telefone, cidade_id) VALUES (7, '2017-06-19 15:02:44.542', '2017-06-19 16:10:03.882', true, 'XV', '45 9897-9798', '85000000', NULL, '38575098055', '1992-10-15', 'Rua XV de Novembro', 'João da Silva Xavier', '15', '851981981', '45 3030-3132', 147);


--
-- TOC entry 2221 (class 0 OID 0)
-- Dependencies: 182
-- Name: associado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('associado_id_seq', 8, true);


--
-- TOC entry 2199 (class 0 OID 26035)
-- Dependencies: 192
-- Data for Name: atendimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO atendimento (id, created, updated, ativo, data_conclusao, data_previsao, mensagem, observacao_interna, situacao, associado_id, funcionario_id, assunto) VALUES (1, '2017-06-19 02:53:43.764', NULL, true, NULL, NULL, 'Testes', NULL, 2, 5, 4, 0);
INSERT INTO atendimento (id, created, updated, ativo, data_conclusao, data_previsao, mensagem, observacao_interna, situacao, associado_id, funcionario_id, assunto) VALUES (2, '2017-06-19 03:03:31.925', '2017-06-19 10:31:48.707', true, '2017-06-29 21:00:00', '2017-06-21 21:00:00', 'Testes', NULL, 1, 5, 4, 1);
INSERT INTO atendimento (id, created, updated, ativo, data_conclusao, data_previsao, mensagem, observacao_interna, situacao, associado_id, funcionario_id, assunto) VALUES (3, '2017-06-19 03:04:49.082', '2017-06-19 11:22:03.87', true, '2017-06-26 09:00:00', '2017-06-23 09:00:00', 'Testando', NULL, 3, 6, 4, 1);
INSERT INTO atendimento (id, created, updated, ativo, data_conclusao, data_previsao, mensagem, observacao_interna, situacao, associado_id, funcionario_id, assunto) VALUES (4, '2017-06-19 15:08:47.691', '2017-06-19 16:12:09.779', true, '2017-06-28 09:00:00', '2017-06-20 09:00:00', 'Testess', NULL, 3, 7, 5, 1);
INSERT INTO atendimento (id, created, updated, ativo, data_conclusao, data_previsao, mensagem, observacao_interna, situacao, associado_id, funcionario_id, assunto) VALUES (5, '2017-06-19 19:44:58.78', NULL, true, '2017-06-19 09:00:00', '2000-11-20 10:00:00', 'testes', NULL, 2, 5, 4, 2);
INSERT INTO atendimento (id, created, updated, ativo, data_conclusao, data_previsao, mensagem, observacao_interna, situacao, associado_id, funcionario_id, assunto) VALUES (6, '2017-06-19 20:06:21.558', NULL, true, '2017-10-20 10:00:00', '2017-10-10 09:00:00', 'Teste', NULL, 1, 5, 4, 1);


--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 191
-- Name: atendimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('atendimento_id_seq', 7, true);


--
-- TOC entry 2201 (class 0 OID 26064)
-- Dependencies: 194
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1, NULL, NULL, 'Acrelândia', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2, NULL, NULL, 'Assis Brasil', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3, NULL, NULL, 'Brasiléia', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4, NULL, NULL, 'Bujari', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5, NULL, NULL, 'Capixaba', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (6, NULL, NULL, 'Cruzeiro do Sul', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (7, NULL, NULL, 'Epitaciolândia', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (8, NULL, NULL, 'Feijó', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (9, NULL, NULL, 'Jordão', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (10, NULL, NULL, 'Mâncio Lima', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (11, NULL, NULL, 'Manoel Urbano', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (12, NULL, NULL, 'Marechal Thaumaturgo', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (13, NULL, NULL, 'Plácido de Castro', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (14, NULL, NULL, 'Porto Acre', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (15, NULL, NULL, 'Porto Walter', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (16, NULL, NULL, 'Rio Branco', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (17, NULL, NULL, 'Rodrigues Alves', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (18, NULL, NULL, 'Santa Rosa do Purus', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (19, NULL, NULL, 'Sena Madureira', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (20, NULL, NULL, 'Senador Guiomard', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (21, NULL, NULL, 'Tarauacá', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (22, NULL, NULL, 'Xapuri', 1);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (23, NULL, NULL, 'Água Branca', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (24, NULL, NULL, 'Anadia', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (25, NULL, NULL, 'Arapiraca', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (26, NULL, NULL, 'Atalaia', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (27, NULL, NULL, 'Barra de Santo Antônio', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (28, NULL, NULL, 'Barra de São Miguel', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (29, NULL, NULL, 'Batalha', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (30, NULL, NULL, 'Belém', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (31, NULL, NULL, 'Belo Monte', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (32, NULL, NULL, 'Boca da Mata', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (33, NULL, NULL, 'Branquinha', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (34, NULL, NULL, 'Cacimbinhas', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (35, NULL, NULL, 'Cajueiro', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (36, NULL, NULL, 'Campestre', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (37, NULL, NULL, 'Campo Alegre', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (38, NULL, NULL, 'Campo Grande', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (39, NULL, NULL, 'Canapi', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (40, NULL, NULL, 'Capela', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (41, NULL, NULL, 'Carneiros', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (42, NULL, NULL, 'Chã Preta', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (43, NULL, NULL, 'Coité do Nóia', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (44, NULL, NULL, 'Colônia Leopoldina', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (45, NULL, NULL, 'Coqueiro Seco', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (46, NULL, NULL, 'Coruripe', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (47, NULL, NULL, 'Craíbas', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (48, NULL, NULL, 'Delmiro Gouveia', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (49, NULL, NULL, 'Dois Riachos', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (50, NULL, NULL, 'Estrela de Alagoas', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (51, NULL, NULL, 'Feira Grande', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (52, NULL, NULL, 'Feliz Deserto', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (53, NULL, NULL, 'Flexeiras', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (54, NULL, NULL, 'Girau do Ponciano', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (55, NULL, NULL, 'Ibateguara', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (56, NULL, NULL, 'Igaci', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (57, NULL, NULL, 'Igreja Nova', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (58, NULL, NULL, 'Inhapi', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (59, NULL, NULL, 'Jacaré dos Homens', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (60, NULL, NULL, 'Jacuípe', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (61, NULL, NULL, 'Japaratinga', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (62, NULL, NULL, 'Jaramataia', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (63, NULL, NULL, 'Joaquim Gomes', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (64, NULL, NULL, 'Jundiá', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (65, NULL, NULL, 'Junqueiro', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (66, NULL, NULL, 'Lagoa da Canoa', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (67, NULL, NULL, 'Limoeiro de Anadia', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (68, NULL, NULL, 'Maceió', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (69, NULL, NULL, 'Major Isidoro', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (70, NULL, NULL, 'Mar Vermelho', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (71, NULL, NULL, 'Maragogi', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (72, NULL, NULL, 'Maravilha', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (73, NULL, NULL, 'Marechal Deodoro', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (74, NULL, NULL, 'Maribondo', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (75, NULL, NULL, 'Mata Grande', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (76, NULL, NULL, 'Matriz de Camaragibe', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (77, NULL, NULL, 'Messias', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (78, NULL, NULL, 'Minador do Negrão', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (79, NULL, NULL, 'Monteirópolis', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (80, NULL, NULL, 'Murici', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (81, NULL, NULL, 'Novo Lino', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (82, NULL, NULL, 'Olho d`Água das Flores', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (83, NULL, NULL, 'Olho d`Água do Casado', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (84, NULL, NULL, 'Olho d`Água Grande', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (85, NULL, NULL, 'Olivença', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (86, NULL, NULL, 'Ouro Branco', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (87, NULL, NULL, 'Palestina', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (88, NULL, NULL, 'Palmeira dos Índios', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (89, NULL, NULL, 'Pão de Açúcar', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (90, NULL, NULL, 'Pariconha', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (91, NULL, NULL, 'Paripueira', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (92, NULL, NULL, 'Passo de Camaragibe', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (93, NULL, NULL, 'Paulo Jacinto', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (94, NULL, NULL, 'Penedo', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (95, NULL, NULL, 'Piaçabuçu', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (96, NULL, NULL, 'Pilar', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (97, NULL, NULL, 'Pindoba', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (98, NULL, NULL, 'Piranhas', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (99, NULL, NULL, 'Poço das Trincheiras', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (100, NULL, NULL, 'Porto Calvo', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (101, NULL, NULL, 'Porto de Pedras', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (102, NULL, NULL, 'Porto Real do Colégio', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (103, NULL, NULL, 'Quebrangulo', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (104, NULL, NULL, 'Rio Largo', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (105, NULL, NULL, 'Roteiro', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (106, NULL, NULL, 'Santa Luzia do Norte', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (107, NULL, NULL, 'Santana do Ipanema', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (108, NULL, NULL, 'Santana do Mundaú', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (109, NULL, NULL, 'São Brás', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (110, NULL, NULL, 'São José da Laje', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (111, NULL, NULL, 'São José da Tapera', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (112, NULL, NULL, 'São Luís do Quitunde', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (113, NULL, NULL, 'São Miguel dos Campos', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (114, NULL, NULL, 'São Miguel dos Milagres', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (115, NULL, NULL, 'São Sebastião', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (116, NULL, NULL, 'Satuba', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (117, NULL, NULL, 'Senador Rui Palmeira', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (118, NULL, NULL, 'Tanque d`Arca', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (119, NULL, NULL, 'Taquarana', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (120, NULL, NULL, 'Teotônio Vilela', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (121, NULL, NULL, 'Traipu', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (122, NULL, NULL, 'União dos Palmares', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (123, NULL, NULL, 'Viçosa', 2);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (124, NULL, NULL, 'Amapá', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (125, NULL, NULL, 'Calçoene', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (126, NULL, NULL, 'Cutias', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (127, NULL, NULL, 'Ferreira Gomes', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (128, NULL, NULL, 'Itaubal', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (129, NULL, NULL, 'Laranjal do Jari', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (130, NULL, NULL, 'Macapá', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (131, NULL, NULL, 'Mazagão', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (132, NULL, NULL, 'Oiapoque', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (133, NULL, NULL, 'Pedra Branca do Amaparí', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (134, NULL, NULL, 'Porto Grande', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (135, NULL, NULL, 'Pracuúba', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (136, NULL, NULL, 'Santana', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (137, NULL, NULL, 'Serra do Navio', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (138, NULL, NULL, 'Tartarugalzinho', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (139, NULL, NULL, 'Vitória do Jari', 3);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (140, NULL, NULL, 'Alvarães', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (141, NULL, NULL, 'Amaturá', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (142, NULL, NULL, 'namã', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (143, NULL, NULL, 'Anori', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (144, NULL, NULL, 'Apuí', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (145, NULL, NULL, 'Atalaia do Norte', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (146, NULL, NULL, 'Autazes', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (147, NULL, NULL, 'Barcelos', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (148, NULL, NULL, 'Barreirinha', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (149, NULL, NULL, 'Benjamin Constant', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (150, NULL, NULL, 'Beruri', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (151, NULL, NULL, 'Boa Vista do Ramos', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (152, NULL, NULL, 'Boca do Acre', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (153, NULL, NULL, 'Borba', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (154, NULL, NULL, 'Caapiranga', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (155, NULL, NULL, 'Canutama', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (156, NULL, NULL, 'Carauari', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (157, NULL, NULL, 'Careiro', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (158, NULL, NULL, 'Careiro da Várzea', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (159, NULL, NULL, 'Coari', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (160, NULL, NULL, 'Codajás', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (161, NULL, NULL, 'Eirunepé', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (162, NULL, NULL, 'Envira', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (163, NULL, NULL, 'Fonte Boa', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (164, NULL, NULL, 'Guajará', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (165, NULL, NULL, 'Humaitá', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (166, NULL, NULL, 'Ipixuna', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (167, NULL, NULL, 'Iranduba', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (168, NULL, NULL, 'Itacoatiara', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (169, NULL, NULL, 'Itamarati', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (170, NULL, NULL, 'Itapiranga', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (171, NULL, NULL, 'Japurá', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (172, NULL, NULL, 'Juruá', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (173, NULL, NULL, 'Jutaí', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (174, NULL, NULL, 'Lábrea', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (175, NULL, NULL, 'Manacapuru', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (176, NULL, NULL, 'Manaquiri', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (177, NULL, NULL, 'Manaus', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (178, NULL, NULL, 'Manicoré', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (179, NULL, NULL, 'Maraã', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (180, NULL, NULL, 'Maués', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (181, NULL, NULL, 'Nhamundá', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (182, NULL, NULL, 'Nova Olinda do Norte', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (183, NULL, NULL, 'Novo Airão', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (184, NULL, NULL, 'Novo Aripuanã', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (185, NULL, NULL, 'Parintins', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (186, NULL, NULL, 'Pauini', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (187, NULL, NULL, 'Presidente Figueiredo', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (188, NULL, NULL, 'Rio Preto da Eva', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (189, NULL, NULL, 'Santa Isabel do Rio Negro', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (190, NULL, NULL, 'Santo Antônio do Içá', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (191, NULL, NULL, 'São Gabriel da Cachoeira', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (192, NULL, NULL, 'São Paulo de Olivença', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (193, NULL, NULL, 'São Sebastião do Uatumã', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (194, NULL, NULL, 'Silves', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (195, NULL, NULL, 'Tabatinga', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (196, NULL, NULL, 'Tapauá', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (197, NULL, NULL, 'Tefé', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (198, NULL, NULL, 'Tonantins', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (199, NULL, NULL, 'Uarini', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (200, NULL, NULL, 'Urucará', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (201, NULL, NULL, 'Urucurituba', 4);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (202, NULL, NULL, 'Abaíra', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (203, NULL, NULL, 'Abaré', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (204, NULL, NULL, 'Acajutiba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (205, NULL, NULL, 'Adustina', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (206, NULL, NULL, 'Água Fria', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (207, NULL, NULL, 'Aiquara', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (208, NULL, NULL, 'Alagoinhas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (209, NULL, NULL, 'Alcobaça', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (210, NULL, NULL, 'Almadina', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (211, NULL, NULL, 'Amargosa', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (212, NULL, NULL, 'Amélia Rodrigues', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (213, NULL, NULL, 'América Dourada', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (214, NULL, NULL, 'Anagé', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (215, NULL, NULL, 'Andaraí', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (216, NULL, NULL, 'Andorinha', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (217, NULL, NULL, 'Angical', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (218, NULL, NULL, 'Anguera', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (219, NULL, NULL, 'Antas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (220, NULL, NULL, 'Antônio Cardoso', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (221, NULL, NULL, 'Antônio Gonçalves', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (222, NULL, NULL, 'Aporá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (223, NULL, NULL, 'Apuarema', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (224, NULL, NULL, 'Araças', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (225, NULL, NULL, 'Aracatu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (226, NULL, NULL, 'Araci', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (227, NULL, NULL, 'Aramari', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (228, NULL, NULL, 'Arataca', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (229, NULL, NULL, 'Aratuípe', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (230, NULL, NULL, 'Aurelino Leal', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (231, NULL, NULL, 'Baianópolis', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (232, NULL, NULL, 'Baixa Grande', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (233, NULL, NULL, 'Banzaê', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (234, NULL, NULL, 'Barra', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (235, NULL, NULL, 'Barra da Estiva', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (236, NULL, NULL, 'Barra do Choça', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (237, NULL, NULL, 'Barra do Mendes', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (238, NULL, NULL, 'Barra do Rocha', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (239, NULL, NULL, 'Barreiras', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (240, NULL, NULL, 'Barro Alto', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (241, NULL, NULL, 'Belmonte', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (242, NULL, NULL, 'Belo Campo', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (243, NULL, NULL, 'Biritinga', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (244, NULL, NULL, 'Boa Nova', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (245, NULL, NULL, 'Boa Vista do Tupim', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (246, NULL, NULL, 'Bom Jesus da Lapa', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (247, NULL, NULL, 'Bom Jesus da Serra', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (248, NULL, NULL, 'Boninal', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (249, NULL, NULL, 'Bonito', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (250, NULL, NULL, 'Boquira', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (251, NULL, NULL, 'Botuporã', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (252, NULL, NULL, 'Brejões', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (253, NULL, NULL, 'Brejolândia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (254, NULL, NULL, 'Brotas de Macaúbas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (255, NULL, NULL, 'Brumado', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (256, NULL, NULL, 'Buerarema', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (257, NULL, NULL, 'Buritirama', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (258, NULL, NULL, 'Caatiba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (259, NULL, NULL, 'Cabaceiras do Paraguaçu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (260, NULL, NULL, 'Cachoeira', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (261, NULL, NULL, 'Caculé', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (262, NULL, NULL, 'Caém', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (263, NULL, NULL, 'Caetanos', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (264, NULL, NULL, 'Caetité', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (265, NULL, NULL, 'Cafarnaum', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (266, NULL, NULL, 'Cairu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (267, NULL, NULL, 'Caldeirão Grande', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (268, NULL, NULL, 'Camacan', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (269, NULL, NULL, 'Camaçari', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (270, NULL, NULL, 'Camamu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (271, NULL, NULL, 'Campo Alegre de Lourdes', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (272, NULL, NULL, 'Campo Formoso', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (273, NULL, NULL, 'Canápolis', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (274, NULL, NULL, 'Canarana', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (275, NULL, NULL, 'Canavieiras', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (276, NULL, NULL, 'Candeal', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (277, NULL, NULL, 'Candeias', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (278, NULL, NULL, 'Candiba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (279, NULL, NULL, 'Cândido Sales', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (280, NULL, NULL, 'Cansanção', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (281, NULL, NULL, 'Canudos', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (282, NULL, NULL, 'Capela do Alto Alegre', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (283, NULL, NULL, 'Capim Grosso', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (284, NULL, NULL, 'Caraíbas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (285, NULL, NULL, 'Caravelas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (286, NULL, NULL, 'Cardeal da Silva', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (287, NULL, NULL, 'Carinhanha', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (288, NULL, NULL, 'Casa Nova', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (289, NULL, NULL, 'Castro Alves', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (290, NULL, NULL, 'Catolândia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (291, NULL, NULL, 'Catu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (292, NULL, NULL, 'Caturama', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (293, NULL, NULL, 'Central', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (294, NULL, NULL, 'Chorrochó', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (295, NULL, NULL, 'Cícero Dantas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (296, NULL, NULL, 'Cipó', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (297, NULL, NULL, 'Coaraci', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (298, NULL, NULL, 'Cocos', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (299, NULL, NULL, 'Conceição da Feira', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (300, NULL, NULL, 'Conceição do Almeida', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (301, NULL, NULL, 'Conceição do Coité', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (302, NULL, NULL, 'Conceição do Jacuípe', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (303, NULL, NULL, 'Conde', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (304, NULL, NULL, 'Condeúba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (305, NULL, NULL, 'Contendas do Sincorá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (306, NULL, NULL, 'Coração de Maria', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (307, NULL, NULL, 'Cordeiros', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (308, NULL, NULL, 'Coribe', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (309, NULL, NULL, 'Coronel João Sá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (310, NULL, NULL, 'Correntina', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (311, NULL, NULL, 'Cotegipe', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (312, NULL, NULL, 'Cravolândia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (313, NULL, NULL, 'Crisópolis', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (314, NULL, NULL, 'Cristópolis', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (315, NULL, NULL, 'Cruz das Almas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (316, NULL, NULL, 'Curaçá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (317, NULL, NULL, 'Dário Meira', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (318, NULL, NULL, 'Dias d`Ávila', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (319, NULL, NULL, 'Dom Basílio', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (320, NULL, NULL, 'Dom Macedo Costa', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (321, NULL, NULL, 'Elísio Medrado', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (322, NULL, NULL, 'Encruzilhada', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (323, NULL, NULL, 'Entre Rios', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (324, NULL, NULL, 'Érico Cardoso', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (325, NULL, NULL, 'Esplanada', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (326, NULL, NULL, 'Euclides da Cunha', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (327, NULL, NULL, 'Eunápolis', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (328, NULL, NULL, 'Fátima', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (329, NULL, NULL, 'Feira da Mata', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (330, NULL, NULL, 'Feira de Santana', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (331, NULL, NULL, 'Filadélfia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (332, NULL, NULL, 'Firmino Alves', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (333, NULL, NULL, 'Floresta Azul', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (334, NULL, NULL, 'Formosa do Rio Preto', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (335, NULL, NULL, 'Gandu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (336, NULL, NULL, 'Gavião', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (337, NULL, NULL, 'Gentio do Ouro', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (338, NULL, NULL, 'Glória', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (339, NULL, NULL, 'Gongogi', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (340, NULL, NULL, 'Governador Lomanto Júnior', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (341, NULL, NULL, 'Governador Mangabeira', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (342, NULL, NULL, 'Guajeru', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (343, NULL, NULL, 'Guanambi', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (344, NULL, NULL, 'Guaratinga', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (345, NULL, NULL, 'Heliópolis', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (346, NULL, NULL, 'Iaçu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (347, NULL, NULL, 'Ibiassucê', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (348, NULL, NULL, 'Ibicaraí', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (349, NULL, NULL, 'Ibicoara', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (350, NULL, NULL, 'Ibicuí', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (351, NULL, NULL, 'Ibipeba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (352, NULL, NULL, 'Ibipitanga', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (353, NULL, NULL, 'Ibiquera', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (354, NULL, NULL, 'Ibirapitanga', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (355, NULL, NULL, 'Ibirapuã', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (356, NULL, NULL, 'Ibirataia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (357, NULL, NULL, 'Ibitiara', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (358, NULL, NULL, 'Ibititá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (359, NULL, NULL, 'Ibotirama', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (360, NULL, NULL, 'Ichu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (361, NULL, NULL, 'Igaporã', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (362, NULL, NULL, 'Igrapiúna', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (363, NULL, NULL, 'Iguaí', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (364, NULL, NULL, 'Ilhéus', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (365, NULL, NULL, 'Inhambupe', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (366, NULL, NULL, 'Ipecaetá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (367, NULL, NULL, 'Ipiaú', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (368, NULL, NULL, 'Ipirá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (369, NULL, NULL, 'Ipupiara', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (370, NULL, NULL, 'Irajuba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (371, NULL, NULL, 'Iramaia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (372, NULL, NULL, 'Iraquara', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (373, NULL, NULL, 'Irará', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (374, NULL, NULL, 'Irecê', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (375, NULL, NULL, 'Itabela', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (376, NULL, NULL, 'Itaberaba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (377, NULL, NULL, 'Itabuna', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (378, NULL, NULL, 'Itacaré', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (379, NULL, NULL, 'Itaeté', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (380, NULL, NULL, 'Itagi', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (381, NULL, NULL, 'Itagibá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (382, NULL, NULL, 'Itagimirim', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (383, NULL, NULL, 'Itaguaçu da Bahia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (384, NULL, NULL, 'Itaju do Colônia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (385, NULL, NULL, 'Itajuípe', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (386, NULL, NULL, 'Itamaraju', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (387, NULL, NULL, 'Itamari', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (388, NULL, NULL, 'Itambé', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (389, NULL, NULL, 'Itanagra', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (390, NULL, NULL, 'Itanhém', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (391, NULL, NULL, 'Itaparica', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (392, NULL, NULL, 'Itapé', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (393, NULL, NULL, 'Itapebi', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (394, NULL, NULL, 'Itapetinga', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (395, NULL, NULL, 'Itapicuru', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (396, NULL, NULL, 'Itapitanga', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (397, NULL, NULL, 'Itaquara', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (398, NULL, NULL, 'Itarantim', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (399, NULL, NULL, 'Itatim', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (400, NULL, NULL, 'Itiruçu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (401, NULL, NULL, 'Itiúba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (402, NULL, NULL, 'Itororó', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (403, NULL, NULL, 'Ituaçu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (404, NULL, NULL, 'Ituberá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (405, NULL, NULL, 'Iuiú', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (406, NULL, NULL, 'Jaborandi', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (407, NULL, NULL, 'Jacaraci', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (408, NULL, NULL, 'Jacobina', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (409, NULL, NULL, 'Jaguaquara', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (410, NULL, NULL, 'Jaguarari', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (411, NULL, NULL, 'Jaguaripe', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (412, NULL, NULL, 'Jandaíra', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (413, NULL, NULL, 'Jequié', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (414, NULL, NULL, 'Jeremoabo', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (415, NULL, NULL, 'Jiquiriçá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (416, NULL, NULL, 'Jitaúna', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (417, NULL, NULL, 'João Dourado', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (418, NULL, NULL, 'Juazeiro', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (419, NULL, NULL, 'Jucuruçu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (420, NULL, NULL, 'Jussara', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (421, NULL, NULL, 'Jussari', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (422, NULL, NULL, 'Jussiape', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (423, NULL, NULL, 'Lafaiete Coutinho', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (424, NULL, NULL, 'Lagoa Real', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (425, NULL, NULL, 'Laje', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (426, NULL, NULL, 'Lajedão', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (427, NULL, NULL, 'Lajedinho', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (428, NULL, NULL, 'Lajedo do Tabocal', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (429, NULL, NULL, 'Lamarão', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (430, NULL, NULL, 'Lapão', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (431, NULL, NULL, 'Lauro de Freitas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (432, NULL, NULL, 'Lençóis', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (433, NULL, NULL, 'Licínio de Almeida', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (434, NULL, NULL, 'Livramento de Nossa Senhora', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (435, NULL, NULL, 'Macajuba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (436, NULL, NULL, 'Macarani', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (437, NULL, NULL, 'Macaúbas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (438, NULL, NULL, 'Macururé', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (439, NULL, NULL, 'Madre de Deus', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (440, NULL, NULL, 'Maetinga', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (441, NULL, NULL, 'Maiquinique', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (442, NULL, NULL, 'Mairi', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (443, NULL, NULL, 'Malhada', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (444, NULL, NULL, 'Malhada de Pedras', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (445, NULL, NULL, 'Manoel Vitorino', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (446, NULL, NULL, 'Mansidão', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (447, NULL, NULL, 'Maracás', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (448, NULL, NULL, 'Maragogipe', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (449, NULL, NULL, 'Maraú', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (450, NULL, NULL, 'Marcionílio Souza', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (451, NULL, NULL, 'Mascote', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (452, NULL, NULL, 'Mata de São João', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (453, NULL, NULL, 'Matina', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (454, NULL, NULL, 'Medeiros Neto', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (455, NULL, NULL, 'Miguel Calmon', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (456, NULL, NULL, 'Milagres', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (457, NULL, NULL, 'Mirangaba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (458, NULL, NULL, 'Mirante', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (459, NULL, NULL, 'Monte Santo', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (460, NULL, NULL, 'Morpará', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (461, NULL, NULL, 'Morro do Chapéu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (462, NULL, NULL, 'Mortugaba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (463, NULL, NULL, 'Mucugê', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (464, NULL, NULL, 'Mucuri', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (465, NULL, NULL, 'Mulungu do Morro', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (466, NULL, NULL, 'Mundo Novo', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (467, NULL, NULL, 'Muniz Ferreira', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (468, NULL, NULL, 'Muquém de São Francisco', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (469, NULL, NULL, 'Muritiba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (470, NULL, NULL, 'Mutuípe', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (471, NULL, NULL, 'Nazaré', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (472, NULL, NULL, 'Nilo Peçanha', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (473, NULL, NULL, 'Nordestina', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (474, NULL, NULL, 'Nova Canaã', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (475, NULL, NULL, 'Nova Fátima', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (476, NULL, NULL, 'Nova Ibiá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (477, NULL, NULL, 'Nova Itarana', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (478, NULL, NULL, 'Nova Redenção', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (479, NULL, NULL, 'Nova Soure', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (480, NULL, NULL, 'Nova Viçosa', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (481, NULL, NULL, 'Novo Horizonte', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (482, NULL, NULL, 'Novo Triunfo', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (483, NULL, NULL, 'Olindina', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (484, NULL, NULL, 'Oliveira dos Brejinhos', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (485, NULL, NULL, 'Ouriçangas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (486, NULL, NULL, 'Ourolândia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (487, NULL, NULL, 'Palmas de Monte Alto', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (488, NULL, NULL, 'Palmeiras', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (489, NULL, NULL, 'Paramirim', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (490, NULL, NULL, 'Paratinga', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (491, NULL, NULL, 'Paripiranga', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (492, NULL, NULL, 'Pau Brasil', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (493, NULL, NULL, 'Paulo Afonso', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (494, NULL, NULL, 'Pé de Serra', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (495, NULL, NULL, 'Pedrão', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (496, NULL, NULL, 'Pedro Alexandre', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (497, NULL, NULL, 'Piatã', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (498, NULL, NULL, 'Pilão Arcado', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (499, NULL, NULL, 'Pindaí', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (500, NULL, NULL, 'Pindobaçu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (501, NULL, NULL, 'Pintadas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (502, NULL, NULL, 'Piraí do Norte', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (503, NULL, NULL, 'Piripá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (504, NULL, NULL, 'Piritiba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (505, NULL, NULL, 'Planaltino', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (506, NULL, NULL, 'Planalto', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (507, NULL, NULL, 'Poções', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (508, NULL, NULL, 'Pojuca', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (509, NULL, NULL, 'Ponto Novo', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (510, NULL, NULL, 'Porto Seguro', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (511, NULL, NULL, 'Potiraguá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (512, NULL, NULL, 'Prado', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (513, NULL, NULL, 'Presidente Dutra', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (514, NULL, NULL, 'Presidente Jânio Quadros', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (515, NULL, NULL, 'Presidente Tancredo Neves', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (516, NULL, NULL, 'Queimadas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (517, NULL, NULL, 'Quijingue', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (518, NULL, NULL, 'Quixabeira', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (519, NULL, NULL, 'Rafael Jambeiro', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (520, NULL, NULL, 'Remanso', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (521, NULL, NULL, 'Retirolândia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (522, NULL, NULL, 'Riachão das Neves', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (523, NULL, NULL, 'Riachão do Jacuípe', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (524, NULL, NULL, 'Riacho de Santana', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (525, NULL, NULL, 'Ribeira do Amparo', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (526, NULL, NULL, 'Ribeira do Pombal', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (527, NULL, NULL, 'Ribeirão do Largo', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (528, NULL, NULL, 'Rio de Contas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (529, NULL, NULL, 'Rio do Antônio', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (530, NULL, NULL, 'Rio do Pires', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (531, NULL, NULL, 'Rio Real', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (532, NULL, NULL, 'Rodelas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (533, NULL, NULL, 'Ruy Barbosa', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (534, NULL, NULL, 'Salinas da Margarida', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (535, NULL, NULL, 'Salvador', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (536, NULL, NULL, 'Santa Bárbara', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (537, NULL, NULL, 'Santa Brígida', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (538, NULL, NULL, 'Santa Cruz Cabrália', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (539, NULL, NULL, 'Santa Cruz da Vitória', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (540, NULL, NULL, 'Santa Inês', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (541, NULL, NULL, 'Santa Luzia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (542, NULL, NULL, 'Santa Maria da Vitória', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (543, NULL, NULL, 'Santa Rita de Cássia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (544, NULL, NULL, 'Santa Teresinha', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (545, NULL, NULL, 'Santaluz', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (546, NULL, NULL, 'Santana', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (547, NULL, NULL, 'Santanópolis', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (548, NULL, NULL, 'Santo Amaro', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (549, NULL, NULL, 'Santo Antônio de Jesus', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (550, NULL, NULL, 'Santo Estêvão', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (551, NULL, NULL, 'São Desidério', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (552, NULL, NULL, 'São Domingos', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (553, NULL, NULL, 'São Felipe', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (554, NULL, NULL, 'São Félix', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (555, NULL, NULL, 'São Félix do Coribe', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (556, NULL, NULL, 'São Francisco do Conde', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (557, NULL, NULL, 'São Gabriel', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (558, NULL, NULL, 'São Gonçalo dos Campos', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (559, NULL, NULL, 'São José da Vitória', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (560, NULL, NULL, 'São José do Jacuípe', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (561, NULL, NULL, 'São Miguel das Matas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (562, NULL, NULL, 'São Sebastião do Passé', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (563, NULL, NULL, 'Sapeaçu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (564, NULL, NULL, 'Sátiro Dias', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (565, NULL, NULL, 'Saubara', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (566, NULL, NULL, 'Saúde', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (567, NULL, NULL, 'Seabra', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (568, NULL, NULL, 'Sebastião Laranjeiras', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (569, NULL, NULL, 'Senhor do Bonfim', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (570, NULL, NULL, 'Sento Sé', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (571, NULL, NULL, 'Serra do Ramalho', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (572, NULL, NULL, 'Serra Dourada', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (573, NULL, NULL, 'Serra Preta', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (574, NULL, NULL, 'Serrinha', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (575, NULL, NULL, 'Serrolândia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (576, NULL, NULL, 'Simões Filho', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (577, NULL, NULL, 'Sítio do Mato', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (578, NULL, NULL, 'Sítio do Quinto', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (579, NULL, NULL, 'Sobradinho', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (580, NULL, NULL, 'Souto Soares', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (581, NULL, NULL, 'Tabocas do Brejo Velho', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (582, NULL, NULL, 'Tanhaçu', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (583, NULL, NULL, 'Tanque Novo', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (584, NULL, NULL, 'Tanquinho', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (585, NULL, NULL, 'Taperoá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (586, NULL, NULL, 'Tapiramutá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (587, NULL, NULL, 'Teixeira de Freitas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (588, NULL, NULL, 'Teodoro Sampaio', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (589, NULL, NULL, 'Teofilândia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (590, NULL, NULL, 'Teolândia', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (591, NULL, NULL, 'Terra Nova', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (592, NULL, NULL, 'Tremedal', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (593, NULL, NULL, 'Tucano', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (594, NULL, NULL, 'Uauá', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (595, NULL, NULL, 'Ubaíra', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (596, NULL, NULL, 'Ubaitaba', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (597, NULL, NULL, 'Ubatã', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (598, NULL, NULL, 'Uibaí', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (599, NULL, NULL, 'Umburanas', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (600, NULL, NULL, 'Una', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (601, NULL, NULL, 'Urandi', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (602, NULL, NULL, 'Uruçuca', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (603, NULL, NULL, 'Utinga', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (604, NULL, NULL, 'Valença', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (605, NULL, NULL, 'Valente', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (606, NULL, NULL, 'Várzea da Roça', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (607, NULL, NULL, 'Várzea do Poço', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (608, NULL, NULL, 'Várzea Nova', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (609, NULL, NULL, 'Varzedo', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (610, NULL, NULL, 'Vera Cruz', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (611, NULL, NULL, 'Vereda', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (612, NULL, NULL, 'Vitória da Conquista', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (613, NULL, NULL, 'Wagner', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (614, NULL, NULL, 'Wanderley', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (615, NULL, NULL, 'Wenceslau Guimarães', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (616, NULL, NULL, 'Xique-Xique', 5);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (617, NULL, NULL, 'Abaiara', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (618, NULL, NULL, 'Acarapé', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (619, NULL, NULL, 'Acaraú', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (620, NULL, NULL, 'Acopiara', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (621, NULL, NULL, 'Aiuaba', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (622, NULL, NULL, 'Alcântaras', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (623, NULL, NULL, 'Altaneira', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (624, NULL, NULL, 'Alto Santo', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (625, NULL, NULL, 'Amontada', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (626, NULL, NULL, 'Antonina do Norte', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (627, NULL, NULL, 'Apuiarés', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (628, NULL, NULL, 'Aquiraz', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (629, NULL, NULL, 'Aracati', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (630, NULL, NULL, 'Aracoiaba', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (631, NULL, NULL, 'Ararendá', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (632, NULL, NULL, 'Araripe', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (633, NULL, NULL, 'Aratuba', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (634, NULL, NULL, 'Arneiroz', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (635, NULL, NULL, 'Assaré', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (636, NULL, NULL, 'Aurora', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (637, NULL, NULL, 'Baixio', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (638, NULL, NULL, 'Banabuiú', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (639, NULL, NULL, 'Barbalha', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (640, NULL, NULL, 'Barreira', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (641, NULL, NULL, 'Barro', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (642, NULL, NULL, 'Barroquinha', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (643, NULL, NULL, 'Baturité', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (644, NULL, NULL, 'Beberibe', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (645, NULL, NULL, 'Bela Cruz', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (646, NULL, NULL, 'Boa Viagem', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (647, NULL, NULL, 'Brejo Santo', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (648, NULL, NULL, 'Camocim', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (649, NULL, NULL, 'Campos Sales', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (650, NULL, NULL, 'Canindé', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (651, NULL, NULL, 'Capistrano', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (652, NULL, NULL, 'Caridade', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (653, NULL, NULL, 'Cariré', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (654, NULL, NULL, 'Caririaçu', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (655, NULL, NULL, 'Cariús', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (656, NULL, NULL, 'Carnaubal', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (657, NULL, NULL, 'Cascavel', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (658, NULL, NULL, 'Catarina', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (659, NULL, NULL, 'Catunda', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (660, NULL, NULL, 'Caucaia', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (661, NULL, NULL, 'Cedro', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (662, NULL, NULL, 'Chaval', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (663, NULL, NULL, 'Choró', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (664, NULL, NULL, 'Chorozinho', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (665, NULL, NULL, 'Coreaú', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (666, NULL, NULL, 'Crateús', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (667, NULL, NULL, 'Crato', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (668, NULL, NULL, 'Croatá', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (669, NULL, NULL, 'Cruz', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (670, NULL, NULL, 'Deputado Irapuan Pinheiro', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (671, NULL, NULL, 'Ererê', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (672, NULL, NULL, 'Eusébio', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (673, NULL, NULL, 'Farias Brito', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (674, NULL, NULL, 'Forquilha', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (675, NULL, NULL, 'Fortaleza', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (676, NULL, NULL, 'Fortim', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (677, NULL, NULL, 'Frecheirinha', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (678, NULL, NULL, 'General Sampaio', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (679, NULL, NULL, 'Graça', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (680, NULL, NULL, 'Granja', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (681, NULL, NULL, 'Granjeiro', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (682, NULL, NULL, 'Groaíras', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (683, NULL, NULL, 'Guaiúba', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (684, NULL, NULL, 'Guaraciaba do Norte', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (685, NULL, NULL, 'Guaramiranga', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (686, NULL, NULL, 'Hidrolândia', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (687, NULL, NULL, 'Horizonte', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (688, NULL, NULL, 'Ibaretama', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (689, NULL, NULL, 'Ibiapina', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (690, NULL, NULL, 'Ibicuitinga', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (691, NULL, NULL, 'Icapuí', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (692, NULL, NULL, 'Icó', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (693, NULL, NULL, 'Iguatu', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (694, NULL, NULL, 'Independência', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (695, NULL, NULL, 'Ipaporanga', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (696, NULL, NULL, 'Ipaumirim', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (697, NULL, NULL, 'Ipu', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (698, NULL, NULL, 'Ipueiras', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (699, NULL, NULL, 'Iracema', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (700, NULL, NULL, 'Irauçuba', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (701, NULL, NULL, 'Itaiçaba', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (702, NULL, NULL, 'Itaitinga', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (703, NULL, NULL, 'Itapagé', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (704, NULL, NULL, 'Itapipoca', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (705, NULL, NULL, 'Itapiúna', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (706, NULL, NULL, 'Itarema', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (707, NULL, NULL, 'Itatira', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (708, NULL, NULL, 'Jaguaretama', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (709, NULL, NULL, 'Jaguaribara', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (710, NULL, NULL, 'Jaguaribe', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (711, NULL, NULL, 'Jaguaruana', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (712, NULL, NULL, 'Jardim', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (713, NULL, NULL, 'Jati', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (714, NULL, NULL, 'Jijoca de Jericoacoara', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (715, NULL, NULL, 'Juazeiro do Norte', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (716, NULL, NULL, 'Jucás', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (717, NULL, NULL, 'Lavras da Mangabeira', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (718, NULL, NULL, 'Limoeiro do Norte', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (719, NULL, NULL, 'Madalena', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (720, NULL, NULL, 'Maracanaú', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (721, NULL, NULL, 'Maranguape', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (722, NULL, NULL, 'Marco', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (723, NULL, NULL, 'Martinópole', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (724, NULL, NULL, 'Massapê', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (725, NULL, NULL, 'Mauriti', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (726, NULL, NULL, 'Meruoca', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (727, NULL, NULL, 'Milagres', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (728, NULL, NULL, 'Milhã', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (729, NULL, NULL, 'Miraíma', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (730, NULL, NULL, 'Missão Velha', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (731, NULL, NULL, 'Mombaça', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (732, NULL, NULL, 'Monsenhor Tabosa', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (733, NULL, NULL, 'Morada Nova', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (734, NULL, NULL, 'Moraújo', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (735, NULL, NULL, 'Morrinhos', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (736, NULL, NULL, 'Mucambo', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (737, NULL, NULL, 'Mulungu', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (738, NULL, NULL, 'Nova Olinda', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (739, NULL, NULL, 'Nova Russas', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (740, NULL, NULL, 'Novo Oriente', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (741, NULL, NULL, 'Ocara', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (742, NULL, NULL, 'Orós', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (743, NULL, NULL, 'Pacajus', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (744, NULL, NULL, 'Pacatuba', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (745, NULL, NULL, 'Pacoti', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (746, NULL, NULL, 'Pacujá', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (747, NULL, NULL, 'Palhano', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (748, NULL, NULL, 'Palmácia', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (749, NULL, NULL, 'Paracuru', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (750, NULL, NULL, 'Paraipaba', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (751, NULL, NULL, 'Parambu', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (752, NULL, NULL, 'Paramoti', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (753, NULL, NULL, 'Pedra Branca', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (754, NULL, NULL, 'Penaforte', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (755, NULL, NULL, 'Pentecoste', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (756, NULL, NULL, 'Pereiro', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (757, NULL, NULL, 'Pindoretama', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (758, NULL, NULL, 'Piquet Carneiro', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (759, NULL, NULL, 'Pires Ferreira', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (760, NULL, NULL, 'Poranga', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (761, NULL, NULL, 'Porteiras', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (762, NULL, NULL, 'Potengi', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (763, NULL, NULL, 'Potiretama', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (764, NULL, NULL, 'Quiterianópolis', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (765, NULL, NULL, 'Quixadá', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (766, NULL, NULL, 'Quixelô', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (767, NULL, NULL, 'Quixeramobim', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (768, NULL, NULL, 'Quixeré', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (769, NULL, NULL, 'Redenção', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (770, NULL, NULL, 'Reriutaba', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (771, NULL, NULL, 'Russas', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (772, NULL, NULL, 'Saboeiro', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (773, NULL, NULL, 'Salitre', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (774, NULL, NULL, 'Santa Quitéria', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (775, NULL, NULL, 'Santana do Acaraú', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (776, NULL, NULL, 'Santana do Cariri', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (777, NULL, NULL, 'São Benedito', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (778, NULL, NULL, 'São Gonçalo do Amarante', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (779, NULL, NULL, 'São João do Jaguaribe', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (780, NULL, NULL, 'São Luís do Curu', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (781, NULL, NULL, 'Senador Pompeu', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (782, NULL, NULL, 'Senador Sá', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (783, NULL, NULL, 'Sobral', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (784, NULL, NULL, 'Solonópole', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (785, NULL, NULL, 'Tabuleiro do Norte', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (786, NULL, NULL, 'Tamboril', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (787, NULL, NULL, 'Tarrafas', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (788, NULL, NULL, 'Tauá', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (789, NULL, NULL, 'Tejuçuoca', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (790, NULL, NULL, 'Tianguá', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (791, NULL, NULL, 'Trairi', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (792, NULL, NULL, 'Tururu', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (793, NULL, NULL, 'Ubajara', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (794, NULL, NULL, 'Umari', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (795, NULL, NULL, 'Umirim', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (796, NULL, NULL, 'Uruburetama', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (797, NULL, NULL, 'Uruoca', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (798, NULL, NULL, 'Varjota', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (799, NULL, NULL, 'Várzea Alegre', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (800, NULL, NULL, 'Viçosa do Ceará', 6);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (801, NULL, NULL, 'Brasília', 7);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (802, NULL, NULL, 'Afonso Cláudio', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (803, NULL, NULL, 'Água Doce do Norte', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (804, NULL, NULL, 'Águia Branca', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (805, NULL, NULL, 'Alegre', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (806, NULL, NULL, 'Alfredo Chaves', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (807, NULL, NULL, 'Alto Rio Novo', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (808, NULL, NULL, 'Anchieta', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (809, NULL, NULL, 'Apiacá', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (810, NULL, NULL, 'Aracruz', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (811, NULL, NULL, 'Atilio Vivacqua', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (812, NULL, NULL, 'Baixo Guandu', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (813, NULL, NULL, 'Barra de São Francisco', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (814, NULL, NULL, 'Boa Esperança', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (815, NULL, NULL, 'Bom Jesus do Norte', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (816, NULL, NULL, 'Brejetuba', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (817, NULL, NULL, 'Cachoeiro de Itapemirim', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (818, NULL, NULL, 'Cariacica', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (819, NULL, NULL, 'Castelo', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (820, NULL, NULL, 'Colatina', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (821, NULL, NULL, 'Conceição da Barra', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (822, NULL, NULL, 'Conceição do Castelo', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (823, NULL, NULL, 'Divino de São Lourenço', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (824, NULL, NULL, 'Domingos Martins', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (825, NULL, NULL, 'Dores do Rio Preto', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (826, NULL, NULL, 'Ecoporanga', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (827, NULL, NULL, 'Fundão', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (828, NULL, NULL, 'Guaçuí', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (829, NULL, NULL, 'Guarapari', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (830, NULL, NULL, 'Ibatiba', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (831, NULL, NULL, 'Ibiraçu', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (832, NULL, NULL, 'Ibitirama', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (833, NULL, NULL, 'Iconha', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (834, NULL, NULL, 'Irupi', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (835, NULL, NULL, 'Itaguaçu', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (836, NULL, NULL, 'Itapemirim', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (837, NULL, NULL, 'Itarana', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (838, NULL, NULL, 'Iúna', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (839, NULL, NULL, 'Jaguaré', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (840, NULL, NULL, 'Jerônimo Monteiro', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (841, NULL, NULL, 'João Neiva', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (842, NULL, NULL, 'Laranja da Terra', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (843, NULL, NULL, 'Linhares', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (844, NULL, NULL, 'Mantenópolis', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (845, NULL, NULL, 'Marataízes', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (846, NULL, NULL, 'Marechal Floriano', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (847, NULL, NULL, 'Marilândia', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (848, NULL, NULL, 'Mimoso do Sul', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (849, NULL, NULL, 'Montanha', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (850, NULL, NULL, 'Mucurici', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (851, NULL, NULL, 'Muniz Freire', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (852, NULL, NULL, 'Muqui', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (853, NULL, NULL, 'Nova Venécia', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (854, NULL, NULL, 'Pancas', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (855, NULL, NULL, 'Pedro Canário', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (856, NULL, NULL, 'Pinheiros', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (857, NULL, NULL, 'Piúma', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (858, NULL, NULL, 'Ponto Belo', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (859, NULL, NULL, 'Presidente Kennedy', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (860, NULL, NULL, 'Rio Bananal', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (861, NULL, NULL, 'Rio Novo do Sul', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (862, NULL, NULL, 'Santa Leopoldina', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (863, NULL, NULL, 'Santa Maria de Jetibá', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (864, NULL, NULL, 'Santa Teresa', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (865, NULL, NULL, 'São Domingos do Norte', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (866, NULL, NULL, 'São Gabriel da Palha', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (867, NULL, NULL, 'São José do Calçado', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (868, NULL, NULL, 'São Mateus', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (869, NULL, NULL, 'São Roque do Canaã', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (870, NULL, NULL, 'Serra', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (871, NULL, NULL, 'Sooretama', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (872, NULL, NULL, 'Vargem Alta', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (873, NULL, NULL, 'Venda Nova do Imigrante', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (874, NULL, NULL, 'Viana', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (875, NULL, NULL, 'Vila Pavão', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (876, NULL, NULL, 'Vila Valério', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (877, NULL, NULL, 'Vila Velha', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (878, NULL, NULL, 'Vitória', 8);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (879, NULL, NULL, 'Abadia de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (880, NULL, NULL, 'Abadiânia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (881, NULL, NULL, 'Acreúna', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (882, NULL, NULL, 'Adelândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (883, NULL, NULL, 'Água Fria de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (884, NULL, NULL, 'Água Limpa', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (885, NULL, NULL, 'Águas Lindas de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (886, NULL, NULL, 'Alexânia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (887, NULL, NULL, 'Aloândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (888, NULL, NULL, 'Alto Horizonte', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (889, NULL, NULL, 'Alto Paraíso de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (890, NULL, NULL, 'Alvorada do Norte', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (891, NULL, NULL, 'Amaralina', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (892, NULL, NULL, 'Americano do Brasil', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (893, NULL, NULL, 'Amorinópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (894, NULL, NULL, 'Anápolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (895, NULL, NULL, 'Anhanguera', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (896, NULL, NULL, 'Anicuns', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (897, NULL, NULL, 'Aparecida de Goiânia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (898, NULL, NULL, 'Aparecida do Rio Doce', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (899, NULL, NULL, 'Aporé', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (900, NULL, NULL, 'Araçu', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (901, NULL, NULL, 'Aragarças', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (902, NULL, NULL, 'Aragoiânia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (903, NULL, NULL, 'Araguapaz', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (904, NULL, NULL, 'Arenópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (905, NULL, NULL, 'Aruanã', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (906, NULL, NULL, 'Aurilândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (907, NULL, NULL, 'Avelinópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (908, NULL, NULL, 'Baliza', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (909, NULL, NULL, 'Barro Alto', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (910, NULL, NULL, 'Bela Vista de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (911, NULL, NULL, 'Bom Jardim de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (912, NULL, NULL, 'Bom Jesus de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (913, NULL, NULL, 'Bonfinópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (914, NULL, NULL, 'Bonópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (915, NULL, NULL, 'Brazabrantes', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (916, NULL, NULL, 'Britânia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (917, NULL, NULL, 'Buriti Alegre', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (918, NULL, NULL, 'Buriti de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (919, NULL, NULL, 'Buritinópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (920, NULL, NULL, 'Cabeceiras', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (921, NULL, NULL, 'Cachoeira Alta', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (922, NULL, NULL, 'Cachoeira de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (923, NULL, NULL, 'Cachoeira Dourada', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (924, NULL, NULL, 'Caçu', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (925, NULL, NULL, 'Caiapônia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (926, NULL, NULL, 'Caldas Novas', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (927, NULL, NULL, 'Caldazinha', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (928, NULL, NULL, 'Campestre de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (929, NULL, NULL, 'Campinaçu', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (930, NULL, NULL, 'Campinorte', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (931, NULL, NULL, 'Campo Alegre de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (932, NULL, NULL, 'Campos Belos', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (933, NULL, NULL, 'Campos Verdes', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (934, NULL, NULL, 'Carmo do Rio Verde', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (935, NULL, NULL, 'Castelândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (936, NULL, NULL, 'Catalão', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (937, NULL, NULL, 'Caturaí', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (938, NULL, NULL, 'Cavalcante', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (939, NULL, NULL, 'Ceres', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (940, NULL, NULL, 'Cezarina', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (941, NULL, NULL, 'Chapadão do Céu', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (942, NULL, NULL, 'Cidade Ocidental', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (943, NULL, NULL, 'Cocalzinho de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (944, NULL, NULL, 'Colinas do Sul', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (945, NULL, NULL, 'Córrego do Ouro', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (946, NULL, NULL, 'Corumbá de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (947, NULL, NULL, 'Corumbaíba', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (948, NULL, NULL, 'Cristalina', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (949, NULL, NULL, 'Cristianópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (950, NULL, NULL, 'Crixás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (951, NULL, NULL, 'Cromínia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (952, NULL, NULL, 'Cumari', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (953, NULL, NULL, 'Damianópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (954, NULL, NULL, 'Damolândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (955, NULL, NULL, 'Davinópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (956, NULL, NULL, 'Diorama', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (957, NULL, NULL, 'Divinópolis de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (958, NULL, NULL, 'Doverlândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (959, NULL, NULL, 'Edealina', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (960, NULL, NULL, 'Edéia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (961, NULL, NULL, 'Estrela do Norte', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (962, NULL, NULL, 'Faina', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (963, NULL, NULL, 'Fazenda Nova', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (964, NULL, NULL, 'Firminópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (965, NULL, NULL, 'Flores de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (966, NULL, NULL, 'Formosa', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (967, NULL, NULL, 'Formoso', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (968, NULL, NULL, 'Goianápolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (969, NULL, NULL, 'Goiandira', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (970, NULL, NULL, 'Goianésia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (971, NULL, NULL, 'Goiânia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (972, NULL, NULL, 'Goianira', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (973, NULL, NULL, 'Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (974, NULL, NULL, 'Goiatuba', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (975, NULL, NULL, 'Gouvelândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (976, NULL, NULL, 'Guapó', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (977, NULL, NULL, 'Guaraíta', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (978, NULL, NULL, 'Guarani de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (979, NULL, NULL, 'Guarinos', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (980, NULL, NULL, 'Heitoraí', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (981, NULL, NULL, 'Hidrolândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (982, NULL, NULL, 'Hidrolina', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (983, NULL, NULL, 'Iaciara', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (984, NULL, NULL, 'Inaciolândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (985, NULL, NULL, 'Indiara', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (986, NULL, NULL, 'Inhumas', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (987, NULL, NULL, 'Ipameri', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (988, NULL, NULL, 'Iporá', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (989, NULL, NULL, 'Israelândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (990, NULL, NULL, 'Itaberaí', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (991, NULL, NULL, 'Itaguari', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (992, NULL, NULL, 'Itaguaru', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (993, NULL, NULL, 'Itajá', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (994, NULL, NULL, 'Itapaci', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (995, NULL, NULL, 'Itapirapuã', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (996, NULL, NULL, 'Itapuranga', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (997, NULL, NULL, 'Itarumã', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (998, NULL, NULL, 'Itauçu', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (999, NULL, NULL, 'Itumbiara', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1000, NULL, NULL, 'Ivolândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1001, NULL, NULL, 'Jandaia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1002, NULL, NULL, 'Jaraguá', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1003, NULL, NULL, 'Jataí', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1004, NULL, NULL, 'Jaupaci', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1005, NULL, NULL, 'Jesúpolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1006, NULL, NULL, 'Joviânia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1007, NULL, NULL, 'Jussara', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1008, NULL, NULL, 'Leopoldo de Bulhões', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1009, NULL, NULL, 'Luziânia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1010, NULL, NULL, 'Mairipotaba', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1011, NULL, NULL, 'Mambaí', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1012, NULL, NULL, 'Mara Rosa', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1013, NULL, NULL, 'Marzagão', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1014, NULL, NULL, 'Matrinchã', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1015, NULL, NULL, 'Maurilândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1016, NULL, NULL, 'Mimoso de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1017, NULL, NULL, 'Minaçu', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1018, NULL, NULL, 'Mineiros', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1019, NULL, NULL, 'Moiporá', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1020, NULL, NULL, 'Monte Alegre de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1021, NULL, NULL, 'Montes Claros de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1022, NULL, NULL, 'Montividiu', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1023, NULL, NULL, 'Montividiu do Norte', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1024, NULL, NULL, 'Morrinhos', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1025, NULL, NULL, 'Morro Agudo de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1026, NULL, NULL, 'Mossâmedes', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1027, NULL, NULL, 'Mozarlândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1028, NULL, NULL, 'Mundo Novo', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1029, NULL, NULL, 'Mutunópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1030, NULL, NULL, 'Nazário', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1031, NULL, NULL, 'Nerópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1032, NULL, NULL, 'Niquelândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1033, NULL, NULL, 'Nova América', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1034, NULL, NULL, 'Nova Aurora', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1035, NULL, NULL, 'Nova Crixás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1036, NULL, NULL, 'Nova Glória', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1037, NULL, NULL, 'Nova Iguaçu de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1038, NULL, NULL, 'Nova Roma', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1039, NULL, NULL, 'Nova Veneza', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1040, NULL, NULL, 'Novo Brasil', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1041, NULL, NULL, 'Novo Gama', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1042, NULL, NULL, 'Novo Planalto', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1043, NULL, NULL, 'Orizona', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1044, NULL, NULL, 'Ouro Verde de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1045, NULL, NULL, 'Ouvidor', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1046, NULL, NULL, 'Padre Bernardo', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1047, NULL, NULL, 'Palestina de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1048, NULL, NULL, 'Palmeiras de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1049, NULL, NULL, 'Palmelo', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1050, NULL, NULL, 'Palminópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1051, NULL, NULL, 'Panamá', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1052, NULL, NULL, 'Paranaiguara', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1053, NULL, NULL, 'Paraúna', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1054, NULL, NULL, 'Perolândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1055, NULL, NULL, 'Petrolina de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1056, NULL, NULL, 'Pilar de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1057, NULL, NULL, 'Piracanjuba', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1058, NULL, NULL, 'Piranhas', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1059, NULL, NULL, 'Pirenópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1060, NULL, NULL, 'Pires do Rio', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1061, NULL, NULL, 'Planaltina', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1062, NULL, NULL, 'Pontalina', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1063, NULL, NULL, 'Porangatu', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1064, NULL, NULL, 'Porteirão', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1065, NULL, NULL, 'Portelândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1066, NULL, NULL, 'Posse', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1067, NULL, NULL, 'Professor Jamil', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1068, NULL, NULL, 'Quirinópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1069, NULL, NULL, 'Rialma', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1070, NULL, NULL, 'Rianápolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1071, NULL, NULL, 'Rio Quente', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1072, NULL, NULL, 'Rio Verde', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1073, NULL, NULL, 'Rubiataba', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1074, NULL, NULL, 'Sanclerlândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1075, NULL, NULL, 'Santa Bárbara de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1076, NULL, NULL, 'Santa Cruz de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1077, NULL, NULL, 'Santa Fé de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1078, NULL, NULL, 'Santa Helena de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1079, NULL, NULL, 'Santa Isabel', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1080, NULL, NULL, 'Santa Rita do Araguaia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1081, NULL, NULL, 'Santa Rita do Novo Destino', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1082, NULL, NULL, 'Santa Rosa de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1083, NULL, NULL, 'Santa Tereza de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1084, NULL, NULL, 'Santa Terezinha de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1085, NULL, NULL, 'Santo Antônio da Barra', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1086, NULL, NULL, 'Santo Antônio de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1087, NULL, NULL, 'Santo Antônio do Descoberto', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1088, NULL, NULL, 'São Domingos', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1089, NULL, NULL, 'São Francisco de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1090, NULL, NULL, 'São João d`Aliança', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1091, NULL, NULL, 'São João da Paraúna', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1092, NULL, NULL, 'São Luís de Montes Belos', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1093, NULL, NULL, 'São Luíz do Norte', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1094, NULL, NULL, 'São Miguel do Araguaia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1095, NULL, NULL, 'São Miguel do Passa Quatro', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1096, NULL, NULL, 'São Patrício', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1097, NULL, NULL, 'São Simão', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1098, NULL, NULL, 'Senador Canedo', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1099, NULL, NULL, 'Serranópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1100, NULL, NULL, 'Silvânia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1101, NULL, NULL, 'Simolândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1102, NULL, NULL, 'Sítio d`Abadia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1103, NULL, NULL, 'Taquaral de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1104, NULL, NULL, 'Teresina de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1105, NULL, NULL, 'Terezópolis de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1106, NULL, NULL, 'Três Ranchos', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1107, NULL, NULL, 'Trindade', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1108, NULL, NULL, 'Trombas', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1109, NULL, NULL, 'Turvânia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1110, NULL, NULL, 'Turvelândia', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1111, NULL, NULL, 'Uirapuru', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1112, NULL, NULL, 'Uruaçu', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1113, NULL, NULL, 'Uruana', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1114, NULL, NULL, 'Urutaí', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1115, NULL, NULL, 'Valparaíso de Goiás', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1116, NULL, NULL, 'Varjão', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1117, NULL, NULL, 'Vianópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1118, NULL, NULL, 'Vicentinópolis', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1119, NULL, NULL, 'Vila Boa', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1120, NULL, NULL, 'Vila Propício', 9);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1121, NULL, NULL, 'Açailândia', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1122, NULL, NULL, 'Afonso Cunha', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1123, NULL, NULL, 'Água Doce do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1124, NULL, NULL, 'Alcântara', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1125, NULL, NULL, 'Aldeias Altas', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1126, NULL, NULL, 'Altamira do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1127, NULL, NULL, 'Alto Alegre do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1128, NULL, NULL, 'Alto Alegre do Pindaré', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1129, NULL, NULL, 'Alto Parnaíba', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1130, NULL, NULL, 'Amapá do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1131, NULL, NULL, 'Amarante do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1132, NULL, NULL, 'Anajatuba', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1133, NULL, NULL, 'Anapurus', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1134, NULL, NULL, 'Apicum-Açu', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1135, NULL, NULL, 'Araguanã', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1136, NULL, NULL, 'Araioses', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1137, NULL, NULL, 'Arame', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1138, NULL, NULL, 'Arari', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1139, NULL, NULL, 'Axixá', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1140, NULL, NULL, 'Bacabal', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1141, NULL, NULL, 'Bacabeira', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1142, NULL, NULL, 'Bacuri', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1143, NULL, NULL, 'Bacurituba', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1144, NULL, NULL, 'Balsas', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1145, NULL, NULL, 'Barão de Grajaú', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1146, NULL, NULL, 'Barra do Corda', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1147, NULL, NULL, 'Barreirinhas', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1148, NULL, NULL, 'Bela Vista do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1149, NULL, NULL, 'Belágua', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1150, NULL, NULL, 'Benedito Leite', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1151, NULL, NULL, 'Bequimão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1152, NULL, NULL, 'Bernardo do Mearim', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1153, NULL, NULL, 'Boa Vista do Gurupi', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1154, NULL, NULL, 'Bom Jardim', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1155, NULL, NULL, 'Bom Jesus das Selvas', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1156, NULL, NULL, 'Bom Lugar', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1157, NULL, NULL, 'Brejo', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1158, NULL, NULL, 'Brejo de Areia', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1159, NULL, NULL, 'Buriti', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1160, NULL, NULL, 'Buriti Bravo', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1161, NULL, NULL, 'Buriticupu', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1162, NULL, NULL, 'Buritirana', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1163, NULL, NULL, 'Cachoeira Grande', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1164, NULL, NULL, 'Cajapió', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1165, NULL, NULL, 'Cajari', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1166, NULL, NULL, 'Campestre do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1167, NULL, NULL, 'Cândido Mendes', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1168, NULL, NULL, 'Cantanhede', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1169, NULL, NULL, 'Capinzal do Norte', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1170, NULL, NULL, 'Carolina', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1171, NULL, NULL, 'Carutapera', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1172, NULL, NULL, 'Caxias', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1173, NULL, NULL, 'Cedral', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1174, NULL, NULL, 'Central do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1175, NULL, NULL, 'Centro do Guilherme', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1176, NULL, NULL, 'Centro Novo do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1177, NULL, NULL, 'Chapadinha', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1178, NULL, NULL, 'Cidelândia', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1179, NULL, NULL, 'Codó', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1180, NULL, NULL, 'Coelho Neto', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1181, NULL, NULL, 'Colinas', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1182, NULL, NULL, 'Conceição do Lago-Açu', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1183, NULL, NULL, 'Coroatá', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1184, NULL, NULL, 'Cururupu', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1185, NULL, NULL, 'Davinópolis', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1186, NULL, NULL, 'Dom Pedro', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1187, NULL, NULL, 'Duque Bacelar', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1188, NULL, NULL, 'Esperantinópolis', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1189, NULL, NULL, 'Estreito', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1190, NULL, NULL, 'Feira Nova do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1191, NULL, NULL, 'Fernando Falcão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1192, NULL, NULL, 'Formosa da Serra Negra', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1193, NULL, NULL, 'Fortaleza dos Nogueiras', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1194, NULL, NULL, 'Fortuna', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1195, NULL, NULL, 'Godofredo Viana', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1196, NULL, NULL, 'Gonçalves Dias', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1197, NULL, NULL, 'Governador Archer', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1198, NULL, NULL, 'Governador Edison Lobão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1199, NULL, NULL, 'Governador Eugênio Barros', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1200, NULL, NULL, 'Governador Luiz Rocha', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1201, NULL, NULL, 'Governador Newton Bello', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1202, NULL, NULL, 'Governador Nunes Freire', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1203, NULL, NULL, 'Graça Aranha', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1204, NULL, NULL, 'Grajaú', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1205, NULL, NULL, 'Guimarães', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1206, NULL, NULL, 'Humberto de Campos', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1207, NULL, NULL, 'Icatu', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1208, NULL, NULL, 'Igarapé do Meio', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1209, NULL, NULL, 'Igarapé Grande', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1210, NULL, NULL, 'Imperatriz', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1211, NULL, NULL, 'Itaipava do Grajaú', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1212, NULL, NULL, 'Itapecuru Mirim', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1213, NULL, NULL, 'Itinga do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1214, NULL, NULL, 'Jatobá', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1215, NULL, NULL, 'Jenipapo dos Vieiras', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1216, NULL, NULL, 'João Lisboa', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1217, NULL, NULL, 'Joselândia', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1218, NULL, NULL, 'Junco do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1219, NULL, NULL, 'Lago da Pedra', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1220, NULL, NULL, 'Lago do Junco', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1221, NULL, NULL, 'Lago dos Rodrigues', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1222, NULL, NULL, 'Lago Verde', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1223, NULL, NULL, 'Lagoa do Mato', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1224, NULL, NULL, 'Lagoa Grande do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1225, NULL, NULL, 'Lajeado Novo', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1226, NULL, NULL, 'Lima Campos', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1227, NULL, NULL, 'Loreto', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1228, NULL, NULL, 'Luís Domingues', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1229, NULL, NULL, 'Magalhães de Almeida', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1230, NULL, NULL, 'Maracaçumé', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1231, NULL, NULL, 'Marajá do Sena', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1232, NULL, NULL, 'Maranhãozinho', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1233, NULL, NULL, 'Mata Roma', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1234, NULL, NULL, 'Matinha', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1235, NULL, NULL, 'Matões', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1236, NULL, NULL, 'Matões do Norte', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1237, NULL, NULL, 'Milagres do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1238, NULL, NULL, 'Mirador', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1239, NULL, NULL, 'Miranda do Norte', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1240, NULL, NULL, 'Mirinzal', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1241, NULL, NULL, 'Monção', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1242, NULL, NULL, 'Montes Altos', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1243, NULL, NULL, 'Morros', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1244, NULL, NULL, 'Nina Rodrigues', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1245, NULL, NULL, 'Nova Colinas', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1246, NULL, NULL, 'Nova Iorque', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1247, NULL, NULL, 'Nova Olinda do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1248, NULL, NULL, 'Olho d`Água das Cunhãs', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1249, NULL, NULL, 'Olinda Nova do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1250, NULL, NULL, 'Paço do Lumiar', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1251, NULL, NULL, 'Palmeirândia', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1252, NULL, NULL, 'Paraibano', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1253, NULL, NULL, 'Parnarama', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1254, NULL, NULL, 'Passagem Franca', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1255, NULL, NULL, 'Pastos Bons', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1256, NULL, NULL, 'Paulino Neves', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1257, NULL, NULL, 'Paulo Ramos', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1258, NULL, NULL, 'Pedreiras', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1259, NULL, NULL, 'Pedro do Rosário', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1260, NULL, NULL, 'Penalva', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1261, NULL, NULL, 'Peri Mirim', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1262, NULL, NULL, 'Peritoró', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1263, NULL, NULL, 'Pindaré-Mirim', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1264, NULL, NULL, 'Pinheiro', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1265, NULL, NULL, 'Pio XII', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1266, NULL, NULL, 'Pirapemas', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1267, NULL, NULL, 'Poção de Pedras', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1268, NULL, NULL, 'Porto Franco', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1269, NULL, NULL, 'Porto Rico do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1270, NULL, NULL, 'Presidente Dutra', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1271, NULL, NULL, 'Presidente Juscelino', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1272, NULL, NULL, 'Presidente Médici', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1273, NULL, NULL, 'Presidente Sarney', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1274, NULL, NULL, 'Presidente Vargas', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1275, NULL, NULL, 'Primeira Cruz', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1276, NULL, NULL, 'Raposa', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1277, NULL, NULL, 'Riachão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1278, NULL, NULL, 'Ribamar Fiquene', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1279, NULL, NULL, 'Rosário', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1280, NULL, NULL, 'Sambaíba', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1281, NULL, NULL, 'Santa Filomena do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1282, NULL, NULL, 'Santa Helena', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1283, NULL, NULL, 'Santa Inês', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1284, NULL, NULL, 'Santa Luzia', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1285, NULL, NULL, 'Santa Luzia do Paruá', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1286, NULL, NULL, 'Santa Quitéria do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1287, NULL, NULL, 'Santa Rita', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1288, NULL, NULL, 'Santana do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1289, NULL, NULL, 'Santo Amaro do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1290, NULL, NULL, 'Santo Antônio dos Lopes', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1291, NULL, NULL, 'São Benedito do Rio Preto', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1292, NULL, NULL, 'São Bento', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1293, NULL, NULL, 'São Bernardo', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1294, NULL, NULL, 'São Domingos do Azeitão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1295, NULL, NULL, 'São Domingos do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1296, NULL, NULL, 'São Félix de Balsas', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1297, NULL, NULL, 'São Francisco do Brejão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1298, NULL, NULL, 'São Francisco do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1299, NULL, NULL, 'São João Batista', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1300, NULL, NULL, 'São João do Carú', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1301, NULL, NULL, 'São João do Paraíso', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1302, NULL, NULL, 'São João do Soter', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1303, NULL, NULL, 'São João dos Patos', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1304, NULL, NULL, 'São José de Ribamar', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1305, NULL, NULL, 'São José dos Basílios', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1306, NULL, NULL, 'São Luís', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1307, NULL, NULL, 'São Luís Gonzaga do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1308, NULL, NULL, 'São Mateus do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1309, NULL, NULL, 'São Pedro da Água Branca', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1310, NULL, NULL, 'São Pedro dos Crentes', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1311, NULL, NULL, 'São Raimundo das Mangabeiras', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1312, NULL, NULL, 'São Raimundo do Doca Bezerra', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1313, NULL, NULL, 'São Roberto', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1314, NULL, NULL, 'São Vicente Ferrer', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1315, NULL, NULL, 'Satubinha', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1316, NULL, NULL, 'Senador Alexandre Costa', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1317, NULL, NULL, 'Senador La Rocque', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1318, NULL, NULL, 'Serrano do Maranhão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1319, NULL, NULL, 'Sítio Novo', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1320, NULL, NULL, 'Sucupira do Norte', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1321, NULL, NULL, 'Sucupira do Riachão', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1322, NULL, NULL, 'Tasso Fragoso', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1323, NULL, NULL, 'Timbiras', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1324, NULL, NULL, 'Timon', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1325, NULL, NULL, 'Trizidela do Vale', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1326, NULL, NULL, 'Tufilândia', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1327, NULL, NULL, 'Tuntum', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1328, NULL, NULL, 'Turiaçu', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1329, NULL, NULL, 'Turilândia', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1330, NULL, NULL, 'Tutóia', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1331, NULL, NULL, 'Urbano Santos', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1332, NULL, NULL, 'Vargem Grande', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1333, NULL, NULL, 'Viana', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1334, NULL, NULL, 'Vila Nova dos Martírios', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1335, NULL, NULL, 'Vitória do Mearim', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1336, NULL, NULL, 'Vitorino Freire', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1337, NULL, NULL, 'Zé Doca', 10);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1338, NULL, NULL, 'Acorizal', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1339, NULL, NULL, 'Água Boa', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1340, NULL, NULL, 'Alta Floresta', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1341, NULL, NULL, 'Alto Araguaia', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1342, NULL, NULL, 'Alto Boa Vista', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1343, NULL, NULL, 'Alto Garças', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1344, NULL, NULL, 'Alto Paraguai', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1345, NULL, NULL, 'Alto Taquari', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1346, NULL, NULL, 'Apiacás', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1347, NULL, NULL, 'Araguaiana', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1348, NULL, NULL, 'Araguainha', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1349, NULL, NULL, 'Araputanga', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1350, NULL, NULL, 'Arenápolis', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1351, NULL, NULL, 'Aripuanã', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1352, NULL, NULL, 'Barão de Melgaço', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1353, NULL, NULL, 'Barra do Bugres', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1354, NULL, NULL, 'Barra do Garças', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1355, NULL, NULL, 'Brasnorte', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1356, NULL, NULL, 'Cáceres', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1357, NULL, NULL, 'Campinápolis', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1358, NULL, NULL, 'Campo Novo do Parecis', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1359, NULL, NULL, 'Campo Verde', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1360, NULL, NULL, 'Campos de Júlio', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1361, NULL, NULL, 'Canabrava do Norte', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1362, NULL, NULL, 'Canarana', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1363, NULL, NULL, 'Carlinda', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1364, NULL, NULL, 'Castanheira', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1365, NULL, NULL, 'Chapada dos Guimarães', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1366, NULL, NULL, 'Cláudia', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1367, NULL, NULL, 'Cocalinho', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1368, NULL, NULL, 'Colíder', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1369, NULL, NULL, 'Comodoro', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1370, NULL, NULL, 'Confresa', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1371, NULL, NULL, 'Cotriguaçu', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1372, NULL, NULL, 'Cuiabá', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1373, NULL, NULL, 'Denise', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1374, NULL, NULL, 'Diamantino', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1375, NULL, NULL, 'Dom Aquino', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1376, NULL, NULL, 'Feliz Natal', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1377, NULL, NULL, 'Figueirópolis d`Oeste', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1378, NULL, NULL, 'Gaúcha do Norte', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1379, NULL, NULL, 'General Carneiro', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1380, NULL, NULL, 'Glória d`Oeste', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1381, NULL, NULL, 'Guarantã do Norte', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1382, NULL, NULL, 'Guiratinga', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1383, NULL, NULL, 'Indiavaí', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1384, NULL, NULL, 'Itaúba', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1385, NULL, NULL, 'Itiquira', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1386, NULL, NULL, 'Jaciara', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1387, NULL, NULL, 'Jangada', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1388, NULL, NULL, 'Jauru', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1389, NULL, NULL, 'Juara', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1390, NULL, NULL, 'Juína', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1391, NULL, NULL, 'Juruena', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1392, NULL, NULL, 'Juscimeira', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1393, NULL, NULL, 'Lambari d`Oeste', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1394, NULL, NULL, 'Lucas do Rio Verde', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1395, NULL, NULL, 'Luciára', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1396, NULL, NULL, 'Marcelândia', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1397, NULL, NULL, 'Matupá', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1398, NULL, NULL, 'Mirassol d`Oeste', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1399, NULL, NULL, 'Nobres', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1400, NULL, NULL, 'Nortelândia', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1401, NULL, NULL, 'Nossa Senhora do Livramento', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1402, NULL, NULL, 'Nova Bandeirantes', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1403, NULL, NULL, 'Nova Brasilândia', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1404, NULL, NULL, 'Nova Canaã do Norte', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1405, NULL, NULL, 'Nova Guarita', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1406, NULL, NULL, 'Nova Lacerda', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1407, NULL, NULL, 'Nova Marilândia', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1408, NULL, NULL, 'Nova Maringá', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1409, NULL, NULL, 'Nova Monte Verde', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1410, NULL, NULL, 'Nova Mutum', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1411, NULL, NULL, 'Nova Olímpia', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1412, NULL, NULL, 'Nova Ubiratã', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1413, NULL, NULL, 'Nova Xavantina', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1414, NULL, NULL, 'Novo Horizonte do Norte', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1415, NULL, NULL, 'Novo Mundo', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1416, NULL, NULL, 'Novo São Joaquim', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1417, NULL, NULL, 'Paranaíta', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1418, NULL, NULL, 'Paranatinga', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1419, NULL, NULL, 'Pedra Preta', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1420, NULL, NULL, 'Peixoto de Azevedo', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1421, NULL, NULL, 'Planalto da Serra', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1422, NULL, NULL, 'Poconé', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1423, NULL, NULL, 'Pontal do Araguaia', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1424, NULL, NULL, 'Ponte Branca', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1425, NULL, NULL, 'Pontes e Lacerda', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1426, NULL, NULL, 'Porto Alegre do Norte', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1427, NULL, NULL, 'Porto dos Gaúchos', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1428, NULL, NULL, 'Porto Esperidião', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1429, NULL, NULL, 'Porto Estrela', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1430, NULL, NULL, 'Poxoréo', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1431, NULL, NULL, 'Primavera do Leste', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1432, NULL, NULL, 'Querência', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1433, NULL, NULL, 'Reserva do Cabaçal', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1434, NULL, NULL, 'Ribeirão Cascalheira', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1435, NULL, NULL, 'Ribeirãozinho', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1436, NULL, NULL, 'Rio Branco', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1437, NULL, NULL, 'Rondonópolis', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1438, NULL, NULL, 'Rosário Oeste', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1439, NULL, NULL, 'Salto do Céu', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1440, NULL, NULL, 'Santa Carmem', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1441, NULL, NULL, 'Santa Terezinha', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1442, NULL, NULL, 'Santo Afonso', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1443, NULL, NULL, 'Santo Antônio do Leverger', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1444, NULL, NULL, 'São Félix do Araguaia', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1445, NULL, NULL, 'São José do Povo', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1446, NULL, NULL, 'São José do Rio Claro', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1447, NULL, NULL, 'São José do Xingu', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1448, NULL, NULL, 'São José dos Quatro Marcos', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1449, NULL, NULL, 'São Pedro da Cipa', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1450, NULL, NULL, 'Sapezal', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1451, NULL, NULL, 'Sinop', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1452, NULL, NULL, 'Sorriso', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1453, NULL, NULL, 'Tabaporã', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1454, NULL, NULL, 'Tangará da Serra', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1455, NULL, NULL, 'Tapurah', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1456, NULL, NULL, 'Terra Nova do Norte', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1457, NULL, NULL, 'Tesouro', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1458, NULL, NULL, 'Torixoréu', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1459, NULL, NULL, 'União do Sul', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1460, NULL, NULL, 'Várzea Grande', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1461, NULL, NULL, 'Vera', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1462, NULL, NULL, 'Vila Bela da Santíssima Trindade', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1463, NULL, NULL, 'Vila Rica', 11);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1464, NULL, NULL, 'Água Clara', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1465, NULL, NULL, 'Alcinópolis', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1466, NULL, NULL, 'Amambaí', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1467, NULL, NULL, 'Anastácio', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1468, NULL, NULL, 'Anaurilândia', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1469, NULL, NULL, 'Angélica', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1470, NULL, NULL, 'Antônio João', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1471, NULL, NULL, 'Aparecida do Taboado', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1472, NULL, NULL, 'Aquidauana', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1473, NULL, NULL, 'Aral Moreira', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1474, NULL, NULL, 'Bandeirantes', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1475, NULL, NULL, 'Bataguassu', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1476, NULL, NULL, 'Bataiporã', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1477, NULL, NULL, 'Bela Vista', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1478, NULL, NULL, 'Bodoquena', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1479, NULL, NULL, 'Bonito', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1480, NULL, NULL, 'Brasilândia', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1481, NULL, NULL, 'Caarapó', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1482, NULL, NULL, 'Camapuã', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1483, NULL, NULL, 'Campo Grande', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1484, NULL, NULL, 'Caracol', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1485, NULL, NULL, 'Cassilândia', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1486, NULL, NULL, 'Chapadão do Sul', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1487, NULL, NULL, 'Corguinho', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1488, NULL, NULL, 'Coronel Sapucaia', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1489, NULL, NULL, 'Corumbá', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1490, NULL, NULL, 'Costa Rica', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1491, NULL, NULL, 'Coxim', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1492, NULL, NULL, 'Deodápolis', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1493, NULL, NULL, 'Dois Irmãos do Buriti', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1494, NULL, NULL, 'Douradina', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1495, NULL, NULL, 'Dourados', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1496, NULL, NULL, 'Eldorado', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1497, NULL, NULL, 'Fátima do Sul', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1498, NULL, NULL, 'Glória de Dourados', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1499, NULL, NULL, 'Guia Lopes da Laguna', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1500, NULL, NULL, 'Iguatemi', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1501, NULL, NULL, 'Inocência', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1502, NULL, NULL, 'Itaporã', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1503, NULL, NULL, 'Itaquiraí', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1504, NULL, NULL, 'Ivinhema', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1505, NULL, NULL, 'Japorã', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1506, NULL, NULL, 'Jaraguari', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1507, NULL, NULL, 'Jardim', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1508, NULL, NULL, 'Jateí', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1509, NULL, NULL, 'Juti', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1510, NULL, NULL, 'Ladário', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1511, NULL, NULL, 'Laguna Carapã', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1512, NULL, NULL, 'Maracaju', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1513, NULL, NULL, 'Miranda', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1514, NULL, NULL, 'Mundo Novo', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1515, NULL, NULL, 'Naviraí', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1516, NULL, NULL, 'Nioaque', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1517, NULL, NULL, 'Nova Alvorada do Sul', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1518, NULL, NULL, 'Nova Andradina', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1519, NULL, NULL, 'Novo Horizonte do Sul', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1520, NULL, NULL, 'Paranaíba', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1521, NULL, NULL, 'Paranhos', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1522, NULL, NULL, 'Pedro Gomes', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1523, NULL, NULL, 'Ponta Porã', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1524, NULL, NULL, 'Porto Murtinho', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1525, NULL, NULL, 'Ribas do Rio Pardo', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1526, NULL, NULL, 'Rio Brilhante', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1527, NULL, NULL, 'Rio Negro', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1528, NULL, NULL, 'Rio Verde de Mato Grosso', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1529, NULL, NULL, 'Rochedo', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1530, NULL, NULL, 'Santa Rita do Pardo', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1531, NULL, NULL, 'São Gabriel do Oeste', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1532, NULL, NULL, 'Selvíria', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1533, NULL, NULL, 'Sete Quedas', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1534, NULL, NULL, 'Sidrolândia', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1535, NULL, NULL, 'Sonora', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1536, NULL, NULL, 'Tacuru', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1537, NULL, NULL, 'Taquarussu', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1538, NULL, NULL, 'Terenos', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1539, NULL, NULL, 'Três Lagoas', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1540, NULL, NULL, 'Vicentina', 12);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1541, NULL, NULL, 'Abadia dos Dourados', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1542, NULL, NULL, 'Abaeté', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1543, NULL, NULL, 'Abre Campo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1544, NULL, NULL, 'Acaiaca', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1545, NULL, NULL, 'Açucena', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1546, NULL, NULL, 'Água Boa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1547, NULL, NULL, 'Água Comprida', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1548, NULL, NULL, 'Aguanil', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1549, NULL, NULL, 'Águas Formosas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1550, NULL, NULL, 'Águas Vermelhas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1551, NULL, NULL, 'Aimorés', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1552, NULL, NULL, 'Aiuruoca', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1553, NULL, NULL, 'Alagoa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1554, NULL, NULL, 'Albertina', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1555, NULL, NULL, 'Além Paraíba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1556, NULL, NULL, 'Alfenas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1557, NULL, NULL, 'Alfredo Vasconcelos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1558, NULL, NULL, 'Almenara', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1559, NULL, NULL, 'Alpercata', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1560, NULL, NULL, 'Alpinópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1561, NULL, NULL, 'Alterosa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1562, NULL, NULL, 'Alto Caparaó', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1563, NULL, NULL, 'Alto Jequitibá', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1564, NULL, NULL, 'Alto Rio Doce', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1565, NULL, NULL, 'Alvarenga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1566, NULL, NULL, 'Alvinópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1567, NULL, NULL, 'Alvorada de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1568, NULL, NULL, 'Amparo do Serra', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1569, NULL, NULL, 'Andradas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1570, NULL, NULL, 'Andrelândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1571, NULL, NULL, 'Angelândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1572, NULL, NULL, 'Antônio Carlos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1573, NULL, NULL, 'Antônio Dias', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1574, NULL, NULL, 'Antônio Prado de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1575, NULL, NULL, 'Araçaí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1576, NULL, NULL, 'Aracitaba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1577, NULL, NULL, 'Araçuaí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1578, NULL, NULL, 'Araguari', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1579, NULL, NULL, 'Arantina', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1580, NULL, NULL, 'Araponga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1581, NULL, NULL, 'Araporã', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1582, NULL, NULL, 'Arapuá', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1583, NULL, NULL, 'Araújos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1584, NULL, NULL, 'Araxá', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1585, NULL, NULL, 'Arceburgo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1586, NULL, NULL, 'Arcos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1587, NULL, NULL, 'Areado', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1588, NULL, NULL, 'Argirita', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1589, NULL, NULL, 'Aricanduva', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1590, NULL, NULL, 'Arinos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1591, NULL, NULL, 'Astolfo Dutra', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1592, NULL, NULL, 'Ataléia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1593, NULL, NULL, 'Augusto de Lima', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1594, NULL, NULL, 'Baependi', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1595, NULL, NULL, 'Baldim', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1596, NULL, NULL, 'Bambuí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1597, NULL, NULL, 'Bandeira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1598, NULL, NULL, 'Bandeira do Sul', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1599, NULL, NULL, 'Barão de Cocais', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1600, NULL, NULL, 'Barão de Monte Alto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1601, NULL, NULL, 'Barbacena', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1602, NULL, NULL, 'Barra Longa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1603, NULL, NULL, 'Barroso', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1604, NULL, NULL, 'Bela Vista de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1605, NULL, NULL, 'Belmiro Braga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1606, NULL, NULL, 'Belo Horizonte', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1607, NULL, NULL, 'Belo Oriente', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1608, NULL, NULL, 'Belo Vale', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1609, NULL, NULL, 'Berilo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1610, NULL, NULL, 'Berizal', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1611, NULL, NULL, 'Bertópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1612, NULL, NULL, 'Betim', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1613, NULL, NULL, 'Bias Fortes', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1614, NULL, NULL, 'Bicas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1615, NULL, NULL, 'Biquinhas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1616, NULL, NULL, 'Boa Esperança', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1617, NULL, NULL, 'Bocaina de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1618, NULL, NULL, 'Bocaiúva', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1619, NULL, NULL, 'Bom Despacho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1620, NULL, NULL, 'Bom Jardim de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1621, NULL, NULL, 'Bom Jesus da Penha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1622, NULL, NULL, 'Bom Jesus do Amparo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1623, NULL, NULL, 'Bom Jesus do Galho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1624, NULL, NULL, 'Bom Repouso', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1625, NULL, NULL, 'Bom Sucesso', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1626, NULL, NULL, 'Bonfim', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1627, NULL, NULL, 'Bonfinópolis de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1628, NULL, NULL, 'Bonito de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1629, NULL, NULL, 'Borda da Mata', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1630, NULL, NULL, 'Botelhos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1631, NULL, NULL, 'Botumirim', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1632, NULL, NULL, 'Brás Pires', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1633, NULL, NULL, 'Brasilândia de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1634, NULL, NULL, 'Brasília de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1635, NULL, NULL, 'Brasópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1636, NULL, NULL, 'Braúnas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1637, NULL, NULL, 'Brumadinho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1638, NULL, NULL, 'Bueno Brandão', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1639, NULL, NULL, 'Buenópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1640, NULL, NULL, 'Bugre', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1641, NULL, NULL, 'Buritis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1642, NULL, NULL, 'Buritizeiro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1643, NULL, NULL, 'Cabeceira Grande', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1644, NULL, NULL, 'Cabo Verde', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1645, NULL, NULL, 'Cachoeira da Prata', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1646, NULL, NULL, 'Cachoeira de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1647, NULL, NULL, 'Cachoeira de Pajeú', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1648, NULL, NULL, 'Cachoeira Dourada', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1649, NULL, NULL, 'Caetanópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1650, NULL, NULL, 'Caeté', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1651, NULL, NULL, 'Caiana', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1652, NULL, NULL, 'Cajuri', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1653, NULL, NULL, 'Caldas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1654, NULL, NULL, 'Camacho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1655, NULL, NULL, 'Camanducaia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1656, NULL, NULL, 'Cambuí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1657, NULL, NULL, 'Cambuquira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1658, NULL, NULL, 'Campanário', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1659, NULL, NULL, 'Campanha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1660, NULL, NULL, 'Campestre', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1661, NULL, NULL, 'Campina Verde', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1662, NULL, NULL, 'Campo Azul', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1663, NULL, NULL, 'Campo Belo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1664, NULL, NULL, 'Campo do Meio', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1665, NULL, NULL, 'Campo Florido', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1666, NULL, NULL, 'Campos Altos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1667, NULL, NULL, 'Campos Gerais', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1668, NULL, NULL, 'Cana Verde', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1669, NULL, NULL, 'Canaã', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1670, NULL, NULL, 'Canápolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1671, NULL, NULL, 'Candeias', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1672, NULL, NULL, 'Cantagalo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1673, NULL, NULL, 'Caparaó', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1674, NULL, NULL, 'Capela Nova', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1675, NULL, NULL, 'Capelinha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1676, NULL, NULL, 'Capetinga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1677, NULL, NULL, 'Capim Branco', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1678, NULL, NULL, 'Capinópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1679, NULL, NULL, 'Capitão Andrade', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1680, NULL, NULL, 'Capitão Enéas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1681, NULL, NULL, 'Capitólio', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1682, NULL, NULL, 'Caputira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1683, NULL, NULL, 'Caraí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1684, NULL, NULL, 'Caranaíba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1685, NULL, NULL, 'Carandaí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1686, NULL, NULL, 'Carangola', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1687, NULL, NULL, 'Caratinga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1688, NULL, NULL, 'Carbonita', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1689, NULL, NULL, 'Careaçu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1690, NULL, NULL, 'Carlos Chagas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1691, NULL, NULL, 'Carmésia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1692, NULL, NULL, 'Carmo da Cachoeira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1693, NULL, NULL, 'Carmo da Mata', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1694, NULL, NULL, 'Carmo de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1695, NULL, NULL, 'Carmo do Cajuru', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1696, NULL, NULL, 'Carmo do Paranaíba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1697, NULL, NULL, 'Carmo do Rio Claro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1698, NULL, NULL, 'Carmópolis de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1699, NULL, NULL, 'Carneirinho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1700, NULL, NULL, 'Carrancas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1701, NULL, NULL, 'Carvalhópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1702, NULL, NULL, 'Carvalhos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1703, NULL, NULL, 'Casa Grande', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1704, NULL, NULL, 'Cascalho Rico', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1705, NULL, NULL, 'Cássia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1706, NULL, NULL, 'Cataguases', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1707, NULL, NULL, 'Catas Altas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1708, NULL, NULL, 'Catas Altas da Noruega', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1709, NULL, NULL, 'Catuji', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1710, NULL, NULL, 'Catuti', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1711, NULL, NULL, 'Caxambu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1712, NULL, NULL, 'Cedro do Abaeté', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1713, NULL, NULL, 'Central de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1714, NULL, NULL, 'Centralina', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1715, NULL, NULL, 'Chácara', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1716, NULL, NULL, 'Chalé', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1717, NULL, NULL, 'Chapada do Norte', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1718, NULL, NULL, 'Chapada Gaúcha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1719, NULL, NULL, 'Chiador', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1720, NULL, NULL, 'Cipotânea', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1721, NULL, NULL, 'Claraval', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1722, NULL, NULL, 'Claro dos Poções', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1723, NULL, NULL, 'Cláudio', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1724, NULL, NULL, 'Coimbra', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1725, NULL, NULL, 'Coluna', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1726, NULL, NULL, 'Comendador Gomes', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1727, NULL, NULL, 'Comercinho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1728, NULL, NULL, 'Conceição da Aparecida', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1729, NULL, NULL, 'Conceição da Barra de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1730, NULL, NULL, 'Conceição das Alagoas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1731, NULL, NULL, 'Conceição das Pedras', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1732, NULL, NULL, 'Conceição de Ipanema', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1733, NULL, NULL, 'Conceição do Mato Dentro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1734, NULL, NULL, 'Conceição do Pará', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1735, NULL, NULL, 'Conceição do Rio Verde', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1736, NULL, NULL, 'Conceição dos Ouros', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1737, NULL, NULL, 'Cônego Marinho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1738, NULL, NULL, 'Confins', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1739, NULL, NULL, 'Congonhal', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1740, NULL, NULL, 'Congonhas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1741, NULL, NULL, 'Congonhas do Norte', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1742, NULL, NULL, 'Conquista', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1743, NULL, NULL, 'Conselheiro Lafaiete', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1744, NULL, NULL, 'Conselheiro Pena', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1745, NULL, NULL, 'Consolação', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1746, NULL, NULL, 'Contagem', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1747, NULL, NULL, 'Coqueiral', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1748, NULL, NULL, 'Coração de Jesus', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1749, NULL, NULL, 'Cordisburgo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1750, NULL, NULL, 'Cordislândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1751, NULL, NULL, 'Corinto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1752, NULL, NULL, 'Coroaci', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1753, NULL, NULL, 'Coromandel', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1754, NULL, NULL, 'Coronel Fabriciano', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1755, NULL, NULL, 'Coronel Murta', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1756, NULL, NULL, 'Coronel Pacheco', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1757, NULL, NULL, 'Coronel Xavier Chaves', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1758, NULL, NULL, 'Córrego Danta', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1759, NULL, NULL, 'Córrego do Bom Jesus', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1760, NULL, NULL, 'Córrego Fundo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1761, NULL, NULL, 'Córrego Novo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1762, NULL, NULL, 'Couto de Magalhães de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1763, NULL, NULL, 'Crisólita', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1764, NULL, NULL, 'Cristais', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1765, NULL, NULL, 'Cristália', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1766, NULL, NULL, 'Cristiano Otoni', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1767, NULL, NULL, 'Cristina', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1768, NULL, NULL, 'Crucilândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1769, NULL, NULL, 'Cruzeiro da Fortaleza', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1770, NULL, NULL, 'Cruzília', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1771, NULL, NULL, 'Cuparaque', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1772, NULL, NULL, 'Curral de Dentro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1773, NULL, NULL, 'Curvelo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1774, NULL, NULL, 'Datas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1775, NULL, NULL, 'Delfim Moreira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1776, NULL, NULL, 'Delfinópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1777, NULL, NULL, 'Delta', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1778, NULL, NULL, 'Descoberto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1779, NULL, NULL, 'Desterro de Entre Rios', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1780, NULL, NULL, 'Desterro do Melo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1781, NULL, NULL, 'Diamantina', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1782, NULL, NULL, 'Diogo de Vasconcelos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1783, NULL, NULL, 'Dionísio', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1784, NULL, NULL, 'Divinésia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1785, NULL, NULL, 'Divino', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1786, NULL, NULL, 'Divino das Laranjeiras', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1787, NULL, NULL, 'Divinolândia de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1788, NULL, NULL, 'Divinópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1789, NULL, NULL, 'Divisa Alegre', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1790, NULL, NULL, 'Divisa Nova', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1791, NULL, NULL, 'Divisópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1792, NULL, NULL, 'Dom Bosco', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1793, NULL, NULL, 'Dom Cavati', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1794, NULL, NULL, 'Dom Joaquim', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1795, NULL, NULL, 'Dom Silvério', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1796, NULL, NULL, 'Dom Viçoso', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1797, NULL, NULL, 'Dona Eusébia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1798, NULL, NULL, 'Dores de Campos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1799, NULL, NULL, 'Dores de Guanhães', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1800, NULL, NULL, 'Dores do Indaiá', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1801, NULL, NULL, 'Dores do Turvo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1802, NULL, NULL, 'Doresópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1803, NULL, NULL, 'Douradoquara', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1804, NULL, NULL, 'Durandé', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1805, NULL, NULL, 'Elói Mendes', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1806, NULL, NULL, 'Engenheiro Caldas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1807, NULL, NULL, 'Engenheiro Navarro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1808, NULL, NULL, 'Entre Folhas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1809, NULL, NULL, 'Entre Rios de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1810, NULL, NULL, 'Ervália', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1811, NULL, NULL, 'Esmeraldas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1812, NULL, NULL, 'Espera Feliz', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1813, NULL, NULL, 'Espinosa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1814, NULL, NULL, 'Espírito Santo do Dourado', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1815, NULL, NULL, 'Estiva', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1816, NULL, NULL, 'Estrela Dalva', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1817, NULL, NULL, 'Estrela do Indaiá', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1818, NULL, NULL, 'Estrela do Sul', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1819, NULL, NULL, 'Eugenópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1820, NULL, NULL, 'Ewbank da Câmara', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1821, NULL, NULL, 'Extrema', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1822, NULL, NULL, 'Fama', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1823, NULL, NULL, 'Faria Lemos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1824, NULL, NULL, 'Felício dos Santos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1825, NULL, NULL, 'Felisburgo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1826, NULL, NULL, 'Felixlândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1827, NULL, NULL, 'Fernandes Tourinho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1828, NULL, NULL, 'Ferros', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1829, NULL, NULL, 'Fervedouro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1830, NULL, NULL, 'Florestal', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1831, NULL, NULL, 'Formiga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1832, NULL, NULL, 'Formoso', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1833, NULL, NULL, 'Fortaleza de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1834, NULL, NULL, 'Fortuna de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1835, NULL, NULL, 'Francisco Badaró', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1836, NULL, NULL, 'Francisco Dumont', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1837, NULL, NULL, 'Francisco Sá', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1838, NULL, NULL, 'Franciscópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1839, NULL, NULL, 'Frei Gaspar', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1840, NULL, NULL, 'Frei Inocêncio', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1841, NULL, NULL, 'Frei Lagonegro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1842, NULL, NULL, 'Fronteira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1843, NULL, NULL, 'Fronteira dos Vales', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1844, NULL, NULL, 'Fruta de Leite', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1845, NULL, NULL, 'Frutal', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1846, NULL, NULL, 'Funilândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1847, NULL, NULL, 'Galiléia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1848, NULL, NULL, 'Gameleiras', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1849, NULL, NULL, 'Glaucilândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1850, NULL, NULL, 'Goiabeira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1851, NULL, NULL, 'Goianá', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1852, NULL, NULL, 'Gonçalves', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1853, NULL, NULL, 'Gonzaga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1854, NULL, NULL, 'Gouveia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1855, NULL, NULL, 'Governador Valadares', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1856, NULL, NULL, 'Grão Mogol', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1857, NULL, NULL, 'Grupiara', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1858, NULL, NULL, 'Guanhães', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1859, NULL, NULL, 'Guapé', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1860, NULL, NULL, 'Guaraciaba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1861, NULL, NULL, 'Guaraciama', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1862, NULL, NULL, 'Guaranésia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1863, NULL, NULL, 'Guarani', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1864, NULL, NULL, 'Guarará', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1865, NULL, NULL, 'Guarda-Mor', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1866, NULL, NULL, 'Guaxupé', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1867, NULL, NULL, 'Guidoval', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1868, NULL, NULL, 'Guimarânia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1869, NULL, NULL, 'Guiricema', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1870, NULL, NULL, 'Gurinhatã', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1871, NULL, NULL, 'Heliodora', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1872, NULL, NULL, 'Iapu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1873, NULL, NULL, 'Ibertioga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1874, NULL, NULL, 'Ibiá', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1875, NULL, NULL, 'Ibiaí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1876, NULL, NULL, 'Ibiracatu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1877, NULL, NULL, 'Ibiraci', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1878, NULL, NULL, 'Ibirité', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1879, NULL, NULL, 'Ibitiúra de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1880, NULL, NULL, 'Ibituruna', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1881, NULL, NULL, 'Icaraí de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1882, NULL, NULL, 'Igarapé', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1883, NULL, NULL, 'Igaratinga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1884, NULL, NULL, 'Iguatama', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1885, NULL, NULL, 'Ijaci', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1886, NULL, NULL, 'Ilicínea', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1887, NULL, NULL, 'Imbé de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1888, NULL, NULL, 'Inconfidentes', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1889, NULL, NULL, 'Indaiabira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1890, NULL, NULL, 'Indianópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1891, NULL, NULL, 'Ingaí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1892, NULL, NULL, 'Inhapim', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1893, NULL, NULL, 'Inhaúma', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1894, NULL, NULL, 'Inimutaba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1895, NULL, NULL, 'Ipaba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1896, NULL, NULL, 'Ipanema', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1897, NULL, NULL, 'Ipatinga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1898, NULL, NULL, 'Ipiaçu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1899, NULL, NULL, 'Ipuiúna', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1900, NULL, NULL, 'Iraí de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1901, NULL, NULL, 'Itabira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1902, NULL, NULL, 'Itabirinha de Mantena', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1903, NULL, NULL, 'Itabirito', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1904, NULL, NULL, 'Itacambira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1905, NULL, NULL, 'Itacarambi', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1906, NULL, NULL, 'Itaguara', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1907, NULL, NULL, 'Itaipé', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1908, NULL, NULL, 'Itajubá', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1909, NULL, NULL, 'Itamarandiba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1910, NULL, NULL, 'Itamarati de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1911, NULL, NULL, 'Itambacuri', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1912, NULL, NULL, 'Itambé do Mato Dentro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1913, NULL, NULL, 'Itamogi', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1914, NULL, NULL, 'Itamonte', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1915, NULL, NULL, 'Itanhandu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1916, NULL, NULL, 'Itanhomi', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1917, NULL, NULL, 'Itaobim', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1918, NULL, NULL, 'Itapagipe', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1919, NULL, NULL, 'Itapecerica', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1920, NULL, NULL, 'Itapeva', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1921, NULL, NULL, 'Itatiaiuçu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1922, NULL, NULL, 'Itaú de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1923, NULL, NULL, 'Itaúna', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1924, NULL, NULL, 'Itaverava', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1925, NULL, NULL, 'Itinga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1926, NULL, NULL, 'Itueta', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1927, NULL, NULL, 'Ituiutaba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1928, NULL, NULL, 'Itumirim', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1929, NULL, NULL, 'Iturama', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1930, NULL, NULL, 'Itutinga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1931, NULL, NULL, 'Jaboticatubas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1932, NULL, NULL, 'Jacinto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1933, NULL, NULL, 'Jacuí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1934, NULL, NULL, 'Jacutinga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1935, NULL, NULL, 'Jaguaraçu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1936, NULL, NULL, 'Jaíba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1937, NULL, NULL, 'Jampruca', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1938, NULL, NULL, 'Janaúba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1939, NULL, NULL, 'Januária', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1940, NULL, NULL, 'Japaraíba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1941, NULL, NULL, 'Japonvar', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1942, NULL, NULL, 'Jeceaba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1943, NULL, NULL, 'Jenipapo de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1944, NULL, NULL, 'Jequeri', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1945, NULL, NULL, 'Jequitaí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1946, NULL, NULL, 'Jequitibá', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1947, NULL, NULL, 'Jequitinhonha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1948, NULL, NULL, 'Jesuânia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1949, NULL, NULL, 'Joaíma', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1950, NULL, NULL, 'Joanésia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1951, NULL, NULL, 'João Monlevade', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1952, NULL, NULL, 'João Pinheiro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1953, NULL, NULL, 'Joaquim Felício', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1954, NULL, NULL, 'Jordânia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1955, NULL, NULL, 'José Gonçalves de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1956, NULL, NULL, 'José Raydan', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1957, NULL, NULL, 'Josenópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1958, NULL, NULL, 'Juatuba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1959, NULL, NULL, 'Juiz de Fora', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1960, NULL, NULL, 'Juramento', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1961, NULL, NULL, 'Juruaia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1962, NULL, NULL, 'Juvenília', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1963, NULL, NULL, 'Ladainha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1964, NULL, NULL, 'Lagamar', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1965, NULL, NULL, 'Lagoa da Prata', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1966, NULL, NULL, 'Lagoa dos Patos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1967, NULL, NULL, 'Lagoa Dourada', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1968, NULL, NULL, 'Lagoa Formosa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1969, NULL, NULL, 'Lagoa Grande', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1970, NULL, NULL, 'Lagoa Santa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1971, NULL, NULL, 'Lajinha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1972, NULL, NULL, 'Lambari', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1973, NULL, NULL, 'Lamim', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1974, NULL, NULL, 'Laranjal', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1975, NULL, NULL, 'Lassance', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1976, NULL, NULL, 'Lavras', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1977, NULL, NULL, 'Leandro Ferreira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1978, NULL, NULL, 'Leme do Prado', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1979, NULL, NULL, 'Leopoldina', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1980, NULL, NULL, 'Liberdade', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1981, NULL, NULL, 'Lima Duarte', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1982, NULL, NULL, 'Limeira do Oeste', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1983, NULL, NULL, 'Lontra', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1984, NULL, NULL, 'Luisburgo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1985, NULL, NULL, 'Luislândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1986, NULL, NULL, 'Luminárias', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1987, NULL, NULL, 'Luz', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1988, NULL, NULL, 'Machacalis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1989, NULL, NULL, 'Machado', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1990, NULL, NULL, 'Madre de Deus de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1991, NULL, NULL, 'Malacacheta', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1992, NULL, NULL, 'Mamonas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1993, NULL, NULL, 'Manga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1994, NULL, NULL, 'Manhuaçu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1995, NULL, NULL, 'Manhumirim', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1996, NULL, NULL, 'Mantena', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1997, NULL, NULL, 'Mar de Espanha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1998, NULL, NULL, 'Maravilhas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (1999, NULL, NULL, 'Maria da Fé', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2000, NULL, NULL, 'Mariana', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2001, NULL, NULL, 'Marilac', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2002, NULL, NULL, 'Mário Campos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2003, NULL, NULL, 'Maripá de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2004, NULL, NULL, 'Marliéria', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2005, NULL, NULL, 'Marmelópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2006, NULL, NULL, 'Martinho Campos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2007, NULL, NULL, 'Martins Soares', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2008, NULL, NULL, 'Mata Verde', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2009, NULL, NULL, 'Materlândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2010, NULL, NULL, 'Mateus Leme', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2011, NULL, NULL, 'Mathias Lobato', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2012, NULL, NULL, 'Matias Barbosa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2013, NULL, NULL, 'Matias Cardoso', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2014, NULL, NULL, 'Matipó', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2015, NULL, NULL, 'Mato Verde', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2016, NULL, NULL, 'Matozinhos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2017, NULL, NULL, 'Matutina', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2018, NULL, NULL, 'Medeiros', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2019, NULL, NULL, 'Medina', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2020, NULL, NULL, 'Mendes Pimentel', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2021, NULL, NULL, 'Mercês', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2022, NULL, NULL, 'Mesquita', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2023, NULL, NULL, 'Minas Novas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2024, NULL, NULL, 'Minduri', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2025, NULL, NULL, 'Mirabela', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2026, NULL, NULL, 'Miradouro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2027, NULL, NULL, 'Miraí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2028, NULL, NULL, 'Miravânia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2029, NULL, NULL, 'Moeda', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2030, NULL, NULL, 'Moema', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2031, NULL, NULL, 'Monjolos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2032, NULL, NULL, 'Monsenhor Paulo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2033, NULL, NULL, 'Montalvânia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2034, NULL, NULL, 'Monte Alegre de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2035, NULL, NULL, 'Monte Azul', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2036, NULL, NULL, 'Monte Belo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2037, NULL, NULL, 'Monte Carmelo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2038, NULL, NULL, 'Monte Formoso', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2039, NULL, NULL, 'Monte Santo de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2040, NULL, NULL, 'Monte Sião', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2041, NULL, NULL, 'Montes Claros', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2042, NULL, NULL, 'Montezuma', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2043, NULL, NULL, 'Morada Nova de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2044, NULL, NULL, 'Morro da Garça', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2045, NULL, NULL, 'Morro do Pilar', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2046, NULL, NULL, 'Munhoz', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2047, NULL, NULL, 'Muriaé', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2048, NULL, NULL, 'Mutum', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2049, NULL, NULL, 'Muzambinho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2050, NULL, NULL, 'Nacip Raydan', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2051, NULL, NULL, 'Nanuque', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2052, NULL, NULL, 'Naque', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2053, NULL, NULL, 'Natalândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2054, NULL, NULL, 'Natércia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2055, NULL, NULL, 'Nazareno', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2056, NULL, NULL, 'Nepomuceno', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2057, NULL, NULL, 'Ninheira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2058, NULL, NULL, 'Nova Belém', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2059, NULL, NULL, 'Nova Era', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2060, NULL, NULL, 'Nova Lima', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2061, NULL, NULL, 'Nova Módica', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2062, NULL, NULL, 'Nova Ponte', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2063, NULL, NULL, 'Nova Porteirinha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2064, NULL, NULL, 'Nova Resende', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2065, NULL, NULL, 'Nova Serrana', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2066, NULL, NULL, 'Nova União', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2067, NULL, NULL, 'Novo Cruzeiro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2068, NULL, NULL, 'Novo Oriente de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2069, NULL, NULL, 'Novorizonte', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2070, NULL, NULL, 'Olaria', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2071, NULL, NULL, 'Olhos-d`Água', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2072, NULL, NULL, 'Olímpio Noronha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2073, NULL, NULL, 'Oliveira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2074, NULL, NULL, 'Oliveira Fortes', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2075, NULL, NULL, 'Onça de Pitangui', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2076, NULL, NULL, 'Oratórios', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2077, NULL, NULL, 'Orizânia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2078, NULL, NULL, 'Ouro Branco', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2079, NULL, NULL, 'Ouro Fino', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2080, NULL, NULL, 'Ouro Preto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2081, NULL, NULL, 'Ouro Verde de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2082, NULL, NULL, 'Padre Carvalho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2083, NULL, NULL, 'Padre Paraíso', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2084, NULL, NULL, 'Pai Pedro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2085, NULL, NULL, 'Paineiras', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2086, NULL, NULL, 'Pains', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2087, NULL, NULL, 'Paiva', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2088, NULL, NULL, 'Palma', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2089, NULL, NULL, 'Palmópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2090, NULL, NULL, 'Papagaios', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2091, NULL, NULL, 'Pará de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2092, NULL, NULL, 'Paracatu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2093, NULL, NULL, 'Paraguaçu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2094, NULL, NULL, 'Paraisópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2095, NULL, NULL, 'Paraopeba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2096, NULL, NULL, 'Passa Quatro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2097, NULL, NULL, 'Passa Tempo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2098, NULL, NULL, 'Passa-Vinte', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2099, NULL, NULL, 'Passabém', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2100, NULL, NULL, 'Passos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2101, NULL, NULL, 'Patis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2102, NULL, NULL, 'Patos de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2103, NULL, NULL, 'Patrocínio', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2104, NULL, NULL, 'Patrocínio do Muriaé', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2105, NULL, NULL, 'Paula Cândido', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2106, NULL, NULL, 'Paulistas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2107, NULL, NULL, 'Pavão', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2108, NULL, NULL, 'Peçanha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2109, NULL, NULL, 'Pedra Azul', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2110, NULL, NULL, 'Pedra Bonita', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2111, NULL, NULL, 'Pedra do Anta', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2112, NULL, NULL, 'Pedra do Indaiá', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2113, NULL, NULL, 'Pedra Dourada', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2114, NULL, NULL, 'Pedralva', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2115, NULL, NULL, 'Pedras de Maria da Cruz', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2116, NULL, NULL, 'Pedrinópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2117, NULL, NULL, 'Pedro Leopoldo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2118, NULL, NULL, 'Pedro Teixeira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2119, NULL, NULL, 'Pequeri', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2120, NULL, NULL, 'Pequi', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2121, NULL, NULL, 'Perdigão', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2122, NULL, NULL, 'Perdizes', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2123, NULL, NULL, 'Perdões', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2124, NULL, NULL, 'Periquito', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2125, NULL, NULL, 'Pescador', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2126, NULL, NULL, 'Piau', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2127, NULL, NULL, 'Piedade de Caratinga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2128, NULL, NULL, 'Piedade de Ponte Nova', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2129, NULL, NULL, 'Piedade do Rio Grande', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2130, NULL, NULL, 'Piedade dos Gerais', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2131, NULL, NULL, 'Pimenta', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2132, NULL, NULL, 'Pingo-d`Água', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2133, NULL, NULL, 'Pintópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2134, NULL, NULL, 'Piracema', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2135, NULL, NULL, 'Pirajuba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2136, NULL, NULL, 'Piranga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2137, NULL, NULL, 'Piranguçu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2138, NULL, NULL, 'Piranguinho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2139, NULL, NULL, 'Pirapetinga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2140, NULL, NULL, 'Pirapora', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2141, NULL, NULL, 'Piraúba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2142, NULL, NULL, 'Pitangui', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2143, NULL, NULL, 'Piumhi', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2144, NULL, NULL, 'Planura', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2145, NULL, NULL, 'Poço Fundo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2146, NULL, NULL, 'Poços de Caldas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2147, NULL, NULL, 'Pocrane', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2148, NULL, NULL, 'Pompéu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2149, NULL, NULL, 'Ponte Nova', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2150, NULL, NULL, 'Ponto Chique', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2151, NULL, NULL, 'Ponto dos Volantes', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2152, NULL, NULL, 'Porteirinha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2153, NULL, NULL, 'Porto Firme', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2154, NULL, NULL, 'Poté', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2155, NULL, NULL, 'Pouso Alegre', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2156, NULL, NULL, 'Pouso Alto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2157, NULL, NULL, 'Prados', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2158, NULL, NULL, 'Prata', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2159, NULL, NULL, 'Pratápolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2160, NULL, NULL, 'Pratinha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2161, NULL, NULL, 'Presidente Bernardes', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2162, NULL, NULL, 'Presidente Juscelino', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2163, NULL, NULL, 'Presidente Kubitschek', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2164, NULL, NULL, 'Presidente Olegário', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2165, NULL, NULL, 'Prudente de Morais', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2166, NULL, NULL, 'Quartel Geral', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2167, NULL, NULL, 'Queluzito', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2168, NULL, NULL, 'Raposos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2169, NULL, NULL, 'Raul Soares', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2170, NULL, NULL, 'Recreio', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2171, NULL, NULL, 'Reduto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2172, NULL, NULL, 'Resende Costa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2173, NULL, NULL, 'Resplendor', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2174, NULL, NULL, 'Ressaquinha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2175, NULL, NULL, 'Riachinho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2176, NULL, NULL, 'Riacho dos Machados', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2177, NULL, NULL, 'Ribeirão das Neves', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2178, NULL, NULL, 'Ribeirão Vermelho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2179, NULL, NULL, 'Rio Acima', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2180, NULL, NULL, 'Rio Casca', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2181, NULL, NULL, 'Rio do Prado', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2182, NULL, NULL, 'Rio Doce', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2183, NULL, NULL, 'Rio Espera', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2184, NULL, NULL, 'Rio Manso', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2185, NULL, NULL, 'Rio Novo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2186, NULL, NULL, 'Rio Paranaíba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2187, NULL, NULL, 'Rio Pardo de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2188, NULL, NULL, 'Rio Piracicaba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2189, NULL, NULL, 'Rio Pomba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2190, NULL, NULL, 'Rio Preto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2191, NULL, NULL, 'Rio Vermelho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2192, NULL, NULL, 'Ritápolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2193, NULL, NULL, 'Rochedo de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2194, NULL, NULL, 'Rodeiro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2195, NULL, NULL, 'Romaria', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2196, NULL, NULL, 'Rosário da Limeira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2197, NULL, NULL, 'Rubelita', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2198, NULL, NULL, 'Rubim', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2199, NULL, NULL, 'Sabará', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2200, NULL, NULL, 'Sabinópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2201, NULL, NULL, 'Sacramento', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2202, NULL, NULL, 'Salinas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2203, NULL, NULL, 'Salto da Divisa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2204, NULL, NULL, 'Santa Bárbara', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2205, NULL, NULL, 'Santa Bárbara do Leste', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2206, NULL, NULL, 'Santa Bárbara do Monte Verde', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2207, NULL, NULL, 'Santa Bárbara do Tugúrio', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2208, NULL, NULL, 'Santa Cruz de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2209, NULL, NULL, 'Santa Cruz de Salinas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2210, NULL, NULL, 'Santa Cruz do Escalvado', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2211, NULL, NULL, 'Santa Efigênia de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2212, NULL, NULL, 'Santa Fé de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2213, NULL, NULL, 'Santa Helena de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2214, NULL, NULL, 'Santa Juliana', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2215, NULL, NULL, 'Santa Luzia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2216, NULL, NULL, 'Santa Margarida', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2217, NULL, NULL, 'Santa Maria de Itabira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2218, NULL, NULL, 'Santa Maria do Salto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2219, NULL, NULL, 'Santa Maria do Suaçuí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2220, NULL, NULL, 'Santa Rita de Caldas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2221, NULL, NULL, 'Santa Rita de Ibitipoca', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2222, NULL, NULL, 'Santa Rita de Jacutinga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2223, NULL, NULL, 'Santa Rita de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2224, NULL, NULL, 'Santa Rita do Itueto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2225, NULL, NULL, 'Santa Rita do Sapucaí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2226, NULL, NULL, 'Santa Rosa da Serra', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2227, NULL, NULL, 'Santa Vitória', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2228, NULL, NULL, 'Santana da Vargem', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2229, NULL, NULL, 'Santana de Cataguases', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2230, NULL, NULL, 'Santana de Pirapama', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2231, NULL, NULL, 'Santana do Deserto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2232, NULL, NULL, 'Santana do Garambéu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2233, NULL, NULL, 'Santana do Jacaré', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2234, NULL, NULL, 'Santana do Manhuaçu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2235, NULL, NULL, 'Santana do Paraíso', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2236, NULL, NULL, 'Santana do Riacho', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2237, NULL, NULL, 'Santana dos Montes', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2238, NULL, NULL, 'Santo Antônio do Amparo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2239, NULL, NULL, 'Santo Antônio do Aventureiro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2240, NULL, NULL, 'Santo Antônio do Grama', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2241, NULL, NULL, 'Santo Antônio do Itambé', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2242, NULL, NULL, 'Santo Antônio do Jacinto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2243, NULL, NULL, 'Santo Antônio do Monte', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2244, NULL, NULL, 'Santo Antônio do Retiro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2245, NULL, NULL, 'Santo Antônio do Rio Abaixo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2246, NULL, NULL, 'Santo Hipólito', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2247, NULL, NULL, 'Santos Dumont', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2248, NULL, NULL, 'São Bento Abade', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2249, NULL, NULL, 'São Brás do Suaçuí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2250, NULL, NULL, 'São Domingos das Dores', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2251, NULL, NULL, 'São Domingos do Prata', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2252, NULL, NULL, 'São Félix de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2253, NULL, NULL, 'São Francisco', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2254, NULL, NULL, 'São Francisco de Paula', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2255, NULL, NULL, 'São Francisco de Sales', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2256, NULL, NULL, 'São Francisco do Glória', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2257, NULL, NULL, 'São Geraldo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2258, NULL, NULL, 'São Geraldo da Piedade', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2259, NULL, NULL, 'São Geraldo do Baixio', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2260, NULL, NULL, 'São Gonçalo do Abaeté', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2261, NULL, NULL, 'São Gonçalo do Pará', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2262, NULL, NULL, 'São Gonçalo do Rio Abaixo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2263, NULL, NULL, 'São Gonçalo do Rio Preto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2264, NULL, NULL, 'São Gonçalo do Sapucaí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2265, NULL, NULL, 'São Gotardo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2266, NULL, NULL, 'São João Batista do Glória', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2267, NULL, NULL, 'São João da Lagoa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2268, NULL, NULL, 'São João da Mata', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2269, NULL, NULL, 'São João da Ponte', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2270, NULL, NULL, 'São João das Missões', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2271, NULL, NULL, 'São João del Rei', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2272, NULL, NULL, 'São João do Manhuaçu', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2273, NULL, NULL, 'São João do Manteninha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2274, NULL, NULL, 'São João do Oriente', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2275, NULL, NULL, 'São João do Pacuí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2276, NULL, NULL, 'São João do Paraíso', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2277, NULL, NULL, 'São João Evangelista', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2278, NULL, NULL, 'São João Nepomuceno', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2279, NULL, NULL, 'São Joaquim de Bicas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2280, NULL, NULL, 'São José da Barra', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2281, NULL, NULL, 'São José da Lapa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2282, NULL, NULL, 'São José da Safira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2283, NULL, NULL, 'São José da Varginha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2284, NULL, NULL, 'São José do Alegre', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2285, NULL, NULL, 'São José do Divino', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2286, NULL, NULL, 'São José do Goiabal', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2287, NULL, NULL, 'São José do Jacuri', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2288, NULL, NULL, 'São José do Mantimento', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2289, NULL, NULL, 'São Lourenço', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2290, NULL, NULL, 'São Miguel do Anta', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2291, NULL, NULL, 'São Pedro da União', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2292, NULL, NULL, 'São Pedro do Suaçuí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2293, NULL, NULL, 'São Pedro dos Ferros', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2294, NULL, NULL, 'São Romão', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2295, NULL, NULL, 'São Roque de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2296, NULL, NULL, 'São Sebastião da Bela Vista', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2297, NULL, NULL, 'São Sebastião da Vargem Alegre', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2298, NULL, NULL, 'São Sebastião do Anta', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2299, NULL, NULL, 'São Sebastião do Maranhão', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2300, NULL, NULL, 'São Sebastião do Oeste', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2301, NULL, NULL, 'São Sebastião do Paraíso', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2302, NULL, NULL, 'São Sebastião do Rio Preto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2303, NULL, NULL, 'São Sebastião do Rio Verde', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2304, NULL, NULL, 'São Thomé das Letras', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2305, NULL, NULL, 'São Tiago', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2306, NULL, NULL, 'São Tomás de Aquino', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2307, NULL, NULL, 'São Vicente de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2308, NULL, NULL, 'Sapucaí-Mirim', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2309, NULL, NULL, 'Sardoá', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2310, NULL, NULL, 'Sarzedo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2311, NULL, NULL, 'Sem-Peixe', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2312, NULL, NULL, 'Senador Amaral', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2313, NULL, NULL, 'Senador Cortes', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2314, NULL, NULL, 'Senador Firmino', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2315, NULL, NULL, 'Senador José Bento', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2316, NULL, NULL, 'Senador Modestino Gonçalves', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2317, NULL, NULL, 'Senhora de Oliveira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2318, NULL, NULL, 'Senhora do Porto', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2319, NULL, NULL, 'Senhora dos Remédios', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2320, NULL, NULL, 'Sericita', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2321, NULL, NULL, 'Seritinga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2322, NULL, NULL, 'Serra Azul de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2323, NULL, NULL, 'Serra da Saudade', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2324, NULL, NULL, 'Serra do Salitre', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2325, NULL, NULL, 'Serra dos Aimorés', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2326, NULL, NULL, 'Serrania', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2327, NULL, NULL, 'Serranópolis de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2328, NULL, NULL, 'Serranos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2329, NULL, NULL, 'Serro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2330, NULL, NULL, 'Sete Lagoas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2331, NULL, NULL, 'Setubinha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2332, NULL, NULL, 'Silveirânia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2333, NULL, NULL, 'Silvianópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2334, NULL, NULL, 'Simão Pereira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2335, NULL, NULL, 'Simonésia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2336, NULL, NULL, 'Sobrália', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2337, NULL, NULL, 'Soledade de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2338, NULL, NULL, 'Tabuleiro', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2339, NULL, NULL, 'Taiobeiras', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2340, NULL, NULL, 'Taparuba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2341, NULL, NULL, 'Tapira', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2342, NULL, NULL, 'Tapiraí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2343, NULL, NULL, 'Taquaraçu de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2344, NULL, NULL, 'Tarumirim', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2345, NULL, NULL, 'Teixeiras', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2346, NULL, NULL, 'Teófilo Otoni', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2347, NULL, NULL, 'Timóteo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2348, NULL, NULL, 'Tiradentes', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2349, NULL, NULL, 'Tiros', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2350, NULL, NULL, 'Tocantins', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2351, NULL, NULL, 'Tocos do Moji', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2352, NULL, NULL, 'Toledo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2353, NULL, NULL, 'Tombos', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2354, NULL, NULL, 'Três Corações', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2355, NULL, NULL, 'Três Marias', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2356, NULL, NULL, 'Três Pontas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2357, NULL, NULL, 'Tumiritinga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2358, NULL, NULL, 'Tupaciguara', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2359, NULL, NULL, 'Turmalina', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2360, NULL, NULL, 'Turvolândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2361, NULL, NULL, 'Ubá', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2362, NULL, NULL, 'Ubaí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2363, NULL, NULL, 'Ubaporanga', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2364, NULL, NULL, 'Uberaba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2365, NULL, NULL, 'Uberlândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2366, NULL, NULL, 'Umburatiba', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2367, NULL, NULL, 'Unaí', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2368, NULL, NULL, 'União de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2369, NULL, NULL, 'Uruana de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2370, NULL, NULL, 'Urucânia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2371, NULL, NULL, 'Urucuia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2372, NULL, NULL, 'Vargem Alegre', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2373, NULL, NULL, 'Vargem Bonita', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2374, NULL, NULL, 'Vargem Grande do Rio Pardo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2375, NULL, NULL, 'Varginha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2376, NULL, NULL, 'Varjão de Minas', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2377, NULL, NULL, 'Várzea da Palma', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2378, NULL, NULL, 'Varzelândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2379, NULL, NULL, 'Vazante', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2380, NULL, NULL, 'Verdelândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2381, NULL, NULL, 'Veredinha', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2382, NULL, NULL, 'Veríssimo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2383, NULL, NULL, 'Vermelho Novo', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2384, NULL, NULL, 'Vespasiano', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2385, NULL, NULL, 'Viçosa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2386, NULL, NULL, 'Vieiras', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2387, NULL, NULL, 'Virgem da Lapa', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2388, NULL, NULL, 'Virgínia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2389, NULL, NULL, 'Virginópolis', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2390, NULL, NULL, 'Virgolândia', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2391, NULL, NULL, 'Visconde do Rio Branco', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2392, NULL, NULL, 'Volta Grande', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2393, NULL, NULL, 'Wenceslau Braz', 13);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2394, NULL, NULL, 'Abaetetuba', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2395, NULL, NULL, 'Abel Figueiredo', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2396, NULL, NULL, 'Acará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2397, NULL, NULL, 'Afuá', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2398, NULL, NULL, 'Água Azul do Norte', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2399, NULL, NULL, 'Alenquer', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2400, NULL, NULL, 'Almeirim', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2401, NULL, NULL, 'Altamira', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2402, NULL, NULL, 'Anajás', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2403, NULL, NULL, 'Ananindeua', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2404, NULL, NULL, 'Anapu', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2405, NULL, NULL, 'Augusto Corrêa', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2406, NULL, NULL, 'Aurora do Pará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2407, NULL, NULL, 'Aveiro', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2408, NULL, NULL, 'Bagre', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2409, NULL, NULL, 'Baião', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2410, NULL, NULL, 'Bannach', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2411, NULL, NULL, 'Barcarena', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2412, NULL, NULL, 'Belém', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2413, NULL, NULL, 'Belterra', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2414, NULL, NULL, 'Benevides', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2415, NULL, NULL, 'Bom Jesus do Tocantins', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2416, NULL, NULL, 'Bonito', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2417, NULL, NULL, 'Bragança', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2418, NULL, NULL, 'Brasil Novo', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2419, NULL, NULL, 'Brejo Grande do Araguaia', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2420, NULL, NULL, 'Breu Branco', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2421, NULL, NULL, 'Breves', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2422, NULL, NULL, 'Bujaru', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2423, NULL, NULL, 'Cachoeira do Arari', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2424, NULL, NULL, 'Cachoeira do Piriá', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2425, NULL, NULL, 'Cametá', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2426, NULL, NULL, 'Canaã dos Carajás', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2427, NULL, NULL, 'Capanema', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2428, NULL, NULL, 'Capitão Poço', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2429, NULL, NULL, 'Castanhal', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2430, NULL, NULL, 'Chaves', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2431, NULL, NULL, 'Colares', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2432, NULL, NULL, 'Conceição do Araguaia', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2433, NULL, NULL, 'Concórdia do Pará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2434, NULL, NULL, 'Cumaru do Norte', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2435, NULL, NULL, 'Curionópolis', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2436, NULL, NULL, 'Curralinho', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2437, NULL, NULL, 'Curuá', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2438, NULL, NULL, 'Curuçá', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2439, NULL, NULL, 'Dom Eliseu', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2440, NULL, NULL, 'Eldorado dos Carajás', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2441, NULL, NULL, 'Faro', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2442, NULL, NULL, 'Floresta do Araguaia', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2443, NULL, NULL, 'Garrafão do Norte', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2444, NULL, NULL, 'Goianésia do Pará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2445, NULL, NULL, 'Gurupá', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2446, NULL, NULL, 'Igarapé-Açu', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2447, NULL, NULL, 'Igarapé-Miri', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2448, NULL, NULL, 'Inhangapi', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2449, NULL, NULL, 'Ipixuna do Pará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2450, NULL, NULL, 'Irituia', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2451, NULL, NULL, 'Itaituba', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2452, NULL, NULL, 'Itupiranga', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2453, NULL, NULL, 'Jacareacanga', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2454, NULL, NULL, 'Jacundá', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2455, NULL, NULL, 'Juruti', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2456, NULL, NULL, 'Limoeiro do Ajuru', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2457, NULL, NULL, 'Mãe do Rio', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2458, NULL, NULL, 'Magalhães Barata', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2459, NULL, NULL, 'Marabá', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2460, NULL, NULL, 'Maracanã', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2461, NULL, NULL, 'Marapanim', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2462, NULL, NULL, 'Marituba', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2463, NULL, NULL, 'Medicilândia', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2464, NULL, NULL, 'Melgaço', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2465, NULL, NULL, 'Mocajuba', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2466, NULL, NULL, 'Moju', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2467, NULL, NULL, 'Monte Alegre', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2468, NULL, NULL, 'Muaná', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2469, NULL, NULL, 'Nova Esperança do Piriá', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2470, NULL, NULL, 'Nova Ipixuna', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2471, NULL, NULL, 'Nova Timboteua', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2472, NULL, NULL, 'Novo Progresso', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2473, NULL, NULL, 'Novo Repartimento', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2474, NULL, NULL, 'Óbidos', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2475, NULL, NULL, 'Oeiras do Pará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2476, NULL, NULL, 'Oriximiná', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2477, NULL, NULL, 'Ourém', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2478, NULL, NULL, 'Ourilândia do Norte', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2479, NULL, NULL, 'Pacajá', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2480, NULL, NULL, 'Palestina do Pará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2481, NULL, NULL, 'Paragominas', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2482, NULL, NULL, 'Parauapebas', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2483, NULL, NULL, 'Pau d`Arco', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2484, NULL, NULL, 'Peixe-Boi', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2485, NULL, NULL, 'Piçarra', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2486, NULL, NULL, 'Placas', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2487, NULL, NULL, 'Ponta de Pedras', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2488, NULL, NULL, 'Portel', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2489, NULL, NULL, 'Porto de Moz', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2490, NULL, NULL, 'Prainha', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2491, NULL, NULL, 'Primavera', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2492, NULL, NULL, 'Quatipuru', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2493, NULL, NULL, 'Redenção', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2494, NULL, NULL, 'Rio Maria', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2495, NULL, NULL, 'Rondon do Pará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2496, NULL, NULL, 'Rurópolis', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2497, NULL, NULL, 'Salinópolis', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2498, NULL, NULL, 'Salvaterra', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2499, NULL, NULL, 'Santa Bárbara do Pará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2500, NULL, NULL, 'Santa Cruz do Arari', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2501, NULL, NULL, 'Santa Isabel do Pará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2502, NULL, NULL, 'Santa Luzia do Pará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2503, NULL, NULL, 'Santa Maria das Barreiras', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2504, NULL, NULL, 'Santa Maria do Pará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2505, NULL, NULL, 'Santana do Araguaia', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2506, NULL, NULL, 'Santarém', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2507, NULL, NULL, 'Santarém Novo', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2508, NULL, NULL, 'Santo Antônio do Tauá', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2509, NULL, NULL, 'São Caetano de Odivelas', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2510, NULL, NULL, 'São Domingos do Araguaia', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2511, NULL, NULL, 'São Domingos do Capim', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2512, NULL, NULL, 'São Félix do Xingu', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2513, NULL, NULL, 'São Francisco do Pará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2514, NULL, NULL, 'São Geraldo do Araguaia', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2515, NULL, NULL, 'São João da Ponta', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2516, NULL, NULL, 'São João de Pirabas', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2517, NULL, NULL, 'São João do Araguaia', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2518, NULL, NULL, 'São Miguel do Guamá', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2519, NULL, NULL, 'São Sebastião da Boa Vista', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2520, NULL, NULL, 'Sapucaia', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2521, NULL, NULL, 'Senador José Porfírio', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2522, NULL, NULL, 'Soure', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2523, NULL, NULL, 'Tailândia', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2524, NULL, NULL, 'Terra Alta', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2525, NULL, NULL, 'Terra Santa', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2526, NULL, NULL, 'Tomé-Açu', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2527, NULL, NULL, 'Tracuateua', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2528, NULL, NULL, 'Trairão', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2529, NULL, NULL, 'Tucumã', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2530, NULL, NULL, 'Tucuruí', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2531, NULL, NULL, 'Ulianópolis', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2532, NULL, NULL, 'Uruará', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2533, NULL, NULL, 'Vigia', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2534, NULL, NULL, 'Viseu', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2535, NULL, NULL, 'Vitória do Xingu', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2536, NULL, NULL, 'Xinguara', 14);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2537, NULL, NULL, 'Água Branca', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2538, NULL, NULL, 'Aguiar', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2539, NULL, NULL, 'Alagoa Grande', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2540, NULL, NULL, 'Alagoa Nova', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2541, NULL, NULL, 'Alagoinha', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2542, NULL, NULL, 'Alcantil', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2543, NULL, NULL, 'Algodão de Jandaíra', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2544, NULL, NULL, 'Alhandra', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2545, NULL, NULL, 'Amparo', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2546, NULL, NULL, 'Aparecida', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2547, NULL, NULL, 'Araçagi', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2548, NULL, NULL, 'Arara', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2549, NULL, NULL, 'Araruna', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2550, NULL, NULL, 'Areia', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2551, NULL, NULL, 'Areia de Baraúnas', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2552, NULL, NULL, 'Areial', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2553, NULL, NULL, 'Aroeiras', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2554, NULL, NULL, 'Assunção', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2555, NULL, NULL, 'Baía da Traição', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2556, NULL, NULL, 'Bananeiras', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2557, NULL, NULL, 'Baraúna', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2558, NULL, NULL, 'Barra de Santa Rosa', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2559, NULL, NULL, 'Barra de Santana', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2560, NULL, NULL, 'Barra de São Miguel', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2561, NULL, NULL, 'Bayeux', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2562, NULL, NULL, 'Belém', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2563, NULL, NULL, 'Belém do Brejo do Cruz', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2564, NULL, NULL, 'Bernardino Batista', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2565, NULL, NULL, 'Boa Ventura', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2566, NULL, NULL, 'Boa Vista', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2567, NULL, NULL, 'Bom Jesus', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2568, NULL, NULL, 'Bom Sucesso', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2569, NULL, NULL, 'Bonito de Santa Fé', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2570, NULL, NULL, 'Boqueirão', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2571, NULL, NULL, 'Borborema', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2572, NULL, NULL, 'Brejo do Cruz', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2573, NULL, NULL, 'Brejo dos Santos', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2574, NULL, NULL, 'Caaporã', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2575, NULL, NULL, 'Cabaceiras', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2576, NULL, NULL, 'Cabedelo', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2577, NULL, NULL, 'Cachoeira dos Índios', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2578, NULL, NULL, 'Cacimba de Areia', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2579, NULL, NULL, 'Cacimba de Dentro', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2580, NULL, NULL, 'Cacimbas', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2581, NULL, NULL, 'Caiçara', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2582, NULL, NULL, 'Cajazeiras', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2583, NULL, NULL, 'Cajazeirinhas', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2584, NULL, NULL, 'Caldas Brandão', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2585, NULL, NULL, 'Camalaú', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2586, NULL, NULL, 'Campina Grande', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2587, NULL, NULL, 'Campo de Santana', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2588, NULL, NULL, 'Capim', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2589, NULL, NULL, 'Caraúbas', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2590, NULL, NULL, 'Carrapateira', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2591, NULL, NULL, 'Casserengue', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2592, NULL, NULL, 'Catingueira', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2593, NULL, NULL, 'Catolé do Rocha', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2594, NULL, NULL, 'Caturité', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2595, NULL, NULL, 'Conceição', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2596, NULL, NULL, 'Condado', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2597, NULL, NULL, 'Conde', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2598, NULL, NULL, 'Congo', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2599, NULL, NULL, 'Coremas', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2600, NULL, NULL, 'Coxixola', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2601, NULL, NULL, 'Cruz do Espírito Santo', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2602, NULL, NULL, 'Cubati', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2603, NULL, NULL, 'Cuité', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2604, NULL, NULL, 'Cuité de Mamanguape', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2605, NULL, NULL, 'Cuitegi', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2606, NULL, NULL, 'Curral de Cima', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2607, NULL, NULL, 'Curral Velho', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2608, NULL, NULL, 'Damião', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2609, NULL, NULL, 'Desterro', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2610, NULL, NULL, 'Diamante', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2611, NULL, NULL, 'Dona Inês', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2612, NULL, NULL, 'Duas Estradas', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2613, NULL, NULL, 'Emas', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2614, NULL, NULL, 'Esperança', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2615, NULL, NULL, 'Fagundes', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2616, NULL, NULL, 'Frei Martinho', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2617, NULL, NULL, 'Gado Bravo', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2618, NULL, NULL, 'Guarabira', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2619, NULL, NULL, 'Gurinhém', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2620, NULL, NULL, 'Gurjão', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2621, NULL, NULL, 'Ibiara', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2622, NULL, NULL, 'Igaracy', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2623, NULL, NULL, 'Imaculada', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2624, NULL, NULL, 'Ingá', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2625, NULL, NULL, 'Itabaiana', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2626, NULL, NULL, 'Itaporanga', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2627, NULL, NULL, 'Itapororoca', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2628, NULL, NULL, 'Itatuba', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2629, NULL, NULL, 'Jacaraú', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2630, NULL, NULL, 'Jericó', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2631, NULL, NULL, 'João Pessoa', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2632, NULL, NULL, 'Juarez Távora', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2633, NULL, NULL, 'Juazeirinho', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2634, NULL, NULL, 'Junco do Seridó', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2635, NULL, NULL, 'Juripiranga', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2636, NULL, NULL, 'Juru', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2637, NULL, NULL, 'Lagoa', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2638, NULL, NULL, 'Lagoa de Dentro', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2639, NULL, NULL, 'Lagoa Seca', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2640, NULL, NULL, 'Lastro', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2641, NULL, NULL, 'Livramento', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2642, NULL, NULL, 'Logradouro', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2643, NULL, NULL, 'Lucena', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2644, NULL, NULL, 'Mãe d`Água', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2645, NULL, NULL, 'Malta', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2646, NULL, NULL, 'Mamanguape', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2647, NULL, NULL, 'Manaíra', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2648, NULL, NULL, 'Marcação', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2649, NULL, NULL, 'Mari', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2650, NULL, NULL, 'Marizópolis', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2651, NULL, NULL, 'Massaranduba', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2652, NULL, NULL, 'Mataraca', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2653, NULL, NULL, 'Matinhas', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2654, NULL, NULL, 'Mato Grosso', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2655, NULL, NULL, 'Maturéia', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2656, NULL, NULL, 'Mogeiro', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2657, NULL, NULL, 'Montadas', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2658, NULL, NULL, 'Monte Horebe', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2659, NULL, NULL, 'Monteiro', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2660, NULL, NULL, 'Mulungu', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2661, NULL, NULL, 'Natuba', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2662, NULL, NULL, 'Nazarezinho', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2663, NULL, NULL, 'Nova Floresta', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2664, NULL, NULL, 'Nova Olinda', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2665, NULL, NULL, 'Nova Palmeira', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2666, NULL, NULL, 'Olho d`Água', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2667, NULL, NULL, 'Olivedos', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2668, NULL, NULL, 'Ouro Velho', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2669, NULL, NULL, 'Parari', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2670, NULL, NULL, 'Passagem', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2671, NULL, NULL, 'Patos', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2672, NULL, NULL, 'Paulista', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2673, NULL, NULL, 'Pedra Branca', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2674, NULL, NULL, 'Pedra Lavrada', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2675, NULL, NULL, 'Pedras de Fogo', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2676, NULL, NULL, 'Pedro Régis', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2677, NULL, NULL, 'Piancó', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2678, NULL, NULL, 'Picuí', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2679, NULL, NULL, 'Pilar', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2680, NULL, NULL, 'Pilões', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2681, NULL, NULL, 'Pilõezinhos', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2682, NULL, NULL, 'Pirpirituba', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2683, NULL, NULL, 'Pitimbu', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2684, NULL, NULL, 'Pocinhos', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2685, NULL, NULL, 'Poço Dantas', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2686, NULL, NULL, 'Poço de José de Moura', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2687, NULL, NULL, 'Pombal', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2688, NULL, NULL, 'Prata', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2689, NULL, NULL, 'Princesa Isabel', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2690, NULL, NULL, 'Puxinanã', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2691, NULL, NULL, 'Queimadas', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2692, NULL, NULL, 'Quixabá', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2693, NULL, NULL, 'Remígio', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2694, NULL, NULL, 'Riachão', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2695, NULL, NULL, 'Riachão do Bacamarte', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2696, NULL, NULL, 'Riachão do Poço', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2697, NULL, NULL, 'Riacho de Santo Antônio', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2698, NULL, NULL, 'Riacho dos Cavalos', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2699, NULL, NULL, 'Rio Tinto', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2700, NULL, NULL, 'Salgadinho', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2701, NULL, NULL, 'Salgado de São Félix', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2702, NULL, NULL, 'Santa Cecília', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2703, NULL, NULL, 'Santa Cruz', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2704, NULL, NULL, 'Santa Helena', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2705, NULL, NULL, 'Santa Inês', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2706, NULL, NULL, 'Santa Luzia', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2707, NULL, NULL, 'Santa Rita', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2708, NULL, NULL, 'Santa Teresinha', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2709, NULL, NULL, 'Santana de Mangueira', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2710, NULL, NULL, 'Santana dos Garrotes', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2711, NULL, NULL, 'Santarém', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2712, NULL, NULL, 'Santo André', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2713, NULL, NULL, 'São Bentinho', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2714, NULL, NULL, 'São Bento', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2715, NULL, NULL, 'São Domingos de Pombal', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2716, NULL, NULL, 'São Domingos do Cariri', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2717, NULL, NULL, 'São Francisco', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2718, NULL, NULL, 'São João do Cariri', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2719, NULL, NULL, 'São João do Rio do Peixe', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2720, NULL, NULL, 'São João do Tigre', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2721, NULL, NULL, 'São José da Lagoa Tapada', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2722, NULL, NULL, 'São José de Caiana', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2723, NULL, NULL, 'São José de Espinharas', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2724, NULL, NULL, 'São José de Piranhas', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2725, NULL, NULL, 'São José de Princesa', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2726, NULL, NULL, 'São José do Bonfim', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2727, NULL, NULL, 'São José do Brejo do Cruz', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2728, NULL, NULL, 'São José do Sabugi', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2729, NULL, NULL, 'São José dos Cordeiros', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2730, NULL, NULL, 'São José dos Ramos', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2731, NULL, NULL, 'São Mamede', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2732, NULL, NULL, 'São Miguel de Taipu', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2733, NULL, NULL, 'São Sebastião de Lagoa de Roça', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2734, NULL, NULL, 'São Sebastião do Umbuzeiro', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2735, NULL, NULL, 'Sapé', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2736, NULL, NULL, 'Seridó', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2737, NULL, NULL, 'Serra Branca', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2738, NULL, NULL, 'Serra da Raiz', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2739, NULL, NULL, 'Serra Grande', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2740, NULL, NULL, 'Serra Redonda', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2741, NULL, NULL, 'Serraria', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2742, NULL, NULL, 'Sertãozinho', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2743, NULL, NULL, 'Sobrado', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2744, NULL, NULL, 'Solânea', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2745, NULL, NULL, 'Soledade', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2746, NULL, NULL, 'Sossêgo', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2747, NULL, NULL, 'Sousa', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2748, NULL, NULL, 'Sumé', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2749, NULL, NULL, 'Taperoá', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2750, NULL, NULL, 'Tavares', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2751, NULL, NULL, 'Teixeira', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2752, NULL, NULL, 'Tenório', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2753, NULL, NULL, 'Triunfo', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2754, NULL, NULL, 'Uiraúna', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2755, NULL, NULL, 'Umbuzeiro', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2756, NULL, NULL, 'Várzea', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2757, NULL, NULL, 'Vieirópolis', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2758, NULL, NULL, 'Vista Serrana', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2759, NULL, NULL, 'Zabelê', 15);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2760, NULL, NULL, 'Abatiá', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2761, NULL, NULL, 'Adrianópolis', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2762, NULL, NULL, 'Agudos do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2763, NULL, NULL, 'Almirante Tamandaré', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2764, NULL, NULL, 'Altamira do Paraná', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2765, NULL, NULL, 'Alto Paraná', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2766, NULL, NULL, 'Alto Piquiri', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2767, NULL, NULL, 'Altônia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2768, NULL, NULL, 'Alvorada do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2769, NULL, NULL, 'Amaporã', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2770, NULL, NULL, 'Ampére', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2771, NULL, NULL, 'Anahy', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2772, NULL, NULL, 'Andirá', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2773, NULL, NULL, 'Ângulo', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2774, NULL, NULL, 'Antonina', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2775, NULL, NULL, 'Antônio Olinto', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2776, NULL, NULL, 'Apucarana', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2777, NULL, NULL, 'Arapongas', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2778, NULL, NULL, 'Arapoti', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2779, NULL, NULL, 'Arapuã', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2780, NULL, NULL, 'Araruna', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2781, NULL, NULL, 'Araucária', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2782, NULL, NULL, 'Ariranha do Ivaí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2783, NULL, NULL, 'Assaí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2784, NULL, NULL, 'Assis Chateaubriand', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2785, NULL, NULL, 'Astorga', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2786, NULL, NULL, 'Atalaia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2787, NULL, NULL, 'Balsa Nova', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2788, NULL, NULL, 'Bandeirantes', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2789, NULL, NULL, 'Barbosa Ferraz', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2790, NULL, NULL, 'Barra do Jacaré', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2791, NULL, NULL, 'Barracão', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2792, NULL, NULL, 'Bela Vista da Caroba', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2793, NULL, NULL, 'Bela Vista do Paraíso', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2794, NULL, NULL, 'Bituruna', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2795, NULL, NULL, 'Boa Esperança', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2796, NULL, NULL, 'Boa Esperança do Iguaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2797, NULL, NULL, 'Boa Ventura de São Roque', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2798, NULL, NULL, 'Boa Vista da Aparecida', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2799, NULL, NULL, 'Bocaiúva do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2800, NULL, NULL, 'Bom Jesus do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2801, NULL, NULL, 'Bom Sucesso', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2802, NULL, NULL, 'Bom Sucesso do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2803, NULL, NULL, 'Borrazópolis', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2804, NULL, NULL, 'Braganey', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2805, NULL, NULL, 'Brasilândia do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2806, NULL, NULL, 'Cafeara', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2807, NULL, NULL, 'Cafelândia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2808, NULL, NULL, 'Cafezal do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2809, NULL, NULL, 'Califórnia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2810, NULL, NULL, 'Cambará', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2811, NULL, NULL, 'Cambé', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2812, NULL, NULL, 'Cambira', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2813, NULL, NULL, 'Campina da Lagoa', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2814, NULL, NULL, 'Campina do Simão', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2815, NULL, NULL, 'Campina Grande do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2816, NULL, NULL, 'Campo Bonito', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2817, NULL, NULL, 'Campo do Tenente', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2818, NULL, NULL, 'Campo Largo', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2819, NULL, NULL, 'Campo Magro', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2820, NULL, NULL, 'Campo Mourão', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2821, NULL, NULL, 'Cândido de Abreu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2822, NULL, NULL, 'Candói', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2823, NULL, NULL, 'Cantagalo', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2824, NULL, NULL, 'Capanema', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2825, NULL, NULL, 'Capitão Leônidas Marques', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2826, NULL, NULL, 'Carambeí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2827, NULL, NULL, 'Carlópolis', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2828, NULL, NULL, 'Cascavel', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2829, NULL, NULL, 'Castro', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2830, NULL, NULL, 'Catanduvas', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2831, NULL, NULL, 'Centenário do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2832, NULL, NULL, 'Cerro Azul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2833, NULL, NULL, 'Céu Azul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2834, NULL, NULL, 'Chopinzinho', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2835, NULL, NULL, 'Cianorte', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2836, NULL, NULL, 'Cidade Gaúcha', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2837, NULL, NULL, 'Clevelândia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2838, NULL, NULL, 'Colombo', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2839, NULL, NULL, 'Colorado', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2840, NULL, NULL, 'Congonhinhas', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2841, NULL, NULL, 'Conselheiro Mairinck', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2842, NULL, NULL, 'Contenda', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2843, NULL, NULL, 'Corbélia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2844, NULL, NULL, 'Cornélio Procópio', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2845, NULL, NULL, 'Coronel Domingos Soares', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2846, NULL, NULL, 'Coronel Vivida', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2847, NULL, NULL, 'Corumbataí do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2848, NULL, NULL, 'Cruz Machado', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2849, NULL, NULL, 'Cruzeiro do Iguaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2850, NULL, NULL, 'Cruzeiro do Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2851, NULL, NULL, 'Cruzeiro do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2852, NULL, NULL, 'Cruzmaltina', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2853, NULL, NULL, 'Curitiba', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2854, NULL, NULL, 'Curiúva', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2855, NULL, NULL, 'Diamante d`Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2856, NULL, NULL, 'Diamante do Norte', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2857, NULL, NULL, 'Diamante do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2858, NULL, NULL, 'Dois Vizinhos', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2859, NULL, NULL, 'Douradina', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2860, NULL, NULL, 'Doutor Camargo', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2861, NULL, NULL, 'Doutor Ulysses', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2862, NULL, NULL, 'Enéas Marques', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2863, NULL, NULL, 'Engenheiro Beltrão', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2864, NULL, NULL, 'Entre Rios do Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2865, NULL, NULL, 'Esperança Nova', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2866, NULL, NULL, 'Espigão Alto do Iguaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2867, NULL, NULL, 'Farol', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2868, NULL, NULL, 'Faxinal', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2869, NULL, NULL, 'Fazenda Rio Grande', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2870, NULL, NULL, 'Fênix', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2871, NULL, NULL, 'Fernandes Pinheiro', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2872, NULL, NULL, 'Figueira', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2873, NULL, NULL, 'Flor da Serra do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2874, NULL, NULL, 'Floraí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2875, NULL, NULL, 'Floresta', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2876, NULL, NULL, 'Florestópolis', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2877, NULL, NULL, 'Flórida', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2878, NULL, NULL, 'Formosa do Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2879, NULL, NULL, 'Foz do Iguaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2880, NULL, NULL, 'Foz do Jordão', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2881, NULL, NULL, 'Francisco Alves', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2882, NULL, NULL, 'Francisco Beltrão', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2883, NULL, NULL, 'General Carneiro', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2884, NULL, NULL, 'Godoy Moreira', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2885, NULL, NULL, 'Goioerê', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2886, NULL, NULL, 'Goioxim', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2887, NULL, NULL, 'Grandes Rios', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2888, NULL, NULL, 'Guaíra', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2889, NULL, NULL, 'Guairaçá', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2890, NULL, NULL, 'Guamiranga', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2891, NULL, NULL, 'Guapirama', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2892, NULL, NULL, 'Guaporema', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2893, NULL, NULL, 'Guaraci', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2894, NULL, NULL, 'Guaraniaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2895, NULL, NULL, 'Guarapuava', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2896, NULL, NULL, 'Guaraqueçaba', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2897, NULL, NULL, 'Guaratuba', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2898, NULL, NULL, 'Honório Serpa', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2899, NULL, NULL, 'Ibaiti', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2900, NULL, NULL, 'Ibema', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2901, NULL, NULL, 'Ibiporã', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2902, NULL, NULL, 'Icaraíma', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2903, NULL, NULL, 'Iguaraçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2904, NULL, NULL, 'Iguatu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2905, NULL, NULL, 'Imbaú', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2906, NULL, NULL, 'Imbituva', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2907, NULL, NULL, 'Inácio Martins', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2908, NULL, NULL, 'Inajá', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2909, NULL, NULL, 'Indianópolis', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2910, NULL, NULL, 'Ipiranga', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2911, NULL, NULL, 'Iporã', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2912, NULL, NULL, 'Iracema do Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2913, NULL, NULL, 'Irati', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2914, NULL, NULL, 'Iretama', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2915, NULL, NULL, 'Itaguajé', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2916, NULL, NULL, 'Itaipulândia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2917, NULL, NULL, 'Itambaracá', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2918, NULL, NULL, 'Itambé', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2919, NULL, NULL, 'Itapejara d`Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2920, NULL, NULL, 'Itaperuçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2921, NULL, NULL, 'Itaúna do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2922, NULL, NULL, 'Ivaí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2923, NULL, NULL, 'Ivaiporã', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2924, NULL, NULL, 'Ivaté', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2925, NULL, NULL, 'Ivatuba', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2926, NULL, NULL, 'Jaboti', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2927, NULL, NULL, 'Jacarezinho', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2928, NULL, NULL, 'Jaguapitã', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2929, NULL, NULL, 'Jaguariaíva', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2930, NULL, NULL, 'Jandaia do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2931, NULL, NULL, 'Janiópolis', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2932, NULL, NULL, 'Japira', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2933, NULL, NULL, 'Japurá', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2934, NULL, NULL, 'Jardim Alegre', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2935, NULL, NULL, 'Jardim Olinda', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2936, NULL, NULL, 'Jataizinho', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2937, NULL, NULL, 'Jesuítas', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2938, NULL, NULL, 'Joaquim Távora', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2939, NULL, NULL, 'Jundiaí do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2940, NULL, NULL, 'Juranda', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2941, NULL, NULL, 'Jussara', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2942, NULL, NULL, 'Kaloré', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2943, NULL, NULL, 'Lapa', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2944, NULL, NULL, 'Laranjal', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2945, NULL, NULL, 'Laranjeiras do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2946, NULL, NULL, 'Leópolis', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2947, NULL, NULL, 'Lidianópolis', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2948, NULL, NULL, 'Lindoeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2949, NULL, NULL, 'Loanda', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2950, NULL, NULL, 'Lobato', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2951, NULL, NULL, 'Londrina', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2952, NULL, NULL, 'Luiziana', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2953, NULL, NULL, 'Lunardelli', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2954, NULL, NULL, 'Lupionópolis', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2955, NULL, NULL, 'Mallet', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2956, NULL, NULL, 'Mamborê', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2957, NULL, NULL, 'Mandaguaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2958, NULL, NULL, 'Mandaguari', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2959, NULL, NULL, 'Mandirituba', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2960, NULL, NULL, 'Manfrinópolis', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2961, NULL, NULL, 'Mangueirinha', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2962, NULL, NULL, 'Manoel Ribas', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2963, NULL, NULL, 'Marechal Cândido Rondon', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2964, NULL, NULL, 'Maria Helena', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2965, NULL, NULL, 'Marialva', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2966, NULL, NULL, 'Marilândia do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2967, NULL, NULL, 'Marilena', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2968, NULL, NULL, 'Mariluz', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2969, NULL, NULL, 'Maringá', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2970, NULL, NULL, 'Mariópolis', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2971, NULL, NULL, 'Maripá', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2972, NULL, NULL, 'Marmeleiro', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2973, NULL, NULL, 'Marquinho', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2974, NULL, NULL, 'Marumbi', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2975, NULL, NULL, 'Matelândia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2976, NULL, NULL, 'Matinhos', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2977, NULL, NULL, 'Mato Rico', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2978, NULL, NULL, 'Mauá da Serra', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2979, NULL, NULL, 'Medianeira', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2980, NULL, NULL, 'Mercedes', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2981, NULL, NULL, 'Mirador', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2982, NULL, NULL, 'Miraselva', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2983, NULL, NULL, 'Missal', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2984, NULL, NULL, 'Moreira Sales', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2985, NULL, NULL, 'Morretes', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2986, NULL, NULL, 'Munhoz de Melo', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2987, NULL, NULL, 'Nossa Senhora das Graças', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2988, NULL, NULL, 'Nova Aliança do Ivaí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2989, NULL, NULL, 'Nova América da Colina', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2990, NULL, NULL, 'Nova Aurora', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2991, NULL, NULL, 'Nova Cantu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2992, NULL, NULL, 'Nova Esperança', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2993, NULL, NULL, 'Nova Esperança do Sudoeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2994, NULL, NULL, 'Nova Fátima', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2995, NULL, NULL, 'Nova Laranjeiras', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2996, NULL, NULL, 'Nova Londrina', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2997, NULL, NULL, 'Nova Olímpia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2998, NULL, NULL, 'Nova Prata do Iguaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (2999, NULL, NULL, 'Nova Santa Bárbara', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3000, NULL, NULL, 'Nova Santa Rosa', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3001, NULL, NULL, 'Nova Tebas', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3002, NULL, NULL, 'Novo Itacolomi', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3003, NULL, NULL, 'Ortigueira', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3004, NULL, NULL, 'Ourizona', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3005, NULL, NULL, 'Ouro Verde do Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3006, NULL, NULL, 'Paiçandu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3007, NULL, NULL, 'Palmas', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3008, NULL, NULL, 'Palmeira', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3009, NULL, NULL, 'Palmital', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3010, NULL, NULL, 'Palotina', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3011, NULL, NULL, 'Paraíso do Norte', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3012, NULL, NULL, 'Paranacity', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3013, NULL, NULL, 'Paranaguá', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3014, NULL, NULL, 'Paranapoema', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3015, NULL, NULL, 'Paranavaí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3016, NULL, NULL, 'Pato Bragado', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3017, NULL, NULL, 'Pato Branco', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3018, NULL, NULL, 'Paula Freitas', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3019, NULL, NULL, 'Paulo Frontin', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3020, NULL, NULL, 'Peabiru', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3021, NULL, NULL, 'Perobal', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3022, NULL, NULL, 'Pérola', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3023, NULL, NULL, 'Pérola d`Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3024, NULL, NULL, 'Piên', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3025, NULL, NULL, 'Pinhais', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3026, NULL, NULL, 'Pinhal de São Bento', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3027, NULL, NULL, 'Pinhalão', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3028, NULL, NULL, 'Pinhão', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3029, NULL, NULL, 'Piraí do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3030, NULL, NULL, 'Piraquara', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3031, NULL, NULL, 'Pitanga', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3032, NULL, NULL, 'Pitangueiras', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3033, NULL, NULL, 'Planaltina do Paraná', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3034, NULL, NULL, 'Planalto', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3035, NULL, NULL, 'Ponta Grossa', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3036, NULL, NULL, 'Pontal do Paraná', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3037, NULL, NULL, 'Porecatu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3038, NULL, NULL, 'Porto Amazonas', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3039, NULL, NULL, 'Porto Barreiro', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3040, NULL, NULL, 'Porto Rico', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3041, NULL, NULL, 'Porto Vitória', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3042, NULL, NULL, 'Prado Ferreira', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3043, NULL, NULL, 'Pranchita', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3044, NULL, NULL, 'Presidente Castelo Branco', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3045, NULL, NULL, 'Primeiro de Maio', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3046, NULL, NULL, 'Prudentópolis', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3047, NULL, NULL, 'Quarto Centenário', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3048, NULL, NULL, 'Quatiguá', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3049, NULL, NULL, 'Quatro Barras', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3050, NULL, NULL, 'Quatro Pontes', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3051, NULL, NULL, 'Quedas do Iguaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3052, NULL, NULL, 'Querência do Norte', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3053, NULL, NULL, 'Quinta do Sol', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3054, NULL, NULL, 'Quitandinha', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3055, NULL, NULL, 'Ramilândia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3056, NULL, NULL, 'Rancho Alegre', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3057, NULL, NULL, 'Rancho Alegre d`Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3058, NULL, NULL, 'Realeza', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3059, NULL, NULL, 'Rebouças', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3060, NULL, NULL, 'Renascença', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3061, NULL, NULL, 'Reserva', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3062, NULL, NULL, 'Reserva do Iguaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3063, NULL, NULL, 'Ribeirão Claro', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3064, NULL, NULL, 'Ribeirão do Pinhal', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3065, NULL, NULL, 'Rio Azul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3066, NULL, NULL, 'Rio Bom', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3067, NULL, NULL, 'Rio Bonito do Iguaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3068, NULL, NULL, 'Rio Branco do Ivaí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3069, NULL, NULL, 'Rio Branco do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3070, NULL, NULL, 'Rio Negro', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3071, NULL, NULL, 'Rolândia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3072, NULL, NULL, 'Roncador', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3073, NULL, NULL, 'Rondon', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3074, NULL, NULL, 'Rosário do Ivaí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3075, NULL, NULL, 'Sabáudia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3076, NULL, NULL, 'Salgado Filho', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3077, NULL, NULL, 'Salto do Itararé', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3078, NULL, NULL, 'Salto do Lontra', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3079, NULL, NULL, 'Santa Amélia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3080, NULL, NULL, 'Santa Cecília do Pavão', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3081, NULL, NULL, 'Santa Cruz de Monte Castelo', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3082, NULL, NULL, 'Santa Fé', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3083, NULL, NULL, 'Santa Helena', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3084, NULL, NULL, 'Santa Inês', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3085, NULL, NULL, 'Santa Isabel do Ivaí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3086, NULL, NULL, 'Santa Izabel do Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3087, NULL, NULL, 'Santa Lúcia', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3088, NULL, NULL, 'Santa Maria do Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3089, NULL, NULL, 'Santa Mariana', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3090, NULL, NULL, 'Santa Mônica', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3091, NULL, NULL, 'Santa Tereza do Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3092, NULL, NULL, 'Santa Terezinha de Itaipu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3093, NULL, NULL, 'Santana do Itararé', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3094, NULL, NULL, 'Santo Antônio da Platina', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3095, NULL, NULL, 'Santo Antônio do Caiuá', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3096, NULL, NULL, 'Santo Antônio do Paraíso', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3097, NULL, NULL, 'Santo Antônio do Sudoeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3098, NULL, NULL, 'Santo Inácio', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3099, NULL, NULL, 'São Carlos do Ivaí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3100, NULL, NULL, 'São Jerônimo da Serra', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3101, NULL, NULL, 'São João', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3102, NULL, NULL, 'São João do Caiuá', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3103, NULL, NULL, 'São João do Ivaí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3104, NULL, NULL, 'São João do Triunfo', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3105, NULL, NULL, 'São Jorge d`Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3106, NULL, NULL, 'São Jorge do Ivaí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3107, NULL, NULL, 'São Jorge do Patrocínio', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3108, NULL, NULL, 'São José da Boa Vista', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3109, NULL, NULL, 'São José das Palmeiras', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3110, NULL, NULL, 'São José dos Pinhais', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3111, NULL, NULL, 'São Manoel do Paraná', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3112, NULL, NULL, 'São Mateus do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3113, NULL, NULL, 'São Miguel do Iguaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3114, NULL, NULL, 'São Pedro do Iguaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3115, NULL, NULL, 'São Pedro do Ivaí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3116, NULL, NULL, 'São Pedro do Paraná', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3117, NULL, NULL, 'São Sebastião da Amoreira', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3118, NULL, NULL, 'São Tomé', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3119, NULL, NULL, 'Sapopema', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3120, NULL, NULL, 'Sarandi', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3121, NULL, NULL, 'Saudade do Iguaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3122, NULL, NULL, 'Sengés', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3123, NULL, NULL, 'Serranópolis do Iguaçu', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3124, NULL, NULL, 'Sertaneja', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3125, NULL, NULL, 'Sertanópolis', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3126, NULL, NULL, 'Siqueira Campos', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3127, NULL, NULL, 'Sulina', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3128, NULL, NULL, 'Tamarana', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3129, NULL, NULL, 'Tamboara', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3130, NULL, NULL, 'Tapejara', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3131, NULL, NULL, 'Tapira', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3132, NULL, NULL, 'Teixeira Soares', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3133, NULL, NULL, 'Telêmaco Borba', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3134, NULL, NULL, 'Terra Boa', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3135, NULL, NULL, 'Terra Rica', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3136, NULL, NULL, 'Terra Roxa', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3137, NULL, NULL, 'Tibagi', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3138, NULL, NULL, 'Tijucas do Sul', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3139, NULL, NULL, 'Toledo', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3140, NULL, NULL, 'Tomazina', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3141, NULL, NULL, 'Três Barras do Paraná', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3142, NULL, NULL, 'Tunas do Paraná', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3143, NULL, NULL, 'Tuneiras do Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3144, NULL, NULL, 'Tupãssi', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3145, NULL, NULL, 'Turvo', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3146, NULL, NULL, 'Ubiratã', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3147, NULL, NULL, 'Umuarama', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3148, NULL, NULL, 'União da Vitória', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3149, NULL, NULL, 'Uniflor', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3150, NULL, NULL, 'Uraí', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3151, NULL, NULL, 'Ventania', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3152, NULL, NULL, 'Vera Cruz do Oeste', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3153, NULL, NULL, 'Verê', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3154, NULL, NULL, 'Vila Alta', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3155, NULL, NULL, 'Virmond', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3156, NULL, NULL, 'Vitorino', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3157, NULL, NULL, 'Wenceslau Braz', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3158, NULL, NULL, 'Xambrê', 16);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3159, NULL, NULL, 'Abreu e Lima', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3160, NULL, NULL, 'Afogados da Ingazeira', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3161, NULL, NULL, 'Afrânio', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3162, NULL, NULL, 'Agrestina', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3163, NULL, NULL, 'Água Preta', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3164, NULL, NULL, 'Águas Belas', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3165, NULL, NULL, 'Alagoinha', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3166, NULL, NULL, 'Aliança', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3167, NULL, NULL, 'Altinho', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3168, NULL, NULL, 'Amaraji', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3169, NULL, NULL, 'Angelim', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3170, NULL, NULL, 'Araçoiaba', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3171, NULL, NULL, 'Araripina', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3172, NULL, NULL, 'Arcoverde', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3173, NULL, NULL, 'Barra de Guabiraba', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3174, NULL, NULL, 'Barreiros', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3175, NULL, NULL, 'Belém de Maria', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3176, NULL, NULL, 'Belém de São Francisco', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3177, NULL, NULL, 'Belo Jardim', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3178, NULL, NULL, 'Betânia', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3179, NULL, NULL, 'Bezerros', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3180, NULL, NULL, 'Bodocó', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3181, NULL, NULL, 'Bom Conselho', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3182, NULL, NULL, 'Bom Jardim', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3183, NULL, NULL, 'Bonito', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3184, NULL, NULL, 'Brejão', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3185, NULL, NULL, 'Brejinho', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3186, NULL, NULL, 'Brejo da Madre de Deus', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3187, NULL, NULL, 'Buenos Aires', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3188, NULL, NULL, 'Buíque', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3189, NULL, NULL, 'Cabo de Santo Agostinho', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3190, NULL, NULL, 'Cabrobó', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3191, NULL, NULL, 'Cachoeirinha', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3192, NULL, NULL, 'Caetés', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3193, NULL, NULL, 'Calçado', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3194, NULL, NULL, 'Calumbi', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3195, NULL, NULL, 'Camaragibe', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3196, NULL, NULL, 'Camocim de São Félix', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3197, NULL, NULL, 'Camutanga', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3198, NULL, NULL, 'Canhotinho', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3199, NULL, NULL, 'Capoeiras', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3200, NULL, NULL, 'Carnaíba', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3201, NULL, NULL, 'Carnaubeira da Penha', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3202, NULL, NULL, 'Carpina', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3203, NULL, NULL, 'Caruaru', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3204, NULL, NULL, 'Casinhas', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3205, NULL, NULL, 'Catende', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3206, NULL, NULL, 'Cedro', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3207, NULL, NULL, 'Chã de Alegria', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3208, NULL, NULL, 'Chã Grande', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3209, NULL, NULL, 'Condado', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3210, NULL, NULL, 'Correntes', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3211, NULL, NULL, 'Cortês', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3212, NULL, NULL, 'Cumaru', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3213, NULL, NULL, 'Cupira', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3214, NULL, NULL, 'Custódia', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3215, NULL, NULL, 'Dormentes', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3216, NULL, NULL, 'Escada', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3217, NULL, NULL, 'Exu', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3218, NULL, NULL, 'Feira Nova', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3219, NULL, NULL, 'Fernando de Noronha', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3220, NULL, NULL, 'Ferreiros', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3221, NULL, NULL, 'Flores', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3222, NULL, NULL, 'Floresta', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3223, NULL, NULL, 'Frei Miguelinho', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3224, NULL, NULL, 'Gameleira', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3225, NULL, NULL, 'Garanhuns', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3226, NULL, NULL, 'Glória do Goitá', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3227, NULL, NULL, 'Goiana', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3228, NULL, NULL, 'Granito', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3229, NULL, NULL, 'Gravatá', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3230, NULL, NULL, 'Iati', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3231, NULL, NULL, 'Ibimirim', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3232, NULL, NULL, 'Ibirajuba', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3233, NULL, NULL, 'Igarassu', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3234, NULL, NULL, 'Iguaraci', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3235, NULL, NULL, 'Inajá', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3236, NULL, NULL, 'Ingazeira', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3237, NULL, NULL, 'Ipojuca', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3238, NULL, NULL, 'Ipubi', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3239, NULL, NULL, 'Itacuruba', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3240, NULL, NULL, 'Itaíba', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3241, NULL, NULL, 'Itamaracá', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3242, NULL, NULL, 'Itambé', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3243, NULL, NULL, 'Itapetim', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3244, NULL, NULL, 'Itapissuma', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3245, NULL, NULL, 'Itaquitinga', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3246, NULL, NULL, 'Jaboatão dos Guararapes', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3247, NULL, NULL, 'Jaqueira', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3248, NULL, NULL, 'Jataúba', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3249, NULL, NULL, 'Jatobá', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3250, NULL, NULL, 'João Alfredo', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3251, NULL, NULL, 'Joaquim Nabuco', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3252, NULL, NULL, 'Jucati', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3253, NULL, NULL, 'Jupi', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3254, NULL, NULL, 'Jurema', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3255, NULL, NULL, 'Lagoa do Carro', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3256, NULL, NULL, 'Lagoa do Itaenga', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3257, NULL, NULL, 'Lagoa do Ouro', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3258, NULL, NULL, 'Lagoa dos Gatos', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3259, NULL, NULL, 'Lagoa Grande', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3260, NULL, NULL, 'Lajedo', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3261, NULL, NULL, 'Limoeiro', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3262, NULL, NULL, 'Macaparana', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3263, NULL, NULL, 'Machados', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3264, NULL, NULL, 'Manari', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3265, NULL, NULL, 'Maraial', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3266, NULL, NULL, 'Mirandiba', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3267, NULL, NULL, 'Moreilândia', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3268, NULL, NULL, 'Moreno', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3269, NULL, NULL, 'Nazaré da Mata', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3270, NULL, NULL, 'Olinda', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3271, NULL, NULL, 'Orobó', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3272, NULL, NULL, 'Orocó', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3273, NULL, NULL, 'Ouricuri', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3274, NULL, NULL, 'Palmares', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3275, NULL, NULL, 'Palmeirina', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3276, NULL, NULL, 'Panelas', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3277, NULL, NULL, 'Paranatama', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3278, NULL, NULL, 'Parnamirim', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3279, NULL, NULL, 'Passira', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3280, NULL, NULL, 'Paudalho', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3281, NULL, NULL, 'Paulista', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3282, NULL, NULL, 'Pedra', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3283, NULL, NULL, 'Pesqueira', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3284, NULL, NULL, 'Petrolândia', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3285, NULL, NULL, 'Petrolina', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3286, NULL, NULL, 'Poção', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3287, NULL, NULL, 'Pombos', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3288, NULL, NULL, 'Primavera', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3289, NULL, NULL, 'Quipapá', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3290, NULL, NULL, 'Quixaba', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3291, NULL, NULL, 'Recife', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3292, NULL, NULL, 'Riacho das Almas', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3293, NULL, NULL, 'Ribeirão', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3294, NULL, NULL, 'Rio Formoso', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3295, NULL, NULL, 'Sairé', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3296, NULL, NULL, 'Salgadinho', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3297, NULL, NULL, 'Salgueiro', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3298, NULL, NULL, 'Saloá', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3299, NULL, NULL, 'Sanharó', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3300, NULL, NULL, 'Santa Cruz', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3301, NULL, NULL, 'Santa Cruz da Baixa Verde', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3302, NULL, NULL, 'Santa Cruz do Capibaribe', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3303, NULL, NULL, 'Santa Filomena', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3304, NULL, NULL, 'Santa Maria da Boa Vista', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3305, NULL, NULL, 'Santa Maria do Cambucá', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3306, NULL, NULL, 'Santa Terezinha', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3307, NULL, NULL, 'São Benedito do Sul', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3308, NULL, NULL, 'São Bento do Una', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3309, NULL, NULL, 'São Caitano', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3310, NULL, NULL, 'São João', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3311, NULL, NULL, 'São Joaquim do Monte', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3312, NULL, NULL, 'São José da Coroa Grande', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3313, NULL, NULL, 'São José do Belmonte', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3314, NULL, NULL, 'São José do Egito', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3315, NULL, NULL, 'São Lourenço da Mata', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3316, NULL, NULL, 'São Vicente Ferrer', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3317, NULL, NULL, 'Serra Talhada', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3318, NULL, NULL, 'Serrita', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3319, NULL, NULL, 'Sertânia', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3320, NULL, NULL, 'Sirinhaém', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3321, NULL, NULL, 'Solidão', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3322, NULL, NULL, 'Surubim', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3323, NULL, NULL, 'Tabira', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3324, NULL, NULL, 'Tacaimbó', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3325, NULL, NULL, 'Tacaratu', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3326, NULL, NULL, 'Tamandaré', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3327, NULL, NULL, 'Taquaritinga do Norte', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3328, NULL, NULL, 'Terezinha', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3329, NULL, NULL, 'Terra Nova', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3330, NULL, NULL, 'Timbaúba', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3331, NULL, NULL, 'Toritama', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3332, NULL, NULL, 'Tracunhaém', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3333, NULL, NULL, 'Trindade', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3334, NULL, NULL, 'Triunfo', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3335, NULL, NULL, 'Tupanatinga', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3336, NULL, NULL, 'Tuparetama', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3337, NULL, NULL, 'Venturosa', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3338, NULL, NULL, 'Verdejante', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3339, NULL, NULL, 'Vertente do Lério', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3340, NULL, NULL, 'Vertentes', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3341, NULL, NULL, 'Vicência', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3342, NULL, NULL, 'Vitória de Santo Antão', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3343, NULL, NULL, 'Xexéu', 17);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3344, NULL, NULL, 'Acauã', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3345, NULL, NULL, 'Agricolândia', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3346, NULL, NULL, 'Água Branca', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3347, NULL, NULL, 'Alagoinha do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3348, NULL, NULL, 'Alegrete do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3349, NULL, NULL, 'Alto Longá', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3350, NULL, NULL, 'Altos', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3351, NULL, NULL, 'Alvorada do Gurguéia', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3352, NULL, NULL, 'Amarante', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3353, NULL, NULL, 'Angical do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3354, NULL, NULL, 'Anísio de Abreu', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3355, NULL, NULL, 'Antônio Almeida', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3356, NULL, NULL, 'Aroazes', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3357, NULL, NULL, 'Arraial', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3358, NULL, NULL, 'Assunção do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3359, NULL, NULL, 'Avelino Lopes', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3360, NULL, NULL, 'Baixa Grande do Ribeiro', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3361, NULL, NULL, 'Barra d`Alcântara', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3362, NULL, NULL, 'Barras', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3363, NULL, NULL, 'Barreiras do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3364, NULL, NULL, 'Barro Duro', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3365, NULL, NULL, 'Batalha', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3366, NULL, NULL, 'Bela Vista do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3367, NULL, NULL, 'Belém do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3368, NULL, NULL, 'Beneditinos', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3369, NULL, NULL, 'Bertolínia', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3370, NULL, NULL, 'Betânia do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3371, NULL, NULL, 'Boa Hora', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3372, NULL, NULL, 'Bocaina', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3373, NULL, NULL, 'Bom Jesus', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3374, NULL, NULL, 'Bom Princípio do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3375, NULL, NULL, 'Bonfim do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3376, NULL, NULL, 'Boqueirão do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3377, NULL, NULL, 'Brasileira', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3378, NULL, NULL, 'Brejo do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3379, NULL, NULL, 'Buriti dos Lopes', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3380, NULL, NULL, 'Buriti dos Montes', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3381, NULL, NULL, 'Cabeceiras do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3382, NULL, NULL, 'Cajazeiras do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3383, NULL, NULL, 'Cajueiro da Praia', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3384, NULL, NULL, 'Caldeirão Grande do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3385, NULL, NULL, 'Campinas do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3386, NULL, NULL, 'Campo Alegre do Fidalgo', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3387, NULL, NULL, 'Campo Grande do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3388, NULL, NULL, 'Campo Largo do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3389, NULL, NULL, 'Campo Maior', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3390, NULL, NULL, 'Canavieira', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3391, NULL, NULL, 'Canto do Buriti', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3392, NULL, NULL, 'Capitão de Campos', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3393, NULL, NULL, 'Capitão Gervásio Oliveira', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3394, NULL, NULL, 'Caracol', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3395, NULL, NULL, 'Caraúbas do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3396, NULL, NULL, 'Caridade do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3397, NULL, NULL, 'Castelo do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3398, NULL, NULL, 'Caxingó', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3399, NULL, NULL, 'Cocal', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3400, NULL, NULL, 'Cocal de Telha', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3401, NULL, NULL, 'Cocal dos Alves', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3402, NULL, NULL, 'Coivaras', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3403, NULL, NULL, 'Colônia do Gurguéia', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3404, NULL, NULL, 'Colônia do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3405, NULL, NULL, 'Conceição do Canindé', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3406, NULL, NULL, 'Coronel José Dias', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3407, NULL, NULL, 'Corrente', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3408, NULL, NULL, 'Cristalândia do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3409, NULL, NULL, 'Cristino Castro', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3410, NULL, NULL, 'Curimatá', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3411, NULL, NULL, 'Currais', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3412, NULL, NULL, 'Curral Novo do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3413, NULL, NULL, 'Curralinhos', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3414, NULL, NULL, 'Demerval Lobão', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3415, NULL, NULL, 'Dirceu Arcoverde', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3416, NULL, NULL, 'Dom Expedito Lopes', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3417, NULL, NULL, 'Dom Inocêncio', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3418, NULL, NULL, 'Domingos Mourão', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3419, NULL, NULL, 'Elesbão Veloso', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3420, NULL, NULL, 'Eliseu Martins', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3421, NULL, NULL, 'Esperantina', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3422, NULL, NULL, 'Fartura do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3423, NULL, NULL, 'Flores do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3424, NULL, NULL, 'Floresta do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3425, NULL, NULL, 'Floriano', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3426, NULL, NULL, 'Francinópolis', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3427, NULL, NULL, 'Francisco Ayres', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3428, NULL, NULL, 'Francisco Macedo', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3429, NULL, NULL, 'Francisco Santos', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3430, NULL, NULL, 'Fronteiras', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3431, NULL, NULL, 'Geminiano', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3432, NULL, NULL, 'Gilbués', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3433, NULL, NULL, 'Guadalupe', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3434, NULL, NULL, 'Guaribas', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3435, NULL, NULL, 'Hugo Napoleão', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3436, NULL, NULL, 'Ilha Grande', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3437, NULL, NULL, 'Inhuma', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3438, NULL, NULL, 'Ipiranga do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3439, NULL, NULL, 'Isaías Coelho', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3440, NULL, NULL, 'Itainópolis', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3441, NULL, NULL, 'Itaueira', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3442, NULL, NULL, 'Jacobina do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3443, NULL, NULL, 'Jaicós', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3444, NULL, NULL, 'Jardim do Mulato', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3445, NULL, NULL, 'Jatobá do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3446, NULL, NULL, 'Jerumenha', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3447, NULL, NULL, 'João Costa', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3448, NULL, NULL, 'Joaquim Pires', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3449, NULL, NULL, 'Joca Marques', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3450, NULL, NULL, 'José de Freitas', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3451, NULL, NULL, 'Juazeiro do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3452, NULL, NULL, 'Júlio Borges', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3453, NULL, NULL, 'Jurema', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3454, NULL, NULL, 'Lagoa Alegre', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3455, NULL, NULL, 'Lagoa de São Francisco', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3456, NULL, NULL, 'Lagoa do Barro do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3457, NULL, NULL, 'Lagoa do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3458, NULL, NULL, 'Lagoa do Sítio', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3459, NULL, NULL, 'Lagoinha do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3460, NULL, NULL, 'Landri Sales', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3461, NULL, NULL, 'Luís Correia', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3462, NULL, NULL, 'Luzilândia', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3463, NULL, NULL, 'Madeiro', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3464, NULL, NULL, 'Manoel Emídio', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3465, NULL, NULL, 'Marcolândia', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3466, NULL, NULL, 'Marcos Parente', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3467, NULL, NULL, 'Massapê do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3468, NULL, NULL, 'Matias Olímpio', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3469, NULL, NULL, 'Miguel Alves', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3470, NULL, NULL, 'Miguel Leão', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3471, NULL, NULL, 'Milton Brandão', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3472, NULL, NULL, 'Monsenhor Gil', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3473, NULL, NULL, 'Monsenhor Hipólito', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3474, NULL, NULL, 'Monte Alegre do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3475, NULL, NULL, 'Morro Cabeça no Tempo', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3476, NULL, NULL, 'Morro do Chapéu do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3477, NULL, NULL, 'Murici dos Portelas', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3478, NULL, NULL, 'Nazaré do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3479, NULL, NULL, 'Nossa Senhora de Nazaré', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3480, NULL, NULL, 'Nossa Senhora dos Remédios', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3481, NULL, NULL, 'Nova Santa Rita', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3482, NULL, NULL, 'Novo Oriente do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3483, NULL, NULL, 'Novo Santo Antônio', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3484, NULL, NULL, 'Oeiras', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3485, NULL, NULL, 'Olho d`Água do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3486, NULL, NULL, 'Padre Marcos', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3487, NULL, NULL, 'Paes Landim', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3488, NULL, NULL, 'Pajeú do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3489, NULL, NULL, 'Palmeira do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3490, NULL, NULL, 'Palmeirais', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3491, NULL, NULL, 'Paquetá', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3492, NULL, NULL, 'Parnaguá', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3493, NULL, NULL, 'Parnaíba', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3494, NULL, NULL, 'Passagem Franca do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3495, NULL, NULL, 'Patos do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3496, NULL, NULL, 'Paulistana', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3497, NULL, NULL, 'Pavussu', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3498, NULL, NULL, 'Pedro II', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3499, NULL, NULL, 'Pedro Laurentino', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3500, NULL, NULL, 'Picos', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3501, NULL, NULL, 'Pimenteiras', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3502, NULL, NULL, 'Pio IX', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3503, NULL, NULL, 'Piracuruca', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3504, NULL, NULL, 'Piripiri', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3505, NULL, NULL, 'Porto', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3506, NULL, NULL, 'Porto Alegre do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3507, NULL, NULL, 'Prata do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3508, NULL, NULL, 'Queimada Nova', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3509, NULL, NULL, 'Redenção do Gurguéia', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3510, NULL, NULL, 'Regeneração', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3511, NULL, NULL, 'Riacho Frio', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3512, NULL, NULL, 'Ribeira do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3513, NULL, NULL, 'Ribeiro Gonçalves', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3514, NULL, NULL, 'Rio Grande do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3515, NULL, NULL, 'Santa Cruz do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3516, NULL, NULL, 'Santa Cruz dos Milagres', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3517, NULL, NULL, 'Santa Filomena', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3518, NULL, NULL, 'Santa Luz', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3519, NULL, NULL, 'Santa Rosa do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3520, NULL, NULL, 'Santana do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3521, NULL, NULL, 'Santo Antônio de Lisboa', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3522, NULL, NULL, 'Santo Antônio dos Milagres', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3523, NULL, NULL, 'Santo Inácio do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3524, NULL, NULL, 'São Braz do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3525, NULL, NULL, 'São Félix do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3526, NULL, NULL, 'São Francisco de Assis do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3527, NULL, NULL, 'São Francisco do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3528, NULL, NULL, 'São Gonçalo do Gurguéia', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3529, NULL, NULL, 'São Gonçalo do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3530, NULL, NULL, 'São João da Canabrava', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3531, NULL, NULL, 'São João da Fronteira', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3532, NULL, NULL, 'São João da Serra', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3533, NULL, NULL, 'São João da Varjota', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3534, NULL, NULL, 'São João do Arraial', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3535, NULL, NULL, 'São João do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3536, NULL, NULL, 'São José do Divino', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3537, NULL, NULL, 'São José do Peixe', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3538, NULL, NULL, 'São José do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3539, NULL, NULL, 'São Julião', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3540, NULL, NULL, 'São Lourenço do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3541, NULL, NULL, 'São Luis do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3542, NULL, NULL, 'São Miguel da Baixa Grande', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3543, NULL, NULL, 'São Miguel do Fidalgo', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3544, NULL, NULL, 'São Miguel do Tapuio', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3545, NULL, NULL, 'São Pedro do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3546, NULL, NULL, 'São Raimundo Nonato', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3547, NULL, NULL, 'Sebastião Barros', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3548, NULL, NULL, 'Sebastião Leal', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3549, NULL, NULL, 'Sigefredo Pacheco', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3550, NULL, NULL, 'Simões', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3551, NULL, NULL, 'Simplício Mendes', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3552, NULL, NULL, 'Socorro do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3553, NULL, NULL, 'Sussuapara', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3554, NULL, NULL, 'Tamboril do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3555, NULL, NULL, 'Tanque do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3556, NULL, NULL, 'Teresina', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3557, NULL, NULL, 'União', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3558, NULL, NULL, 'Uruçuí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3559, NULL, NULL, 'Valença do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3560, NULL, NULL, 'Várzea Branca', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3561, NULL, NULL, 'Várzea Grande', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3562, NULL, NULL, 'Vera Mendes', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3563, NULL, NULL, 'Vila Nova do Piauí', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3564, NULL, NULL, 'Wall Ferraz', 18);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3565, NULL, NULL, 'Angra dos Reis', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3566, NULL, NULL, 'Aperibé', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3567, NULL, NULL, 'Araruama', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3568, NULL, NULL, 'Areal', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3569, NULL, NULL, 'Armação dos Búzios', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3570, NULL, NULL, 'Arraial do Cabo', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3571, NULL, NULL, 'Barra do Piraí', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3572, NULL, NULL, 'Barra Mansa', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3573, NULL, NULL, 'Belford Roxo', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3574, NULL, NULL, 'Bom Jardim', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3575, NULL, NULL, 'Bom Jesus do Itabapoana', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3576, NULL, NULL, 'Cabo Frio', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3577, NULL, NULL, 'Cachoeiras de Macacu', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3578, NULL, NULL, 'Cambuci', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3579, NULL, NULL, 'Campos dos Goytacazes', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3580, NULL, NULL, 'Cantagalo', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3581, NULL, NULL, 'Carapebus', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3582, NULL, NULL, 'Cardoso Moreira', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3583, NULL, NULL, 'Carmo', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3584, NULL, NULL, 'Casimiro de Abreu', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3585, NULL, NULL, 'Comendador Levy Gasparian', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3586, NULL, NULL, 'Conceição de Macabu', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3587, NULL, NULL, 'Cordeiro', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3588, NULL, NULL, 'Duas Barras', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3589, NULL, NULL, 'Duque de Caxias', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3590, NULL, NULL, 'Engenheiro Paulo de Frontin', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3591, NULL, NULL, 'Guapimirim', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3592, NULL, NULL, 'Iguaba Grande', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3593, NULL, NULL, 'Itaboraí', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3594, NULL, NULL, 'Itaguaí', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3595, NULL, NULL, 'Italva', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3596, NULL, NULL, 'Itaocara', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3597, NULL, NULL, 'Itaperuna', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3598, NULL, NULL, 'Itatiaia', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3599, NULL, NULL, 'Japeri', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3600, NULL, NULL, 'Laje do Muriaé', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3601, NULL, NULL, 'Macaé', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3602, NULL, NULL, 'Macuco', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3603, NULL, NULL, 'Magé', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3604, NULL, NULL, 'Mangaratiba', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3605, NULL, NULL, 'Maricá', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3606, NULL, NULL, 'Mendes', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3607, NULL, NULL, 'Miguel Pereira', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3608, NULL, NULL, 'Miracema', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3609, NULL, NULL, 'Natividade', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3610, NULL, NULL, 'Nilópolis', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3611, NULL, NULL, 'Niterói', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3612, NULL, NULL, 'Nova Friburgo', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3613, NULL, NULL, 'Nova Iguaçu', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3614, NULL, NULL, 'Paracambi', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3615, NULL, NULL, 'Paraíba do Sul', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3616, NULL, NULL, 'Parati', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3617, NULL, NULL, 'Paty do Alferes', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3618, NULL, NULL, 'Petrópolis', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3619, NULL, NULL, 'Pinheiral', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3620, NULL, NULL, 'Piraí', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3621, NULL, NULL, 'Porciúncula', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3622, NULL, NULL, 'Porto Real', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3623, NULL, NULL, 'Quatis', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3624, NULL, NULL, 'Queimados', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3625, NULL, NULL, 'Quissamã', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3626, NULL, NULL, 'Resende', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3627, NULL, NULL, 'Rio Bonito', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3628, NULL, NULL, 'Rio Claro', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3629, NULL, NULL, 'Rio das Flores', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3630, NULL, NULL, 'Rio das Ostras', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3631, NULL, NULL, 'Rio de Janeiro', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3632, NULL, NULL, 'Santa Maria Madalena', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3633, NULL, NULL, 'Santo Antônio de Pádua', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3634, NULL, NULL, 'São Fidélis', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3635, NULL, NULL, 'São Francisco de Itabapoana', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3636, NULL, NULL, 'São Gonçalo', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3637, NULL, NULL, 'São João da Barra', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3638, NULL, NULL, 'São João de Meriti', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3639, NULL, NULL, 'São José de Ubá', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3640, NULL, NULL, 'São José do Vale do Rio Preto', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3641, NULL, NULL, 'São Pedro da Aldeia', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3642, NULL, NULL, 'São Sebastião do Alto', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3643, NULL, NULL, 'Sapucaia', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3644, NULL, NULL, 'Saquarema', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3645, NULL, NULL, 'Seropédica', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3646, NULL, NULL, 'Silva Jardim', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3647, NULL, NULL, 'Sumidouro', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3648, NULL, NULL, 'Tanguá', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3649, NULL, NULL, 'Teresópolis', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3650, NULL, NULL, 'Trajano de Morais', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3651, NULL, NULL, 'Três Rios', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3652, NULL, NULL, 'Valença', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3653, NULL, NULL, 'Varre-Sai', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3654, NULL, NULL, 'Vassouras', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3655, NULL, NULL, 'Volta Redonda', 19);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3656, NULL, NULL, 'Acari', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3657, NULL, NULL, 'Açu', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3658, NULL, NULL, 'Afonso Bezerra', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3659, NULL, NULL, 'Água Nova', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3660, NULL, NULL, 'Alexandria', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3661, NULL, NULL, 'Almino Afonso', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3662, NULL, NULL, 'Alto do Rodrigues', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3663, NULL, NULL, 'Angicos', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3664, NULL, NULL, 'Antônio Martins', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3665, NULL, NULL, 'Apodi', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3666, NULL, NULL, 'Areia Branca', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3667, NULL, NULL, 'Arês', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3668, NULL, NULL, 'Augusto Severo', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3669, NULL, NULL, 'Baía Formosa', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3670, NULL, NULL, 'Baraúna', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3671, NULL, NULL, 'Barcelona', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3672, NULL, NULL, 'Bento Fernandes', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3673, NULL, NULL, 'Bodó', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3674, NULL, NULL, 'Bom Jesus', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3675, NULL, NULL, 'Brejinho', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3676, NULL, NULL, 'Caiçara do Norte', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3677, NULL, NULL, 'Caiçara do Rio do Vento', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3678, NULL, NULL, 'Caicó', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3679, NULL, NULL, 'Campo Redondo', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3680, NULL, NULL, 'Canguaretama', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3681, NULL, NULL, 'Caraúbas', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3682, NULL, NULL, 'Carnaúba dos Dantas', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3683, NULL, NULL, 'Carnaubais', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3684, NULL, NULL, 'Ceará-Mirim', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3685, NULL, NULL, 'Cerro Corá', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3686, NULL, NULL, 'Coronel Ezequiel', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3687, NULL, NULL, 'Coronel João Pessoa', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3688, NULL, NULL, 'Cruzeta', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3689, NULL, NULL, 'Currais Novos', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3690, NULL, NULL, 'Doutor Severiano', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3691, NULL, NULL, 'Encanto', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3692, NULL, NULL, 'Equador', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3693, NULL, NULL, 'Espírito Santo', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3694, NULL, NULL, 'Extremoz', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3695, NULL, NULL, 'Felipe Guerra', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3696, NULL, NULL, 'Fernando Pedroza', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3697, NULL, NULL, 'Florânia', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3698, NULL, NULL, 'Francisco Dantas', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3699, NULL, NULL, 'Frutuoso Gomes', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3700, NULL, NULL, 'Galinhos', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3701, NULL, NULL, 'Goianinha', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3702, NULL, NULL, 'Governador Dix-Sept Rosado', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3703, NULL, NULL, 'Grossos', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3704, NULL, NULL, 'Guamaré', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3705, NULL, NULL, 'Ielmo Marinho', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3706, NULL, NULL, 'Ipanguaçu', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3707, NULL, NULL, 'Ipueira', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3708, NULL, NULL, 'Itajá', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3709, NULL, NULL, 'Itaú', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3710, NULL, NULL, 'Jaçanã', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3711, NULL, NULL, 'Jandaíra', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3712, NULL, NULL, 'Janduís', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3713, NULL, NULL, 'Januário Cicco', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3714, NULL, NULL, 'Japi', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3715, NULL, NULL, 'Jardim de Angicos', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3716, NULL, NULL, 'Jardim de Piranhas', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3717, NULL, NULL, 'Jardim do Seridó', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3718, NULL, NULL, 'João Câmara', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3719, NULL, NULL, 'João Dias', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3720, NULL, NULL, 'José da Penha', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3721, NULL, NULL, 'Jucurutu', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3722, NULL, NULL, 'Lagoa d`Anta', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3723, NULL, NULL, 'Lagoa de Pedras', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3724, NULL, NULL, 'Lagoa de Velhos', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3725, NULL, NULL, 'Lagoa Nova', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3726, NULL, NULL, 'Lagoa Salgada', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3727, NULL, NULL, 'Lajes', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3728, NULL, NULL, 'Lajes Pintadas', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3729, NULL, NULL, 'Lucrécia', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3730, NULL, NULL, 'Luís Gomes', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3731, NULL, NULL, 'Macaíba', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3732, NULL, NULL, 'Macau', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3733, NULL, NULL, 'Major Sales', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3734, NULL, NULL, 'Marcelino Vieira', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3735, NULL, NULL, 'Martins', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3736, NULL, NULL, 'Maxaranguape', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3737, NULL, NULL, 'Messias Targino', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3738, NULL, NULL, 'Montanhas', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3739, NULL, NULL, 'Monte Alegre', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3740, NULL, NULL, 'Monte das Gameleiras', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3741, NULL, NULL, 'Mossoró', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3742, NULL, NULL, 'Natal', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3743, NULL, NULL, 'Nísia Floresta', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3744, NULL, NULL, 'Nova Cruz', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3745, NULL, NULL, 'Olho-d`Água do Borges', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3746, NULL, NULL, 'Ouro Branco', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3747, NULL, NULL, 'Paraná', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3748, NULL, NULL, 'Paraú', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3749, NULL, NULL, 'Parazinho', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3750, NULL, NULL, 'Parelhas', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3751, NULL, NULL, 'Parnamirim', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3752, NULL, NULL, 'Passa e Fica', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3753, NULL, NULL, 'Passagem', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3754, NULL, NULL, 'Patu', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3755, NULL, NULL, 'Pau dos Ferros', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3756, NULL, NULL, 'Pedra Grande', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3757, NULL, NULL, 'Pedra Preta', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3758, NULL, NULL, 'Pedro Avelino', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3759, NULL, NULL, 'Pedro Velho', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3760, NULL, NULL, 'Pendências', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3761, NULL, NULL, 'Pilões', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3762, NULL, NULL, 'Poço Branco', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3763, NULL, NULL, 'Portalegre', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3764, NULL, NULL, 'Porto do Mangue', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3765, NULL, NULL, 'Presidente Juscelino', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3766, NULL, NULL, 'Pureza', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3767, NULL, NULL, 'Rafael Fernandes', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3768, NULL, NULL, 'Rafael Godeiro', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3769, NULL, NULL, 'Riacho da Cruz', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3770, NULL, NULL, 'Riacho de Santana', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3771, NULL, NULL, 'Riachuelo', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3772, NULL, NULL, 'Rio do Fogo', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3773, NULL, NULL, 'Rodolfo Fernandes', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3774, NULL, NULL, 'Ruy Barbosa', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3775, NULL, NULL, 'Santa Cruz', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3776, NULL, NULL, 'Santa Maria', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3777, NULL, NULL, 'Santana do Matos', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3778, NULL, NULL, 'Santana do Seridó', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3779, NULL, NULL, 'Santo Antônio', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3780, NULL, NULL, 'São Bento do Norte', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3781, NULL, NULL, 'São Bento do Trairí', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3782, NULL, NULL, 'São Fernando', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3783, NULL, NULL, 'São Francisco do Oeste', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3784, NULL, NULL, 'São Gonçalo do Amarante', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3785, NULL, NULL, 'São João do Sabugi', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3786, NULL, NULL, 'São José de Mipibu', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3787, NULL, NULL, 'São José do Campestre', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3788, NULL, NULL, 'São José do Seridó', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3789, NULL, NULL, 'São Miguel', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3790, NULL, NULL, 'São Miguel de Touros', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3791, NULL, NULL, 'São Paulo do Potengi', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3792, NULL, NULL, 'São Pedro', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3793, NULL, NULL, 'São Rafael', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3794, NULL, NULL, 'São Tomé', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3795, NULL, NULL, 'São Vicente', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3796, NULL, NULL, 'Senador Elói de Souza', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3797, NULL, NULL, 'Senador Georgino Avelino', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3798, NULL, NULL, 'Serra de São Bento', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3799, NULL, NULL, 'Serra do Mel', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3800, NULL, NULL, 'Serra Negra do Norte', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3801, NULL, NULL, 'Serrinha', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3802, NULL, NULL, 'Serrinha dos Pintos', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3803, NULL, NULL, 'Severiano Melo', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3804, NULL, NULL, 'Sítio Novo', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3805, NULL, NULL, 'Taboleiro Grande', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3806, NULL, NULL, 'Taipu', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3807, NULL, NULL, 'Tangará', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3808, NULL, NULL, 'Tenente Ananias', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3809, NULL, NULL, 'Tenente Laurentino Cruz', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3810, NULL, NULL, 'Tibau', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3811, NULL, NULL, 'Tibau do Sul', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3812, NULL, NULL, 'Timbaúba dos Batistas', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3813, NULL, NULL, 'Touros', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3814, NULL, NULL, 'Triunfo Potiguar', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3815, NULL, NULL, 'Umarizal', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3816, NULL, NULL, 'Upanema', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3817, NULL, NULL, 'Várzea', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3818, NULL, NULL, 'Venha-Ver', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3819, NULL, NULL, 'Vera Cruz', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3820, NULL, NULL, 'Viçosa', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3821, NULL, NULL, 'Vila Flor', 20);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3822, NULL, NULL, 'Água Santa', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3823, NULL, NULL, 'Agudo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3824, NULL, NULL, 'Ajuricaba', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3825, NULL, NULL, 'Alecrim', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3826, NULL, NULL, 'Alegrete', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3827, NULL, NULL, 'Alegria', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3828, NULL, NULL, 'Alpestre', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3829, NULL, NULL, 'Alto Alegre', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3830, NULL, NULL, 'Alto Feliz', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3831, NULL, NULL, 'Alvorada', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3832, NULL, NULL, 'Amaral Ferrador', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3833, NULL, NULL, 'Ametista do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3834, NULL, NULL, 'André da Rocha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3835, NULL, NULL, 'Anta Gorda', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3836, NULL, NULL, 'Antônio Prado', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3837, NULL, NULL, 'Arambaré', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3838, NULL, NULL, 'Araricá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3839, NULL, NULL, 'Aratiba', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3840, NULL, NULL, 'Arroio do Meio', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3841, NULL, NULL, 'Arroio do Sal', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3842, NULL, NULL, 'Arroio do Tigre', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3843, NULL, NULL, 'Arroio dos Ratos', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3844, NULL, NULL, 'Arroio Grande', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3845, NULL, NULL, 'Arvorezinha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3846, NULL, NULL, 'Augusto Pestana', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3847, NULL, NULL, 'Áurea', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3848, NULL, NULL, 'Bagé', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3849, NULL, NULL, 'Balneário Pinhal', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3850, NULL, NULL, 'Barão', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3851, NULL, NULL, 'Barão de Cotegipe', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3852, NULL, NULL, 'Barão do Triunfo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3853, NULL, NULL, 'Barra do Guarita', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3854, NULL, NULL, 'Barra do Quaraí', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3855, NULL, NULL, 'Barra do Ribeiro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3856, NULL, NULL, 'Barra do Rio Azul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3857, NULL, NULL, 'Barra Funda', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3858, NULL, NULL, 'Barracão', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3859, NULL, NULL, 'Barros Cassal', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3860, NULL, NULL, 'Benjamin Constant do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3861, NULL, NULL, 'Bento Gonçalves', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3862, NULL, NULL, 'Boa Vista das Missões', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3863, NULL, NULL, 'Boa Vista do Buricá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3864, NULL, NULL, 'Boa Vista do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3865, NULL, NULL, 'Bom Jesus', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3866, NULL, NULL, 'Bom Princípio', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3867, NULL, NULL, 'Bom Progresso', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3868, NULL, NULL, 'Bom Retiro do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3869, NULL, NULL, 'Boqueirão do Leão', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3870, NULL, NULL, 'Bossoroca', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3871, NULL, NULL, 'Braga', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3872, NULL, NULL, 'Brochier', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3873, NULL, NULL, 'Butiá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3874, NULL, NULL, 'Caçapava do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3875, NULL, NULL, 'Cacequi', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3876, NULL, NULL, 'Cachoeira do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3877, NULL, NULL, 'Cachoeirinha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3878, NULL, NULL, 'Cacique Doble', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3879, NULL, NULL, 'Caibaté', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3880, NULL, NULL, 'Caiçara', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3881, NULL, NULL, 'Camaquã', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3882, NULL, NULL, 'Camargo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3883, NULL, NULL, 'Cambará do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3884, NULL, NULL, 'Campestre da Serra', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3885, NULL, NULL, 'Campina das Missões', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3886, NULL, NULL, 'Campinas do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3887, NULL, NULL, 'Campo Bom', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3888, NULL, NULL, 'Campo Novo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3889, NULL, NULL, 'Campos Borges', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3890, NULL, NULL, 'Candelária', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3891, NULL, NULL, 'Cândido Godói', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3892, NULL, NULL, 'Candiota', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3893, NULL, NULL, 'Canela', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3894, NULL, NULL, 'Canguçu', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3895, NULL, NULL, 'Canoas', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3896, NULL, NULL, 'Capão da Canoa', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3897, NULL, NULL, 'Capão do Leão', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3898, NULL, NULL, 'Capela de Santana', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3899, NULL, NULL, 'Capitão', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3900, NULL, NULL, 'Capivari do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3901, NULL, NULL, 'Caraá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3902, NULL, NULL, 'Carazinho', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3903, NULL, NULL, 'Carlos Barbosa', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3904, NULL, NULL, 'Carlos Gomes', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3905, NULL, NULL, 'Casca', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3906, NULL, NULL, 'Caseiros', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3907, NULL, NULL, 'Catuípe', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3908, NULL, NULL, 'Caxias do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3909, NULL, NULL, 'Centenário', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3910, NULL, NULL, 'Cerrito', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3911, NULL, NULL, 'Cerro Branco', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3912, NULL, NULL, 'Cerro Grande', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3913, NULL, NULL, 'Cerro Grande do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3914, NULL, NULL, 'Cerro Largo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3915, NULL, NULL, 'Chapada', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3916, NULL, NULL, 'Charqueadas', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3917, NULL, NULL, 'Charrua', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3918, NULL, NULL, 'Chiapeta', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3919, NULL, NULL, 'Chuí', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3920, NULL, NULL, 'Chuvisca', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3921, NULL, NULL, 'Cidreira', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3922, NULL, NULL, 'Ciríaco', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3923, NULL, NULL, 'Colinas', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3924, NULL, NULL, 'Colorado', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3925, NULL, NULL, 'Condor', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3926, NULL, NULL, 'Constantina', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3927, NULL, NULL, 'Coqueiros do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3928, NULL, NULL, 'Coronel Barros', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3929, NULL, NULL, 'Coronel Bicaco', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3930, NULL, NULL, 'Cotiporã', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3931, NULL, NULL, 'Coxilha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3932, NULL, NULL, 'Crissiumal', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3933, NULL, NULL, 'Cristal', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3934, NULL, NULL, 'Cristal do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3935, NULL, NULL, 'Cruz Alta', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3936, NULL, NULL, 'Cruzeiro do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3937, NULL, NULL, 'David Canabarro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3938, NULL, NULL, 'Derrubadas', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3939, NULL, NULL, 'Dezesseis de Novembro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3940, NULL, NULL, 'Dilermando de Aguiar', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3941, NULL, NULL, 'Dois Irmãos', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3942, NULL, NULL, 'Dois Irmãos das Missões', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3943, NULL, NULL, 'Dois Lajeados', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3944, NULL, NULL, 'Dom Feliciano', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3945, NULL, NULL, 'Dom Pedrito', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3946, NULL, NULL, 'Dom Pedro de Alcântara', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3947, NULL, NULL, 'Dona Francisca', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3948, NULL, NULL, 'Doutor Maurício Cardoso', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3949, NULL, NULL, 'Doutor Ricardo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3950, NULL, NULL, 'Eldorado do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3951, NULL, NULL, 'Encantado', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3952, NULL, NULL, 'Encruzilhada do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3953, NULL, NULL, 'Engenho Velho', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3954, NULL, NULL, 'Entre Rios do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3955, NULL, NULL, 'Entre-Ijuís', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3956, NULL, NULL, 'Erebango', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3957, NULL, NULL, 'Erechim', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3958, NULL, NULL, 'Ernestina', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3959, NULL, NULL, 'Erval Grande', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3960, NULL, NULL, 'Erval Seco', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3961, NULL, NULL, 'Esmeralda', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3962, NULL, NULL, 'Esperança do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3963, NULL, NULL, 'Espumoso', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3964, NULL, NULL, 'Estação', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3965, NULL, NULL, 'Estância Velha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3966, NULL, NULL, 'Esteio', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3967, NULL, NULL, 'Estrela', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3968, NULL, NULL, 'Estrela Velha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3969, NULL, NULL, 'Eugênio de Castro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3970, NULL, NULL, 'Fagundes Varela', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3971, NULL, NULL, 'Farroupilha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3972, NULL, NULL, 'Faxinal do Soturno', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3973, NULL, NULL, 'Faxinalzinho', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3974, NULL, NULL, 'Fazenda Vilanova', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3975, NULL, NULL, 'Feliz', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3976, NULL, NULL, 'Flores da Cunha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3977, NULL, NULL, 'Floriano Peixoto', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3978, NULL, NULL, 'Fontoura Xavier', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3979, NULL, NULL, 'Formigueiro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3980, NULL, NULL, 'Fortaleza dos Valos', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3981, NULL, NULL, 'Frederico Westphalen', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3982, NULL, NULL, 'Garibaldi', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3983, NULL, NULL, 'Garruchos', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3984, NULL, NULL, 'Gaurama', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3985, NULL, NULL, 'General Câmara', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3986, NULL, NULL, 'Gentil', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3987, NULL, NULL, 'Getúlio Vargas', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3988, NULL, NULL, 'Giruá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3989, NULL, NULL, 'Glorinha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3990, NULL, NULL, 'Gramado', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3991, NULL, NULL, 'Gramado dos Loureiros', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3992, NULL, NULL, 'Gramado Xavier', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3993, NULL, NULL, 'Gravataí', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3994, NULL, NULL, 'Guabiju', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3995, NULL, NULL, 'Guaíba', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3996, NULL, NULL, 'Guaporé', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3997, NULL, NULL, 'Guarani das Missões', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3998, NULL, NULL, 'Harmonia', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (3999, NULL, NULL, 'Herval', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4000, NULL, NULL, 'Herveiras', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4001, NULL, NULL, 'Horizontina', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4002, NULL, NULL, 'Hulha Negra', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4003, NULL, NULL, 'Humaitá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4004, NULL, NULL, 'Ibarama', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4005, NULL, NULL, 'Ibiaçá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4006, NULL, NULL, 'Ibiraiaras', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4007, NULL, NULL, 'Ibirapuitã', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4008, NULL, NULL, 'Ibirubá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4009, NULL, NULL, 'Igrejinha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4010, NULL, NULL, 'Ijuí', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4011, NULL, NULL, 'Ilópolis', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4012, NULL, NULL, 'Imbé', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4013, NULL, NULL, 'Imigrante', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4014, NULL, NULL, 'Independência', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4015, NULL, NULL, 'Inhacorá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4016, NULL, NULL, 'Ipê', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4017, NULL, NULL, 'Ipiranga do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4018, NULL, NULL, 'Iraí', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4019, NULL, NULL, 'Itaara', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4020, NULL, NULL, 'Itacurubi', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4021, NULL, NULL, 'Itapuca', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4022, NULL, NULL, 'Itaqui', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4023, NULL, NULL, 'Itatiba do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4024, NULL, NULL, 'Ivorá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4025, NULL, NULL, 'Ivoti', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4026, NULL, NULL, 'Jaboticaba', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4027, NULL, NULL, 'Jacutinga', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4028, NULL, NULL, 'Jaguarão', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4029, NULL, NULL, 'Jaguari', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4030, NULL, NULL, 'Jaquirana', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4031, NULL, NULL, 'Jari', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4032, NULL, NULL, 'Jóia', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4033, NULL, NULL, 'Júlio de Castilhos', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4034, NULL, NULL, 'Lagoa dos Três Cantos', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4035, NULL, NULL, 'Lagoa Vermelha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4036, NULL, NULL, 'Lagoão', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4037, NULL, NULL, 'Lajeado', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4038, NULL, NULL, 'Lajeado do Bugre', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4039, NULL, NULL, 'Lavras do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4040, NULL, NULL, 'Liberato Salzano', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4041, NULL, NULL, 'Lindolfo Collor', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4042, NULL, NULL, 'Linha Nova', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4043, NULL, NULL, 'Maçambara', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4044, NULL, NULL, 'Machadinho', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4045, NULL, NULL, 'Mampituba', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4046, NULL, NULL, 'Manoel Viana', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4047, NULL, NULL, 'Maquiné', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4048, NULL, NULL, 'Maratá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4049, NULL, NULL, 'Marau', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4050, NULL, NULL, 'Marcelino Ramos', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4051, NULL, NULL, 'Mariana Pimentel', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4052, NULL, NULL, 'Mariano Moro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4053, NULL, NULL, 'Marques de Souza', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4054, NULL, NULL, 'Mata', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4055, NULL, NULL, 'Mato Castelhano', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4056, NULL, NULL, 'Mato Leitão', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4057, NULL, NULL, 'Maximiliano de Almeida', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4058, NULL, NULL, 'Minas do Leão', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4059, NULL, NULL, 'Miraguaí', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4060, NULL, NULL, 'Montauri', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4061, NULL, NULL, 'Monte Alegre dos Campos', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4062, NULL, NULL, 'Monte Belo do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4063, NULL, NULL, 'Montenegro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4064, NULL, NULL, 'Mormaço', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4065, NULL, NULL, 'Morrinhos do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4066, NULL, NULL, 'Morro Redondo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4067, NULL, NULL, 'Morro Reuter', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4068, NULL, NULL, 'Mostardas', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4069, NULL, NULL, 'Muçum', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4070, NULL, NULL, 'Muitos Capões', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4071, NULL, NULL, 'Muliterno', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4072, NULL, NULL, 'Não-Me-Toque', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4073, NULL, NULL, 'Nicolau Vergueiro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4074, NULL, NULL, 'Nonoai', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4075, NULL, NULL, 'Nova Alvorada', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4076, NULL, NULL, 'Nova Araçá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4077, NULL, NULL, 'Nova Bassano', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4078, NULL, NULL, 'Nova Boa Vista', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4079, NULL, NULL, 'Nova Bréscia', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4080, NULL, NULL, 'Nova Candelária', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4081, NULL, NULL, 'Nova Esperança do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4082, NULL, NULL, 'Nova Hartz', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4083, NULL, NULL, 'Nova Pádua', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4084, NULL, NULL, 'Nova Palma', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4085, NULL, NULL, 'Nova Petrópolis', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4086, NULL, NULL, 'Nova Prata', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4087, NULL, NULL, 'Nova Ramada', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4088, NULL, NULL, 'Nova Roma do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4089, NULL, NULL, 'Nova Santa Rita', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4090, NULL, NULL, 'Novo Barreiro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4091, NULL, NULL, 'Novo Cabrais', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4092, NULL, NULL, 'Novo Hamburgo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4093, NULL, NULL, 'Novo Machado', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4094, NULL, NULL, 'Novo Tiradentes', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4095, NULL, NULL, 'Osório', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4096, NULL, NULL, 'Paim Filho', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4097, NULL, NULL, 'Palmares do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4098, NULL, NULL, 'Palmeira das Missões', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4099, NULL, NULL, 'Palmitinho', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4100, NULL, NULL, 'Panambi', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4101, NULL, NULL, 'Pantano Grande', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4102, NULL, NULL, 'Paraí', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4103, NULL, NULL, 'Paraíso do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4104, NULL, NULL, 'Pareci Novo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4105, NULL, NULL, 'Parobé', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4106, NULL, NULL, 'Passa Sete', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4107, NULL, NULL, 'Passo do Sobrado', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4108, NULL, NULL, 'Passo Fundo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4109, NULL, NULL, 'Paverama', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4110, NULL, NULL, 'Pedro Osório', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4111, NULL, NULL, 'Pejuçara', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4112, NULL, NULL, 'Pelotas', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4113, NULL, NULL, 'Picada Café', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4114, NULL, NULL, 'Pinhal', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4115, NULL, NULL, 'Pinhal Grande', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4116, NULL, NULL, 'Pinheirinho do Vale', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4117, NULL, NULL, 'Pinheiro Machado', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4118, NULL, NULL, 'Pirapó', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4119, NULL, NULL, 'Piratini', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4120, NULL, NULL, 'Planalto', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4121, NULL, NULL, 'Poço das Antas', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4122, NULL, NULL, 'Pontão', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4123, NULL, NULL, 'Ponte Preta', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4124, NULL, NULL, 'Portão', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4125, NULL, NULL, 'Porto Alegre', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4126, NULL, NULL, 'Porto Lucena', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4127, NULL, NULL, 'Porto Mauá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4128, NULL, NULL, 'Porto Vera Cruz', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4129, NULL, NULL, 'Porto Xavier', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4130, NULL, NULL, 'Pouso Novo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4131, NULL, NULL, 'Presidente Lucena', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4132, NULL, NULL, 'Progresso', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4133, NULL, NULL, 'Protásio Alves', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4134, NULL, NULL, 'Putinga', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4135, NULL, NULL, 'Quaraí', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4136, NULL, NULL, 'Quevedos', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4137, NULL, NULL, 'Quinze de Novembro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4138, NULL, NULL, 'Redentora', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4139, NULL, NULL, 'Relvado', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4140, NULL, NULL, 'Restinga Seca', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4141, NULL, NULL, 'Rio dos Índios', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4142, NULL, NULL, 'Rio Grande', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4143, NULL, NULL, 'Rio Pardo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4144, NULL, NULL, 'Riozinho', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4145, NULL, NULL, 'Roca Sales', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4146, NULL, NULL, 'Rodeio Bonito', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4147, NULL, NULL, 'Rolante', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4148, NULL, NULL, 'Ronda Alta', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4149, NULL, NULL, 'Rondinha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4150, NULL, NULL, 'Roque Gonzales', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4151, NULL, NULL, 'Rosário do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4152, NULL, NULL, 'Sagrada Família', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4153, NULL, NULL, 'Saldanha Marinho', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4154, NULL, NULL, 'Salto do Jacuí', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4155, NULL, NULL, 'Salvador das Missões', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4156, NULL, NULL, 'Salvador do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4157, NULL, NULL, 'Sananduva', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4158, NULL, NULL, 'Santa Bárbara do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4159, NULL, NULL, 'Santa Clara do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4160, NULL, NULL, 'Santa Cruz do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4161, NULL, NULL, 'Santa Maria', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4162, NULL, NULL, 'Santa Maria do Herval', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4163, NULL, NULL, 'Santa Rosa', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4164, NULL, NULL, 'Santa Tereza', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4165, NULL, NULL, 'Santa Vitória do Palmar', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4166, NULL, NULL, 'Santana da Boa Vista', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4167, NULL, NULL, 'Santana do Livramento', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4168, NULL, NULL, 'Santiago', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4169, NULL, NULL, 'Santo Ângelo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4170, NULL, NULL, 'Santo Antônio da Patrulha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4171, NULL, NULL, 'Santo Antônio das Missões', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4172, NULL, NULL, 'Santo Antônio do Palma', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4173, NULL, NULL, 'Santo Antônio do Planalto', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4174, NULL, NULL, 'Santo Augusto', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4175, NULL, NULL, 'Santo Cristo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4176, NULL, NULL, 'Santo Expedito do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4177, NULL, NULL, 'São Borja', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4178, NULL, NULL, 'São Domingos do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4179, NULL, NULL, 'São Francisco de Assis', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4180, NULL, NULL, 'São Francisco de Paula', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4181, NULL, NULL, 'São Gabriel', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4182, NULL, NULL, 'São Jerônimo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4183, NULL, NULL, 'São João da Urtiga', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4184, NULL, NULL, 'São João do Polêsine', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4185, NULL, NULL, 'São Jorge', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4186, NULL, NULL, 'São José das Missões', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4187, NULL, NULL, 'São José do Herval', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4188, NULL, NULL, 'São José do Hortêncio', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4189, NULL, NULL, 'São José do Inhacorá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4190, NULL, NULL, 'São José do Norte', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4191, NULL, NULL, 'São José do Ouro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4192, NULL, NULL, 'São José dos Ausentes', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4193, NULL, NULL, 'São Leopoldo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4194, NULL, NULL, 'São Lourenço do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4195, NULL, NULL, 'São Luiz Gonzaga', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4196, NULL, NULL, 'São Marcos', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4197, NULL, NULL, 'São Martinho', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4198, NULL, NULL, 'São Martinho da Serra', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4199, NULL, NULL, 'São Miguel das Missões', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4200, NULL, NULL, 'São Nicolau', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4201, NULL, NULL, 'São Paulo das Missões', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4202, NULL, NULL, 'São Pedro da Serra', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4203, NULL, NULL, 'São Pedro do Butiá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4204, NULL, NULL, 'São Pedro do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4205, NULL, NULL, 'São Sebastião do Caí', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4206, NULL, NULL, 'São Sepé', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4207, NULL, NULL, 'São Valentim', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4208, NULL, NULL, 'São Valentim do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4209, NULL, NULL, 'São Valério do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4210, NULL, NULL, 'São Vendelino', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4211, NULL, NULL, 'São Vicente do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4212, NULL, NULL, 'Sapiranga', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4213, NULL, NULL, 'Sapucaia do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4214, NULL, NULL, 'Sarandi', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4215, NULL, NULL, 'Seberi', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4216, NULL, NULL, 'Sede Nova', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4217, NULL, NULL, 'Segredo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4218, NULL, NULL, 'Selbach', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4219, NULL, NULL, 'Senador Salgado Filho', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4220, NULL, NULL, 'Sentinela do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4221, NULL, NULL, 'Serafina Corrêa', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4222, NULL, NULL, 'Sério', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4223, NULL, NULL, 'Sertão', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4224, NULL, NULL, 'Sertão Santana', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4225, NULL, NULL, 'Sete de Setembro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4226, NULL, NULL, 'Severiano de Almeida', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4227, NULL, NULL, 'Silveira Martins', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4228, NULL, NULL, 'Sinimbu', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4229, NULL, NULL, 'Sobradinho', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4230, NULL, NULL, 'Soledade', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4231, NULL, NULL, 'Tabaí', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4232, NULL, NULL, 'Tapejara', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4233, NULL, NULL, 'Tapera', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4234, NULL, NULL, 'Tapes', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4235, NULL, NULL, 'Taquara', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4236, NULL, NULL, 'Taquari', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4237, NULL, NULL, 'Taquaruçu do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4238, NULL, NULL, 'Tavares', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4239, NULL, NULL, 'Tenente Portela', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4240, NULL, NULL, 'Terra de Areia', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4241, NULL, NULL, 'Teutônia', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4242, NULL, NULL, 'Tiradentes do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4243, NULL, NULL, 'Toropi', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4244, NULL, NULL, 'Torres', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4245, NULL, NULL, 'Tramandaí', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4246, NULL, NULL, 'Travesseiro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4247, NULL, NULL, 'Três Arroios', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4248, NULL, NULL, 'Três Cachoeiras', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4249, NULL, NULL, 'Três Coroas', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4250, NULL, NULL, 'Três de Maio', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4251, NULL, NULL, 'Três Forquilhas', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4252, NULL, NULL, 'Três Palmeiras', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4253, NULL, NULL, 'Três Passos', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4254, NULL, NULL, 'Trindade do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4255, NULL, NULL, 'Triunfo', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4256, NULL, NULL, 'Tucunduva', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4257, NULL, NULL, 'Tunas', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4258, NULL, NULL, 'Tupanci do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4259, NULL, NULL, 'Tupanciretã', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4260, NULL, NULL, 'Tupandi', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4261, NULL, NULL, 'Tuparendi', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4262, NULL, NULL, 'Turuçu', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4263, NULL, NULL, 'Ubiretama', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4264, NULL, NULL, 'União da Serra', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4265, NULL, NULL, 'Unistalda', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4266, NULL, NULL, 'Uruguaiana', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4267, NULL, NULL, 'Vacaria', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4268, NULL, NULL, 'Vale do Sol', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4269, NULL, NULL, 'Vale Real', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4270, NULL, NULL, 'Vale Verde', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4271, NULL, NULL, 'Vanini', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4272, NULL, NULL, 'Venâncio Aires', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4273, NULL, NULL, 'Vera Cruz', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4274, NULL, NULL, 'Veranópolis', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4275, NULL, NULL, 'Vespasiano Correa', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4276, NULL, NULL, 'Viadutos', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4277, NULL, NULL, 'Viamão', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4278, NULL, NULL, 'Vicente Dutra', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4279, NULL, NULL, 'Victor Graeff', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4280, NULL, NULL, 'Vila Flores', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4281, NULL, NULL, 'Vila Lângaro', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4282, NULL, NULL, 'Vila Maria', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4283, NULL, NULL, 'Vila Nova do Sul', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4284, NULL, NULL, 'Vista Alegre', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4285, NULL, NULL, 'Vista Alegre do Prata', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4286, NULL, NULL, 'Vista Gaúcha', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4287, NULL, NULL, 'Vitória das Missões', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4288, NULL, NULL, 'Xangri-lá', 21);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4289, NULL, NULL, 'Alta Floresta d`Oeste', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4290, NULL, NULL, 'Alto Alegre dos Parecis', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4291, NULL, NULL, 'Alto Paraíso', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4292, NULL, NULL, 'Alvorada d`Oeste', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4293, NULL, NULL, 'Ariquemes', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4294, NULL, NULL, 'Buritis', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4295, NULL, NULL, 'Cabixi', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4296, NULL, NULL, 'Cacaulândia', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4297, NULL, NULL, 'Cacoal', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4298, NULL, NULL, 'Campo Novo de Rondônia', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4299, NULL, NULL, 'Candeias do Jamari', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4300, NULL, NULL, 'Castanheiras', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4301, NULL, NULL, 'Cerejeiras', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4302, NULL, NULL, 'Chupinguaia', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4303, NULL, NULL, 'Colorado do Oeste', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4304, NULL, NULL, 'Corumbiara', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4305, NULL, NULL, 'Costa Marques', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4306, NULL, NULL, 'Cujubim', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4307, NULL, NULL, 'Espigão d`Oeste', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4308, NULL, NULL, 'Governador Jorge Teixeira', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4309, NULL, NULL, 'Guajará-Mirim', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4310, NULL, NULL, 'Itapuã do Oeste', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4311, NULL, NULL, 'Jaru', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4312, NULL, NULL, 'Ji-Paraná', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4313, NULL, NULL, 'Machadinho d`Oeste', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4314, NULL, NULL, 'Ministro Andreazza', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4315, NULL, NULL, 'Mirante da Serra', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4316, NULL, NULL, 'Monte Negro', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4317, NULL, NULL, 'Nova Brasilândia d`Oeste', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4318, NULL, NULL, 'Nova Mamoré', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4319, NULL, NULL, 'Nova União', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4320, NULL, NULL, 'Novo Horizonte do Oeste', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4321, NULL, NULL, 'Ouro Preto do Oeste', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4322, NULL, NULL, 'Parecis', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4323, NULL, NULL, 'Pimenta Bueno', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4324, NULL, NULL, 'Pimenteiras do Oeste', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4325, NULL, NULL, 'Porto Velho', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4326, NULL, NULL, 'Presidente Médici', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4327, NULL, NULL, 'Primavera de Rondônia', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4328, NULL, NULL, 'Rio Crespo', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4329, NULL, NULL, 'Rolim de Moura', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4330, NULL, NULL, 'Santa Luzia d`Oeste', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4331, NULL, NULL, 'São Felipe d`Oeste', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4332, NULL, NULL, 'São Francisco do Guaporé', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4333, NULL, NULL, 'São Miguel do Guaporé', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4334, NULL, NULL, 'Seringueiras', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4335, NULL, NULL, 'Teixeirópolis', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4336, NULL, NULL, 'Theobroma', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4337, NULL, NULL, 'Urupá', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4338, NULL, NULL, 'Vale do Anari', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4339, NULL, NULL, 'Vale do Paraíso', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4340, NULL, NULL, 'Vilhena', 22);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4341, NULL, NULL, 'Alto Alegre', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4342, NULL, NULL, 'Amajari', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4343, NULL, NULL, 'Boa Vista', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4344, NULL, NULL, 'Bonfim', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4345, NULL, NULL, 'Cantá', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4346, NULL, NULL, 'Caracaraí', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4347, NULL, NULL, 'Caroebe', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4348, NULL, NULL, 'Iracema', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4349, NULL, NULL, 'Mucajaí', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4350, NULL, NULL, 'Normandia', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4351, NULL, NULL, 'Pacaraima', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4352, NULL, NULL, 'Rorainópolis', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4353, NULL, NULL, 'São João da Baliza', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4354, NULL, NULL, 'São Luiz', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4355, NULL, NULL, 'Uiramutã', 23);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4356, NULL, NULL, 'Abdon Batista', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4357, NULL, NULL, 'Abelardo Luz', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4358, NULL, NULL, 'Agrolândia', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4359, NULL, NULL, 'Agronômica', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4360, NULL, NULL, 'Água Doce', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4361, NULL, NULL, 'Águas de Chapecó', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4362, NULL, NULL, 'Águas Frias', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4363, NULL, NULL, 'Águas Mornas', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4364, NULL, NULL, 'Alfredo Wagner', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4365, NULL, NULL, 'Alto Bela Vista', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4366, NULL, NULL, 'Anchieta', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4367, NULL, NULL, 'Angelina', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4368, NULL, NULL, 'Anita Garibaldi', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4369, NULL, NULL, 'Anitápolis', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4370, NULL, NULL, 'Antônio Carlos', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4371, NULL, NULL, 'Apiúna', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4372, NULL, NULL, 'Arabutã', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4373, NULL, NULL, 'Araquari', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4374, NULL, NULL, 'Araranguá', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4375, NULL, NULL, 'Armazém', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4376, NULL, NULL, 'Arroio Trinta', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4377, NULL, NULL, 'Arvoredo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4378, NULL, NULL, 'Ascurra', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4379, NULL, NULL, 'Atalanta', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4380, NULL, NULL, 'Aurora', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4381, NULL, NULL, 'Balneário Arroio do Silva', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4382, NULL, NULL, 'Balneário Barra do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4383, NULL, NULL, 'Balneário Camboriú', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4384, NULL, NULL, 'Balneário Gaivota', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4385, NULL, NULL, 'Bandeirante', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4386, NULL, NULL, 'Barra Bonita', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4387, NULL, NULL, 'Barra Velha', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4388, NULL, NULL, 'Bela Vista do Toldo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4389, NULL, NULL, 'Belmonte', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4390, NULL, NULL, 'Benedito Novo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4391, NULL, NULL, 'Biguaçu', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4392, NULL, NULL, 'Blumenau', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4393, NULL, NULL, 'Bocaina do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4394, NULL, NULL, 'Bom Jardim da Serra', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4395, NULL, NULL, 'Bom Jesus', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4396, NULL, NULL, 'Bom Jesus do Oeste', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4397, NULL, NULL, 'Bom Retiro', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4398, NULL, NULL, 'Bombinhas', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4399, NULL, NULL, 'Botuverá', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4400, NULL, NULL, 'Braço do Norte', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4401, NULL, NULL, 'Braço do Trombudo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4402, NULL, NULL, 'Brunópolis', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4403, NULL, NULL, 'Brusque', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4404, NULL, NULL, 'Caçador', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4405, NULL, NULL, 'Caibi', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4406, NULL, NULL, 'Calmon', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4407, NULL, NULL, 'Camboriú', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4408, NULL, NULL, 'Campo Alegre', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4409, NULL, NULL, 'Campo Belo do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4410, NULL, NULL, 'Campo Erê', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4411, NULL, NULL, 'Campos Novos', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4412, NULL, NULL, 'Canelinha', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4413, NULL, NULL, 'Canoinhas', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4414, NULL, NULL, 'Capão Alto', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4415, NULL, NULL, 'Capinzal', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4416, NULL, NULL, 'Capivari de Baixo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4417, NULL, NULL, 'Catanduvas', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4418, NULL, NULL, 'Caxambu do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4419, NULL, NULL, 'Celso Ramos', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4420, NULL, NULL, 'Cerro Negro', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4421, NULL, NULL, 'Chapadão do Lageado', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4422, NULL, NULL, 'Chapecó', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4423, NULL, NULL, 'Cocal do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4424, NULL, NULL, 'Concórdia', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4425, NULL, NULL, 'Cordilheira Alta', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4426, NULL, NULL, 'Coronel Freitas', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4427, NULL, NULL, 'Coronel Martins', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4428, NULL, NULL, 'Correia Pinto', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4429, NULL, NULL, 'Corupá', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4430, NULL, NULL, 'Criciúma', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4431, NULL, NULL, 'Cunha Porã', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4432, NULL, NULL, 'Cunhataí', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4433, NULL, NULL, 'Curitibanos', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4434, NULL, NULL, 'Descanso', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4435, NULL, NULL, 'Dionísio Cerqueira', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4436, NULL, NULL, 'Dona Emma', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4437, NULL, NULL, 'Doutor Pedrinho', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4438, NULL, NULL, 'Entre Rios', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4439, NULL, NULL, 'Ermo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4440, NULL, NULL, 'Erval Velho', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4441, NULL, NULL, 'Faxinal dos Guedes', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4442, NULL, NULL, 'Flor do Sertão', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4443, NULL, NULL, 'Florianópolis', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4444, NULL, NULL, 'Formosa do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4445, NULL, NULL, 'Forquilhinha', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4446, NULL, NULL, 'Fraiburgo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4447, NULL, NULL, 'Frei Rogério', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4448, NULL, NULL, 'Galvão', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4449, NULL, NULL, 'Garopaba', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4450, NULL, NULL, 'Garuva', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4451, NULL, NULL, 'Gaspar', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4452, NULL, NULL, 'Governador Celso Ramos', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4453, NULL, NULL, 'Grão Pará', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4454, NULL, NULL, 'Gravatal', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4455, NULL, NULL, 'Guabiruba', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4456, NULL, NULL, 'Guaraciaba', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4457, NULL, NULL, 'Guaramirim', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4458, NULL, NULL, 'Guarujá do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4459, NULL, NULL, 'Guatambú', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4460, NULL, NULL, 'Herval d`Oeste', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4461, NULL, NULL, 'Ibiam', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4462, NULL, NULL, 'Ibicaré', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4463, NULL, NULL, 'Ibirama', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4464, NULL, NULL, 'Içara', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4465, NULL, NULL, 'Ilhota', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4466, NULL, NULL, 'Imaruí', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4467, NULL, NULL, 'Imbituba', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4468, NULL, NULL, 'Imbuia', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4469, NULL, NULL, 'Indaial', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4470, NULL, NULL, 'Iomerê', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4471, NULL, NULL, 'Ipira', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4472, NULL, NULL, 'Iporã do Oeste', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4473, NULL, NULL, 'Ipuaçu', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4474, NULL, NULL, 'Ipumirim', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4475, NULL, NULL, 'Iraceminha', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4476, NULL, NULL, 'Irani', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4477, NULL, NULL, 'Irati', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4478, NULL, NULL, 'Irineópolis', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4479, NULL, NULL, 'Itá', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4480, NULL, NULL, 'Itaiópolis', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4481, NULL, NULL, 'Itajaí', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4482, NULL, NULL, 'Itapema', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4483, NULL, NULL, 'Itapiranga', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4484, NULL, NULL, 'Itapoá', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4485, NULL, NULL, 'Ituporanga', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4486, NULL, NULL, 'Jaborá', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4487, NULL, NULL, 'Jacinto Machado', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4488, NULL, NULL, 'Jaguaruna', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4489, NULL, NULL, 'Jaraguá do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4490, NULL, NULL, 'Jardinópolis', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4491, NULL, NULL, 'Joaçaba', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4492, NULL, NULL, 'Joinville', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4493, NULL, NULL, 'José Boiteux', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4494, NULL, NULL, 'Jupiá', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4495, NULL, NULL, 'Lacerdópolis', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4496, NULL, NULL, 'Lages', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4497, NULL, NULL, 'Laguna', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4498, NULL, NULL, 'Lajeado Grande', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4499, NULL, NULL, 'Laurentino', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4500, NULL, NULL, 'Lauro Muller', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4501, NULL, NULL, 'Lebon Régis', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4502, NULL, NULL, 'Leoberto Leal', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4503, NULL, NULL, 'Lindóia do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4504, NULL, NULL, 'Lontras', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4505, NULL, NULL, 'Luiz Alves', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4506, NULL, NULL, 'Luzerna', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4507, NULL, NULL, 'Macieira', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4508, NULL, NULL, 'Mafra', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4509, NULL, NULL, 'Major Gercino', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4510, NULL, NULL, 'Major Vieira', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4511, NULL, NULL, 'Maracajá', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4512, NULL, NULL, 'Maravilha', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4513, NULL, NULL, 'Marema', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4514, NULL, NULL, 'Massaranduba', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4515, NULL, NULL, 'Matos Costa', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4516, NULL, NULL, 'Meleiro', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4517, NULL, NULL, 'Mirim Doce', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4518, NULL, NULL, 'Modelo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4519, NULL, NULL, 'Mondaí', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4520, NULL, NULL, 'Monte Carlo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4521, NULL, NULL, 'Monte Castelo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4522, NULL, NULL, 'Morro da Fumaça', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4523, NULL, NULL, 'Morro Grande', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4524, NULL, NULL, 'Navegantes', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4525, NULL, NULL, 'Nova Erechim', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4526, NULL, NULL, 'Nova Itaberaba', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4527, NULL, NULL, 'Nova Trento', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4528, NULL, NULL, 'Nova Veneza', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4529, NULL, NULL, 'Novo Horizonte', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4530, NULL, NULL, 'Orleans', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4531, NULL, NULL, 'Otacílio Costa', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4532, NULL, NULL, 'Ouro', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4533, NULL, NULL, 'Ouro Verde', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4534, NULL, NULL, 'Paial', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4535, NULL, NULL, 'Painel', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4536, NULL, NULL, 'Palhoça', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4537, NULL, NULL, 'Palma Sola', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4538, NULL, NULL, 'Palmeira', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4539, NULL, NULL, 'Palmitos', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4540, NULL, NULL, 'Papanduva', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4541, NULL, NULL, 'Paraíso', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4542, NULL, NULL, 'Passo de Torres', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4543, NULL, NULL, 'Passos Maia', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4544, NULL, NULL, 'Paulo Lopes', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4545, NULL, NULL, 'Pedras Grandes', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4546, NULL, NULL, 'Penha', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4547, NULL, NULL, 'Peritiba', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4548, NULL, NULL, 'Petrolândia', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4549, NULL, NULL, 'Piçarras', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4550, NULL, NULL, 'Pinhalzinho', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4551, NULL, NULL, 'Pinheiro Preto', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4552, NULL, NULL, 'Piratuba', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4553, NULL, NULL, 'Planalto Alegre', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4554, NULL, NULL, 'Pomerode', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4555, NULL, NULL, 'Ponte Alta', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4556, NULL, NULL, 'Ponte Alta do Norte', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4557, NULL, NULL, 'Ponte Serrada', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4558, NULL, NULL, 'Porto Belo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4559, NULL, NULL, 'Porto União', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4560, NULL, NULL, 'Pouso Redondo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4561, NULL, NULL, 'Praia Grande', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4562, NULL, NULL, 'Presidente Castelo Branco', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4563, NULL, NULL, 'Presidente Getúlio', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4564, NULL, NULL, 'Presidente Nereu', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4565, NULL, NULL, 'Princesa', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4566, NULL, NULL, 'Quilombo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4567, NULL, NULL, 'Rancho Queimado', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4568, NULL, NULL, 'Rio das Antas', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4569, NULL, NULL, 'Rio do Campo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4570, NULL, NULL, 'Rio do Oeste', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4571, NULL, NULL, 'Rio do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4572, NULL, NULL, 'Rio dos Cedros', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4573, NULL, NULL, 'Rio Fortuna', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4574, NULL, NULL, 'Rio Negrinho', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4575, NULL, NULL, 'Rio Rufino', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4576, NULL, NULL, 'Riqueza', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4577, NULL, NULL, 'Rodeio', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4578, NULL, NULL, 'Romelândia', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4579, NULL, NULL, 'Salete', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4580, NULL, NULL, 'Saltinho', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4581, NULL, NULL, 'Salto Veloso', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4582, NULL, NULL, 'Sangão', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4583, NULL, NULL, 'Santa Cecília', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4584, NULL, NULL, 'Santa Helena', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4585, NULL, NULL, 'Santa Rosa de Lima', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4586, NULL, NULL, 'Santa Rosa do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4587, NULL, NULL, 'Santa Terezinha', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4588, NULL, NULL, 'Santa Terezinha do Progresso', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4589, NULL, NULL, 'Santiago do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4590, NULL, NULL, 'Santo Amaro da Imperatriz', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4591, NULL, NULL, 'São Bento do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4592, NULL, NULL, 'São Bernardino', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4593, NULL, NULL, 'São Bonifácio', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4594, NULL, NULL, 'São Carlos', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4595, NULL, NULL, 'São Cristovão do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4596, NULL, NULL, 'São Domingos', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4597, NULL, NULL, 'São Francisco do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4598, NULL, NULL, 'São João Batista', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4599, NULL, NULL, 'São João do Itaperiú', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4600, NULL, NULL, 'São João do Oeste', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4601, NULL, NULL, 'São João do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4602, NULL, NULL, 'São Joaquim', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4603, NULL, NULL, 'São José', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4604, NULL, NULL, 'São José do Cedro', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4605, NULL, NULL, 'São José do Cerrito', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4606, NULL, NULL, 'São Lourenço do Oeste', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4607, NULL, NULL, 'São Ludgero', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4608, NULL, NULL, 'São Martinho', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4609, NULL, NULL, 'São Miguel da Boa Vista', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4610, NULL, NULL, 'São Miguel do Oeste', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4611, NULL, NULL, 'São Pedro de Alcântara', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4612, NULL, NULL, 'Saudades', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4613, NULL, NULL, 'Schroeder', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4614, NULL, NULL, 'Seara', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4615, NULL, NULL, 'Serra Alta', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4616, NULL, NULL, 'Siderópolis', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4617, NULL, NULL, 'Sombrio', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4618, NULL, NULL, 'Sul Brasil', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4619, NULL, NULL, 'Taió', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4620, NULL, NULL, 'Tangará', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4621, NULL, NULL, 'Tigrinhos', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4622, NULL, NULL, 'Tijucas', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4623, NULL, NULL, 'Timbé do Sul', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4624, NULL, NULL, 'Timbó', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4625, NULL, NULL, 'Timbó Grande', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4626, NULL, NULL, 'Três Barras', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4627, NULL, NULL, 'Treviso', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4628, NULL, NULL, 'Treze de Maio', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4629, NULL, NULL, 'Treze Tílias', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4630, NULL, NULL, 'Trombudo Central', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4631, NULL, NULL, 'Tubarão', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4632, NULL, NULL, 'Tunápolis', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4633, NULL, NULL, 'Turvo', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4634, NULL, NULL, 'União do Oeste', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4635, NULL, NULL, 'Urubici', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4636, NULL, NULL, 'Urupema', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4637, NULL, NULL, 'Urussanga', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4638, NULL, NULL, 'Vargeão', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4639, NULL, NULL, 'Vargem', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4640, NULL, NULL, 'Vargem Bonita', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4641, NULL, NULL, 'Vidal Ramos', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4642, NULL, NULL, 'Videira', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4643, NULL, NULL, 'Vitor Meireles', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4644, NULL, NULL, 'Witmarsum', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4645, NULL, NULL, 'Xanxerê', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4646, NULL, NULL, 'Xavantina', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4647, NULL, NULL, 'Xaxim', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4648, NULL, NULL, 'Zortéa', 24);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4649, NULL, NULL, 'Adamantina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4650, NULL, NULL, 'Adolfo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4651, NULL, NULL, 'Aguaí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4652, NULL, NULL, 'Águas da Prata', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4653, NULL, NULL, 'Águas de Lindóia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4654, NULL, NULL, 'Águas de Santa Bárbara', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4655, NULL, NULL, 'Águas de São Pedro', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4656, NULL, NULL, 'Agudos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4657, NULL, NULL, 'Alambari', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4658, NULL, NULL, 'Alfredo Marcondes', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4659, NULL, NULL, 'Altair', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4660, NULL, NULL, 'Altinópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4661, NULL, NULL, 'Alto Alegre', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4662, NULL, NULL, 'Alumínio', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4663, NULL, NULL, 'Álvares Florence', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4664, NULL, NULL, 'Álvares Machado', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4665, NULL, NULL, 'Álvaro de Carvalho', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4666, NULL, NULL, 'Alvinlândia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4667, NULL, NULL, 'Americana', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4668, NULL, NULL, 'Américo Brasiliense', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4669, NULL, NULL, 'Américo de Campos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4670, NULL, NULL, 'Amparo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4671, NULL, NULL, 'Analândia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4672, NULL, NULL, 'Andradina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4673, NULL, NULL, 'Angatuba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4674, NULL, NULL, 'Anhembi', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4675, NULL, NULL, 'Anhumas', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4676, NULL, NULL, 'Aparecida', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4677, NULL, NULL, 'Aparecida d`Oeste', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4678, NULL, NULL, 'Apiaí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4679, NULL, NULL, 'Araçariguama', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4680, NULL, NULL, 'Araçatuba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4681, NULL, NULL, 'Araçoiaba da Serra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4682, NULL, NULL, 'Aramina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4683, NULL, NULL, 'Arandu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4684, NULL, NULL, 'Arapeí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4685, NULL, NULL, 'Araraquara', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4686, NULL, NULL, 'Araras', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4687, NULL, NULL, 'Arco-Íris', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4688, NULL, NULL, 'Arealva', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4689, NULL, NULL, 'Areias', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4690, NULL, NULL, 'Areiópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4691, NULL, NULL, 'Ariranha', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4692, NULL, NULL, 'Artur Nogueira', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4693, NULL, NULL, 'Arujá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4694, NULL, NULL, 'Aspásia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4695, NULL, NULL, 'Assis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4696, NULL, NULL, 'Atibaia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4697, NULL, NULL, 'Auriflama', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4698, NULL, NULL, 'Avaí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4699, NULL, NULL, 'Avanhandava', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4700, NULL, NULL, 'Avaré', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4701, NULL, NULL, 'Bady Bassitt', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4702, NULL, NULL, 'Balbinos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4703, NULL, NULL, 'Bálsamo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4704, NULL, NULL, 'Bananal', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4705, NULL, NULL, 'Barão de Antonina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4706, NULL, NULL, 'Barbosa', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4707, NULL, NULL, 'Bariri', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4708, NULL, NULL, 'Barra Bonita', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4709, NULL, NULL, 'Barra do Chapéu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4710, NULL, NULL, 'Barra do Turvo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4711, NULL, NULL, 'Barretos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4712, NULL, NULL, 'Barrinha', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4713, NULL, NULL, 'Barueri', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4714, NULL, NULL, 'Bastos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4715, NULL, NULL, 'Batatais', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4716, NULL, NULL, 'Bauru', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4717, NULL, NULL, 'Bebedouro', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4718, NULL, NULL, 'Bento de Abreu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4719, NULL, NULL, 'Bernardino de Campos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4720, NULL, NULL, 'Bertioga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4721, NULL, NULL, 'Bilac', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4722, NULL, NULL, 'Birigui', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4723, NULL, NULL, 'Biritiba-Mirim', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4724, NULL, NULL, 'Boa Esperança do Sul', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4725, NULL, NULL, 'Bocaina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4726, NULL, NULL, 'Bofete', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4727, NULL, NULL, 'Boituva', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4728, NULL, NULL, 'Bom Jesus dos Perdões', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4729, NULL, NULL, 'Bom Sucesso de Itararé', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4730, NULL, NULL, 'Borá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4731, NULL, NULL, 'Boracéia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4732, NULL, NULL, 'Borborema', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4733, NULL, NULL, 'Borebi', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4734, NULL, NULL, 'Botucatu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4735, NULL, NULL, 'Bragança Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4736, NULL, NULL, 'Braúna', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4737, NULL, NULL, 'Brejo Alegre', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4738, NULL, NULL, 'Brodowski', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4739, NULL, NULL, 'Brotas', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4740, NULL, NULL, 'Buri', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4741, NULL, NULL, 'Buritama', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4742, NULL, NULL, 'Buritizal', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4743, NULL, NULL, 'Cabrália Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4744, NULL, NULL, 'Cabreúva', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4745, NULL, NULL, 'Caçapava', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4746, NULL, NULL, 'Cachoeira Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4747, NULL, NULL, 'Caconde', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4748, NULL, NULL, 'Cafelândia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4749, NULL, NULL, 'Caiabu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4750, NULL, NULL, 'Caieiras', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4751, NULL, NULL, 'Caiuá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4752, NULL, NULL, 'Cajamar', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4753, NULL, NULL, 'Cajati', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4754, NULL, NULL, 'Cajobi', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4755, NULL, NULL, 'Cajuru', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4756, NULL, NULL, 'Campina do Monte Alegre', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4757, NULL, NULL, 'Campinas', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4758, NULL, NULL, 'Campo Limpo Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4759, NULL, NULL, 'Campos do Jordão', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4760, NULL, NULL, 'Campos Novos Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4761, NULL, NULL, 'Cananéia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4762, NULL, NULL, 'Canas', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4763, NULL, NULL, 'Cândido Mota', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4764, NULL, NULL, 'Cândido Rodrigues', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4765, NULL, NULL, 'Canitar', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4766, NULL, NULL, 'Capão Bonito', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4767, NULL, NULL, 'Capela do Alto', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4768, NULL, NULL, 'Capivari', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4769, NULL, NULL, 'Caraguatatuba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4770, NULL, NULL, 'Carapicuíba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4771, NULL, NULL, 'Cardoso', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4772, NULL, NULL, 'Casa Branca', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4773, NULL, NULL, 'Cássia dos Coqueiros', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4774, NULL, NULL, 'Castilho', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4775, NULL, NULL, 'Catanduva', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4776, NULL, NULL, 'Catiguá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4777, NULL, NULL, 'Cedral', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4778, NULL, NULL, 'Cerqueira César', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4779, NULL, NULL, 'Cerquilho', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4780, NULL, NULL, 'Cesário Lange', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4781, NULL, NULL, 'Charqueada', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4782, NULL, NULL, 'Chavantes', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4783, NULL, NULL, 'Clementina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4784, NULL, NULL, 'Colina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4785, NULL, NULL, 'Colômbia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4786, NULL, NULL, 'Conchal', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4787, NULL, NULL, 'Conchas', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4788, NULL, NULL, 'Cordeirópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4789, NULL, NULL, 'Coroados', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4790, NULL, NULL, 'Coronel Macedo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4791, NULL, NULL, 'Corumbataí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4792, NULL, NULL, 'Cosmópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4793, NULL, NULL, 'Cosmorama', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4794, NULL, NULL, 'Cotia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4795, NULL, NULL, 'Cravinhos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4796, NULL, NULL, 'Cristais Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4797, NULL, NULL, 'Cruzália', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4798, NULL, NULL, 'Cruzeiro', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4799, NULL, NULL, 'Cubatão', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4800, NULL, NULL, 'Cunha', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4801, NULL, NULL, 'Descalvado', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4802, NULL, NULL, 'Diadema', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4803, NULL, NULL, 'Dirce Reis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4804, NULL, NULL, 'Divinolândia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4805, NULL, NULL, 'Dobrada', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4806, NULL, NULL, 'Dois Córregos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4807, NULL, NULL, 'Dolcinópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4808, NULL, NULL, 'Dourado', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4809, NULL, NULL, 'Dracena', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4810, NULL, NULL, 'Duartina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4811, NULL, NULL, 'Dumont', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4812, NULL, NULL, 'Echaporã', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4813, NULL, NULL, 'Eldorado', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4814, NULL, NULL, 'Elias Fausto', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4815, NULL, NULL, 'Elisiário', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4816, NULL, NULL, 'Embaúba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4817, NULL, NULL, 'Embu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4818, NULL, NULL, 'Embu-Guaçu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4819, NULL, NULL, 'Emilianópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4820, NULL, NULL, 'Engenheiro Coelho', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4821, NULL, NULL, 'Espírito Santo do Pinhal', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4822, NULL, NULL, 'Espírito Santo do Turvo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4823, NULL, NULL, 'Estiva Gerbi', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4824, NULL, NULL, 'Estrela d`Oeste', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4825, NULL, NULL, 'Estrela do Norte', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4826, NULL, NULL, 'Euclides da Cunha Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4827, NULL, NULL, 'Fartura', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4828, NULL, NULL, 'Fernando Prestes', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4829, NULL, NULL, 'Fernandópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4830, NULL, NULL, 'Fernão', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4831, NULL, NULL, 'Ferraz de Vasconcelos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4832, NULL, NULL, 'Flora Rica', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4833, NULL, NULL, 'Floreal', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4834, NULL, NULL, 'Florínia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4835, NULL, NULL, 'Flórida Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4836, NULL, NULL, 'Franca', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4837, NULL, NULL, 'Francisco Morato', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4838, NULL, NULL, 'Franco da Rocha', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4839, NULL, NULL, 'Gabriel Monteiro', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4840, NULL, NULL, 'Gália', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4841, NULL, NULL, 'Garça', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4842, NULL, NULL, 'Gastão Vidigal', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4843, NULL, NULL, 'Gavião Peixoto', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4844, NULL, NULL, 'General Salgado', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4845, NULL, NULL, 'Getulina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4846, NULL, NULL, 'Glicério', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4847, NULL, NULL, 'Guaiçara', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4848, NULL, NULL, 'Guaimbê', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4849, NULL, NULL, 'Guaíra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4850, NULL, NULL, 'Guapiaçu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4851, NULL, NULL, 'Guapiara', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4852, NULL, NULL, 'Guará', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4853, NULL, NULL, 'Guaraçaí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4854, NULL, NULL, 'Guaraci', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4855, NULL, NULL, 'Guarani d`Oeste', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4856, NULL, NULL, 'Guarantã', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4857, NULL, NULL, 'Guararapes', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4858, NULL, NULL, 'Guararema', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4859, NULL, NULL, 'Guaratinguetá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4860, NULL, NULL, 'Guareí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4861, NULL, NULL, 'Guariba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4862, NULL, NULL, 'Guarujá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4863, NULL, NULL, 'Guarulhos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4864, NULL, NULL, 'Guatapará', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4865, NULL, NULL, 'Guzolândia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4866, NULL, NULL, 'Herculândia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4867, NULL, NULL, 'Holambra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4868, NULL, NULL, 'Hortolândia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4869, NULL, NULL, 'Iacanga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4870, NULL, NULL, 'Iacri', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4871, NULL, NULL, 'Iaras', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4872, NULL, NULL, 'Ibaté', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4873, NULL, NULL, 'Ibirá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4874, NULL, NULL, 'Ibirarema', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4875, NULL, NULL, 'Ibitinga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4876, NULL, NULL, 'Ibiúna', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4877, NULL, NULL, 'Icém', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4878, NULL, NULL, 'Iepê', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4879, NULL, NULL, 'Igaraçu do Tietê', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4880, NULL, NULL, 'Igarapava', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4881, NULL, NULL, 'Igaratá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4882, NULL, NULL, 'Iguape', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4883, NULL, NULL, 'Ilha Comprida', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4884, NULL, NULL, 'Ilha Solteira', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4885, NULL, NULL, 'Ilhabela', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4886, NULL, NULL, 'Indaiatuba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4887, NULL, NULL, 'Indiana', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4888, NULL, NULL, 'Indiaporã', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4889, NULL, NULL, 'Inúbia Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4890, NULL, NULL, 'Ipauçu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4891, NULL, NULL, 'Iperó', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4892, NULL, NULL, 'Ipeúna', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4893, NULL, NULL, 'Ipiguá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4894, NULL, NULL, 'Iporanga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4895, NULL, NULL, 'Ipuã', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4896, NULL, NULL, 'Iracemápolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4897, NULL, NULL, 'Irapuã', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4898, NULL, NULL, 'Irapuru', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4899, NULL, NULL, 'Itaberá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4900, NULL, NULL, 'Itaí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4901, NULL, NULL, 'Itajobi', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4902, NULL, NULL, 'Itaju', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4903, NULL, NULL, 'Itanhaém', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4904, NULL, NULL, 'Itaóca', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4905, NULL, NULL, 'Itapecerica da Serra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4906, NULL, NULL, 'Itapetininga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4907, NULL, NULL, 'Itapeva', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4908, NULL, NULL, 'Itapevi', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4909, NULL, NULL, 'Itapira', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4910, NULL, NULL, 'Itapirapuã Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4911, NULL, NULL, 'Itápolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4912, NULL, NULL, 'Itaporanga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4913, NULL, NULL, 'Itapuí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4914, NULL, NULL, 'Itapura', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4915, NULL, NULL, 'Itaquaquecetuba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4916, NULL, NULL, 'Itararé', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4917, NULL, NULL, 'Itariri', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4918, NULL, NULL, 'Itatiba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4919, NULL, NULL, 'Itatinga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4920, NULL, NULL, 'Itirapina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4921, NULL, NULL, 'Itirapuã', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4922, NULL, NULL, 'Itobi', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4923, NULL, NULL, 'Itu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4924, NULL, NULL, 'Itupeva', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4925, NULL, NULL, 'Ituverava', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4926, NULL, NULL, 'Jaborandi', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4927, NULL, NULL, 'Jaboticabal', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4928, NULL, NULL, 'Jacareí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4929, NULL, NULL, 'Jaci', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4930, NULL, NULL, 'Jacupiranga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4931, NULL, NULL, 'Jaguariúna', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4932, NULL, NULL, 'Jales', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4933, NULL, NULL, 'Jambeiro', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4934, NULL, NULL, 'Jandira', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4935, NULL, NULL, 'Jardinópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4936, NULL, NULL, 'Jarinu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4937, NULL, NULL, 'Jaú', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4938, NULL, NULL, 'Jeriquara', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4939, NULL, NULL, 'Joanópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4940, NULL, NULL, 'João Ramalho', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4941, NULL, NULL, 'José Bonifácio', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4942, NULL, NULL, 'Júlio Mesquita', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4943, NULL, NULL, 'Jumirim', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4944, NULL, NULL, 'Jundiaí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4945, NULL, NULL, 'Junqueirópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4946, NULL, NULL, 'Juquiá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4947, NULL, NULL, 'Juquitiba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4948, NULL, NULL, 'Lagoinha', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4949, NULL, NULL, 'Laranjal Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4950, NULL, NULL, 'Lavínia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4951, NULL, NULL, 'Lavrinhas', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4952, NULL, NULL, 'Leme', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4953, NULL, NULL, 'Lençóis Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4954, NULL, NULL, 'Limeira', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4955, NULL, NULL, 'Lindóia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4956, NULL, NULL, 'Lins', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4957, NULL, NULL, 'Lorena', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4958, NULL, NULL, 'Lourdes', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4959, NULL, NULL, 'Louveira', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4960, NULL, NULL, 'Lucélia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4961, NULL, NULL, 'Lucianópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4962, NULL, NULL, 'Luís Antônio', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4963, NULL, NULL, 'Luiziânia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4964, NULL, NULL, 'Lupércio', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4965, NULL, NULL, 'Lutécia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4966, NULL, NULL, 'Macatuba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4967, NULL, NULL, 'Macaubal', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4968, NULL, NULL, 'Macedônia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4969, NULL, NULL, 'Magda', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4970, NULL, NULL, 'Mairinque', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4971, NULL, NULL, 'Mairiporã', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4972, NULL, NULL, 'Manduri', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4973, NULL, NULL, 'Marabá Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4974, NULL, NULL, 'Maracaí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4975, NULL, NULL, 'Marapoama', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4976, NULL, NULL, 'Mariápolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4977, NULL, NULL, 'Marília', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4978, NULL, NULL, 'Marinópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4979, NULL, NULL, 'Martinópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4980, NULL, NULL, 'Matão', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4981, NULL, NULL, 'Mauá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4982, NULL, NULL, 'Mendonça', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4983, NULL, NULL, 'Meridiano', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4984, NULL, NULL, 'Mesópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4985, NULL, NULL, 'Miguelópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4986, NULL, NULL, 'Mineiros do Tietê', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4987, NULL, NULL, 'Mira Estrela', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4988, NULL, NULL, 'Miracatu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4989, NULL, NULL, 'Mirandópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4990, NULL, NULL, 'Mirante do Paranapanema', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4991, NULL, NULL, 'Mirassol', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4992, NULL, NULL, 'Mirassolândia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4993, NULL, NULL, 'Mococa', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4994, NULL, NULL, 'Mogi das Cruzes', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4995, NULL, NULL, 'Mogi Guaçu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4996, NULL, NULL, 'Mogi-Mirim', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4997, NULL, NULL, 'Mombuca', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4998, NULL, NULL, 'Monções', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (4999, NULL, NULL, 'Mongaguá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5000, NULL, NULL, 'Monte Alegre do Sul', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5001, NULL, NULL, 'Monte Alto', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5002, NULL, NULL, 'Monte Aprazível', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5003, NULL, NULL, 'Monte Azul Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5004, NULL, NULL, 'Monte Castelo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5005, NULL, NULL, 'Monte Mor', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5006, NULL, NULL, 'Monteiro Lobato', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5007, NULL, NULL, 'Morro Agudo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5008, NULL, NULL, 'Morungaba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5009, NULL, NULL, 'Motuca', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5010, NULL, NULL, 'Murutinga do Sul', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5011, NULL, NULL, 'Nantes', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5012, NULL, NULL, 'Narandiba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5013, NULL, NULL, 'Natividade da Serra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5014, NULL, NULL, 'Nazaré Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5015, NULL, NULL, 'Neves Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5016, NULL, NULL, 'Nhandeara', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5017, NULL, NULL, 'Nipoã', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5018, NULL, NULL, 'Nova Aliança', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5019, NULL, NULL, 'Nova Campina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5020, NULL, NULL, 'Nova Canaã Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5021, NULL, NULL, 'Nova Castilho', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5022, NULL, NULL, 'Nova Europa', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5023, NULL, NULL, 'Nova Granada', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5024, NULL, NULL, 'Nova Guataporanga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5025, NULL, NULL, 'Nova Independência', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5026, NULL, NULL, 'Nova Luzitânia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5027, NULL, NULL, 'Nova Odessa', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5028, NULL, NULL, 'Novais', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5029, NULL, NULL, 'Novo Horizonte', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5030, NULL, NULL, 'Nuporanga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5031, NULL, NULL, 'Ocauçu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5032, NULL, NULL, 'Óleo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5033, NULL, NULL, 'Olímpia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5034, NULL, NULL, 'Onda Verde', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5035, NULL, NULL, 'Oriente', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5036, NULL, NULL, 'Orindiúva', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5037, NULL, NULL, 'Orlândia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5038, NULL, NULL, 'Osasco', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5039, NULL, NULL, 'Oscar Bressane', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5040, NULL, NULL, 'Osvaldo Cruz', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5041, NULL, NULL, 'Ourinhos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5042, NULL, NULL, 'Ouro Verde', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5043, NULL, NULL, 'Ouroeste', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5044, NULL, NULL, 'Pacaembu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5045, NULL, NULL, 'Palestina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5046, NULL, NULL, 'Palmares Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5047, NULL, NULL, 'Palmeira d`Oeste', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5048, NULL, NULL, 'Palmital', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5049, NULL, NULL, 'Panorama', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5050, NULL, NULL, 'Paraguaçu Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5051, NULL, NULL, 'Paraibuna', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5052, NULL, NULL, 'Paraíso', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5053, NULL, NULL, 'Paranapanema', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5054, NULL, NULL, 'Paranapuã', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5055, NULL, NULL, 'Parapuã', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5056, NULL, NULL, 'Pardinho', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5057, NULL, NULL, 'Pariquera-Açu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5058, NULL, NULL, 'Parisi', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5059, NULL, NULL, 'Patrocínio Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5060, NULL, NULL, 'Paulicéia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5061, NULL, NULL, 'Paulínia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5062, NULL, NULL, 'Paulistânia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5063, NULL, NULL, 'Paulo de Faria', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5064, NULL, NULL, 'Pederneiras', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5065, NULL, NULL, 'Pedra Bela', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5066, NULL, NULL, 'Pedranópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5067, NULL, NULL, 'Pedregulho', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5068, NULL, NULL, 'Pedreira', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5069, NULL, NULL, 'Pedrinhas Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5070, NULL, NULL, 'Pedro de Toledo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5071, NULL, NULL, 'Penápolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5072, NULL, NULL, 'Pereira Barreto', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5073, NULL, NULL, 'Pereiras', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5074, NULL, NULL, 'Peruíbe', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5075, NULL, NULL, 'Piacatu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5076, NULL, NULL, 'Piedade', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5077, NULL, NULL, 'Pilar do Sul', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5078, NULL, NULL, 'Pindamonhangaba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5079, NULL, NULL, 'Pindorama', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5080, NULL, NULL, 'Pinhalzinho', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5081, NULL, NULL, 'Piquerobi', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5082, NULL, NULL, 'Piquete', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5083, NULL, NULL, 'Piracaia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5084, NULL, NULL, 'Piracicaba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5085, NULL, NULL, 'Piraju', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5086, NULL, NULL, 'Pirajuí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5087, NULL, NULL, 'Pirangi', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5088, NULL, NULL, 'Pirapora do Bom Jesus', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5089, NULL, NULL, 'Pirapozinho', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5090, NULL, NULL, 'Pirassununga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5091, NULL, NULL, 'Piratininga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5092, NULL, NULL, 'Pitangueiras', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5093, NULL, NULL, 'Planalto', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5094, NULL, NULL, 'Platina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5095, NULL, NULL, 'Poá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5096, NULL, NULL, 'Poloni', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5097, NULL, NULL, 'Pompéia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5098, NULL, NULL, 'Pongaí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5099, NULL, NULL, 'Pontal', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5100, NULL, NULL, 'Pontalinda', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5101, NULL, NULL, 'Pontes Gestal', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5102, NULL, NULL, 'Populina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5103, NULL, NULL, 'Porangaba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5104, NULL, NULL, 'Porto Feliz', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5105, NULL, NULL, 'Porto Ferreira', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5106, NULL, NULL, 'Potim', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5107, NULL, NULL, 'Potirendaba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5108, NULL, NULL, 'Pracinha', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5109, NULL, NULL, 'Pradópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5110, NULL, NULL, 'Praia Grande', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5111, NULL, NULL, 'Pratânia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5112, NULL, NULL, 'Presidente Alves', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5113, NULL, NULL, 'Presidente Bernardes', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5114, NULL, NULL, 'Presidente Epitácio', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5115, NULL, NULL, 'Presidente Prudente', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5116, NULL, NULL, 'Presidente Venceslau', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5117, NULL, NULL, 'Promissão', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5118, NULL, NULL, 'Quadra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5119, NULL, NULL, 'Quatá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5120, NULL, NULL, 'Queiroz', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5121, NULL, NULL, 'Queluz', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5122, NULL, NULL, 'Quintana', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5123, NULL, NULL, 'Rafard', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5124, NULL, NULL, 'Rancharia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5125, NULL, NULL, 'Redenção da Serra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5126, NULL, NULL, 'Regente Feijó', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5127, NULL, NULL, 'Reginópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5128, NULL, NULL, 'Registro', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5129, NULL, NULL, 'Restinga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5130, NULL, NULL, 'Ribeira', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5131, NULL, NULL, 'Ribeirão Bonito', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5132, NULL, NULL, 'Ribeirão Branco', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5133, NULL, NULL, 'Ribeirão Corrente', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5134, NULL, NULL, 'Ribeirão do Sul', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5135, NULL, NULL, 'Ribeirão dos Índios', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5136, NULL, NULL, 'Ribeirão Grande', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5137, NULL, NULL, 'Ribeirão Pires', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5138, NULL, NULL, 'Ribeirão Preto', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5139, NULL, NULL, 'Rifaina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5140, NULL, NULL, 'Rincão', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5141, NULL, NULL, 'Rinópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5142, NULL, NULL, 'Rio Claro', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5143, NULL, NULL, 'Rio das Pedras', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5144, NULL, NULL, 'Rio Grande da Serra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5145, NULL, NULL, 'Riolândia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5146, NULL, NULL, 'Riversul', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5147, NULL, NULL, 'Rosana', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5148, NULL, NULL, 'Roseira', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5149, NULL, NULL, 'Rubiácea', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5150, NULL, NULL, 'Rubinéia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5151, NULL, NULL, 'Sabino', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5152, NULL, NULL, 'Sagres', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5153, NULL, NULL, 'Sales', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5154, NULL, NULL, 'Sales Oliveira', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5155, NULL, NULL, 'Salesópolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5156, NULL, NULL, 'Salmourão', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5157, NULL, NULL, 'Saltinho', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5158, NULL, NULL, 'Salto', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5159, NULL, NULL, 'Salto de Pirapora', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5160, NULL, NULL, 'Salto Grande', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5161, NULL, NULL, 'Sandovalina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5162, NULL, NULL, 'Santa Adélia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5163, NULL, NULL, 'Santa Albertina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5164, NULL, NULL, 'Santa Bárbara d`Oeste', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5165, NULL, NULL, 'Santa Branca', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5166, NULL, NULL, 'Santa Clara d`Oeste', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5167, NULL, NULL, 'Santa Cruz da Conceição', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5168, NULL, NULL, 'Santa Cruz da Esperança', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5169, NULL, NULL, 'Santa Cruz das Palmeiras', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5170, NULL, NULL, 'Santa Cruz do Rio Pardo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5171, NULL, NULL, 'Santa Ernestina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5172, NULL, NULL, 'Santa Fé do Sul', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5173, NULL, NULL, 'Santa Gertrudes', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5174, NULL, NULL, 'Santa Isabel', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5175, NULL, NULL, 'Santa Lúcia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5176, NULL, NULL, 'Santa Maria da Serra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5177, NULL, NULL, 'Santa Mercedes', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5178, NULL, NULL, 'Santa Rita d`Oeste', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5179, NULL, NULL, 'Santa Rita do Passa Quatro', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5180, NULL, NULL, 'Santa Rosa de Viterbo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5181, NULL, NULL, 'Santa Salete', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5182, NULL, NULL, 'Santana da Ponte Pensa', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5183, NULL, NULL, 'Santana de Parnaíba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5184, NULL, NULL, 'Santo Anastácio', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5185, NULL, NULL, 'Santo André', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5186, NULL, NULL, 'Santo Antônio da Alegria', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5187, NULL, NULL, 'Santo Antônio de Posse', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5188, NULL, NULL, 'Santo Antônio do Aracanguá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5189, NULL, NULL, 'Santo Antônio do Jardim', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5190, NULL, NULL, 'Santo Antônio do Pinhal', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5191, NULL, NULL, 'Santo Expedito', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5192, NULL, NULL, 'Santópolis do Aguapeí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5193, NULL, NULL, 'Santos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5194, NULL, NULL, 'São Bento do Sapucaí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5195, NULL, NULL, 'São Bernardo do Campo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5196, NULL, NULL, 'São Caetano do Sul', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5197, NULL, NULL, 'São Carlos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5198, NULL, NULL, 'São Francisco', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5199, NULL, NULL, 'São João da Boa Vista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5200, NULL, NULL, 'São João das Duas Pontes', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5201, NULL, NULL, 'São João de Iracema', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5202, NULL, NULL, 'São João do Pau d`Alho', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5203, NULL, NULL, 'São Joaquim da Barra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5204, NULL, NULL, 'São José da Bela Vista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5205, NULL, NULL, 'São José do Barreiro', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5206, NULL, NULL, 'São José do Rio Pardo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5207, NULL, NULL, 'São José do Rio Preto', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5208, NULL, NULL, 'São José dos Campos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5209, NULL, NULL, 'São Lourenço da Serra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5210, NULL, NULL, 'São Luís do Paraitinga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5211, NULL, NULL, 'São Manuel', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5212, NULL, NULL, 'São Miguel Arcanjo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5213, NULL, NULL, 'São Paulo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5214, NULL, NULL, 'São Pedro', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5215, NULL, NULL, 'São Pedro do Turvo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5216, NULL, NULL, 'São Roque', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5217, NULL, NULL, 'São Sebastião', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5218, NULL, NULL, 'São Sebastião da Grama', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5219, NULL, NULL, 'São Simão', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5220, NULL, NULL, 'São Vicente', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5221, NULL, NULL, 'Sarapuí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5222, NULL, NULL, 'Sarutaiá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5223, NULL, NULL, 'Sebastianópolis do Sul', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5224, NULL, NULL, 'Serra Azul', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5225, NULL, NULL, 'Serra Negra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5226, NULL, NULL, 'Serrana', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5227, NULL, NULL, 'Sertãozinho', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5228, NULL, NULL, 'Sete Barras', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5229, NULL, NULL, 'Severínia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5230, NULL, NULL, 'Silveiras', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5231, NULL, NULL, 'Socorro', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5232, NULL, NULL, 'Sorocaba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5233, NULL, NULL, 'Sud Mennucci', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5234, NULL, NULL, 'Sumaré', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5235, NULL, NULL, 'Suzanápolis', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5236, NULL, NULL, 'Suzano', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5237, NULL, NULL, 'Tabapuã', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5238, NULL, NULL, 'Tabatinga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5239, NULL, NULL, 'Taboão da Serra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5240, NULL, NULL, 'Taciba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5241, NULL, NULL, 'Taguaí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5242, NULL, NULL, 'Taiaçu', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5243, NULL, NULL, 'Taiúva', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5244, NULL, NULL, 'Tambaú', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5245, NULL, NULL, 'Tanabi', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5246, NULL, NULL, 'Tapiraí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5247, NULL, NULL, 'Tapiratiba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5248, NULL, NULL, 'Taquaral', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5249, NULL, NULL, 'Taquaritinga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5250, NULL, NULL, 'Taquarituba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5251, NULL, NULL, 'Taquarivaí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5252, NULL, NULL, 'Tarabai', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5253, NULL, NULL, 'Tarumã', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5254, NULL, NULL, 'Tatuí', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5255, NULL, NULL, 'Taubaté', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5256, NULL, NULL, 'Tejupá', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5257, NULL, NULL, 'Teodoro Sampaio', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5258, NULL, NULL, 'Terra Roxa', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5259, NULL, NULL, 'Tietê', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5260, NULL, NULL, 'Timburi', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5261, NULL, NULL, 'Torre de Pedra', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5262, NULL, NULL, 'Torrinha', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5263, NULL, NULL, 'Trabiju', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5264, NULL, NULL, 'Tremembé', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5265, NULL, NULL, 'Três Fronteiras', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5266, NULL, NULL, 'Tuiuti', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5267, NULL, NULL, 'Tupã', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5268, NULL, NULL, 'Tupi Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5269, NULL, NULL, 'Turiúba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5270, NULL, NULL, 'Turmalina', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5271, NULL, NULL, 'Ubarana', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5272, NULL, NULL, 'Ubatuba', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5273, NULL, NULL, 'Ubirajara', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5274, NULL, NULL, 'Uchoa', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5275, NULL, NULL, 'União Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5276, NULL, NULL, 'Urânia', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5277, NULL, NULL, 'Uru', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5278, NULL, NULL, 'Urupês', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5279, NULL, NULL, 'Valentim Gentil', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5280, NULL, NULL, 'Valinhos', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5281, NULL, NULL, 'Valparaíso', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5282, NULL, NULL, 'Vargem', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5283, NULL, NULL, 'Vargem Grande do Sul', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5284, NULL, NULL, 'Vargem Grande Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5285, NULL, NULL, 'Várzea Paulista', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5286, NULL, NULL, 'Vera Cruz', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5287, NULL, NULL, 'Vinhedo', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5288, NULL, NULL, 'Viradouro', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5289, NULL, NULL, 'Vista Alegre do Alto', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5290, NULL, NULL, 'Vitória Brasil', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5291, NULL, NULL, 'Votorantim', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5292, NULL, NULL, 'Votuporanga', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5293, NULL, NULL, 'Zacarias', 25);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5294, NULL, NULL, 'Amparo de São Francisco', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5295, NULL, NULL, 'Aquidabã', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5296, NULL, NULL, 'Aracaju', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5297, NULL, NULL, 'Arauá', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5298, NULL, NULL, 'Areia Branca', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5299, NULL, NULL, 'Barra dos Coqueiros', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5300, NULL, NULL, 'Boquim', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5301, NULL, NULL, 'Brejo Grande', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5302, NULL, NULL, 'Campo do Brito', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5303, NULL, NULL, 'Canhoba', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5304, NULL, NULL, 'Canindé de São Francisco', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5305, NULL, NULL, 'Capela', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5306, NULL, NULL, 'Carira', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5307, NULL, NULL, 'Carmópolis', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5308, NULL, NULL, 'Cedro de São João', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5309, NULL, NULL, 'Cristinápolis', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5310, NULL, NULL, 'Cumbe', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5311, NULL, NULL, 'Divina Pastora', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5312, NULL, NULL, 'Estância', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5313, NULL, NULL, 'Feira Nova', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5314, NULL, NULL, 'Frei Paulo', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5315, NULL, NULL, 'Gararu', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5316, NULL, NULL, 'General Maynard', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5317, NULL, NULL, 'Gracho Cardoso', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5318, NULL, NULL, 'Ilha das Flores', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5319, NULL, NULL, 'Indiaroba', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5320, NULL, NULL, 'Itabaiana', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5321, NULL, NULL, 'Itabaianinha', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5322, NULL, NULL, 'Itabi', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5323, NULL, NULL, 'Itaporanga d`Ajuda', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5324, NULL, NULL, 'Japaratuba', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5325, NULL, NULL, 'Japoatã', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5326, NULL, NULL, 'Lagarto', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5327, NULL, NULL, 'Laranjeiras', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5328, NULL, NULL, 'Macambira', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5329, NULL, NULL, 'Malhada dos Bois', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5330, NULL, NULL, 'Malhador', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5331, NULL, NULL, 'Maruim', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5332, NULL, NULL, 'Moita Bonita', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5333, NULL, NULL, 'Monte Alegre de Sergipe', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5334, NULL, NULL, 'Muribeca', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5335, NULL, NULL, 'Neópolis', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5336, NULL, NULL, 'Nossa Senhora Aparecida', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5337, NULL, NULL, 'Nossa Senhora da Glória', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5338, NULL, NULL, 'Nossa Senhora das Dores', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5339, NULL, NULL, 'Nossa Senhora de Lourdes', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5340, NULL, NULL, 'Nossa Senhora do Socorro', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5341, NULL, NULL, 'Pacatuba', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5342, NULL, NULL, 'Pedra Mole', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5343, NULL, NULL, 'Pedrinhas', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5344, NULL, NULL, 'Pinhão', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5345, NULL, NULL, 'Pirambu', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5346, NULL, NULL, 'Poço Redondo', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5347, NULL, NULL, 'Poço Verde', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5348, NULL, NULL, 'Porto da Folha', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5349, NULL, NULL, 'Propriá', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5350, NULL, NULL, 'Riachão do Dantas', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5351, NULL, NULL, 'Riachuelo', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5352, NULL, NULL, 'Ribeirópolis', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5353, NULL, NULL, 'Rosário do Catete', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5354, NULL, NULL, 'Salgado', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5355, NULL, NULL, 'Santa Luzia do Itanhy', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5356, NULL, NULL, 'Santa Rosa de Lima', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5357, NULL, NULL, 'Santana do São Francisco', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5358, NULL, NULL, 'Santo Amaro das Brotas', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5359, NULL, NULL, 'São Cristóvão', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5360, NULL, NULL, 'São Domingos', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5361, NULL, NULL, 'São Francisco', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5362, NULL, NULL, 'São Miguel do Aleixo', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5363, NULL, NULL, 'Simão Dias', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5364, NULL, NULL, 'Siriri', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5365, NULL, NULL, 'Telha', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5366, NULL, NULL, 'Tobias Barreto', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5367, NULL, NULL, 'Tomar do Geru', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5368, NULL, NULL, 'Umbaúba', 26);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5369, NULL, NULL, 'Abreulândia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5370, NULL, NULL, 'Aguiarnópolis', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5371, NULL, NULL, 'Aliança do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5372, NULL, NULL, 'Almas', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5373, NULL, NULL, 'Alvorada', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5374, NULL, NULL, 'Ananás', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5375, NULL, NULL, 'Angico', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5376, NULL, NULL, 'Aparecida do Rio Negro', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5377, NULL, NULL, 'Aragominas', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5378, NULL, NULL, 'Araguacema', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5379, NULL, NULL, 'Araguaçu', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5380, NULL, NULL, 'Araguaína', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5381, NULL, NULL, 'Araguanã', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5382, NULL, NULL, 'Araguatins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5383, NULL, NULL, 'Arapoema', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5384, NULL, NULL, 'Arraias', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5385, NULL, NULL, 'Augustinópolis', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5386, NULL, NULL, 'Aurora do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5387, NULL, NULL, 'Axixá do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5388, NULL, NULL, 'Babaçulândia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5389, NULL, NULL, 'Bandeirantes do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5390, NULL, NULL, 'Barra do Ouro', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5391, NULL, NULL, 'Barrolândia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5392, NULL, NULL, 'Bernardo Sayão', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5393, NULL, NULL, 'Bom Jesus do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5394, NULL, NULL, 'Brasilândia do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5395, NULL, NULL, 'Brejinho de Nazaré', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5396, NULL, NULL, 'Buriti do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5397, NULL, NULL, 'Cachoeirinha', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5398, NULL, NULL, 'Campos Lindos', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5399, NULL, NULL, 'Cariri do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5400, NULL, NULL, 'Carmolândia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5401, NULL, NULL, 'Carrasco Bonito', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5402, NULL, NULL, 'Caseara', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5403, NULL, NULL, 'Centenário', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5404, NULL, NULL, 'Chapada da Natividade', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5405, NULL, NULL, 'Chapada de Areia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5406, NULL, NULL, 'Colinas do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5407, NULL, NULL, 'Colméia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5408, NULL, NULL, 'Combinado', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5409, NULL, NULL, 'Conceição do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5410, NULL, NULL, 'Couto de Magalhães', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5411, NULL, NULL, 'Cristalândia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5412, NULL, NULL, 'Crixás do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5413, NULL, NULL, 'Darcinópolis', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5414, NULL, NULL, 'Dianópolis', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5415, NULL, NULL, 'Divinópolis do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5416, NULL, NULL, 'Dois Irmãos do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5417, NULL, NULL, 'Dueré', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5418, NULL, NULL, 'Esperantina', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5419, NULL, NULL, 'Fátima', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5420, NULL, NULL, 'Figueirópolis', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5421, NULL, NULL, 'Filadélfia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5422, NULL, NULL, 'Formoso do Araguaia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5423, NULL, NULL, 'Fortaleza do Tabocão', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5424, NULL, NULL, 'Goianorte', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5425, NULL, NULL, 'Goiatins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5426, NULL, NULL, 'Guaraí', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5427, NULL, NULL, 'Gurupi', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5428, NULL, NULL, 'Ipueiras', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5429, NULL, NULL, 'Itacajá', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5430, NULL, NULL, 'Itaguatins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5431, NULL, NULL, 'Itapiratins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5432, NULL, NULL, 'Itaporã do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5433, NULL, NULL, 'Jaú do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5434, NULL, NULL, 'Juarina', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5435, NULL, NULL, 'Lagoa da Confusão', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5436, NULL, NULL, 'Lagoa do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5437, NULL, NULL, 'Lajeado', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5438, NULL, NULL, 'Lavandeira', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5439, NULL, NULL, 'Lizarda', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5440, NULL, NULL, 'Luzinópolis', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5441, NULL, NULL, 'Marianópolis do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5442, NULL, NULL, 'Mateiros', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5443, NULL, NULL, 'Maurilândia do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5444, NULL, NULL, 'Miracema do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5445, NULL, NULL, 'Miranorte', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5446, NULL, NULL, 'Monte do Carmo', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5447, NULL, NULL, 'Monte Santo do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5448, NULL, NULL, 'Muricilândia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5449, NULL, NULL, 'Natividade', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5450, NULL, NULL, 'Nazaré', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5451, NULL, NULL, 'Nova Olinda', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5452, NULL, NULL, 'Nova Rosalândia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5453, NULL, NULL, 'Novo Acordo', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5454, NULL, NULL, 'Novo Alegre', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5455, NULL, NULL, 'Novo Jardim', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5456, NULL, NULL, 'Oliveira de Fátima', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5457, NULL, NULL, 'Palmas', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5458, NULL, NULL, 'Palmeirante', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5459, NULL, NULL, 'Palmeiras do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5460, NULL, NULL, 'Palmeirópolis', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5461, NULL, NULL, 'Paraíso do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5462, NULL, NULL, 'Paranã', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5463, NULL, NULL, 'Pau d`Arco', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5464, NULL, NULL, 'Pedro Afonso', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5465, NULL, NULL, 'Peixe', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5466, NULL, NULL, 'Pequizeiro', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5467, NULL, NULL, 'Pindorama do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5468, NULL, NULL, 'Piraquê', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5469, NULL, NULL, 'Pium', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5470, NULL, NULL, 'Ponte Alta do Bom Jesus', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5471, NULL, NULL, 'Ponte Alta do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5472, NULL, NULL, 'Porto Alegre do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5473, NULL, NULL, 'Porto Nacional', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5474, NULL, NULL, 'Praia Norte', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5475, NULL, NULL, 'Presidente Kennedy', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5476, NULL, NULL, 'Pugmil', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5477, NULL, NULL, 'Recursolândia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5478, NULL, NULL, 'Riachinho', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5479, NULL, NULL, 'Rio da Conceição', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5480, NULL, NULL, 'Rio dos Bois', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5481, NULL, NULL, 'Rio Sono', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5482, NULL, NULL, 'Sampaio', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5483, NULL, NULL, 'Sandolândia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5484, NULL, NULL, 'Santa Fé do Araguaia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5485, NULL, NULL, 'Santa Maria do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5486, NULL, NULL, 'Santa Rita do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5487, NULL, NULL, 'Santa Rosa do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5488, NULL, NULL, 'Santa Tereza do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5489, NULL, NULL, 'Santa Terezinha do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5490, NULL, NULL, 'São Bento do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5491, NULL, NULL, 'São Félix do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5492, NULL, NULL, 'São Miguel do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5493, NULL, NULL, 'São Salvador do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5494, NULL, NULL, 'São Sebastião do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5495, NULL, NULL, 'São Valério da Natividade', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5496, NULL, NULL, 'Silvanópolis', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5497, NULL, NULL, 'Sítio Novo do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5498, NULL, NULL, 'Sucupira', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5499, NULL, NULL, 'Taguatinga', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5500, NULL, NULL, 'Taipas do Tocantins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5501, NULL, NULL, 'Talismã', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5502, NULL, NULL, 'Tocantínia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5503, NULL, NULL, 'Tocantinópolis', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5504, NULL, NULL, 'Tupirama', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5505, NULL, NULL, 'Tupiratins', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5506, NULL, NULL, 'Wanderlândia', 27);
INSERT INTO cidade (id, created, updated, nome, id_estado) VALUES (5507, NULL, NULL, 'Xambioá', 27);


--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 193
-- Name: cidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cidade_id_seq', 1, false);


--
-- TOC entry 2203 (class 0 OID 26075)
-- Dependencies: 196
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (1, NULL, NULL, 'Acre', 'AC', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (2, NULL, NULL, 'Alagoas', 'AL', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (3, NULL, NULL, 'Amapá', 'AP', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (4, NULL, NULL, 'Amazonas', 'AM', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (5, NULL, NULL, 'Bahia', 'BA', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (6, NULL, NULL, 'Ceará', 'CE', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (7, NULL, NULL, 'Distrito Federal', 'DF', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (8, NULL, NULL, 'Espírito Santo', 'ES', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (9, NULL, NULL, 'Goiás', 'GO', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (10, NULL, NULL, 'Maranhão', 'MA', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (11, NULL, NULL, 'Mato Grosso', 'MT', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (12, NULL, NULL, 'Mato Grosso do Sul', 'MS', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (13, NULL, NULL, 'Minas Gerais', 'MG', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (14, NULL, NULL, 'Pará', 'PA', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (15, NULL, NULL, 'Paraíba', 'PB', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (16, NULL, NULL, 'Paraná', 'PR', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (17, NULL, NULL, 'Pernambuco', 'PE', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (18, NULL, NULL, 'Piauí', 'PI', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (19, NULL, NULL, 'Rio de Janeiro', 'RJ', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (20, NULL, NULL, 'Rio Grande do Norte', 'RN', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (21, NULL, NULL, 'Rio Grande do Sul', 'RS', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (22, NULL, NULL, 'Rondônia', 'RO', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (23, NULL, NULL, 'Roraima', 'RR', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (24, NULL, NULL, 'Santa Catarina', 'SC', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (25, NULL, NULL, 'São Paulo', 'SP', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (26, NULL, NULL, 'Sergipe', 'SE', 1);
INSERT INTO estado (id, created, updated, nome, sigla, id_pais) VALUES (27, NULL, NULL, 'Tocantins', 'TO', 1);


--
-- TOC entry 2224 (class 0 OID 0)
-- Dependencies: 195
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_id_seq', 1, false);


--
-- TOC entry 2192 (class 0 OID 25429)
-- Dependencies: 185
-- Data for Name: farmacia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO farmacia (id, created, updated, ativo, bairro, cep, cnpj, complemento, email, info_complementar, inscricao_estadual, logradouro, nome_fantasia, numero, razao_social, telefone, cidade_id) VALUES (11, '2017-06-19 15:05:00.582', '2017-06-19 15:05:23.997', false, 'Três', '80620000', '22465866000100', NULL, 'outra@farmacia.com', NULL, '06513205426', 'Rua Dois', 'Farmacia Outra 2', '2', 'Farmacia Outra Teste LTDA', '45 3523-2200', 30);
INSERT INTO farmacia (id, created, updated, ativo, bairro, cep, cnpj, complemento, email, info_complementar, inscricao_estadual, logradouro, nome_fantasia, numero, razao_social, telefone, cidade_id) VALUES (12, '2017-06-19 19:36:11.134', '2017-06-19 19:36:43.688', false, 'Teste', '85856560', '94837565000171', 'asdasd', 'teste@teste.com', NULL, '56151151', 'rua teste', 'Farmacia Teste', '123', 'Farmacia Outra Teste LTDA', '45 30253030', 2820);
INSERT INTO farmacia (id, created, updated, ativo, bairro, cep, cnpj, complemento, email, info_complementar, inscricao_estadual, logradouro, nome_fantasia, numero, razao_social, telefone, cidade_id) VALUES (10, '2017-06-19 04:13:21.71', '2017-06-19 19:39:39.034', true, 'Centro', '81919818', '34771323000109', '', 'teste@farmacia.com', '', '1651651651', 'Rua XYZ', 'Farmacia Testess', '12345', 'Farmacia Testes LTDA', '45 3030-3030', 2413);


--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 184
-- Name: farmacia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('farmacia_id_seq', 12, true);


--
-- TOC entry 2194 (class 0 OID 25440)
-- Dependencies: 187
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO funcionario (id, created, updated, ativo, celular, cpf, data_nascimento, nome, rg, telefone) VALUES (4, '2017-06-19 00:04:44.666', '2017-06-19 11:19:20.076', true, '45 99983030', '95642655094', '1990-10-17', 'João de Souza', '51651615', '45 30253030');
INSERT INTO funcionario (id, created, updated, ativo, celular, cpf, data_nascimento, nome, rg, telefone) VALUES (6, '2017-06-19 16:03:33.869', '2017-06-19 16:03:39.1', false, '45 99983030', '06701762905', '1980-06-10', 'Testw', 'asdas', '45 30253030');
INSERT INTO funcionario (id, created, updated, ativo, celular, cpf, data_nascimento, nome, rg, telefone) VALUES (5, '2017-06-19 15:06:07.961', '2017-06-19 16:11:29.081', true, '41 9720-7070', '79532270027', '1971-07-01', 'José Alencar', '4981918', '45 3025-7070');


--
-- TOC entry 2226 (class 0 OID 0)
-- Dependencies: 186
-- Name: funcionario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funcionario_id_seq', 6, true);


--
-- TOC entry 2205 (class 0 OID 26090)
-- Dependencies: 198
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pais (id, created, updated, nome, sigla) VALUES (1, NULL, NULL, 'Brasil', 'BR');


--
-- TOC entry 2227 (class 0 OID 0)
-- Dependencies: 197
-- Name: pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pais_id_seq', 1, false);


--
-- TOC entry 2197 (class 0 OID 25980)
-- Dependencies: 190
-- Data for Name: schema_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO schema_version (version_rank, installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (1, 1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'postgres', '2017-06-12 21:08:50.731768', 0, true);


--
-- TOC entry 2196 (class 0 OID 25448)
-- Dependencies: 189
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario (id, created, updated, ativo, email, perfil, senha) VALUES (2, '2017-06-10 18:28:14.289856', '2017-06-11 16:35:20.278', false, 'teste@teste.com', 1, '$2a$10$bAdAVLvM.k3DqPaPYi0gnO1OffPSHLref8MElAk.u.fFQ17v9YKC2');
INSERT INTO usuario (id, created, updated, ativo, email, perfil, senha) VALUES (3, '2017-06-10 19:33:00.537044', '2017-06-12 03:09:42.954', true, 'aaa@ggg.com', 1, '$2a$10$/phA/e9oB6V4GK5cEr3Huewzy7X6JwavopiUMxYMGwkn5xZmP4Rhm');
INSERT INTO usuario (id, created, updated, ativo, email, perfil, senha) VALUES (7, '2017-06-12 10:35:42.263', '2017-06-12 13:34:26.406', false, 'pppp@pppp.com', 4, '$2a$10$U2E2jBDTukI2MkgX/KmVpO24qP0YseDkSr.7x6kIb8W0y//koI8M6');
INSERT INTO usuario (id, created, updated, ativo, email, perfil, senha) VALUES (8, '2017-06-12 19:56:14.328', '2017-06-12 19:59:24.463', false, 'teste@teste2', 3, '$2a$10$03BJORKSf.7lW73GQv9S9.5OKIaafvkPDDoYDx0gGeKASrE/LpuOi');
INSERT INTO usuario (id, created, updated, ativo, email, perfil, senha) VALUES (5, '2017-05-29 20:19:09', '2017-06-12 20:00:27.345', false, 'teste@teste', 0, '$2a$10$oNS29dNZWWJD2J6f.j/EDOwjXy1UGEF6ucTQBLHTZEvoHe19cmEiy');
INSERT INTO usuario (id, created, updated, ativo, email, perfil, senha) VALUES (4, '2017-05-29 20:19:09', '2017-06-18 17:33:12.703', false, 'teste@admin.com', 1, '$2a$10$PSC.tGnugCLJAF/KcclMKuYBiIHU1NM/.CFOaT.I/pz6XNa6Cm7.e');
INSERT INTO usuario (id, created, updated, ativo, email, perfil, senha) VALUES (1, '2017-05-29 20:19:09.26558', '2017-06-18 17:50:37.118', true, 'admin@admin.com', 1, '$2a$10$bAdAVLvM.k3DqPaPYi0gnO1OffPSHLref8MElAk.u.fFQ17v9YKC2');
INSERT INTO usuario (id, created, updated, ativo, email, perfil, senha) VALUES (9, '2017-06-18 22:46:07.889', '2017-06-18 22:46:55.256', false, 'tttt@tttt', 3, '$2a$10$BQkmYRKnQSXkfOekm051Oeq/LrhaKnRrmdi.408POwA1TczQm.nue');
INSERT INTO usuario (id, created, updated, ativo, email, perfil, senha) VALUES (10, '2017-06-19 00:19:41.754', '2017-06-19 00:42:33.599', false, 'aaa@bbb.ccc', 2, '$2a$10$s08CEtbEMdrCpGxjkfnHUO4I30loUdVXLLrvGL9yK8GTNcQZpKdyG');
INSERT INTO usuario (id, created, updated, ativo, email, perfil, senha) VALUES (11, '2017-06-19 15:00:21.792', '2017-06-19 15:00:32.115', false, 'teste@aaa.com', 3, '$2a$10$yscAgLPavAdm1b3ztZlyReK6qhnU1iV4QSbJs1hNoyJTLW93oMSAq');
INSERT INTO usuario (id, created, updated, ativo, email, perfil, senha) VALUES (6, '2017-05-29 20:19:09', '2017-06-19 15:00:39.679', true, 'teste@hotmail.com', 4, '$2a$10$vZ1woqjXCQpMivdh0.20JeOPEOnXPv/LF7ZcXLLXcIEBttjqPwrm6');


--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 188
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 11, true);


--
-- TOC entry 2047 (class 2606 OID 25426)
-- Name: associado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY associado
    ADD CONSTRAINT associado_pkey PRIMARY KEY (id);


--
-- TOC entry 2062 (class 2606 OID 26043)
-- Name: atendimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atendimento
    ADD CONSTRAINT atendimento_pkey PRIMARY KEY (id);


--
-- TOC entry 2064 (class 2606 OID 26072)
-- Name: cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2066 (class 2606 OID 26083)
-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- TOC entry 2049 (class 2606 OID 25437)
-- Name: farmacia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY farmacia
    ADD CONSTRAINT farmacia_pkey PRIMARY KEY (id);


--
-- TOC entry 2051 (class 2606 OID 25445)
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id);


--
-- TOC entry 2068 (class 2606 OID 26098)
-- Name: pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id);


--
-- TOC entry 2058 (class 2606 OID 25988)
-- Name: schema_version_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schema_version
    ADD CONSTRAINT schema_version_pk PRIMARY KEY (version);


--
-- TOC entry 2053 (class 2606 OID 25455)
-- Name: uk_5171l57faosmj8myawaucatdw; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT uk_5171l57faosmj8myawaucatdw UNIQUE (email);


--
-- TOC entry 2055 (class 2606 OID 25453)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2056 (class 1259 OID 25990)
-- Name: schema_version_ir_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schema_version_ir_idx ON schema_version USING btree (installed_rank);


--
-- TOC entry 2059 (class 1259 OID 25991)
-- Name: schema_version_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schema_version_s_idx ON schema_version USING btree (success);


--
-- TOC entry 2060 (class 1259 OID 25989)
-- Name: schema_version_vr_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schema_version_vr_idx ON schema_version USING btree (version_rank);


--
-- TOC entry 2072 (class 2606 OID 26054)
-- Name: fk2sg8ccij71y3t43w8d14qt108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atendimento
    ADD CONSTRAINT fk2sg8ccij71y3t43w8d14qt108 FOREIGN KEY (funcionario_id) REFERENCES funcionario(id);


--
-- TOC entry 2069 (class 2606 OID 26104)
-- Name: fk5a1nptdkcl7n2aoen55e163kd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY associado
    ADD CONSTRAINT fk5a1nptdkcl7n2aoen55e163kd FOREIGN KEY (cidade_id) REFERENCES cidade(id);


--
-- TOC entry 2074 (class 2606 OID 26129)
-- Name: fke60f1axsp2ruxllng5jju6r2f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT fke60f1axsp2ruxllng5jju6r2f FOREIGN KEY (id_pais) REFERENCES pais(id);


--
-- TOC entry 2073 (class 2606 OID 26124)
-- Name: fkgevayuj7c2adiuiv9h1t0dnmo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT fkgevayuj7c2adiuiv9h1t0dnmo FOREIGN KEY (id_estado) REFERENCES estado(id);


--
-- TOC entry 2071 (class 2606 OID 26044)
-- Name: fkmbw8kk4gqt4e5k7tpc0h2fkkt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atendimento
    ADD CONSTRAINT fkmbw8kk4gqt4e5k7tpc0h2fkkt FOREIGN KEY (associado_id) REFERENCES associado(id);


--
-- TOC entry 2070 (class 2606 OID 26119)
-- Name: fks4k37f0yq07vrxeypwjiwyv5q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY farmacia
    ADD CONSTRAINT fks4k37f0yq07vrxeypwjiwyv5q FOREIGN KEY (cidade_id) REFERENCES cidade(id);


-- Completed on 2017-06-19 21:00:18

--
-- PostgreSQL database dump complete
--

