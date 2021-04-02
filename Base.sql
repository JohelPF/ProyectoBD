--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-02 14:05:46

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
-- TOC entry 3 (class 2615 OID 24587)
-- Name: Subastas; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Subastas";


ALTER SCHEMA "Subastas" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 24596)
-- Name: Administrador; Type: TABLE; Schema: Subastas; Owner: postgres
--

CREATE TABLE "Subastas"."Administrador" (
    "ID_Administrador" integer NOT NULL,
    "Alias" name NOT NULL,
    "Password" name NOT NULL
);


ALTER TABLE "Subastas"."Administrador" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24712)
-- Name: Administrador_ID_Administrador_seq; Type: SEQUENCE; Schema: Subastas; Owner: postgres
--

ALTER TABLE "Subastas"."Administrador" ALTER COLUMN "ID_Administrador" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Subastas"."Administrador_ID_Administrador_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 200 (class 1259 OID 24588)
-- Name: Busqueda; Type: TABLE; Schema: Subastas; Owner: postgres
--

CREATE TABLE "Subastas"."Busqueda" (
    "ID_Busqueda" integer NOT NULL,
    "CategoriaPrimaria" name,
    "CategoriaSecundaria" name
);


ALTER TABLE "Subastas"."Busqueda" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24720)
-- Name: Busqueda_ID_Busqueda_seq; Type: SEQUENCE; Schema: Subastas; Owner: postgres
--

ALTER TABLE "Subastas"."Busqueda" ALTER COLUMN "ID_Busqueda" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Subastas"."Busqueda_ID_Busqueda_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 208 (class 1259 OID 24771)
-- Name: Clasificacion; Type: TABLE; Schema: Subastas; Owner: postgres
--

CREATE TABLE "Subastas"."Clasificacion" (
    "ID_Clasificacion" integer NOT NULL,
    "ForeignKey_Vendedor" integer NOT NULL,
    "ForeignKey_Comprador" integer NOT NULL,
    "Puntaje" integer NOT NULL,
    "Descripcion" text
);


ALTER TABLE "Subastas"."Clasificacion" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24604)
-- Name: Participante; Type: TABLE; Schema: Subastas; Owner: postgres
--

CREATE TABLE "Subastas"."Participante" (
    "ID_Participante" integer NOT NULL,
    "CorreoElectronico" name NOT NULL,
    "Nombre" name NOT NULL,
    "Alias" character(20)[] NOT NULL,
    "Telefono" numeric,
    "ForeignKey_Administrador" integer NOT NULL
);


ALTER TABLE "Subastas"."Participante" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24624)
-- Name: Comprador; Type: TABLE; Schema: Subastas; Owner: postgres
--

CREATE TABLE "Subastas"."Comprador" (
)
INHERITS ("Subastas"."Participante");


ALTER TABLE "Subastas"."Comprador" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24744)
-- Name: Participante_ID_Participante_seq; Type: SEQUENCE; Schema: Subastas; Owner: postgres
--

ALTER TABLE "Subastas"."Participante" ALTER COLUMN "ID_Participante" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Subastas"."Participante_ID_Participante_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 24807)
-- Name: Puja; Type: TABLE; Schema: Subastas; Owner: postgres
--

CREATE TABLE "Subastas"."Puja" (
    "ID_Puja" integer NOT NULL,
    "Ofrecido" numeric NOT NULL,
    "Fecha" date NOT NULL,
    "ForeignKey_Subasta" integer NOT NULL,
    "ForeignKey_Comprador" integer NOT NULL
);


ALTER TABLE "Subastas"."Puja" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24789)
-- Name: Subasta; Type: TABLE; Schema: Subastas; Owner: postgres
--

CREATE TABLE "Subastas"."Subasta" (
    "ID_Subasta" integer NOT NULL,
    "Imagen" oid,
    "Descripcion" text NOT NULL,
    "DetallesEntrega" text NOT NULL,
    "PrecioBase" numeric NOT NULL,
    "FechaInicio" date NOT NULL,
    "FechaFinal" date NOT NULL,
    "ForeignKey_Vendedor" integer NOT NULL,
    "ForeignKey_Busqueda" integer NOT NULL
);


ALTER TABLE "Subastas"."Subasta" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24618)
-- Name: Vendedor; Type: TABLE; Schema: Subastas; Owner: postgres
--

CREATE TABLE "Subastas"."Vendedor" (
    "PuntajeClasificacion" numeric(5,0) NOT NULL
)
INHERITS ("Subastas"."Participante");


ALTER TABLE "Subastas"."Vendedor" OWNER TO postgres;

--
-- TOC entry 3049 (class 0 OID 24596)
-- Dependencies: 201
-- Data for Name: Administrador; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Administrador" ("ID_Administrador", "Alias", "Password") FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 24588)
-- Dependencies: 200
-- Data for Name: Busqueda; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Busqueda" ("ID_Busqueda", "CategoriaPrimaria", "CategoriaSecundaria") FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 24771)
-- Dependencies: 208
-- Data for Name: Clasificacion; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Clasificacion" ("ID_Clasificacion", "ForeignKey_Vendedor", "ForeignKey_Comprador", "Puntaje", "Descripcion") FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 24624)
-- Dependencies: 204
-- Data for Name: Comprador; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Comprador" ("ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador") FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 24604)
-- Dependencies: 202
-- Data for Name: Participante; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Participante" ("ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador") FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 24807)
-- Dependencies: 210
-- Data for Name: Puja; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Puja" ("ID_Puja", "Ofrecido", "Fecha", "ForeignKey_Subasta", "ForeignKey_Comprador") FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 24789)
-- Dependencies: 209
-- Data for Name: Subasta; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Subasta" ("ID_Subasta", "Imagen", "Descripcion", "DetallesEntrega", "PrecioBase", "FechaInicio", "FechaFinal", "ForeignKey_Vendedor", "ForeignKey_Busqueda") FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 24618)
-- Dependencies: 203
-- Data for Name: Vendedor; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Vendedor" ("ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador", "PuntajeClasificacion") FROM stdin;
\.


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 205
-- Name: Administrador_ID_Administrador_seq; Type: SEQUENCE SET; Schema: Subastas; Owner: postgres
--

SELECT pg_catalog.setval('"Subastas"."Administrador_ID_Administrador_seq"', 1, false);


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 206
-- Name: Busqueda_ID_Busqueda_seq; Type: SEQUENCE SET; Schema: Subastas; Owner: postgres
--

SELECT pg_catalog.setval('"Subastas"."Busqueda_ID_Busqueda_seq"', 1, false);


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 207
-- Name: Participante_ID_Participante_seq; Type: SEQUENCE SET; Schema: Subastas; Owner: postgres
--

SELECT pg_catalog.setval('"Subastas"."Participante_ID_Participante_seq"', 1, false);


--
-- TOC entry 2893 (class 2606 OID 24702)
-- Name: Administrador Administrador_pkey; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Administrador"
    ADD CONSTRAINT "Administrador_pkey" PRIMARY KEY ("ID_Administrador");


--
-- TOC entry 2889 (class 2606 OID 24715)
-- Name: Busqueda Busqueda_pkey; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Busqueda"
    ADD CONSTRAINT "Busqueda_pkey" PRIMARY KEY ("ID_Busqueda");


--
-- TOC entry 2895 (class 2606 OID 24770)
-- Name: Administrador ID_A; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Administrador"
    ADD CONSTRAINT "ID_A" UNIQUE ("ID_Administrador");


--
-- TOC entry 2891 (class 2606 OID 24768)
-- Name: Busqueda ID_B; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Busqueda"
    ADD CONSTRAINT "ID_B" UNIQUE ("ID_Busqueda");


--
-- TOC entry 2902 (class 2606 OID 24766)
-- Name: Comprador ID_C; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Comprador"
    ADD CONSTRAINT "ID_C" UNIQUE ("ID_Participante");


--
-- TOC entry 2904 (class 2606 OID 24778)
-- Name: Clasificacion ID_Cl; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Clasificacion"
    ADD CONSTRAINT "ID_Cl" PRIMARY KEY ("ID_Clasificacion");


--
-- TOC entry 2908 (class 2606 OID 24816)
-- Name: Puja ID_P; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "ID_P" UNIQUE ("ID_Puja") INCLUDE ("ID_Puja");


--
-- TOC entry 2906 (class 2606 OID 24796)
-- Name: Subasta ID_S; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Subasta"
    ADD CONSTRAINT "ID_S" PRIMARY KEY ("ID_Subasta");


--
-- TOC entry 2900 (class 2606 OID 24764)
-- Name: Vendedor ID_V; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Vendedor"
    ADD CONSTRAINT "ID_V" UNIQUE ("ID_Participante");


--
-- TOC entry 2897 (class 2606 OID 24723)
-- Name: Participante Participante_pkey; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Participante"
    ADD CONSTRAINT "Participante_pkey" PRIMARY KEY ("ID_Participante");


--
-- TOC entry 2910 (class 2606 OID 24814)
-- Name: Puja Puja_pkey; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "Puja_pkey" PRIMARY KEY ("ID_Puja");


--
-- TOC entry 2898 (class 1259 OID 24664)
-- Name: fki_FK_Admin; Type: INDEX; Schema: Subastas; Owner: postgres
--

CREATE INDEX "fki_FK_Admin" ON "Subastas"."Participante" USING btree ("ForeignKey_Administrador");


--
-- TOC entry 2911 (class 2606 OID 24703)
-- Name: Participante FK_Admin; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Participante"
    ADD CONSTRAINT "FK_Admin" FOREIGN KEY ("ForeignKey_Administrador") REFERENCES "Subastas"."Administrador"("ID_Administrador") NOT VALID;


--
-- TOC entry 2915 (class 2606 OID 24802)
-- Name: Subasta FK_Busqueda; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Subasta"
    ADD CONSTRAINT "FK_Busqueda" FOREIGN KEY ("ForeignKey_Busqueda") REFERENCES "Subastas"."Busqueda"("ID_Busqueda");


--
-- TOC entry 2913 (class 2606 OID 24784)
-- Name: Clasificacion FK_Comprador; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Clasificacion"
    ADD CONSTRAINT "FK_Comprador" FOREIGN KEY ("ForeignKey_Comprador") REFERENCES "Subastas"."Comprador"("ID_Participante");


--
-- TOC entry 2916 (class 2606 OID 24817)
-- Name: Puja FK_Comprador; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "FK_Comprador" FOREIGN KEY ("ForeignKey_Comprador") REFERENCES "Subastas"."Comprador"("ID_Participante");


--
-- TOC entry 2917 (class 2606 OID 24822)
-- Name: Puja FK_Subasta; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "FK_Subasta" FOREIGN KEY ("ForeignKey_Subasta") REFERENCES "Subastas"."Subasta"("ID_Subasta");


--
-- TOC entry 2912 (class 2606 OID 24779)
-- Name: Clasificacion FK_Vendedor; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Clasificacion"
    ADD CONSTRAINT "FK_Vendedor" FOREIGN KEY ("ForeignKey_Vendedor") REFERENCES "Subastas"."Vendedor"("ID_Participante");


--
-- TOC entry 2914 (class 2606 OID 24797)
-- Name: Subasta FK_Vendedor; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Subasta"
    ADD CONSTRAINT "FK_Vendedor" FOREIGN KEY ("ForeignKey_Vendedor") REFERENCES "Subastas"."Vendedor"("ID_Participante");


-- Completed on 2021-04-02 14:05:46

--
-- PostgreSQL database dump complete
--

