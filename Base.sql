PGDMP                         y            Progra_1    13.2    13.2 4    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24586    Progra_1    DATABASE     n   CREATE DATABASE "Progra_1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "Progra_1";
                postgres    false            �           0    0    DATABASE "Progra_1"    COMMENT     D   COMMENT ON DATABASE "Progra_1" IS 'Base de datos para la progra 1';
                   postgres    false    3068            �           0    0    Progra_1    DATABASE PROPERTIES     N   ALTER ROLE "User" IN DATABASE "Progra_1" SET transaction_read_only TO 'true';
                     postgres    false                        2615    24587    Subastas    SCHEMA        CREATE SCHEMA "Subastas";
    DROP SCHEMA "Subastas";
                postgres    false            �            1255    32783    Delete_Admin(integer) 	   PROCEDURE     I  CREATE PROCEDURE "Subastas"."Delete_Admin"("ID_A" integer)
    LANGUAGE sql
    AS $$
UPDATE "Subastas"."Participante" SET "ForeignKey_Administrador" = 0
WHERE "ID_A" = "Subastas"."Participante"."ForeignKey_Administrador";
DELETE FROM "Subastas"."Administrador"
	WHERE "Subastas"."Administrador"."ID_Administrador" = "ID_A";
$$;
 :   DROP PROCEDURE "Subastas"."Delete_Admin"("ID_A" integer);
       Subastas          postgres    false    3            �            1255    32798 ;   Insert_Admin(integer, character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE "Subastas"."Insert_Admin"("New_Alias" integer, "New_Password" character varying, "ID_A" character varying)
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
 {   DROP PROCEDURE "Subastas"."Insert_Admin"("New_Alias" integer, "New_Password" character varying, "ID_A" character varying);
       Subastas          postgres    false    3            �            1255    32780    Select_Admin() 	   PROCEDURE     �   CREATE PROCEDURE "Subastas"."Select_Admin"()
    LANGUAGE sql
    AS $$
SELECT "ID_Administrador", "Alias", "Password"
	FROM "Subastas"."Administrador";
$$;
 ,   DROP PROCEDURE "Subastas"."Select_Admin"();
       Subastas          postgres    false    3            �            1255    32779 ;   Update_Admin(integer, character varying, character varying) 	   PROCEDURE     {  CREATE PROCEDURE "Subastas"."Update_Admin"(id_a integer, new_alias character varying, new_password character varying)
    LANGUAGE sql
    AS $$
UPDATE "Subastas"."Administrador"
	SET "Alias"=New_Alias, "Password"=New_Password
	WHERE LENGTH(new_alias) < 21 AND LENGTH(new_password) >= 8 AND LENGTH(new_password) < 16 AND "Subastas"."Administrador"."ID_Administrador" = id_a;
$$;
 u   DROP PROCEDURE "Subastas"."Update_Admin"(id_a integer, new_alias character varying, new_password character varying);
       Subastas          postgres    false    3            �            1259    24596    Administrador    TABLE     �   CREATE TABLE "Subastas"."Administrador" (
    "ID_Administrador" integer NOT NULL,
    "Alias" name NOT NULL,
    "Password" name NOT NULL
);
 '   DROP TABLE "Subastas"."Administrador";
       Subastas         heap    postgres    false    3            �            1259    24712 "   Administrador_ID_Administrador_seq    SEQUENCE     �   ALTER TABLE "Subastas"."Administrador" ALTER COLUMN "ID_Administrador" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Subastas"."Administrador_ID_Administrador_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Subastas          postgres    false    3    201            �            1259    24588    Busqueda    TABLE     �   CREATE TABLE "Subastas"."Busqueda" (
    "ID_Busqueda" integer NOT NULL,
    "CategoriaPrimaria" name,
    "CategoriaSecundaria" name
);
 "   DROP TABLE "Subastas"."Busqueda";
       Subastas         heap    postgres    false    3            �            1259    24720    Busqueda_ID_Busqueda_seq    SEQUENCE     �   ALTER TABLE "Subastas"."Busqueda" ALTER COLUMN "ID_Busqueda" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Subastas"."Busqueda_ID_Busqueda_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Subastas          postgres    false    3    200            �            1259    24771    Clasificacion    TABLE     �   CREATE TABLE "Subastas"."Clasificacion" (
    "ID_Clasificacion" integer NOT NULL,
    "ForeignKey_Vendedor" integer NOT NULL,
    "ForeignKey_Comprador" integer NOT NULL,
    "Puntaje" integer NOT NULL,
    "Descripcion" text
);
 '   DROP TABLE "Subastas"."Clasificacion";
       Subastas         heap    postgres    false    3            �            1259    24604    Participante    TABLE       CREATE TABLE "Subastas"."Participante" (
    "ID_Participante" integer NOT NULL,
    "CorreoElectronico" name NOT NULL,
    "Nombre" name NOT NULL,
    "Alias" character(20)[] NOT NULL,
    "Telefono" numeric,
    "ForeignKey_Administrador" integer NOT NULL
);
 &   DROP TABLE "Subastas"."Participante";
       Subastas         heap    postgres    false    3            �            1259    24624 	   Comprador    TABLE     N   CREATE TABLE "Subastas"."Comprador" (
)
INHERITS ("Subastas"."Participante");
 #   DROP TABLE "Subastas"."Comprador";
       Subastas         heap    postgres    false    202    3            �            1259    24744     Participante_ID_Participante_seq    SEQUENCE     �   ALTER TABLE "Subastas"."Participante" ALTER COLUMN "ID_Participante" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Subastas"."Participante_ID_Participante_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Subastas          postgres    false    3    202            �            1259    24807    Puja    TABLE     �   CREATE TABLE "Subastas"."Puja" (
    "ID_Puja" integer NOT NULL,
    "Ofrecido" numeric NOT NULL,
    "Fecha" date NOT NULL,
    "ForeignKey_Subasta" integer NOT NULL,
    "ForeignKey_Comprador" integer NOT NULL
);
    DROP TABLE "Subastas"."Puja";
       Subastas         heap    postgres    false    3            �            1259    24789    Subasta    TABLE     ]  CREATE TABLE "Subastas"."Subasta" (
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
 !   DROP TABLE "Subastas"."Subasta";
       Subastas         heap    postgres    false    3            �            1259    24618    Vendedor    TABLE     ~   CREATE TABLE "Subastas"."Vendedor" (
    "PuntajeClasificacion" numeric(5,0) NOT NULL
)
INHERITS ("Subastas"."Participante");
 "   DROP TABLE "Subastas"."Vendedor";
       Subastas         heap    postgres    false    202    3            �          0    24596    Administrador 
   TABLE DATA           V   COPY "Subastas"."Administrador" ("ID_Administrador", "Alias", "Password") FROM stdin;
    Subastas          postgres    false    201   �D       �          0    24588    Busqueda 
   TABLE DATA           c   COPY "Subastas"."Busqueda" ("ID_Busqueda", "CategoriaPrimaria", "CategoriaSecundaria") FROM stdin;
    Subastas          postgres    false    200   �D       �          0    24771    Clasificacion 
   TABLE DATA           �   COPY "Subastas"."Clasificacion" ("ID_Clasificacion", "ForeignKey_Vendedor", "ForeignKey_Comprador", "Puntaje", "Descripcion") FROM stdin;
    Subastas          postgres    false    208   E       �          0    24624 	   Comprador 
   TABLE DATA           �   COPY "Subastas"."Comprador" ("ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador") FROM stdin;
    Subastas          postgres    false    204   %E       �          0    24604    Participante 
   TABLE DATA           �   COPY "Subastas"."Participante" ("ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador") FROM stdin;
    Subastas          postgres    false    202   BE       �          0    24807    Puja 
   TABLE DATA           r   COPY "Subastas"."Puja" ("ID_Puja", "Ofrecido", "Fecha", "ForeignKey_Subasta", "ForeignKey_Comprador") FROM stdin;
    Subastas          postgres    false    210   _E       �          0    24789    Subasta 
   TABLE DATA           �   COPY "Subastas"."Subasta" ("ID_Subasta", "Imagen", "Descripcion", "DetallesEntrega", "PrecioBase", "FechaInicio", "FechaFinal", "ForeignKey_Vendedor", "ForeignKey_Busqueda") FROM stdin;
    Subastas          postgres    false    209   |E       �          0    24618    Vendedor 
   TABLE DATA           �   COPY "Subastas"."Vendedor" ("ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador", "PuntajeClasificacion") FROM stdin;
    Subastas          postgres    false    203   �E       �           0    0 "   Administrador_ID_Administrador_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('"Subastas"."Administrador_ID_Administrador_seq"', 1, false);
          Subastas          postgres    false    205                        0    0    Busqueda_ID_Busqueda_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"Subastas"."Busqueda_ID_Busqueda_seq"', 1, false);
          Subastas          postgres    false    206                       0    0     Participante_ID_Participante_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('"Subastas"."Participante_ID_Participante_seq"', 1, false);
          Subastas          postgres    false    207            Q           2606    24702     Administrador Administrador_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY "Subastas"."Administrador"
    ADD CONSTRAINT "Administrador_pkey" PRIMARY KEY ("ID_Administrador");
 R   ALTER TABLE ONLY "Subastas"."Administrador" DROP CONSTRAINT "Administrador_pkey";
       Subastas            postgres    false    201            M           2606    24715    Busqueda Busqueda_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY "Subastas"."Busqueda"
    ADD CONSTRAINT "Busqueda_pkey" PRIMARY KEY ("ID_Busqueda");
 H   ALTER TABLE ONLY "Subastas"."Busqueda" DROP CONSTRAINT "Busqueda_pkey";
       Subastas            postgres    false    200            S           2606    24770    Administrador ID_A 
   CONSTRAINT     c   ALTER TABLE ONLY "Subastas"."Administrador"
    ADD CONSTRAINT "ID_A" UNIQUE ("ID_Administrador");
 D   ALTER TABLE ONLY "Subastas"."Administrador" DROP CONSTRAINT "ID_A";
       Subastas            postgres    false    201            O           2606    24768    Busqueda ID_B 
   CONSTRAINT     Y   ALTER TABLE ONLY "Subastas"."Busqueda"
    ADD CONSTRAINT "ID_B" UNIQUE ("ID_Busqueda");
 ?   ALTER TABLE ONLY "Subastas"."Busqueda" DROP CONSTRAINT "ID_B";
       Subastas            postgres    false    200            Z           2606    24766    Comprador ID_C 
   CONSTRAINT     ^   ALTER TABLE ONLY "Subastas"."Comprador"
    ADD CONSTRAINT "ID_C" UNIQUE ("ID_Participante");
 @   ALTER TABLE ONLY "Subastas"."Comprador" DROP CONSTRAINT "ID_C";
       Subastas            postgres    false    204            \           2606    24778    Clasificacion ID_Cl 
   CONSTRAINT     i   ALTER TABLE ONLY "Subastas"."Clasificacion"
    ADD CONSTRAINT "ID_Cl" PRIMARY KEY ("ID_Clasificacion");
 E   ALTER TABLE ONLY "Subastas"."Clasificacion" DROP CONSTRAINT "ID_Cl";
       Subastas            postgres    false    208            `           2606    24816 	   Puja ID_P 
   CONSTRAINT     e   ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "ID_P" UNIQUE ("ID_Puja") INCLUDE ("ID_Puja");
 ;   ALTER TABLE ONLY "Subastas"."Puja" DROP CONSTRAINT "ID_P";
       Subastas            postgres    false    210    210            ^           2606    24796    Subasta ID_S 
   CONSTRAINT     \   ALTER TABLE ONLY "Subastas"."Subasta"
    ADD CONSTRAINT "ID_S" PRIMARY KEY ("ID_Subasta");
 >   ALTER TABLE ONLY "Subastas"."Subasta" DROP CONSTRAINT "ID_S";
       Subastas            postgres    false    209            X           2606    24764    Vendedor ID_V 
   CONSTRAINT     ]   ALTER TABLE ONLY "Subastas"."Vendedor"
    ADD CONSTRAINT "ID_V" UNIQUE ("ID_Participante");
 ?   ALTER TABLE ONLY "Subastas"."Vendedor" DROP CONSTRAINT "ID_V";
       Subastas            postgres    false    203            U           2606    24723    Participante Participante_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY "Subastas"."Participante"
    ADD CONSTRAINT "Participante_pkey" PRIMARY KEY ("ID_Participante");
 P   ALTER TABLE ONLY "Subastas"."Participante" DROP CONSTRAINT "Participante_pkey";
       Subastas            postgres    false    202            b           2606    24814    Puja Puja_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "Puja_pkey" PRIMARY KEY ("ID_Puja");
 @   ALTER TABLE ONLY "Subastas"."Puja" DROP CONSTRAINT "Puja_pkey";
       Subastas            postgres    false    210            V           1259    24664    fki_FK_Admin    INDEX     c   CREATE INDEX "fki_FK_Admin" ON "Subastas"."Participante" USING btree ("ForeignKey_Administrador");
 &   DROP INDEX "Subastas"."fki_FK_Admin";
       Subastas            postgres    false    202            c           2606    24703    Participante FK_Admin    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Participante"
    ADD CONSTRAINT "FK_Admin" FOREIGN KEY ("ForeignKey_Administrador") REFERENCES "Subastas"."Administrador"("ID_Administrador") NOT VALID;
 G   ALTER TABLE ONLY "Subastas"."Participante" DROP CONSTRAINT "FK_Admin";
       Subastas          postgres    false    2897    202    201            g           2606    24802    Subasta FK_Busqueda    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Subasta"
    ADD CONSTRAINT "FK_Busqueda" FOREIGN KEY ("ForeignKey_Busqueda") REFERENCES "Subastas"."Busqueda"("ID_Busqueda");
 E   ALTER TABLE ONLY "Subastas"."Subasta" DROP CONSTRAINT "FK_Busqueda";
       Subastas          postgres    false    200    209    2893            e           2606    24784    Clasificacion FK_Comprador    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Clasificacion"
    ADD CONSTRAINT "FK_Comprador" FOREIGN KEY ("ForeignKey_Comprador") REFERENCES "Subastas"."Comprador"("ID_Participante");
 L   ALTER TABLE ONLY "Subastas"."Clasificacion" DROP CONSTRAINT "FK_Comprador";
       Subastas          postgres    false    208    204    2906            h           2606    24817    Puja FK_Comprador    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "FK_Comprador" FOREIGN KEY ("ForeignKey_Comprador") REFERENCES "Subastas"."Comprador"("ID_Participante");
 C   ALTER TABLE ONLY "Subastas"."Puja" DROP CONSTRAINT "FK_Comprador";
       Subastas          postgres    false    2906    210    204            i           2606    24822    Puja FK_Subasta    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "FK_Subasta" FOREIGN KEY ("ForeignKey_Subasta") REFERENCES "Subastas"."Subasta"("ID_Subasta");
 A   ALTER TABLE ONLY "Subastas"."Puja" DROP CONSTRAINT "FK_Subasta";
       Subastas          postgres    false    2910    209    210            d           2606    24779    Clasificacion FK_Vendedor    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Clasificacion"
    ADD CONSTRAINT "FK_Vendedor" FOREIGN KEY ("ForeignKey_Vendedor") REFERENCES "Subastas"."Vendedor"("ID_Participante");
 K   ALTER TABLE ONLY "Subastas"."Clasificacion" DROP CONSTRAINT "FK_Vendedor";
       Subastas          postgres    false    208    203    2904            f           2606    24797    Subasta FK_Vendedor    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Subasta"
    ADD CONSTRAINT "FK_Vendedor" FOREIGN KEY ("ForeignKey_Vendedor") REFERENCES "Subastas"."Vendedor"("ID_Participante");
 E   ALTER TABLE ONLY "Subastas"."Subasta" DROP CONSTRAINT "FK_Vendedor";
       Subastas          postgres    false    209    203    2904            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     