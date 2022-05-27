--
-- PostgreSQL database dump
--

-- Dumped from database version 12.10
-- Dumped by pg_dump version 12.10

-- Started on 2022-05-27 16:34:41

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
-- TOC entry 2900 (class 0 OID 0)
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
-- TOC entry 2901 (class 0 OID 0)
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
-- TOC entry 2902 (class 0 OID 0)
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
-- TOC entry 2903 (class 0 OID 0)
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
-- TOC entry 2904 (class 0 OID 0)
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
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 210
-- Name: tarea_tra_numero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarea_tra_numero_seq OWNED BY public.tarea.tra_numero;


--
-- TOC entry 215 (class 1259 OID 16490)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    token character varying,
    passwd character varying,
    email character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16488)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


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
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 213
-- Name: usuario_usu_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_usu_codigo_seq OWNED BY public.usuario.usu_codigo;


--
-- TOC entry 2730 (class 2604 OID 16399)
-- Name: cliente cli_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN cli_codigo SET DEFAULT nextval('public.cliente_cli_codigo_seq'::regclass);


--
-- TOC entry 2733 (class 2604 OID 16437)
-- Name: empleado emp_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado ALTER COLUMN emp_codigo SET DEFAULT nextval('public.empleado_emp_codigo_seq'::regclass);


--
-- TOC entry 2731 (class 2604 OID 16410)
-- Name: ruta rut_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruta ALTER COLUMN rut_codigo SET DEFAULT nextval('public.ruta_rut_codigo_seq'::regclass);


--
-- TOC entry 2732 (class 2604 OID 16426)
-- Name: sistema sis_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistema ALTER COLUMN sis_codigo SET DEFAULT nextval('public.sistema_sis_codigo_seq'::regclass);


--
-- TOC entry 2734 (class 2604 OID 16448)
-- Name: tarea tra_numero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea ALTER COLUMN tra_numero SET DEFAULT nextval('public.tarea_tra_numero_seq'::regclass);


--
-- TOC entry 2736 (class 2604 OID 16493)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2735 (class 2604 OID 16474)
-- Name: usuario usu_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN usu_codigo SET DEFAULT nextval('public.usuario_usu_codigo_seq'::regclass);


--
-- TOC entry 2882 (class 0 OID 16396)
-- Dependencies: 203
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (cli_codigo, cli_nombre, cli_rucci, cli_telefono, cli_email, cli_direccion, cli_codrut) FROM stdin;
1	Despensa Jose Carlos	12345645	9874563145	jose@gmail.com	Pablo Rojas 	4
7	Comercial Marta	123456	98745631	maria@gmail.com	Pablo Rojas	1
11	Supermercado 8	4761137	0973620234	alexpenciso@gmail.com	algun lado	3
12	Libreria Greta	47994156	0973895452	alicia@hotmail.com	algun lado	3
15	Heladeria Miguel	678646				4
16	Cliente Nuevo	57575	5575		centro	6
17	Jose	4587687	678676		km 9	1
\.


--
-- TOC entry 2888 (class 0 OID 16434)
-- Dependencies: 209
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado (emp_codigo, emp_nombre, emp_telefono, emp_ci, emp_direccion, emp_codusu) FROM stdin;
1	Gael L	0976854746	46514894	Centro	1
5	Marta	0975466564	45864789	San Juan 2	17
8	Alex	0973620245	4761137	San Isidro	15
\.


--
-- TOC entry 2884 (class 0 OID 16407)
-- Dependencies: 205
-- Data for Name: ruta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ruta (rut_codigo, rut_descripcion) FROM stdin;
3	Ruta 5
4	Ruta 10
1	Ruta 9
6	Ruta Centro
\.


--
-- TOC entry 2886 (class 0 OID 16423)
-- Dependencies: 207
-- Data for Name: sistema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sistema (sis_codigo, sis_descripcion) FROM stdin;
3	Asistencia Tecnica
1	Sistema de Ventas y Compras
6	Mantenimiento
\.


--
-- TOC entry 2890 (class 0 OID 16445)
-- Dependencies: 211
-- Data for Name: tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarea (tra_numero, tra_fecha, tra_codsis, tra_codcli, tra_codemp, tra_descripcion, tra_estado, tra_obs) FROM stdin;
3	2022-01-01 15:00:00	1	1	1	Instalar la nueva impresora 2	F	Se instalo sin problemas la impreso
11	2022-05-27 18:28:00	6	11	5	limpieza de pc	I	\N
10	2022-05-27 22:14:00	3	7	5	hacer visita tecnica	F	se realizo la visita tecnica
2	2023-01-01 18:00:00	1	1	8	Instalar la nueva computadora, ver si hace falta comprar tones\npasar presupuesto	A	pausado
5	2022-01-01 15:00:00	3	7	8	Instalar la nueva impresora 2	F	Se instalo sin problemas la impreso
13	2022-05-27 20:06:00	1	1	8	instalar monitor nuevo	F	se instalo el nuevo monitor
15	2022-05-28 00:22:00	3	12	8	ir a instalar la impresora 	F	se instalo la nueva impresora sin problemas
\.


--
-- TOC entry 2894 (class 0 OID 16490)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, token, passwd, email) FROM stdin;
17	Perla	\N	179	perla@gmail.com
15	Alex Paul	\N	123	alexpenciso@gmail.com
14	Otra empresa	\N	9874651	marta@gmail.com
16	ana	\N	12345	ana@gmail.com
\.


--
-- TOC entry 2891 (class 0 OID 16469)
-- Dependencies: 212
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (usu_codigo, usu_email, usu_password, usu_nombre) FROM stdin;
1	empresa@gmail.com	12345	Empresa S.A
\.


--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 202
-- Name: cliente_cli_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_cli_codigo_seq', 17, true);


--
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 208
-- Name: empleado_emp_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleado_emp_codigo_seq', 10, true);


--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 204
-- Name: ruta_rut_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ruta_rut_codigo_seq', 7, true);


--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 206
-- Name: sistema_sis_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sistema_sis_codigo_seq', 8, true);


--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 210
-- Name: tarea_tra_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarea_tra_numero_seq', 15, true);


--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 20, true);


--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 213
-- Name: usuario_usu_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_usu_codigo_seq', 2, true);


--
-- TOC entry 2738 (class 2606 OID 16404)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cli_codigo);


--
-- TOC entry 2744 (class 2606 OID 16442)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (emp_codigo);


--
-- TOC entry 2740 (class 2606 OID 16415)
-- Name: ruta ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruta
    ADD CONSTRAINT ruta_pkey PRIMARY KEY (rut_codigo);


--
-- TOC entry 2742 (class 2606 OID 16431)
-- Name: sistema sistema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistema
    ADD CONSTRAINT sistema_pkey PRIMARY KEY (sis_codigo);


--
-- TOC entry 2746 (class 2606 OID 16453)
-- Name: tarea tarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_pkey PRIMARY KEY (tra_numero);


--
-- TOC entry 2750 (class 2606 OID 16498)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 16482)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (usu_codigo);


--
-- TOC entry 2751 (class 2606 OID 16416)
-- Name: cliente cliente_cli_codrut_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cli_codrut_fkey FOREIGN KEY (cli_codrut) REFERENCES public.ruta(rut_codigo) NOT VALID;


--
-- TOC entry 2753 (class 2606 OID 16459)
-- Name: tarea tarea_tra_codcli_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_tra_codcli_fkey FOREIGN KEY (tra_codcli) REFERENCES public.cliente(cli_codigo) NOT VALID;


--
-- TOC entry 2754 (class 2606 OID 16464)
-- Name: tarea tarea_tra_codemp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_tra_codemp_fkey FOREIGN KEY (tra_codemp) REFERENCES public.empleado(emp_codigo) NOT VALID;


--
-- TOC entry 2752 (class 2606 OID 16454)
-- Name: tarea tarea_tra_codsis_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_tra_codsis_fkey FOREIGN KEY (tra_codsis) REFERENCES public.sistema(sis_codigo) NOT VALID;


-- Completed on 2022-05-27 16:34:41

--
-- PostgreSQL database dump complete
--

