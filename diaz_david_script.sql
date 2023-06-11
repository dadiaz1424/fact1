--
-- PostgreSQL database dump
--

-- Dumped from database version 13.11
-- Dumped by pg_dump version 13.11

-- Started on 2023-06-11 11:10:34

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 204 (class 1259 OID 16403)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    cod_cliente integer NOT NULL,
    tipo_identificacion character varying(3) NOT NULL,
    version bigint NOT NULL,
    telefono character varying(15),
    identificacion character varying(20) NOT NULL,
    apellido character varying(50),
    nombre character varying(50),
    correo_electronico character varying(100) NOT NULL,
    direccion character varying(100) NOT NULL,
    razon_social character varying(100)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16395)
-- Name: cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_seq OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16408)
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura (
    cod_cliente integer NOT NULL,
    cod_establecimiento character varying(3) NOT NULL,
    punto_emision character varying(3) NOT NULL,
    secuencial integer NOT NULL,
    subtotal numeric(10,2) NOT NULL,
    total numeric(10,2) NOT NULL,
    cod_factura bigint NOT NULL,
    fecha timestamp(6) without time zone NOT NULL,
    version bigint NOT NULL,
    numero_autorizacion character varying(40) NOT NULL
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16413)
-- Name: factura_detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura_detalle (
    cantidad numeric(10,2) NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    subtotal numeric(10,2) NOT NULL,
    cod_factura bigint NOT NULL,
    cod_factura_detalle bigint NOT NULL,
    version bigint NOT NULL,
    cod_producto character varying(20) NOT NULL,
    nombre_producto character varying(100) NOT NULL
);


ALTER TABLE public.factura_detalle OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16397)
-- Name: factura_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factura_detalle_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.factura_detalle_seq OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16399)
-- Name: factura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factura_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.factura_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16418)
-- Name: impuesto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.impuesto (
    cod_impuesto character varying(3) NOT NULL,
    siglas character varying(10) NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.impuesto OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16423)
-- Name: impuesto_porcentaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.impuesto_porcentaje (
    cod_impuesto character varying(3) NOT NULL,
    estado character varying(3) NOT NULL,
    fecha_fin date,
    fecha_inicio date NOT NULL,
    porcentaje numeric(4,1) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.impuesto_porcentaje OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16401)
-- Name: impuesto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.impuesto_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.impuesto_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16428)
-- Name: proucto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proucto (
    estado character varying(3) NOT NULL,
    existencia numeric(10,2) NOT NULL,
    ice character varying(1) NOT NULL,
    iva character varying(1) NOT NULL,
    precio numeric(10,2) NOT NULL,
    cod_producto character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(500)
);


ALTER TABLE public.proucto OWNER TO postgres;

--
-- TOC entry 3027 (class 0 OID 16403)
-- Dependencies: 204
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (cod_cliente, tipo_identificacion, version, telefono, identificacion, apellido, nombre, correo_electronico, direccion, razon_social) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 16408)
-- Dependencies: 205
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura (cod_cliente, cod_establecimiento, punto_emision, secuencial, subtotal, total, cod_factura, fecha, version, numero_autorizacion) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 16413)
-- Dependencies: 206
-- Data for Name: factura_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura_detalle (cantidad, precio_unitario, subtotal, cod_factura, cod_factura_detalle, version, cod_producto, nombre_producto) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 16418)
-- Dependencies: 207
-- Data for Name: impuesto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.impuesto (cod_impuesto, siglas, nombre) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 16423)
-- Dependencies: 208
-- Data for Name: impuesto_porcentaje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.impuesto_porcentaje (cod_impuesto, estado, fecha_fin, fecha_inicio, porcentaje, version) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 16428)
-- Dependencies: 209
-- Data for Name: proucto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proucto (estado, existencia, ice, iva, precio, cod_producto, nombre, descripcion) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 200
-- Name: cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_seq', 1, false);


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 201
-- Name: factura_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factura_detalle_seq', 1, false);


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 202
-- Name: factura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factura_seq', 1, false);


--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 203
-- Name: impuesto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.impuesto_seq', 1, false);


--
-- TOC entry 2878 (class 2606 OID 16407)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cod_cliente);


--
-- TOC entry 2882 (class 2606 OID 16417)
-- Name: factura_detalle factura_detalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_detalle
    ADD CONSTRAINT factura_detalle_pkey PRIMARY KEY (cod_factura_detalle);


--
-- TOC entry 2880 (class 2606 OID 16412)
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (cod_factura);


--
-- TOC entry 2884 (class 2606 OID 16422)
-- Name: impuesto impuesto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impuesto
    ADD CONSTRAINT impuesto_pkey PRIMARY KEY (cod_impuesto);


--
-- TOC entry 2886 (class 2606 OID 16427)
-- Name: impuesto_porcentaje impuesto_porcentaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impuesto_porcentaje
    ADD CONSTRAINT impuesto_porcentaje_pkey PRIMARY KEY (cod_impuesto, porcentaje);


--
-- TOC entry 2888 (class 2606 OID 16435)
-- Name: proucto proucto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proucto
    ADD CONSTRAINT proucto_pkey PRIMARY KEY (cod_producto);


--
-- TOC entry 2890 (class 2606 OID 16441)
-- Name: factura_detalle fk381g2ury6qgpyg8ph60ilvm36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_detalle
    ADD CONSTRAINT fk381g2ury6qgpyg8ph60ilvm36 FOREIGN KEY (cod_factura) REFERENCES public.factura(cod_factura);


--
-- TOC entry 2889 (class 2606 OID 16436)
-- Name: factura fkk93riwh9mxuat174hx0l06p8l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT fkk93riwh9mxuat174hx0l06p8l FOREIGN KEY (cod_cliente) REFERENCES public.cliente(cod_cliente);


--
-- TOC entry 2892 (class 2606 OID 16451)
-- Name: impuesto_porcentaje fkncpfw8e1i7t13t3vt7vpq9w9h; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impuesto_porcentaje
    ADD CONSTRAINT fkncpfw8e1i7t13t3vt7vpq9w9h FOREIGN KEY (cod_impuesto) REFERENCES public.impuesto(cod_impuesto);


--
-- TOC entry 2891 (class 2606 OID 16446)
-- Name: factura_detalle fktfg11xb8ebbehhb9tqwk8smyi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_detalle
    ADD CONSTRAINT fktfg11xb8ebbehhb9tqwk8smyi FOREIGN KEY (cod_producto) REFERENCES public.proucto(cod_producto);


-- Completed on 2023-06-11 11:10:35

--
-- PostgreSQL database dump complete
--

