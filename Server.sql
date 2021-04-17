--
-- PostgreSQL database cluster dump
--

-- Started on 2021-04-16 12:48:35

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE "Admin";
ALTER ROLE "Admin" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:mFKjO/hWVyWGy0vzFoyuSA==$hdA2MEsLf5o2fDmrUdKpW6C/wtpv/WEeTHTgm6CyIUQ=:T/e5LL553Q3lY7mgwPNZqxxnHV81Fs+oDn5nAkk36p4=';
CREATE ROLE "User";
ALTER ROLE "User" WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:vuc3ePvc+jblXmLtZ/aUXQ==$lDmYkoKa9MGs7hhTv1KS4KW57iOSLVmy8cuMANVtHG4=:oN0i9wLoOf6rRbqzzKGGQWVbB63fsYOmLZIV6lR1zlY=';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-16 12:48:35

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

-- Completed on 2021-04-16 12:48:35

--
-- PostgreSQL database dump complete
--

--
-- Database "Progra_1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-16 12:48:35

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
-- TOC entry 3080 (class 1262 OID 24586)
-- Name: Progra_1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Progra_1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE "Progra_1" OWNER TO postgres;

\connect "Progra_1"

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
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 3080
-- Name: DATABASE "Progra_1"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "Progra_1" IS 'Base de datos para la progra 1';


--
-- TOC entry 3082 (class 0 OID 0)
-- Name: Progra_1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER ROLE "User" IN DATABASE "Progra_1" SET transaction_read_only TO 'true';


\connect "Progra_1"

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

--
-- TOC entry 213 (class 1255 OID 32783)
-- Name: Delete_Admin(integer); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Delete_Admin"("ID_A" integer)
    LANGUAGE sql
    AS $$
UPDATE "Subastas"."Participante" SET "ForeignKey_Administrador" = 0
WHERE "ID_A" = "Subastas"."Participante"."ForeignKey_Administrador";
DELETE FROM "Subastas"."Administrador"
	WHERE "Subastas"."Administrador"."ID_Administrador" = "ID_A";
$$;


ALTER PROCEDURE "Subastas"."Delete_Admin"("ID_A" integer) OWNER TO postgres;

--
-- TOC entry 214 (class 1255 OID 40980)
-- Name: Delete_Busqueda(integer); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Delete_Busqueda"("ID_B" integer)
    LANGUAGE sql
    AS $$
DELETE FROM "Subastas"."Busqueda"
	WHERE "ID_B" = "ID_Busqueda";
$$;


ALTER PROCEDURE "Subastas"."Delete_Busqueda"("ID_B" integer) OWNER TO postgres;

--
-- TOC entry 220 (class 1255 OID 40985)
-- Name: Delete_Clasificacion(integer); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Delete_Clasificacion"("ID_C" integer)
    LANGUAGE sql
    AS $$
DELETE FROM "Subastas"."Clasificacion"
	WHERE "ID_C" = "ID_Clasificacion";
$$;


ALTER PROCEDURE "Subastas"."Delete_Clasificacion"("ID_C" integer) OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 40990)
-- Name: Delelte_Comprador(integer); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Delelte_Comprador"("ID_C" integer)
    LANGUAGE sql
    AS $$
DELETE FROM "Subastas"."Comprador"
	WHERE "ID_C" = "ID_Participante";
$$;


ALTER PROCEDURE "Subastas"."Delelte_Comprador"("ID_C" integer) OWNER TO postgres;


CREATE PROCEDURE "Subastas"."Delete_Participante"("ID_P" integer)
    LANGUAGE sql
    AS $$
DELETE FROM "Subastas"."Participante"
	WHERE "ID_P" = "ID_Participante";
$$;


ALTER PROCEDURE "Subastas"."Delete_Participante"("ID_P" integer) OWNER TO postgres;


CREATE PROCEDURE "Subastas"."Delete_Puja"("ID_P" integer)
    LANGUAGE sql
    AS $$
DELETE FROM "Subastas"."Puja"
	WHERE "ID_P" = "ID_Puja";
$$;


ALTER PROCEDURE "Subastas"."Delete_Puja"("ID_P" integer) OWNER TO postgres;


CREATE PROCEDURE "Subastas"."Delete_Subasta"("ID_S" integer)
    LANGUAGE sql
    AS $$
DELETE FROM "Subastas"."Subasta"
	WHERE "ID_S" = "ID_Subasta";
$$;


ALTER PROCEDURE "Subastas"."Delete_Subasta"("ID_S" integer) OWNER TO postgres;


CREATE PROCEDURE "Subastas"."Delete_Vendedor"("ID_V" integer)
    LANGUAGE sql
    AS $$
DELETE FROM "Subastas"."Vendedor"
	WHERE "ID_V" = "ID_Participante";
$$;


ALTER PROCEDURE "Subastas"."Delete_Vendedor"("ID_V" integer) OWNER TO postgres;


--
-- TOC entry 232 (class 1255 OID 32798)
-- Name: Insert_Admin(integer, character varying, character varying); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Insert_Admin"("New_Alias" integer, "New_Password" character varying, "ID_A" character varying)
    LANGUAGE sql
    AS $_$
DO $$
IF LENGTH("New_Alias") < 21 AND LENGTH("New_Password") >= 8 AND LENGTH("New_Password") < 16 THEN
	INSERT INTO "Subastas"."Administrador"(
		"ID_Administrador", "Alias", "Password")
		VALUES ("ID_A", "New_Alias", "New_Password");
END IF;
END $$
$_$;


ALTER PROCEDURE "Subastas"."Insert_Admin"("New_Alias" integer, "New_Password" character varying, "ID_A" character varying) OWNER TO postgres;

--
-- TOC entry 211 (class 1255 OID 40977)
-- Name: Insert_Busqueda(name, name); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Insert_Busqueda"("CP" name, "CS" name)
    LANGUAGE sql
    AS $$
INSERT INTO "Subastas"."Busqueda"(
	"CategoriaPrimaria", "CategoriaSecundaria")
	VALUES ("CP", "CS");
$$;


ALTER PROCEDURE "Subastas"."Insert_Busqueda"("CP" name, "CS" name) OWNER TO postgres;

--
-- TOC entry 219 (class 1255 OID 40984)
-- Name: Insert_Clasificacion(integer, integer, integer, integer, text); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Insert_Clasificacion"("ID_C" integer, "FK_V" integer, "FK_C" integer, "Punt" integer, "Desc" text)
    LANGUAGE sql
    AS $$
INSERT INTO "Subastas"."Clasificacion"(
	"ID_Clasificacion", "ForeignKey_Vendedor", "ForeignKey_Comprador", "Puntaje", "Descripcion")
	VALUES ("ID_C", "FK_V", "FK_C", "Punt", "Desc");
$$;


ALTER PROCEDURE "Subastas"."Insert_Clasificacion"("ID_C" integer, "FK_V" integer, "FK_C" integer, "Punt" integer, "Desc" text) OWNER TO postgres;

--
-- TOC entry 235 (class 1255 OID 40988)
-- Name: Insert_Comprador(integer, name, name, character[], numeric, integer, character[]); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Insert_Comprador"("ID_P" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[])
    LANGUAGE sql
    AS $_$
DO $$
IF LENGTH("New_Alias") < 21 AND LENGTH("New_Password") >= 8 AND LENGTH("New_Password") < 16 THEN
	INSERT INTO "Subastas"."Comprador"(
	"ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador", "Password")
	VALUES ("ID_P", "CE", "Nom", "New_Alias", "Tel", "FK_A", "New_Password");
END IF;
END $$
$_$;


ALTER PROCEDURE "Subastas"."Insert_Comprador"("ID_P" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[]) OWNER TO postgres;

-- Participante
CREATE PROCEDURE "Subastas"."Insert_Participante"("ID_P" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[])
    LANGUAGE sql
    AS $_$
DO $$
IF LENGTH("New_Alias") < 21 AND LENGTH("New_Password") >= 8 AND LENGTH("New_Password") < 16 THEN
	INSERT INTO "Subastas"."Participante"(
	"ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador", "Password")
	VALUES ("ID_P", "CE", "Nom", "New_Alias", "Tel", "FK_A", "New_Password");
END IF;
END $$
$_$;


ALTER PROCEDURE "Subastas"."Insert_Participante"("ID_P" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[]) OWNER TO postgres;


-- Puja
CREATE PROCEDURE "Subastas"."Insert_Puja"("ID_P" integer, "Ofrecido" numeric, "fecha" date, "FK_S" integer, "FK_C" integer)
    LANGUAGE sql
    AS $$
INSERT INTO "Subastas"."Puja"(
	"ID_Puja", "Ofrecido", "Fecha", "ForeignKey_Subasta", "ForeignKey_Comprador")
	VALUES ("ID_P", "Ofrecido", "fecha", "FK_S", "FK_C");
$$;


ALTER PROCEDURE "Subastas"."Insert_Puja"("ID_P" integer, "Ofrecido" numeric, "fecha" date, "FK_S" integer, "FK_C" integer) OWNER TO postgres;


-- Subasta
CREATE PROCEDURE "Subastas"."Insert_Subasta"("ID_S" integer, "Img" oid, "Descr" text, "DetEntrega" text, "Precio" numeric, "FechaI" date, "FechaF" date, "FK_V" integer, "FK_B" integer)
    LANGUAGE sql
    AS $_$
DO $$
IF "Precio" >= 0 THEN
	INSERT INTO "Subastas"."Subasta"(
	"ID_Subasta", "Imagen", "Descripcion", "DetallesEntrega", "PrecioBase", "FechaInicio", "FechaFinal", "ForeignKey_Vendedor", "ForeignKey_Busqueda")
	VALUES ("ID_S", "Img", "Descr", "DetEntrega", "Precio", "FechaI", "FechaF", "FK_V", "FK_B");
END IF;
END $$
$_$;


ALTER PROCEDURE "Subastas"."Insert_Subasta"("ID_S" integer, "Img" oid, "Descr" text, "DetEntrega" text, "Precio" numeric, "FechaI" date, "FechaF" date, "FK_V" integer, "FK_B" integer) OWNER TO postgres;


-- Vendedor
CREATE PROCEDURE "Subastas"."Insert_Vendedor"("ID_P" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[], "Pun" numeric)
    LANGUAGE sql
    AS $_$
DO $$
IF LENGTH("New_Alias") < 21 AND LENGTH("New_Password") >= 8 AND LENGTH("New_Password") < 16 THEN
	INSERT INTO "Subastas"."Vendedor"(
	"ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador", "Password", "PuntajeClasificacion")
	VALUES ("ID_P", "CE", "Nom", "New_Alias", "Tel", "FK_A", "New_Password", "Pun");
END IF;
END $$
$_$;


ALTER PROCEDURE "Subastas"."Insert_Vendedor"("ID_P" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[], "Pun" numeric) OWNER TO postgres;


--
-- TOC entry 212 (class 1255 OID 32780)
-- Name: Select_Admin(); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Select_Admin"()
    LANGUAGE sql
    AS $$
SELECT "ID_Administrador", "Alias", "Password"
	FROM "Subastas"."Administrador";
$$;


ALTER PROCEDURE "Subastas"."Select_Admin"() OWNER TO postgres;

--
-- TOC entry 215 (class 1255 OID 40981)
-- Name: Select_Busqueda(); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Select_Busqueda"()
    LANGUAGE sql
    AS $$
SELECT "ID_Busqueda", "CategoriaPrimaria", "CategoriaSecundaria"
	FROM "Subastas"."Busqueda";
$$;


ALTER PROCEDURE "Subastas"."Select_Busqueda"() OWNER TO postgres;

--
-- TOC entry 218 (class 1255 OID 40983)
-- Name: Select_Clasificacion(); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Select_Clasificacion"()
    LANGUAGE sql
    AS $$
SELECT "ID_Clasificacion", "ForeignKey_Vendedor", "ForeignKey_Comprador", "Puntaje", "Descripcion"
	FROM "Subastas"."Clasificacion";
$$;


ALTER PROCEDURE "Subastas"."Select_Clasificacion"() OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 40987)
-- Name: Select_Comprador(); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Select_Comprador"()
    LANGUAGE sql
    AS $$
SELECT "ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador"
	FROM "Subastas"."Comprador";
$$;


ALTER PROCEDURE "Subastas"."Select_Comprador"() OWNER TO postgres;

-- Participante
CREATE PROCEDURE "Subastas"."Select_Participante"()
    LANGUAGE sql
    AS $$
SELECT "ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador"
	FROM "Subastas"."Participante";
$$;


ALTER PROCEDURE "Subastas"."Select_Participante"() OWNER TO postgres;

-- Puja
CREATE PROCEDURE "Subastas"."Select_Puja"()
    LANGUAGE sql
    AS $$
SELECT "ID_Puja", "Ofrecido", "Fecha", "ForeignKey_Subasta", "ForeignKey_Comprador"
	FROM "Subastas"."Puja";
$$;


ALTER PROCEDURE "Subastas"."Select_Puja"() OWNER TO postgres;

-- Subasta
CREATE PROCEDURE "Subastas"."Select_Subasta"()
    LANGUAGE sql
    AS $$
SELECT "ID_Subasta", "Imagen", "Descripcion", "DetallesEntrega", "PrecioBase", "FechaInicio", "FechaFinal", "ForeignKey_Vendedor", "ForeignKey_Busqueda"
	FROM "Subastas"."Subasta";
$$;


ALTER PROCEDURE "Subastas"."Select_Subasta"() OWNER TO postgres;

-- Vendedor
CREATE PROCEDURE "Subastas"."Select_Vendedor"()
    LANGUAGE sql
    AS $$
SELECT "ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador", "PuntajeClasificacion"
	FROM "Subastas"."Vendedor";
$$;


ALTER PROCEDURE "Subastas"."Select_Vendedor"() OWNER TO postgres;


--
-- TOC entry 217 (class 1255 OID 32779)
-- Name: Update_Admin(integer, character varying, character varying); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Update_Admin"(id_a integer, new_alias character varying, new_password character varying)
    LANGUAGE sql
    AS $$
UPDATE "Subastas"."Administrador"
	SET "Alias"=New_Alias, "Password"=New_Password
	WHERE LENGTH(new_alias) < 21 AND LENGTH(new_password) >= 8 AND LENGTH(new_password) < 16 AND "Subastas"."Administrador"."ID_Administrador" = id_a;
$$;


ALTER PROCEDURE "Subastas"."Update_Admin"(id_a integer, new_alias character varying, new_password character varying) OWNER TO postgres;

--
-- TOC entry 216 (class 1255 OID 40982)
-- Name: Update_Busqueda(integer, name, name); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Update_Busqueda"("ID_B" integer, "CP" name, "CS" name)
    LANGUAGE sql
    AS $$
UPDATE "Subastas"."Busqueda"
	SET "CategoriaPrimaria"="CP", "CategoriaSecundaria"="CS"
	WHERE "ID_B"="ID_Busqueda";
$$;


ALTER PROCEDURE "Subastas"."Update_Busqueda"("ID_B" integer, "CP" name, "CS" name) OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 40986)
-- Name: Update_Clasificacion(integer, integer, integer, integer, text); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Update_Clasificacion"("ID_C" integer, "FK_V" integer, "FK_C" integer, "Punt" integer, "Desc" text)
    LANGUAGE sql
    AS $$
UPDATE "Subastas"."Clasificacion"
	SET "ID_Clasificacion"="ID_C", "ForeignKey_Vendedor"="FK_V", "ForeignKey_Comprador"="FK_C", "Puntaje"="Punt", "Descripcion"="Desc"
	WHERE "ID_C" = "ID_Clasificacion";
$$;


ALTER PROCEDURE "Subastas"."Update_Clasificacion"("ID_C" integer, "FK_V" integer, "FK_C" integer, "Punt" integer, "Desc" text) OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 41081)
-- Name: Update_Comprador(integer, name, name, character[], numeric, integer, character[]); Type: PROCEDURE; Schema: Subastas; Owner: postgres
--

CREATE PROCEDURE "Subastas"."Update_Comprador"("ID_C" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[])
    LANGUAGE sql
    AS $_$
DO $$
IF LENGTH("New_Alias") < 21 AND LENGTH("New_Password") >= 8 AND LENGTH("New_Password") < 16 THEN
UPDATE "Subastas"."Comprador"
	SET "CorreoElectronico"="CE", "Nombre"="Nom", "Alias"="New_Alias", "Telefono"="Tel", "ForeignKey_Administrador"="FK_A", "Password"="New_Password"
	WHERE "ID_C" = "ID_Participante";
END IF;
END $$
$_$;


ALTER PROCEDURE "Subastas"."Update_Comprador"("ID_C" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[]) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

-- Participante
CREATE PROCEDURE "Subastas"."Update_Participante"("ID_P" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[])
    LANGUAGE sql
    AS $_$
DO $$
IF LENGTH("New_Alias") < 21 AND LENGTH("New_Password") >= 8 AND LENGTH("New_Password") < 16 THEN
UPDATE "Subastas"."Participante"
	SET "CorreoElectronico"="CE", "Nombre"="Nom", "Alias"="New_Alias", "Telefono"="Tel", "ForeignKey_Administrador"="FK_A", "Password"="New_Password"
	WHERE "ID_P" = "ID_Participante";
END IF;
END $$
$_$;

	
ALTER PROCEDURE "Subastas"."Update_Participante"("ID_P" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[]) OWNER TO postgres;

-- Puja
CREATE PROCEDURE "Subastas"."Update_Puja"("ID_P" integer, "Ofr" numeric, "fecha" date, "FK_S" integer, "FK_C" integer)
    LANGUAGE sql
    AS $$
UPDATE "Subastas"."Puja"
	SET "ID_Puja"="ID_P", "Ofrecido"="Ofr", "Fecha"="fecha", "ForeignKey_Subasta"="FK_S", "ForeignKey_Comprador"="FK_C"
	WHERE "ID_P" = "ID_Puja";
$$;


ALTER PROCEDURE "Subastas"."Update_Puja"("ID_P" integer, "Ofrecido" numeric, "fecha" date, "FK_S" integer, "FK_C" integer) OWNER TO postgres;

-- Subasta
CREATE PROCEDURE "Subastas"."Update_Subasta"("ID_S" integer, "Img" oid, "Descr" text, "DetEntrega" text, "Precio" numeric, "FechaI" date, "FechaF" date, "FK_V" integer, "FK_B" integer)
    LANGUAGE sql
    AS $$
UPDATE "Subastas"."Subasta"
	SET "ID_Subasta"="ID_S", "Imagen"="Img", "Descripcion"="Descr", "DetallesEntrega"="DetEntrega", "PrecioBase"="Precio", "FechaInicio"="FechaI", "FechaFinal"="FechaF", "ForeignKey_Vendedor"="FK_V", "ForeignKey_Busqueda"="FK_B"
	WHERE "ID_S"="ID_Subasta";
$$;


ALTER PROCEDURE "Subastas"."Update_Subasta"("ID_S" integer, "Img" oid, "Descr" text, "DetEntrega" text, "Precio" numeric, "FechaI" date, "FechaF" date, "FK_V" integer, "FK_B" integer) OWNER TO postgres;

-- Vendedor
CREATE PROCEDURE "Subastas"."Update_Vendedor"("ID_P" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[], "Pun" numeric)
    LANGUAGE sql
    AS $_$
DO $$
IF LENGTH("New_Alias") < 21 AND LENGTH("New_Password") >= 8 AND LENGTH("New_Password") < 16 THEN
UPDATE "Subastas"."Vendedor"
	SET "CorreoElectronico"="CE", "Nombre"="Nom", "Alias"="New_Alias", "Telefono"="Tel", "ForeignKey_Administrador"="FK_A", "Password"="New_Password", "PuntajeClasificacion"="Pun"
	WHERE "ID_P" = "ID_Participante";
END IF;
END $$
$_$;


ALTER PROCEDURE "Subastas"."Update_Vendedor"("ID_P" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[], "Pun" numeric) OWNER TO postgres;


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
    "ForeignKey_Administrador" integer NOT NULL,
    "Password" character(15)[] NOT NULL
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
-- TOC entry 3065 (class 0 OID 24596)
-- Dependencies: 201
-- Data for Name: Administrador; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Administrador" ("ID_Administrador", "Alias", "Password") FROM stdin;
\.


--
-- TOC entry 3064 (class 0 OID 24588)
-- Dependencies: 200
-- Data for Name: Busqueda; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Busqueda" ("ID_Busqueda", "CategoriaPrimaria", "CategoriaSecundaria") FROM stdin;
1	CategoriaPrimaria	CategoriaSecundaria
2	Antigüedades	Antigüedades
3	Antigüedades	Arquitectónico y jardín
4	Antigüedades	Antigüedades de Asia
5	Antigüedades	Libros y manuscritos
6	Antigüedades	Artes decorativas
7	Antigüedades	Etnográfico
8	Antigüedades	Muebles
9	Antigüedades	Hogar y chimeneas
10	Antigüedades	Linos y textiles (antes de 1930)
11	Antigüedades	Mapas, atlas y globos terráqueos
12	Antigüedades	Marítimo
13	Antigüedades	Mercantil, comercio y fábricas
14	Antigüedades	Instrumentos musicales (antes de 1930)
15	Antigüedades	Épocas y estilos
16	Antigüedades	Primitivos
17	Antigüedades	Restauración y cuidado
18	Antigüedades	Alfombras y tapetes
19	Antigüedades	Ciencia y medicina (antes de 1930)
20	Antigüedades	Costura (antes de 1930)
21	Antigüedades	Plateado
22	Antigüedades	Réplicas de antigüedades
23	Antigüedades	Otros
24	Arte	Directo del artista
25	Arte	Arte de anticuarios y revendedores
26	Arte	Lotes al por mayor
27	Bebés	Artículos para bebé
28	Bebés	Seguridad y salud del bebé
29	Bebés	Baño y aseo
30	Bebés	Asientos de seguridad para autos
31	Bebés	Pañales
32	Bebés	Alimentación
33	Bebés	Recuerdos y anuncios de nacimiento
34	Bebés	Ropa de cama para niños
35	Bebés	Decoración de habitaciones de bebé
36	Bebés	Muebles para bebés
37	Bebés	Dejar los pañales
38	Bebés	Coches para bebés
39	Bebés	Accesorios para coches
40	Bebés	Juguetes para bebés
41	Bebés	Otros
42	Libros	Accesorios
43	Libros	Antigüedades y piezas de colección
44	Libros	Libro en audio
45	Libros	Catálogos
46	Libros	Niños y adultos jóvenes
47	Libros	Libros de cocina
48	Libros	Ficción y literatura
49	Libros	Publicaciones anteriores de revistas
50	Libros	No ficción
51	Libros	Libros de textos, educación
52	Libros	Otros
53	Equipo y maquinaria industrial	Agricultura y silvicultura
54	Equipo y maquinaria industrial	Construcción
55	Equipo y maquinaria industrial	Equipo eléctrico y de prueba
56	Equipo y maquinaria industrial	Combustible y energía
57	Equipo y maquinaria industrial	Cuidado de salud y laboratorio
58	Equipo y maquinaria industrial	Equipo pesado
59	Equipo y maquinaria industrial	Accesorios de equipo pesado
60	Equipo y maquinaria industrial	Piezas y accesorios de equipo pesado
61	Equipo y maquinaria industrial	Equipo ligero y herramientas
62	Equipo y maquinaria industrial	Manufactura y metalurgia
63	Equipo y maquinaria industrial	Suministro industrial y MRO
64	Equipo y maquinaria industrial	Oficina
65	Equipo y maquinaria industrial	Empaque y envío
66	Equipo y maquinaria industrial	Artes gráficas y de impresión
67	Equipo y maquinaria industrial	Restaurante y catering
68	Equipo y maquinaria industrial	Sitios en internet y negocios en venta
69	Equipo y maquinaria industrial	Otros
70	Cámaras y fotografía	Binoculares y telescopios
71	Cámaras y fotografía	Drones con cámaras
72	Cámaras y fotografía	Cámara de video
73	Cámaras y fotografía	Cámaras digitales
74	Cámaras y fotografía	Accesorios de cámaras y fotografía
75	Cámaras y fotografía	Marcos de fotos digitales
76	Cámaras y fotografía	Fotografía de película
77	Cámaras y fotografía	Flashes y accesorios
78	Cámaras y fotografía	Lentes y filtros
79	Cámaras y fotografía	Iluminación y estudio
80	Cámaras y fotografía	Manuales y guías
81	Cámaras y fotografía	Piezas y herramientas de repuesto
82	Cámaras y fotografía	Trípodes y soportes
83	Cámaras y fotografía	Edición y producción de video
84	Cámaras y fotografía	Fotografías y películas vintage
85	Cámaras y fotografía	Lotes al por mayor
86	Cámaras y fotografía	Otros
87	Teléfonos celulares y accesorios	Celulares y smartphones
88	Teléfonos celulares y accesorios	Relojes inteligentes
89	Teléfonos celulares y accesorios	Accesorios para teléfonos celulares
90	Teléfonos celulares y accesorios	Teléfonos con display
91	Teléfonos celulares y accesorios	Tarjetas SIM y tarjetas telefónicas
92	Teléfonos celulares y accesorios	Piezas y herramientas de repuesto
93	Teléfonos celulares y accesorios	Otros
94	Ropa, zapatos y accesorios	Ropa de infantes y bebés
95	Ropa, zapatos y accesorios	Vestuario, zapatos y accesorios de niños
96	Ropa, zapatos y accesorios	Disfraces, representación, teatro
97	Ropa, zapatos y accesorios	Ropa étnica y cultural
98	Ropa, zapatos y accesorios	Trajes de baile
99	Ropa, zapatos y accesorios	Accesorios para hombre
100	Ropa, zapatos y accesorios	Ropa para hombre
101	Ropa, zapatos y accesorios	Zapatos para hombres
102	Ropa, zapatos y accesorios	Uniformes y ropa de trabajo
103	Ropa, zapatos y accesorios	Vestuario, zapatos y accesorios unisex
104	Ropa, zapatos y accesorios	Boda y ocasión formal
105	Ropa, zapatos y accesorios	Accesorios para mujer
106	Ropa, zapatos y accesorios	Ropa para mujer
107	Ropa, zapatos y accesorios	Carteras y bolsos de mujer
108	Ropa, zapatos y accesorios	Calzado de mujer
109	Ropa, zapatos y accesorios	Vintage
110	Ropa, zapatos y accesorios	Lotes grandes y pequeños al por mayor
111	Monedas y billetes	En lingotes
112	Monedas y billetes	Monedas: EE. UU.
113	Monedas y billetes	Monedas: Canadá
114	Monedas y billetes	Monedas: antiguas
115	Monedas y billetes	Monedas: Edad Media
116	Monedas y billetes	Monedas: del mundo
117	Monedas y billetes	Objetos numismáticos
118	Monedas y billetes	Billetes: EE. UU.
119	Monedas y billetes	Billetes del mundo
120	Monedas y billetes	Publicaciones y suministros
121	Monedas y billetes	Acciones y bonos, escripofilia
122	Monedas y billetes	Divisa virtual
123	Monedas y billetes	Otros
124	Artículos de colección	Publicidad
125	Artículos de colección	Animales
126	Artículos de colección	Dibujos animados y personajes
127	Artículos de colección	Salas de juegos, rocolas y pinball
128	Artículos de colección	Autógrafos
129	Artículos de colección	Bancos, registros y ventas
130	Artículos de colección	Artículos de bar
131	Artículos de colección	Cuentas
132	Artículos de colección	Botellas y aisladores
133	Artículos de colección	Breweriana, cerveza
134	Artículos de colección	Casino
135	Artículos de colección	Relojes
136	Artículos de colección	Cómics
137	Artículos de colección	Culturas y etnias
138	Artículos de colección	Adornos de colección
139	Artículos de colección	Disneyana
140	Artículos de colección	Fantasía, míticos y magia
141	Artículos de colección	Memorabilia histórica
142	Artículos de colección	Festivo y de temporada
143	Artículos de colección	Cocina y hogar
144	Artículos de colección	Cuchillos, espadas y cuchillas
145	Artículos de colección	Lámparas, luces
146	Artículos de colección	Ropa blanca y telas (1930 - presente)
147	Artículos de colección	Objetos de metal
148	Artículos de colección	Militaria
149	Artículos de colección	Papel
150	Artículos de colección	Bolígrafos e instrumentos para escribir
151	Artículos de colección	Pez, llaveros, vasos promocionales
152	Artículos de colección	Imágenes fotográficas
153	Artículos de colección	Prendedores, cabezones, loncheras
154	Artículos de colección	Postales
155	Artículos de colección	Radio, fonógrafo, televisión, teléfono
156	Artículos de colección	Religión y espiritualidad
157	Artículos de colección	Rocas, fósiles y minerales
158	Artículos de colección	Ciencia ficción y horror
159	Artículos de colección	Ciencia y medicina (1930 - presente)
160	Artículos de colección	Costura (1930 - presente)
161	Artículos de colección	Recuerdos y memorabilia de viajes
162	Artículos de colección	Productos relacionados con el tabaco
163	Artículos de colección	Herramientas y cerraduras
164	Artículos de colección	Tarjetas de colección
165	Artículos de colección	Transporte
166	Artículos de colección	Tocador, perfume y productos de afeitar
167	Artículos de colección	Vintage, retro, de mediados de siglo
168	Computadoras, tablets y redes	iPads, tablets y lectores electrónicos
169	Computadoras, tablets y redes	Accesorios para iPad/Tableta/eBook
170	Computadoras, tablets y redes	Tablet & eBook Reader Parts
171	Computadoras, tablets y redes	Laptops y netbooks
172	Computadoras, tablets y redes	Computadoras y todo en uno
173	Computadoras, tablets y redes	Accs. para laptops y comp. de escritorio
174	Computadoras, tablets y redes	Cables y conectores
175	Computadoras, tablets y redes	Partes y componentes de computadora
176	Computadoras, tablets y redes	Unidades de disco, almacenamiento y discos en blanco
177	Computadoras, tablets y redes	Redes y servidores empresariales
178	Computadoras, tablets y redes	Red y conectividad doméstica
179	Computadoras, tablets y redes	Teclados, mouses y punteros
180	Computadoras, tablets y redes	Monitores, proyectores y accesorios
181	Computadoras, tablets y redes	Protección, distribución de alimentación
182	Computadoras, tablets y redes	Impresoras, escáneres y suministros
183	Computadoras, tablets y redes	Software
184	Computadoras, tablets y redes	Manuales y recursos
185	Computadoras, tablets y redes	Informática vintage
186	Computadoras, tablets y redes	Otros
187	Artículos electrónicos	Audio portátil y audífonos
188	Artículos electrónicos	Televisor, video y audio para el hogar
189	Artículos electrónicos	Sistemas electrónicos del vehículo y GPS
190	Artículos electrónicos	Sistemas de automatización (domótica)
191	Artículos electrónicos	Vigilancia residencial
192	Artículos electrónicos	Teléfonos para el hogar
193	Artículos electrónicos	Baterías y energías multiusos
194	Artículos electrónicos	Comunicación por radio
195	Artículos electrónicos	Artefactos y otros sistemas electrónicos
196	Artículos electrónicos	Sistemas electrónicos vintage
197	Artesanías	Materiales para arte
198	Artesanías	Cuentas y fabricación de joyas
199	Artesanías	Vidrio y mosaicos
200	Artesanías	Piezas de artesanía y acabadas
201	Artesanías	Artes y artesanías para el hogar
202	Artesanías	Artesanías infantiles
203	Artesanías	Materiales multiusos para artesanía
204	Artesanías	Artesanías con agujas e hilos
205	Artesanías	Colec. de recortes y artesanías de papel
206	Artesanías	Costura y tela
207	Artesanías	Timbres y gofrados
208	Artesanías	Otras artesanías
209	Muñecas y osos	Materiales para hacer osos
210	Muñecas y osos	Osos
211	Muñecas y osos	Muñecas
212	Muñecas y osos	Miniaturas para casas de muñeca
213	Muñecas y osos	Muñecas de papel
214	Películas y DVD	DVD y Blu-ray
215	Películas y DVD	Película fotográfica
216	Películas y DVD	Discos láser
217	Películas y DVD	UMD
218	Películas y DVD	Cintas VHS
219	Películas y DVD	Otros formatos
220	Películas y DVD	Almacenamiento y accesorios para videos
221	Vehículos	Vehículos y camionetas
222	Vehículos	Motocicletas
223	Vehículos	Otros vehículos y remolques
224	Vehículos	Botes
225	Vehículos	Vehículos de aventura, recreativos
226	Vehículos	Partes y accesorios
227	Memorabilia de entretenimiento	Autógrafos-original
228	Memorabilia de entretenimiento	Autógrafos-reimpresos
229	Memorabilia de entretenimiento	Memorabilia de películas
230	Memorabilia de entretenimiento	Memorabilia de música
231	Memorabilia de entretenimiento	Memorabilia de televisión
232	Memorabilia de entretenimiento	Memorabilia de teatro
233	Memorabilia de entretenimiento	Memorabilia de juegos de video
234	Memorabilia de entretenimiento	Otros
235	Tarjetas de regalo y cupones	Tarjetas de regalo
236	Tarjetas de regalo y cupones	Tarjetas de regalo de eBay
237	Tarjetas de regalo y cupones	Certificados de regalo
238	Tarjetas de regalo y cupones	Cupones
239	Tarjetas de regalo y cupones	Productos digitales
240	Belleza y salud	Cuerpo y baño
241	Belleza y salud	Suplementos alimenticios, nutrición
242	Belleza y salud	Fragancias
243	Belleza y salud	Cuidado del cabello y peinado
244	Belleza y salud	Cuidado de la salud
245	Belleza y salud	Maquillaje
246	Belleza y salud	Masaje
247	Belleza y salud	Medicina, movilidad y discapacidad
248	Belleza y salud	Cuidado de las uñas, manicure y pedicure
249	Belleza y salud	Remedios naturales y homeopáticos
250	Belleza y salud	Higiene bucal
251	Belleza y salud	Medicamentos de venta libre
252	Belleza y salud	Equipo de spa y salón
253	Belleza y salud	Afeitado y depilación
254	Belleza y salud	Cuidado de la piel
255	Belleza y salud	Protección solar y bronceador
256	Belleza y salud	Tatuajes y arte corporal
257	Belleza y salud	Cuidado de la vista
258	Belleza y salud	Control de peso
259	Belleza y salud	Lotes al por mayor
260	Belleza y salud	Otros
261	Casa y jardín	Baño
262	Casa y jardín	Ropa de cama
263	Casa y jardín	Comida y bebidas
264	Casa y jardín	Flores naturales y suministros
265	Casa y jardín	Muebles
266	Casa y jardín	Tarjetas y suministros para fiestas
267	Casa y jardín	Decoración festiva y de temporada
268	Casa y jardín	Decoración para el hogar
269	Casa y jardín	Artículos para mejoras del hogar
270	Casa y jardín	Materiales de limpieza para el hogar
271	Casa y jardín	Niños y adolescentes
272	Casa y jardín	Cocina, comedor y bar
273	Casa y jardín	Lámparas, luces y ventiladores de techo
274	Casa y jardín	Electrodomésticos grandes
275	Casa y jardín	Alfombras y tapetes
276	Casa y jardín	Herramientas
277	Casa y jardín	Suministros para soldadura
278	Casa y jardín	Decoración y herrajes para ventanas
279	Casa y jardín	Patio, jardín y espacios abiertos
280	Casa y jardín	Lotes al por mayor
281	Casa y jardín	Otros
282	Joyería y relojes	Joyas infantiles
283	Joyería y relojes	Compromiso y boda
284	Joyería y relojes	Étnicos, regionales y tribales
285	Joyería y relojes	Joyas de moda
286	Joyería y relojes	Joyería fina
287	Joyería y relojes	Joyas artesanales, hechas a mano
288	Joyería y relojes	Joyeros y organizadores de joyas
289	Joyería y relojes	Diseño y reparación de joyas
290	Joyería y relojes	Cuentas sueltas
291	Joyería y relojes	Diamantes y gemas sueltos
292	Joyería y relojes	Joyas para hombres
293	Joyería y relojes	Joyas vintage y antiguas
294	Joyería y relojes	Relojes
295	Joyería y relojes	Otros
296	Música	Casetes
297	Música	CD
298	Música	Discos
299	Música	Otros formatos
300	Música	Almacenamiento y accesorios para videos
301	Música	Lotes al por mayor
302	Instrumentos y equipos musicales	Acordeones y concertinas
303	Instrumentos y equipos musicales	Latón
304	Instrumentos y equipos musicales	Equipo
305	Instrumentos y equipos musicales	Guitarra
306	Instrumentos y equipos musicales	Armónica
307	Instrumentos y equipos musicales	Libros, CD y videos de instrucciones
308	Instrumentos y equipos musicales	Karaoke
309	Instrumentos y equipos musicales	Percusión
310	Instrumentos y equipos musicales	Pianos, órganos y teclados
311	Instrumentos y equipos musicales	Equipo de audio profesional
312	Instrumentos y equipos musicales	Partituras y cancioneros
313	Instrumentos y equipos musicales	Iluminación y efectos de escenario
314	Instrumentos y equipos musicales	Cuerdas
315	Instrumentos y equipos musicales	Instrumentos de viento-madera
316	Instrumentos y equipos musicales	Lotes al por mayor
317	Instrumentos y equipos musicales	Otros
318	Productos para mascotas	Aves de corral
319	Productos para mascotas	Aves
320	Productos para mascotas	Gatos
321	Productos para mascotas	Perros
322	Productos para mascotas	Peces y acuarios
323	Productos para mascotas	Caballos
324	Productos para mascotas	Reptiles
325	Productos para mascotas	Animales pequeños
326	Productos para mascotas	Lápidas y urnas
327	Productos para mascotas	Otros
328	Cerámica y vidrio	Vidrio
329	Cerámica y vidrio	Cerámica y porcelana
330	Bienes raíces	Comerciales
331	Bienes raíces	Terreno
332	Bienes raíces	Casas prefabricadas
333	Bienes raíces	Residenciales
334	Bienes raíces	Tiempos compartidos a la venta
335	Bienes raíces	Otros bienes raíces
336	Servicios especiales	Servicios artísticos
337	Servicios especiales	Ropa y joyería a la medida
338	Servicios especiales	Servicios de subastas de eBay
339	Servicios especiales	Diseño gráfico y de logotipos
340	Servicios especiales	Servicios para mejoras del hogar
341	Servicios especiales	Servicios basados en artículos
342	Servicios especiales	Edición y duplicado de medios
343	Servicios especiales	Impresión y personalización
344	Servicios especiales	Restauración y reparación
345	Servicios especiales	Servicios Web e informáticos
346	Servicios especiales	Otros servicios
347	Artículos deportivos	Boxeo, artes marciales y artes marciales mixtas (MMA)
348	Artículos deportivos	Ciclismo
349	Artículos deportivos	Pesca
350	Artículos deportivos	Fitness, running y yoga
351	Artículos deportivos	Golf
352	Artículos deportivos	Cacería
353	Artículos deportivos	Juegos en interiores
354	Artículos deportivos	Deportes al aire libre
355	Artículos deportivos	Deportes de equipo
356	Artículos deportivos	Tenis y deportes con raqueta
357	Artículos deportivos	Deportes acuáticos
358	Artículos deportivos	Deportes de invierno
359	Artículos deportivos	Otros
360	Artículos deportivos	Lotes al por mayor
361	Memorabilia de deporte, tarjetas, fans	Autógrafos (original)
362	Memorabilia de deporte, tarjetas, fans	Autógrafos (reimpresos)
363	Memorabilia de deporte, tarjetas, fans	Tarjetas
364	Memorabilia de deporte, tarjetas, fans	Ropa para aficionados y recuerdos
365	Memorabilia de deporte, tarjetas, fans	Memorabilia de juegos usada
366	Memorabilia de deporte, tarjetas, fans	Autenticada por el fabricante
367	Memorabilia de deporte, tarjetas, fans	Memorabilia de deportes antigua
368	Memorabilia de deporte, tarjetas, fans	Lotes al por mayor
369	Estampillas	Estados Unidos
370	Estampillas	Canadá
371	Estampillas	Gran Bretaña
372	Estampillas	África
373	Estampillas	Asia
374	Estampillas	Australia y Oceanía
375	Estampillas	Colonias británicas y territorios
376	Estampillas	Caribe
377	Estampillas	Europa
378	Estampillas	Latinoamérica
379	Estampillas	Oriente Medio
380	Estampillas	Mundiales
381	Estampillas	Estampillas tropicales
382	Estampillas	Filatelia especializada
383	Estampillas	Publicaciones y suministros
384	Estampillas	Otros
385	Boletos y experiencias	Boletos para deportes
386	Boletos y experiencias	Boletos para conciertos
387	Boletos y experiencias	Boletos para el teatro
388	Boletos y experiencias	Pases para parques temáticos y clubes
389	Boletos y experiencias	Pases de estacionamiento
390	Boletos y experiencias	Experiencias especiales
391	Boletos y experiencias	Otros
392	Juguetes y pasatiempos	Figuras de acción
393	Juguetes y pasatiempos	Afelpados con pelotas de semillas
394	Juguetes y pasatiempos	Juguetes de construcción
395	Juguetes y pasatiempos	Juguetes clásicos
396	Juguetes y pasatiempos	Vehículos de presofusión y de juguete
397	Juguetes y pasatiempos	Educativos
398	Juguetes y pasatiempos	Electrónicos, baterías y a cuerda
399	Juguetes y pasatiempos	Juguetes de comida rápida y cereales
400	Juguetes y pasatiempos	Juegos
401	Juguetes y pasatiempos	Canicas
402	Juguetes y pasatiempos	Modelos de ferrocarriles y trenes
403	Juguetes y pasatiempos	Modelos y juegos
404	Juguetes y pasatiempos	Juguetes y estructuras para exterior
405	Juguetes y pasatiempos	Juguetes preescolares y juegos de roles
406	Juguetes y pasatiempos	Rompecabezas
407	Juguetes y pasatiempos	Control por radio y mando
408	Juguetes y pasatiempos	Robots, monstruos y juguetes del espacio
409	Juguetes y pasatiempos	Automóviles con ranuras
410	Juguetes y pasatiempos	Animales de peluche
411	Juguetes y pasatiempos	Soldados de juguete
412	Juguetes y pasatiempos	Juegos de cartas intercambiables
413	Juguetes y pasatiempos	Juguetes de personajes, TV y películas
414	Juguetes y pasatiempos	Juguetes antiguos
415	Viaje	Línea aérea
416	Viaje	Camping y casas rodantes
417	Viaje	Alquiler de automóviles
418	Viaje	Cruceros
419	Viaje	Alojamiento
420	Viaje	Equipaje
421	Viaje	Accesorios para equipaje
422	Viaje	Mapas
423	Viaje	Ferrocarril
424	Viaje	Accesorios de viaje
425	Viaje	Paquetes de vacaciones
426	Viaje	Otros
427	Videojuegos y consolas	Videojuegos
428	Videojuegos y consolas	Consolas de videojuego
429	Videojuegos y consolas	Accesorios de videojuegos
430	Videojuegos y consolas	Tarjetas de juego prepagadas
431	Videojuegos y consolas	Piezas y herramientas de repuesto
432	Videojuegos y consolas	Guías de estrategia y trampas
433	Videojuegos y consolas	Productos de videojuegos
434	Videojuegos y consolas	Otros
435	Todo lo demás	Solo para adultos
436	Todo lo demás	Desarrollo profesional y educación
437	Todo lo demás	Ofertas especiales de eBay
438	Todo lo demás	Herramientas de usuario de eBay
439	Todo lo demás	Funeral y cementerio
440	Todo lo demás	Genealogía
441	Todo lo demás	Productos de información
442	Todo lo demás	Metafísica
443	Todo lo demás	Desarrollo personal
444	Todo lo demás	Seguridad personal
445	Todo lo demás	Productos y suministros religiosos
446	Todo lo demás	Programa de puntos e incentivos
447	Todo lo demás	Artículos extraños
448	Todo lo demás	Otros
\.


--
-- TOC entry 3072 (class 0 OID 24771)
-- Dependencies: 208
-- Data for Name: Clasificacion; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Clasificacion" ("ID_Clasificacion", "ForeignKey_Vendedor", "ForeignKey_Comprador", "Puntaje", "Descripcion") FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 24624)
-- Dependencies: 204
-- Data for Name: Comprador; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Comprador" ("ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador", "Password") FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 24604)
-- Dependencies: 202
-- Data for Name: Participante; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Participante" ("ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador", "Password") FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 24807)
-- Dependencies: 210
-- Data for Name: Puja; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Puja" ("ID_Puja", "Ofrecido", "Fecha", "ForeignKey_Subasta", "ForeignKey_Comprador") FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 24789)
-- Dependencies: 209
-- Data for Name: Subasta; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Subasta" ("ID_Subasta", "Imagen", "Descripcion", "DetallesEntrega", "PrecioBase", "FechaInicio", "FechaFinal", "ForeignKey_Vendedor", "ForeignKey_Busqueda") FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 24618)
-- Dependencies: 203
-- Data for Name: Vendedor; Type: TABLE DATA; Schema: Subastas; Owner: postgres
--

COPY "Subastas"."Vendedor" ("ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador", "PuntajeClasificacion", "Password") FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 205
-- Name: Administrador_ID_Administrador_seq; Type: SEQUENCE SET; Schema: Subastas; Owner: postgres
--

SELECT pg_catalog.setval('"Subastas"."Administrador_ID_Administrador_seq"', 1, false);


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 206
-- Name: Busqueda_ID_Busqueda_seq; Type: SEQUENCE SET; Schema: Subastas; Owner: postgres
--

SELECT pg_catalog.setval('"Subastas"."Busqueda_ID_Busqueda_seq"', 448, true);


--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 207
-- Name: Participante_ID_Participante_seq; Type: SEQUENCE SET; Schema: Subastas; Owner: postgres
--

SELECT pg_catalog.setval('"Subastas"."Participante_ID_Participante_seq"', 1, false);


--
-- TOC entry 2909 (class 2606 OID 24702)
-- Name: Administrador Administrador_pkey; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Administrador"
    ADD CONSTRAINT "Administrador_pkey" PRIMARY KEY ("ID_Administrador");


--
-- TOC entry 2905 (class 2606 OID 24715)
-- Name: Busqueda Busqueda_pkey; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Busqueda"
    ADD CONSTRAINT "Busqueda_pkey" PRIMARY KEY ("ID_Busqueda");


--
-- TOC entry 2911 (class 2606 OID 24770)
-- Name: Administrador ID_A; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Administrador"
    ADD CONSTRAINT "ID_A" UNIQUE ("ID_Administrador");


--
-- TOC entry 2907 (class 2606 OID 24768)
-- Name: Busqueda ID_B; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Busqueda"
    ADD CONSTRAINT "ID_B" UNIQUE ("ID_Busqueda");


--
-- TOC entry 2918 (class 2606 OID 24766)
-- Name: Comprador ID_C; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Comprador"
    ADD CONSTRAINT "ID_C" UNIQUE ("ID_Participante");


--
-- TOC entry 2920 (class 2606 OID 24778)
-- Name: Clasificacion ID_Cl; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Clasificacion"
    ADD CONSTRAINT "ID_Cl" PRIMARY KEY ("ID_Clasificacion");


--
-- TOC entry 2924 (class 2606 OID 24816)
-- Name: Puja ID_P; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "ID_P" UNIQUE ("ID_Puja") INCLUDE ("ID_Puja");


--
-- TOC entry 2922 (class 2606 OID 24796)
-- Name: Subasta ID_S; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Subasta"
    ADD CONSTRAINT "ID_S" PRIMARY KEY ("ID_Subasta");


--
-- TOC entry 2916 (class 2606 OID 24764)
-- Name: Vendedor ID_V; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Vendedor"
    ADD CONSTRAINT "ID_V" UNIQUE ("ID_Participante");


--
-- TOC entry 2913 (class 2606 OID 24723)
-- Name: Participante Participante_pkey; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Participante"
    ADD CONSTRAINT "Participante_pkey" PRIMARY KEY ("ID_Participante");


--
-- TOC entry 2926 (class 2606 OID 24814)
-- Name: Puja Puja_pkey; Type: CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "Puja_pkey" PRIMARY KEY ("ID_Puja");


--
-- TOC entry 2914 (class 1259 OID 24664)
-- Name: fki_FK_Admin; Type: INDEX; Schema: Subastas; Owner: postgres
--

CREATE INDEX "fki_FK_Admin" ON "Subastas"."Participante" USING btree ("ForeignKey_Administrador");


--
-- TOC entry 2927 (class 2606 OID 24703)
-- Name: Participante FK_Admin; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Participante"
    ADD CONSTRAINT "FK_Admin" FOREIGN KEY ("ForeignKey_Administrador") REFERENCES "Subastas"."Administrador"("ID_Administrador") NOT VALID;


--
-- TOC entry 2931 (class 2606 OID 24802)
-- Name: Subasta FK_Busqueda; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Subasta"
    ADD CONSTRAINT "FK_Busqueda" FOREIGN KEY ("ForeignKey_Busqueda") REFERENCES "Subastas"."Busqueda"("ID_Busqueda");


--
-- TOC entry 2929 (class 2606 OID 24784)
-- Name: Clasificacion FK_Comprador; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Clasificacion"
    ADD CONSTRAINT "FK_Comprador" FOREIGN KEY ("ForeignKey_Comprador") REFERENCES "Subastas"."Comprador"("ID_Participante");


--
-- TOC entry 2932 (class 2606 OID 24817)
-- Name: Puja FK_Comprador; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "FK_Comprador" FOREIGN KEY ("ForeignKey_Comprador") REFERENCES "Subastas"."Comprador"("ID_Participante");


--
-- TOC entry 2933 (class 2606 OID 24822)
-- Name: Puja FK_Subasta; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "FK_Subasta" FOREIGN KEY ("ForeignKey_Subasta") REFERENCES "Subastas"."Subasta"("ID_Subasta");


--
-- TOC entry 2928 (class 2606 OID 24779)
-- Name: Clasificacion FK_Vendedor; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Clasificacion"
    ADD CONSTRAINT "FK_Vendedor" FOREIGN KEY ("ForeignKey_Vendedor") REFERENCES "Subastas"."Vendedor"("ID_Participante");


--
-- TOC entry 2930 (class 2606 OID 24797)
-- Name: Subasta FK_Vendedor; Type: FK CONSTRAINT; Schema: Subastas; Owner: postgres
--

ALTER TABLE ONLY "Subastas"."Subasta"
    ADD CONSTRAINT "FK_Vendedor" FOREIGN KEY ("ForeignKey_Vendedor") REFERENCES "Subastas"."Vendedor"("ID_Participante");


-- Completed on 2021-04-16 12:48:36

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-16 12:48:36

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


-- Completed on 2021-04-16 12:48:36

--
-- PostgreSQL database dump complete
--

-- Completed on 2021-04-16 12:48:36

--
-- PostgreSQL database cluster dump complete
--

