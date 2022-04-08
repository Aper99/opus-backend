--
-- PostgreSQL database dump
--

-- Dumped from database version 12.10
-- Dumped by pg_dump version 12.10

-- Started on 2022-04-07 21:12:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16396)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    cli_codigo integer NOT NULL,
    cli_nombre character varying(30) NOT NULL,
    cli_rucci character varying(15),
    cli_telefono character varying(20),
    cli_email character varying(50),
    cli_direccion character varying,
    cli_codrut integer
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16394)
-- Name: cliente_cli_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_cli_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_cli_codigo_seq OWNER TO postgres;

--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 202
-- Name: cliente_cli_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_cli_codigo_seq OWNED BY public.cliente.cli_codigo;


--
-- TOC entry 209 (class 1259 OID 16434)
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    emp_codigo integer NOT NULL,
    emp_nombre character varying(20) NOT NULL,
    emp_telefono character varying(20),
    emp_ci character varying(15),
    emp_direccion character varying,
    emp_codusu integer
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16432)
-- Name: empleado_emp_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleado_emp_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empleado_emp_codigo_seq OWNER TO postgres;

--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 208
-- Name: empleado_emp_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleado_emp_codigo_seq OWNED BY public.empleado.emp_codigo;


--
-- TOC entry 205 (class 1259 OID 16407)
-- Name: ruta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ruta (
    rut_codigo integer NOT NULL,
    rut_descripcion character varying
);


ALTER TABLE public.ruta OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16405)
-- Name: ruta_rut_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ruta_rut_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ruta_rut_codigo_seq OWNER TO postgres;

--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 204
-- Name: ruta_rut_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ruta_rut_codigo_seq OWNED BY public.ruta.rut_codigo;


--
-- TOC entry 207 (class 1259 OID 16423)
-- Name: sistema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sistema (
    sis_codigo integer NOT NULL,
    sis_descripcion character varying
);


ALTER TABLE public.sistema OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16421)
-- Name: sistema_sis_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sistema_sis_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sistema_sis_codigo_seq OWNER TO postgres;

--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 206
-- Name: sistema_sis_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sistema_sis_codigo_seq OWNED BY public.sistema.sis_codigo;


--
-- TOC entry 211 (class 1259 OID 16445)
-- Name: tarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarea (
    tra_numero integer NOT NULL,
    tra_fecha timestamp without time zone NOT NULL,
    tra_codsis integer,
    tra_codcli integer,
    tra_codemp integer,
    tra_descripcion text,
    tra_estado character(1),
    tra_obs text
);


ALTER TABLE public.tarea OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16443)
-- Name: tarea_tra_numero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarea_tra_numero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tarea_tra_numero_seq OWNER TO postgres;

--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 210
-- Name: tarea_tra_numero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarea_tra_numero_seq OWNED BY public.tarea.tra_numero;


--
-- TOC entry 212 (class 1259 OID 16469)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    usu_codigo integer NOT NULL,
    usu_email character varying(50) NOT NULL,
    usu_password character varying NOT NULL,
    usu_nombre character varying(30) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16472)
-- Name: usuario_usu_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_usu_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_usu_codigo_seq OWNER TO postgres;

--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 213
-- Name: usuario_usu_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_usu_codigo_seq OWNED BY public.usuario.usu_codigo;


--
-- TOC entry 2723 (class 2604 OID 16399)
-- Name: cliente cli_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN cli_codigo SET DEFAULT nextval('public.cliente_cli_codigo_seq'::regclass);


--
-- TOC entry 2726 (class 2604 OID 16437)
-- Name: empleado emp_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado ALTER COLUMN emp_codigo SET DEFAULT nextval('public.empleado_emp_codigo_seq'::regclass);


--
-- TOC entry 2724 (class 2604 OID 16410)
-- Name: ruta rut_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruta ALTER COLUMN rut_codigo SET DEFAULT nextval('public.ruta_rut_codigo_seq'::regclass);


--
-- TOC entry 2725 (class 2604 OID 16426)
-- Name: sistema sis_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistema ALTER COLUMN sis_codigo SET DEFAULT nextval('public.sistema_sis_codigo_seq'::regclass);


--
-- TOC entry 2727 (class 2604 OID 16448)
-- Name: tarea tra_numero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea ALTER COLUMN tra_numero SET DEFAULT nextval('public.tarea_tra_numero_seq'::regclass);


--
-- TOC entry 2728 (class 2604 OID 16474)
-- Name: usuario usu_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN usu_codigo SET DEFAULT nextval('public.usuario_usu_codigo_seq'::regclass);


--
-- TOC entry 2872 (class 0 OID 16396)
-- Dependencies: 203
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (cli_codigo, cli_nombre, cli_rucci, cli_telefono, cli_email, cli_direccion, cli_codrut) FROM stdin;
11	Alex	4761137	0973620234	alexpenciso@gmail.com	algun lado	3
7	Marta	123456	98745631	maria@gmail.com	Pablo Rojas	1
1	Jose Carlos	12345645	9874563145	jose@gmail.com	Pablo Rojas 	1
12	Alicia	47994156	0973895452	alicia@hotmail.com	algun lado	3
\.


--
-- TOC entry 2878 (class 0 OID 16434)
-- Dependencies: 209
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado (emp_codigo, emp_nombre, emp_telefono, emp_ci, emp_direccion, emp_codusu) FROM stdin;
1	Gael L	0976854746	46514894	Centro	1
5	Marta	0975466	45864	San Juan	2
\.


--
-- TOC entry 2874 (class 0 OID 16407)
-- Dependencies: 205
-- Data for Name: ruta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ruta (rut_codigo, rut_descripcion) FROM stdin;
1	Ruta 1
3	Ruta 5
4	Ruta 10
\.


--
-- TOC entry 2876 (class 0 OID 16423)
-- Dependencies: 207
-- Data for Name: sistema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sistema (sis_codigo, sis_descripcion) FROM stdin;
3	Asistencia Tecnica
1	Sistema de Ventas y Compras
6	Mantenimiento
\.


--
-- TOC entry 2880 (class 0 OID 16445)
-- Dependencies: 211
-- Data for Name: tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarea (tra_numero, tra_fecha, tra_codsis, tra_codcli, tra_codemp, tra_descripcion, tra_estado, tra_obs) FROM stdin;
1	2022-01-01 15:00:00	1	1	1	Instalar la nueva impresora	F	Se instalo sin problemas la impreso
2	2023-01-01 15:00:00	1	1	1	Instalar la nueva computadora	A	
\.


--
-- TOC entry 2881 (class 0 OID 16469)
-- Dependencies: 212
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (usu_codigo, usu_email, usu_password, usu_nombre) FROM stdin;
1	empresa@gmail.com	12345	Empresa S.A
\.


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 202
-- Name: cliente_cli_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_cli_codigo_seq', 13, true);


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 208
-- Name: empleado_emp_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleado_emp_codigo_seq', 6, true);


--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 204
-- Name: ruta_rut_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ruta_rut_codigo_seq', 4, true);


--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 206
-- Name: sistema_sis_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sistema_sis_codigo_seq', 7, true);


--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 210
-- Name: tarea_tra_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarea_tra_numero_seq', 2, true);


--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 213
-- Name: usuario_usu_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_usu_codigo_seq', 2, true);


--
-- TOC entry 2730 (class 2606 OID 16404)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cli_codigo);


--
-- TOC entry 2736 (class 2606 OID 16442)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (emp_codigo);


--
-- TOC entry 2732 (class 2606 OID 16415)
-- Name: ruta ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruta
    ADD CONSTRAINT ruta_pkey PRIMARY KEY (rut_codigo);


--
-- TOC entry 2734 (class 2606 OID 16431)
-- Name: sistema sistema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistema
    ADD CONSTRAINT sistema_pkey PRIMARY KEY (sis_codigo);


--
-- TOC entry 2738 (class 2606 OID 16453)
-- Name: tarea tarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_pkey PRIMARY KEY (tra_numero);


--
-- TOC entry 2740 (class 2606 OID 16482)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (usu_codigo);


--
-- TOC entry 2741 (class 2606 OID 16416)
-- Name: cliente cliente_cli_codrut_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cli_codrut_fkey FOREIGN KEY (cli_codrut) REFERENCES public.ruta(rut_codigo) NOT VALID;


--
-- TOC entry 2743 (class 2606 OID 16459)
-- Name: tarea tarea_tra_codcli_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_tra_codcli_fkey FOREIGN KEY (tra_codcli) REFERENCES public.cliente(cli_codigo) NOT VALID;


--
-- TOC entry 2744 (class 2606 OID 16464)
-- Name: tarea tarea_tra_codemp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_tra_codemp_fkey FOREIGN KEY (tra_codemp) REFERENCES public.empleado(emp_codigo) NOT VALID;


--
-- TOC entry 2742 (class 2606 OID 16454)
-- Name: tarea tarea_tra_codsis_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_tra_codsis_fkey FOREIGN KEY (tra_codsis) REFERENCES public.sistema(sis_codigo) NOT VALID;


-- Completed on 2022-04-07 21:12:57

--
-- PostgreSQL database dump complete
--

