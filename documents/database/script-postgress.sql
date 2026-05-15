--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.0

-- Started on 2026-05-15 12:09:02

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16407)
-- Name: alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos (
    id integer NOT NULL,
    nombre character varying(75) NOT NULL,
    apellido character varying(75) NOT NULL,
    id_curso integer,
    fecha_nacimiento date,
    hace_deportes boolean
);


ALTER TABLE public.alumnos OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16406)
-- Name: alumnos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alumnos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alumnos_id_seq OWNER TO postgres;

--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 218
-- Name: alumnos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumnos_id_seq OWNED BY public.alumnos.id;


--
-- TOC entry 223 (class 1259 OID 16426)
-- Name: calificaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calificaciones (
    id integer NOT NULL,
    id_alumno integer NOT NULL,
    id_materia integer NOT NULL,
    nota integer NOT NULL,
    fecha date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.calificaciones OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16425)
-- Name: calificaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calificaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.calificaciones_id_seq OWNER TO postgres;

--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 222
-- Name: calificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calificaciones_id_seq OWNED BY public.calificaciones.id;


--
-- TOC entry 217 (class 1259 OID 16400)
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos (
    id integer NOT NULL,
    nombre character varying(75) NOT NULL
);


ALTER TABLE public.cursos OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16399)
-- Name: cursos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_id_seq OWNER TO postgres;

--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 216
-- Name: cursos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_id_seq OWNED BY public.cursos.id;


--
-- TOC entry 221 (class 1259 OID 16419)
-- Name: materias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materias (
    id integer NOT NULL,
    nombre character varying(75) NOT NULL
);


ALTER TABLE public.materias OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16418)
-- Name: materias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materias_id_seq OWNER TO postgres;

--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 220
-- Name: materias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materias_id_seq OWNED BY public.materias.id;


--
-- TOC entry 4651 (class 2604 OID 16410)
-- Name: alumnos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos ALTER COLUMN id SET DEFAULT nextval('public.alumnos_id_seq'::regclass);


--
-- TOC entry 4653 (class 2604 OID 16429)
-- Name: calificaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones ALTER COLUMN id SET DEFAULT nextval('public.calificaciones_id_seq'::regclass);


--
-- TOC entry 4650 (class 2604 OID 16403)
-- Name: cursos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos ALTER COLUMN id SET DEFAULT nextval('public.cursos_id_seq'::regclass);


--
-- TOC entry 4652 (class 2604 OID 16422)
-- Name: materias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias ALTER COLUMN id SET DEFAULT nextval('public.materias_id_seq'::regclass);


--
-- TOC entry 4814 (class 0 OID 16407)
-- Dependencies: 219
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumnos (id, nombre, apellido, id_curso, fecha_nacimiento, hace_deportes) FROM stdin;
1	Federico	De La Puente Sztajer	1	2007-03-14	t
2	Nicolas	Frenkel	1	2008-11-02	f
3	Andres	Furland Otero	1	2007-06-21	t
4	Brandon Ivan	Gaguine Alexandrovich	1	2008-08-09	f
5	Luca	Gamas De Maio	1	2007-01-18	t
6	Benjamin	Hamra Minian	1	2008-05-30	f
7	Martina Sol	Korinfeld Asher	1	2007-09-11	t
8	Eitan Uriel	Koze	1	2008-12-25	t
9	Benjamin Esteban	Kracovitz	1	2007-04-07	f
10	TomÃ¡s Vinicio	Lopez	1	2008-09-13	t
11	TomÃ¡s	Mandelman	1	2007-07-19	f
12	JoaquÃ­n	Medina	1	2008-02-03	t
13	Nicolas Darren	Navarro Feinberg	1	2007-10-28	t
14	Catalina LujÃ¡n	Rodriguez Grosso	1	2008-06-15	f
15	Lucas Ioel	Roitman	1	2007-05-08	t
16	MartÃ­n	Saban	1	2008-03-27	f
17	Florencia	Sirotinsky	1	2007-08-16	t
18	Victoria	Tandeter	1	2008-10-05	t
19	Elian	Ulman	1	2007-02-22	f
20	Milena	Winer	1	2008-07-01	t
21	Camila	Zielonka	1	2007-11-09	f
22	Zoe	Acquistapace	2	2008-04-14	t
23	Vitas	AlÃ¡n	2	2007-06-02	f
24	Felipe	Andraca	2	2008-09-18	t
25	Felipe	Beckford	2	2007-01-11	t
26	IlÃ¡n	Bleicher	2	2008-12-07	f
27	Facundo	Cardoso Peri	2	2007-03-24	t
28	Juan SebastiÃ¡n	CarÃºs	2	2008-08-29	f
29	Lucas	Chechik	2	2007-10-12	t
30	Catalina	Cohen	2	2008-05-21	t
31	NicolÃ¡s	Cukier	2	2007-07-03	f
32	GastÃ³n	Daiksel	2	2008-11-14	t
33	Federico	Drucker	2	2007-02-27	f
34	Felipe	Feldman	2	2008-06-18	t
35	Uriel	Galanti	2	2007-04-30	t
36	AlÃ¡n	Gordon	2	2008-09-05	f
37	TomÃ¡s	Grinstein	2	2007-01-16	t
38	Canela	Ledezma	2	2008-03-08	f
39	Manuel	Mandel	2	2007-12-01	t
40	Matias	Naddeo	2	2008-07-25	t
41	Brisa	Monastiridis Vorornicoff	2	2007-05-19	f
42	Chloe	Monastirsky	2	2008-10-10	t
43	Levi IvÃ¡n	Moscovich	2	2007-01-28	f
44	MÃ¡ximo	Patejim	2	2008-08-17	t
45	Juan Manuel	Sabathie Lopez	2	2007-03-06	t
46	Florencia	Sack	2	2008-05-23	f
47	Naomi	Serebrinsky	2	2007-09-12	t
48	Suti	Uriel	2	2008-11-30	f
49	Julieta	Usoz	2	2007-06-15	t
50	Luciano	Vallejos	2	2008-02-09	t
51	Matias	Wolfus	2	2007-07-27	f
52	Agustin	Aiello	3	2008-04-03	t
53	Jazmin	Arias	3	2007-10-21	f
54	Alejo	Campano	3	2008-12-13	t
55	Julian	Canievsky	3	2007-05-29	t
56	Santiago	Choe	3	2008-09-07	f
57	Damian	Cymerman	3	2007-02-14	t
58	Tobias	Digestani	3	2008-06-11	f
59	Valentina	Elterman	3	2007-08-25	t
60	AndrÃ©s	Fishman	3	2008-01-31	t
61	Fidel	Goldsman	3	2007-11-18	f
62	Julian	Hofman	3	2008-03-03	t
63	Santiago	Hong	3	2007-07-14	f
64	Joaquin	Iribas	3	2008-10-26	t
65	Nicolas	Jajurin	3	2007-04-09	t
66	Ignacio	Kohn	3	2008-06-20	f
67	Victoria	Kriger	3	2007-12-02	t
68	Alan	Laizerovich	3	2008-05-15	f
69	Damian	Leibman	3	2007-09-27	t
70	Facundo	Lukacher	3	2008-02-08	t
71	Pedro	Malowicki	3	2007-11-22	f
72	Dante	Martinez	3	2008-03-17	t
73	Jonatan	Naifeld	3	2007-08-04	f
74	Diana	Park	3	2008-01-25	t
75	Ciro	Perazzo	3	2007-06-30	t
76	Santiago	Schettini	3	2008-10-11	f
77	Nicolas	Schnaider	3	2007-05-07	t
78	Ailin	Severino	3	2008-09-19	f
79	Sofia	Zalucki	3	2007-12-28	t
80	Gael	Zolotow	3	2008-04-24	t
81	Cecilia	Abreu	4	2007-07-13	f
82	Federico	Ajami	4	2008-02-16	t
83	Maximiliano	Bernardoni	4	2007-10-03	t
84	SebastiÃ¡n	CalviÃ±o	4	2008-06-09	f
85	Santiago	Dobrovitzky	4	2007-01-12	t
86	Lucas	Dorin	4	2008-11-01	f
87	Lucas	DueÃ±az	4	2007-03-29	t
88	Tobias	Epsztein	4	2008-08-18	t
89	Ignacio	Eskenazi	4	2007-05-26	f
90	Manuel	Gartenkrot Casal	4	2008-09-30	t
91	TomÃ¡s	Goldentul	4	2007-02-05	f
92	Uriel	Grinfeld	4	2008-07-21	t
93	MÃ¡ximo	Hevia	4	2007-12-14	t
94	Luciana	Kampel	4	2008-04-06	f
95	MartÃ­n	Ku	4	2007-10-23	t
96	Juana	Lopez Valenzuela	4	2008-01-17	f
97	Tobias	Nul	4	2007-06-28	t
98	Augusto	Perez	4	2008-11-09	t
99	Ramiro	Pita	4	2007-08-31	f
100	Felipe	Plat	4	2008-03-12	t
101	Ciro	Ranieli	4	2007-05-04	f
102	JoaquÃ­n	Stock	4	2008-09-15	t
103	Iara	Szwarstein	4	2007-02-20	t
104	Lior	Tanel	4	2008-07-08	f
105	Theo	Trosman	4	2007-11-24	t
106	Clara	Wolman	4	2008-04-27	f
107	Federico Victor	Abas	5	2007-01-30	t
108	Facundo Eliel	Angel	5	2008-06-13	f
109	Micaela	Berman Kreserman	5	2007-09-22	t
110	Matias Ramiro	Brasburg	5	2008-03-05	t
111	Kiara SofÃ­a	Brukiew	5	2007-12-19	f
112	Ilan Uriel	Busso	5	2008-05-10	t
113	Franco	Cappella	5	2007-08-01	f
114	Francisco	Castillo	5	2008-10-14	t
115	Ludmila Uma	GrÃ¼n	5	2007-04-11	t
116	Uriel Federico	Hamu	5	2008-07-26	f
117	Eliel	Jamilis	5	2007-11-06	t
118	Delfina	Kaltman	5	2008-02-15	f
119	Federico	Kreserman	5	2007-06-22	t
120	Benjamin	Liberman	5	2008-09-08	t
121	Mateo Julian	Milano	5	2007-01-09	f
122	Gael Ricardo	Mizrahi	5	2008-12-03	t
123	Andres	Perel	5	2007-05-17	f
124	TobÃ­as	Rohr	5	2008-08-27	t
125	Bruno	Roth	5	2007-03-01	t
126	Ivan Daniel	Shoffer	5	2008-10-20	f
127	Sofia	Sufryn	5	2007-07-02	t
128	Milena	Svatzky	5	2008-11-11	f
129	Augusto Amadeo	Traverso	5	2007-04-18	t
130	Maica	Trutner Kobryniec	5	2008-06-29	t
131	Tobias Yoel	Turquie	5	2007-09-16	f
132	Franco	Urquizo Barba	5	2008-01-24	t
133	Alexia	Wainstok	5	2007-08-07	f
134	Morena Yael	Zalcman	5	2008-05-12	t
\.


--
-- TOC entry 4818 (class 0 OID 16426)
-- Dependencies: 223
-- Data for Name: calificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calificaciones (id, id_alumno, id_materia, nota, fecha) FROM stdin;
\.


--
-- TOC entry 4812 (class 0 OID 16400)
-- Dependencies: 217
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos (id, nombre) FROM stdin;
1	5IA
2	5IB
3	5IC
4	5ID
5	5IE
\.


--
-- TOC entry 4816 (class 0 OID 16419)
-- Dependencies: 221
-- Data for Name: materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materias (id, nombre) FROM stdin;
1	MatemÃ¡tica
2	Lengua
3	Historia
4	ProgramaciÃ³n
5	Base de Datos
6	MatemÃ¡tica
7	Lengua
8	Historia
9	ProgramaciÃ³n
10	Base de Datos
\.


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 218
-- Name: alumnos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alumnos_id_seq', 134, true);


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 222
-- Name: calificaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calificaciones_id_seq', 1, false);


--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 216
-- Name: cursos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_id_seq', 5, true);


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 220
-- Name: materias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materias_id_seq', 10, true);


--
-- TOC entry 4658 (class 2606 OID 16412)
-- Name: alumnos alumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (id);


--
-- TOC entry 4662 (class 2606 OID 16434)
-- Name: calificaciones calificaciones_id_alumno_id_materia_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_id_alumno_id_materia_key UNIQUE (id_alumno, id_materia);


--
-- TOC entry 4664 (class 2606 OID 16432)
-- Name: calificaciones calificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 4656 (class 2606 OID 16405)
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id);


--
-- TOC entry 4660 (class 2606 OID 16424)
-- Name: materias materias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_pkey PRIMARY KEY (id);


--
-- TOC entry 4665 (class 2606 OID 16413)
-- Name: alumnos alumnos_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.cursos(id);


--
-- TOC entry 4666 (class 2606 OID 16435)
-- Name: calificaciones calificaciones_id_alumno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_id_alumno_fkey FOREIGN KEY (id_alumno) REFERENCES public.alumnos(id);


--
-- TOC entry 4667 (class 2606 OID 16440)
-- Name: calificaciones calificaciones_id_materia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_id_materia_fkey FOREIGN KEY (id_materia) REFERENCES public.materias(id);


-- Completed on 2026-05-15 12:09:02

--
-- PostgreSQL database dump complete
--

