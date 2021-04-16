PGDMP         0                y            Progra_1    13.2    13.2 @               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24586    Progra_1    DATABASE     n   CREATE DATABASE "Progra_1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "Progra_1";
                postgres    false            	           0    0    DATABASE "Progra_1"    COMMENT     D   COMMENT ON DATABASE "Progra_1" IS 'Base de datos para la progra 1';
                   postgres    false    3080            
           0    0    Progra_1    DATABASE PROPERTIES     N   ALTER ROLE "User" IN DATABASE "Progra_1" SET transaction_read_only TO 'true';
                     postgres    false                        2615    24587    Subastas    SCHEMA        CREATE SCHEMA "Subastas";
    DROP SCHEMA "Subastas";
                postgres    false            �            1255    40990    Delelte_Comprador(integer) 	   PROCEDURE     �   CREATE PROCEDURE "Subastas"."Delelte_Comprador"("ID_C" integer)
    LANGUAGE sql
    AS $$
DELETE FROM "Subastas"."Comprador"
	WHERE "ID_C" = "ID_Participante";
$$;
 ?   DROP PROCEDURE "Subastas"."Delelte_Comprador"("ID_C" integer);
       Subastas          postgres    false    3            �            1255    32783    Delete_Admin(integer) 	   PROCEDURE     I  CREATE PROCEDURE "Subastas"."Delete_Admin"("ID_A" integer)
    LANGUAGE sql
    AS $$
UPDATE "Subastas"."Participante" SET "ForeignKey_Administrador" = 0
WHERE "ID_A" = "Subastas"."Participante"."ForeignKey_Administrador";
DELETE FROM "Subastas"."Administrador"
	WHERE "Subastas"."Administrador"."ID_Administrador" = "ID_A";
$$;
 :   DROP PROCEDURE "Subastas"."Delete_Admin"("ID_A" integer);
       Subastas          postgres    false    3            �            1255    40980    Delete_Busqueda(integer) 	   PROCEDURE     �   CREATE PROCEDURE "Subastas"."Delete_Busqueda"("ID_B" integer)
    LANGUAGE sql
    AS $$
DELETE FROM "Subastas"."Busqueda"
	WHERE "ID_B" = "ID_Busqueda";
$$;
 =   DROP PROCEDURE "Subastas"."Delete_Busqueda"("ID_B" integer);
       Subastas          postgres    false    3            �            1255    40985    Delete_Clasificacion(integer) 	   PROCEDURE     �   CREATE PROCEDURE "Subastas"."Delete_Clasificacion"("ID_C" integer)
    LANGUAGE sql
    AS $$
DELETE FROM "Subastas"."Clasificacion"
	WHERE "ID_C" = "ID_Clasificacion";
$$;
 B   DROP PROCEDURE "Subastas"."Delete_Clasificacion"("ID_C" integer);
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
       Subastas          postgres    false    3            �            1255    40977    Insert_Busqueda(name, name) 	   PROCEDURE     �   CREATE PROCEDURE "Subastas"."Insert_Busqueda"("CP" name, "CS" name)
    LANGUAGE sql
    AS $$
INSERT INTO "Subastas"."Busqueda"(
	"CategoriaPrimaria", "CategoriaSecundaria")
	VALUES ("CP", "CS");
$$;
 C   DROP PROCEDURE "Subastas"."Insert_Busqueda"("CP" name, "CS" name);
       Subastas          postgres    false    3            �            1255    40984 >   Insert_Clasificacion(integer, integer, integer, integer, text) 	   PROCEDURE     W  CREATE PROCEDURE "Subastas"."Insert_Clasificacion"("ID_C" integer, "FK_V" integer, "FK_C" integer, "Punt" integer, "Desc" text)
    LANGUAGE sql
    AS $$
INSERT INTO "Subastas"."Clasificacion"(
	"ID_Clasificacion", "ForeignKey_Vendedor", "ForeignKey_Comprador", "Puntaje", "Descripcion")
	VALUES ("ID_C", "FK_V", "FK_C", "Punt", "Desc");
$$;
    DROP PROCEDURE "Subastas"."Insert_Clasificacion"("ID_C" integer, "FK_V" integer, "FK_C" integer, "Punt" integer, "Desc" text);
       Subastas          postgres    false    3            �            1255    40988 Q   Insert_Comprador(integer, name, name, character[], numeric, integer, character[]) 	   PROCEDURE     !  CREATE PROCEDURE "Subastas"."Insert_Comprador"("ID_P" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[])
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
 �   DROP PROCEDURE "Subastas"."Insert_Comprador"("ID_P" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[]);
       Subastas          postgres    false    3            �            1255    32780    Select_Admin() 	   PROCEDURE     �   CREATE PROCEDURE "Subastas"."Select_Admin"()
    LANGUAGE sql
    AS $$
SELECT "ID_Administrador", "Alias", "Password"
	FROM "Subastas"."Administrador";
$$;
 ,   DROP PROCEDURE "Subastas"."Select_Admin"();
       Subastas          postgres    false    3            �            1255    40981    Select_Busqueda() 	   PROCEDURE     �   CREATE PROCEDURE "Subastas"."Select_Busqueda"()
    LANGUAGE sql
    AS $$
SELECT "ID_Busqueda", "CategoriaPrimaria", "CategoriaSecundaria"
	FROM "Subastas"."Busqueda";
$$;
 /   DROP PROCEDURE "Subastas"."Select_Busqueda"();
       Subastas          postgres    false    3            �            1255    40983    Select_Clasificacion() 	   PROCEDURE     �   CREATE PROCEDURE "Subastas"."Select_Clasificacion"()
    LANGUAGE sql
    AS $$
SELECT "ID_Clasificacion", "ForeignKey_Vendedor", "ForeignKey_Comprador", "Puntaje", "Descripcion"
	FROM "Subastas"."Clasificacion";
$$;
 4   DROP PROCEDURE "Subastas"."Select_Clasificacion"();
       Subastas          postgres    false    3            �            1255    40987    Select_Comprador() 	   PROCEDURE     �   CREATE PROCEDURE "Subastas"."Select_Comprador"()
    LANGUAGE sql
    AS $$
SELECT "ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador", "Password"
	FROM "Subastas"."Comprador";
$$;
 0   DROP PROCEDURE "Subastas"."Select_Comprador"();
       Subastas          postgres    false    3            �            1255    32779 ;   Update_Admin(integer, character varying, character varying) 	   PROCEDURE     {  CREATE PROCEDURE "Subastas"."Update_Admin"(id_a integer, new_alias character varying, new_password character varying)
    LANGUAGE sql
    AS $$
UPDATE "Subastas"."Administrador"
	SET "Alias"=New_Alias, "Password"=New_Password
	WHERE LENGTH(new_alias) < 21 AND LENGTH(new_password) >= 8 AND LENGTH(new_password) < 16 AND "Subastas"."Administrador"."ID_Administrador" = id_a;
$$;
 u   DROP PROCEDURE "Subastas"."Update_Admin"(id_a integer, new_alias character varying, new_password character varying);
       Subastas          postgres    false    3            �            1255    40982 $   Update_Busqueda(integer, name, name) 	   PROCEDURE     �   CREATE PROCEDURE "Subastas"."Update_Busqueda"("ID_B" integer, "CP" name, "CS" name)
    LANGUAGE sql
    AS $$
UPDATE "Subastas"."Busqueda"
	SET "CategoriaPrimaria"="CP", "CategoriaSecundaria"="CS"
	WHERE "ID_B"="ID_Busqueda";
$$;
 S   DROP PROCEDURE "Subastas"."Update_Busqueda"("ID_B" integer, "CP" name, "CS" name);
       Subastas          postgres    false    3            �            1255    40986 >   Update_Clasificacion(integer, integer, integer, integer, text) 	   PROCEDURE     i  CREATE PROCEDURE "Subastas"."Update_Clasificacion"("ID_C" integer, "FK_V" integer, "FK_C" integer, "Punt" integer, "Desc" text)
    LANGUAGE sql
    AS $$
UPDATE "Subastas"."Clasificacion"
	SET "ID_Clasificacion"="ID_C", "ForeignKey_Vendedor"="FK_V", "ForeignKey_Comprador"="FK_C", "Puntaje"="Punt", "Descripcion"="Desc"
	WHERE "ID_C" = "ID_Clasificacion";
$$;
    DROP PROCEDURE "Subastas"."Update_Clasificacion"("ID_C" integer, "FK_V" integer, "FK_C" integer, "Punt" integer, "Desc" text);
       Subastas          postgres    false    3            �            1255    41081 Q   Update_Comprador(integer, name, name, character[], numeric, integer, character[]) 	   PROCEDURE       CREATE PROCEDURE "Subastas"."Update_Comprador"("ID_C" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[])
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
 �   DROP PROCEDURE "Subastas"."Update_Comprador"("ID_C" integer, "CE" name, "Nom" name, "New_Alias" character[], "Tel" numeric, "FK_A" integer, "New_Password" character[]);
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
            Subastas          postgres    false    200    3            �            1259    24771    Clasificacion    TABLE     �   CREATE TABLE "Subastas"."Clasificacion" (
    "ID_Clasificacion" integer NOT NULL,
    "ForeignKey_Vendedor" integer NOT NULL,
    "ForeignKey_Comprador" integer NOT NULL,
    "Puntaje" integer NOT NULL,
    "Descripcion" text
);
 '   DROP TABLE "Subastas"."Clasificacion";
       Subastas         heap    postgres    false    3            �            1259    24604    Participante    TABLE     .  CREATE TABLE "Subastas"."Participante" (
    "ID_Participante" integer NOT NULL,
    "CorreoElectronico" name NOT NULL,
    "Nombre" name NOT NULL,
    "Alias" character(20)[] NOT NULL,
    "Telefono" numeric,
    "ForeignKey_Administrador" integer NOT NULL,
    "Password" character(15)[] NOT NULL
);
 &   DROP TABLE "Subastas"."Participante";
       Subastas         heap    postgres    false    3            �            1259    24624 	   Comprador    TABLE     N   CREATE TABLE "Subastas"."Comprador" (
)
INHERITS ("Subastas"."Participante");
 #   DROP TABLE "Subastas"."Comprador";
       Subastas         heap    postgres    false    3    202            �            1259    24744     Participante_ID_Participante_seq    SEQUENCE     �   ALTER TABLE "Subastas"."Participante" ALTER COLUMN "ID_Participante" ADD GENERATED ALWAYS AS IDENTITY (
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
    Subastas          postgres    false    201   ^       �          0    24588    Busqueda 
   TABLE DATA           c   COPY "Subastas"."Busqueda" ("ID_Busqueda", "CategoriaPrimaria", "CategoriaSecundaria") FROM stdin;
    Subastas          postgres    false    200   �^                  0    24771    Clasificacion 
   TABLE DATA           �   COPY "Subastas"."Clasificacion" ("ID_Clasificacion", "ForeignKey_Vendedor", "ForeignKey_Comprador", "Puntaje", "Descripcion") FROM stdin;
    Subastas          postgres    false    208   �v       �          0    24624 	   Comprador 
   TABLE DATA           �   COPY "Subastas"."Comprador" ("ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador", "Password") FROM stdin;
    Subastas          postgres    false    204   w       �          0    24604    Participante 
   TABLE DATA           �   COPY "Subastas"."Participante" ("ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador", "Password") FROM stdin;
    Subastas          postgres    false    202   w                 0    24807    Puja 
   TABLE DATA           r   COPY "Subastas"."Puja" ("ID_Puja", "Ofrecido", "Fecha", "ForeignKey_Subasta", "ForeignKey_Comprador") FROM stdin;
    Subastas          postgres    false    210   <w                 0    24789    Subasta 
   TABLE DATA           �   COPY "Subastas"."Subasta" ("ID_Subasta", "Imagen", "Descripcion", "DetallesEntrega", "PrecioBase", "FechaInicio", "FechaFinal", "ForeignKey_Vendedor", "ForeignKey_Busqueda") FROM stdin;
    Subastas          postgres    false    209   Yw       �          0    24618    Vendedor 
   TABLE DATA           �   COPY "Subastas"."Vendedor" ("ID_Participante", "CorreoElectronico", "Nombre", "Alias", "Telefono", "ForeignKey_Administrador", "PuntajeClasificacion", "Password") FROM stdin;
    Subastas          postgres    false    203   vw                  0    0 "   Administrador_ID_Administrador_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('"Subastas"."Administrador_ID_Administrador_seq"', 1, false);
          Subastas          postgres    false    205                       0    0    Busqueda_ID_Busqueda_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('"Subastas"."Busqueda_ID_Busqueda_seq"', 448, true);
          Subastas          postgres    false    206                       0    0     Participante_ID_Participante_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('"Subastas"."Participante_ID_Participante_seq"', 1, false);
          Subastas          postgres    false    207            ]           2606    24702     Administrador Administrador_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY "Subastas"."Administrador"
    ADD CONSTRAINT "Administrador_pkey" PRIMARY KEY ("ID_Administrador");
 R   ALTER TABLE ONLY "Subastas"."Administrador" DROP CONSTRAINT "Administrador_pkey";
       Subastas            postgres    false    201            Y           2606    24715    Busqueda Busqueda_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY "Subastas"."Busqueda"
    ADD CONSTRAINT "Busqueda_pkey" PRIMARY KEY ("ID_Busqueda");
 H   ALTER TABLE ONLY "Subastas"."Busqueda" DROP CONSTRAINT "Busqueda_pkey";
       Subastas            postgres    false    200            _           2606    24770    Administrador ID_A 
   CONSTRAINT     c   ALTER TABLE ONLY "Subastas"."Administrador"
    ADD CONSTRAINT "ID_A" UNIQUE ("ID_Administrador");
 D   ALTER TABLE ONLY "Subastas"."Administrador" DROP CONSTRAINT "ID_A";
       Subastas            postgres    false    201            [           2606    24768    Busqueda ID_B 
   CONSTRAINT     Y   ALTER TABLE ONLY "Subastas"."Busqueda"
    ADD CONSTRAINT "ID_B" UNIQUE ("ID_Busqueda");
 ?   ALTER TABLE ONLY "Subastas"."Busqueda" DROP CONSTRAINT "ID_B";
       Subastas            postgres    false    200            f           2606    24766    Comprador ID_C 
   CONSTRAINT     ^   ALTER TABLE ONLY "Subastas"."Comprador"
    ADD CONSTRAINT "ID_C" UNIQUE ("ID_Participante");
 @   ALTER TABLE ONLY "Subastas"."Comprador" DROP CONSTRAINT "ID_C";
       Subastas            postgres    false    204            h           2606    24778    Clasificacion ID_Cl 
   CONSTRAINT     i   ALTER TABLE ONLY "Subastas"."Clasificacion"
    ADD CONSTRAINT "ID_Cl" PRIMARY KEY ("ID_Clasificacion");
 E   ALTER TABLE ONLY "Subastas"."Clasificacion" DROP CONSTRAINT "ID_Cl";
       Subastas            postgres    false    208            l           2606    24816 	   Puja ID_P 
   CONSTRAINT     e   ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "ID_P" UNIQUE ("ID_Puja") INCLUDE ("ID_Puja");
 ;   ALTER TABLE ONLY "Subastas"."Puja" DROP CONSTRAINT "ID_P";
       Subastas            postgres    false    210    210            j           2606    24796    Subasta ID_S 
   CONSTRAINT     \   ALTER TABLE ONLY "Subastas"."Subasta"
    ADD CONSTRAINT "ID_S" PRIMARY KEY ("ID_Subasta");
 >   ALTER TABLE ONLY "Subastas"."Subasta" DROP CONSTRAINT "ID_S";
       Subastas            postgres    false    209            d           2606    24764    Vendedor ID_V 
   CONSTRAINT     ]   ALTER TABLE ONLY "Subastas"."Vendedor"
    ADD CONSTRAINT "ID_V" UNIQUE ("ID_Participante");
 ?   ALTER TABLE ONLY "Subastas"."Vendedor" DROP CONSTRAINT "ID_V";
       Subastas            postgres    false    203            a           2606    24723    Participante Participante_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY "Subastas"."Participante"
    ADD CONSTRAINT "Participante_pkey" PRIMARY KEY ("ID_Participante");
 P   ALTER TABLE ONLY "Subastas"."Participante" DROP CONSTRAINT "Participante_pkey";
       Subastas            postgres    false    202            n           2606    24814    Puja Puja_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "Puja_pkey" PRIMARY KEY ("ID_Puja");
 @   ALTER TABLE ONLY "Subastas"."Puja" DROP CONSTRAINT "Puja_pkey";
       Subastas            postgres    false    210            b           1259    24664    fki_FK_Admin    INDEX     c   CREATE INDEX "fki_FK_Admin" ON "Subastas"."Participante" USING btree ("ForeignKey_Administrador");
 &   DROP INDEX "Subastas"."fki_FK_Admin";
       Subastas            postgres    false    202            o           2606    24703    Participante FK_Admin    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Participante"
    ADD CONSTRAINT "FK_Admin" FOREIGN KEY ("ForeignKey_Administrador") REFERENCES "Subastas"."Administrador"("ID_Administrador") NOT VALID;
 G   ALTER TABLE ONLY "Subastas"."Participante" DROP CONSTRAINT "FK_Admin";
       Subastas          postgres    false    201    2909    202            s           2606    24802    Subasta FK_Busqueda    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Subasta"
    ADD CONSTRAINT "FK_Busqueda" FOREIGN KEY ("ForeignKey_Busqueda") REFERENCES "Subastas"."Busqueda"("ID_Busqueda");
 E   ALTER TABLE ONLY "Subastas"."Subasta" DROP CONSTRAINT "FK_Busqueda";
       Subastas          postgres    false    2905    209    200            q           2606    24784    Clasificacion FK_Comprador    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Clasificacion"
    ADD CONSTRAINT "FK_Comprador" FOREIGN KEY ("ForeignKey_Comprador") REFERENCES "Subastas"."Comprador"("ID_Participante");
 L   ALTER TABLE ONLY "Subastas"."Clasificacion" DROP CONSTRAINT "FK_Comprador";
       Subastas          postgres    false    208    204    2918            t           2606    24817    Puja FK_Comprador    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "FK_Comprador" FOREIGN KEY ("ForeignKey_Comprador") REFERENCES "Subastas"."Comprador"("ID_Participante");
 C   ALTER TABLE ONLY "Subastas"."Puja" DROP CONSTRAINT "FK_Comprador";
       Subastas          postgres    false    2918    210    204            u           2606    24822    Puja FK_Subasta    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Puja"
    ADD CONSTRAINT "FK_Subasta" FOREIGN KEY ("ForeignKey_Subasta") REFERENCES "Subastas"."Subasta"("ID_Subasta");
 A   ALTER TABLE ONLY "Subastas"."Puja" DROP CONSTRAINT "FK_Subasta";
       Subastas          postgres    false    210    2922    209            p           2606    24779    Clasificacion FK_Vendedor    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Clasificacion"
    ADD CONSTRAINT "FK_Vendedor" FOREIGN KEY ("ForeignKey_Vendedor") REFERENCES "Subastas"."Vendedor"("ID_Participante");
 K   ALTER TABLE ONLY "Subastas"."Clasificacion" DROP CONSTRAINT "FK_Vendedor";
       Subastas          postgres    false    2916    208    203            r           2606    24797    Subasta FK_Vendedor    FK CONSTRAINT     �   ALTER TABLE ONLY "Subastas"."Subasta"
    ADD CONSTRAINT "FK_Vendedor" FOREIGN KEY ("ForeignKey_Vendedor") REFERENCES "Subastas"."Vendedor"("ID_Participante");
 E   ALTER TABLE ONLY "Subastas"."Subasta" DROP CONSTRAINT "FK_Vendedor";
       Subastas          postgres    false    2916    209    203            �      x������ � �      �      x��\Is�Ȓ>����u?b!�M��v�5VHjO��\�`�����Y����}�÷���͗Y�1�nSU��df�VY�.����4��m��=��˰L��f�WIm�+�b-��_�����,�B���{���b>�l}����8�Z�W9f�w��G�,�1�N$efQ��כ��!�4E�,rcсx]$�6;|�`M���)�*�^�N�o�Vd�:|�v2�֚�����
���0���H�ZL+pf?�՝L�E~i�"����F(d���YJ���R�Fd�oE�K�K����1�/�0�ᏈH�9|YeQH�R�]�Y�퀎��ur�]>��OC^��1-����䧾.��%�L��HZF�������7�n��L��K�ʰ��YF2	#AR!�Q%���˩e�X@�ˠ����fw�pw������-Z���2�C�5l�e��U��H���M��a�s�G��K9�L>�d-�iF�{
�}JK��O3��43��ŵ\��!8|K���ltE͆�W��r[fDu����\�j4TPA]��_$B"�������H����<��#�X�-F �2�Ǝ� ����T�w�22[�q��S5C�Oh8n��u�b'��I��b�y�5��1@>�UD���b�ګ�U���7ȅ�����LE�jG51�i��Ŭix�2O��2������ܖ$�-|������ʯ1��:ucK}���H~V����]��L��]�(5�y����[ܫ��)K\Y�1�����H�X�F��4\��z��A�a��q�7��o��#�:��\������Y�������՟��o
�*�e�el^Os�\��aڧlI�+!�fFɺ�>�D|q����fIG��D�s��1w���)��j��)x�-���-l'��}��|��|�~G_�ȉ̶�o@\L"*��ǘu 8$Vd6I������2'9&�z<�S������j���0֙�������V����y��t�F�Z4v� �-�oR���]�@�1���7woR�>lظ޴@��hW��|��Lʐr��S�De��琥؛�ʨ���It����M
�=�p�(�����	<�P7?koR���^�.��/�`y����'68�p�p�E&��%�{R�k�U�Z)L3������D��h��p&@!��v���n���$�����e*����p��2�v"�,Q��>��5��{ɾ�Xq.}�ɩ�EH�-��tHٕ�O]�!7�A�j����ٗ�
�2���>U67Oሑ��2�5��j�,]kqP�`�^�#&ֻ��?����?�wu����٣MJM(���Y{�l4���?�a1|��;�Oh�3O�8a�g`v������	����},^��:WdO����G'�OR+w!t�}�H��8g���_��Yi���k���ЇO���|�#�8
FN��������U�o��K�g��P�� ���`1���ׂ�ˁ#�d��cX�x�N�@\n�tW�)���g�+k�[c���(�Q��p�H�M��o�fe���xB�<s�?,��OeT~��5��bV\�Pߚ�JO����If@�#=+�Q�XB�H��Vi�+��0G�c)���	��G��ַ�5*J�B�&:"��*9�j)b˲.n�5�j�QS(x�:��lSNxX�)�����׿���+��Q��H���p�(�2JJY��)꿑k���卂RraW&��� ?��>A��>���h�)�k����`�9�=;�Ba�jW�Rp'y���W��rRJr�!��'��*BD+`�3�G�$�>��f"���S ��0�U��׳T��4ԫhU>�p����e��	iN�.�Q�E���S	��T{�^�D�JĴKd�eq�N��8�I��˭�fxVa���F&hu�N�c�/�jL{d-8��ڤ��X�Ԝ�8#(��b"��K���V#^B�&���v� 4�����.
	h��KeK9����v�t[�2�?X�D�`��厰� ���4w��uƟbl�a܍ܥ��t��GH��;���3��7��~��BŚpF��9lt% �1��#��{��y�9#?������7.Cb�;�d6��gD��S�DYm�S�Z�g1"�&SHy@�H�]��p�V X1��ǯSD3J��6.%�`���@���o�g*�2#r?�f�(��(8�w0;[Jk�xH�B�4"�Y��ǩ+��L֑&�#9$@S�i^蕍r�&��V��f��T��0̘�P�U���(��)2�;��0��{���{S����ffs� ?�YFn�|DbN]�����z�ڈ5o ve��2�ވ �rHOR����Эuh	�����Cވ4�֌ _�J@�,EވձhG{#2��(�9a��y �!ޗ�lp*�ԅVb#I`�	�>3�n��K�`�7��R���2>���eA�ādp��]�E�b�j���"aI�2u�L�
&F�$4��H�M^�������(x�_LF0�X�̼E$Bw���{�/�}ι�b�ɞ@j���O�|�S�ѧ\�Ԧ�_�~�z�(�r]ݧS�ߢL��:�Ji����XDYM
���5<baobD�u��:�Cȓ�w"��::l̩���liK��a�N��5��J�8�M&�U�bJ>1DM������+\�CSR� C�$ѳK�\��%��I��)qD�ᄾTG�����)��+���$2��e����[˟��wLA�;|����W���ާ����*��d62��9B�`J2�%���S�U˟E��-���E�n`�)�/ht������Sy��1��'���a�J��OW��q˝�4s8�,�}{{oX��qH�"݉"����?��'����� �}�i�E�k�5[y���=J�*���v�c]��N�W��T�Q����`y�D��S5�_@�����n�wH98�O��x?̯Z"����	��N�l�.[l����Y��.�O�S�B�E��?F��vi.x��lւ���D��z."�[-�+����]n�3���!U��<O�9C���{����;86�fb[>�3Ƽ�y�|������azb't;�1�=�:���%�h�m�=D���+�t���H�u�/��1 �����T��)6ܓ�G��ۚ��?��?���v��Z��*c��IV�38b�F��@���z1_}|u����:.��@�}�����;1�2���l9@}�?n^���w,#>+�G��g����T�d۳>�U�o��9![+-�7~�l����m�	v���Q�>�٧V��(C�Y���&�5'�m{>�:ݔ]��o3)T9�m{M�کk���hecȽL
8�2ѥ\ͬ�/@�"ʃt����eRU(���f��x�j����w���Y��1�;����K2�q~Q�f�7Ͷ�N����y+���V������':���(/��N���]ʬ����౞ӟ�S�0<���:	����v���dW3�FYQ�$@��}����di�9���K3)��KI�k��db˞M휘�*܊9���2J�T�uG0��6��{p7TY��I��;ѝ��E�K�j(xy�b][J���uOa����r�흀�Sf�m�q��A�NR���6)��1��t_�!��>�~c���lH�����݈]]���f�ͮ=�3L�&Q2c�[���>�8c�V9�}�`ʞOqm����ֈ��<��L}��IH�˰��>#@/�W���R�4~���e<���L�B�Xi��8�s�Tղ��V>�E� Ԭ��dt�ݎfE0��n?���o�Wr���]�71��Maj��7�bT�l��v�J�5�� 6��V�[tњe�����	�2e�Xך�am�nq�N>qBi}D��Wg�G/�� �����d����)UܩJ{�c��VQO ��Xi�'��"����-��U�)Y�8��㪴Nˤ�=�{�=���^�8�Lۢ����.�qHל��(+uQ�S�ڳJx�Wo៥�՟&���P���h� �=��:�~���8��������Z�� 4  #5u�4�9G���0g��� ��)��?�{�U���!d�JYc>������ �j�P-��/�G�qMy	>���F�	������@�}>J���m?8���E���$>w"t;������R�,y�uzphD]����#?�~�
���$G��N��JG��$c��j;8�@-e�wq��kCu�ű�[���hMA��	Ҝ٬�:76sfV�s�83��x�E��7�Q]\�c��J�����uf�4�{Q����;���Χaߖt_��̼3���T1#�g,��Y\�K
�)U��~��3�G�70#��p0|+��T1�c�΀����1e�B��1�u.�U6�S�Y
[ͪ
�!5GU�EH�>H���g�F�z#��86�T燁��a�r�3$���$��eG�^��q:u��3�Ji�26ut�\��_PVﹺK�2fB0
j8�� x�ԆmB@�xA�=괈z�`gx)�N���A�;�W�ձ�Û��^ǂC�{������J)3�M�bXs��)���p�9_����N�6���P�T�Лk.2�T9	�pU���w���^� ;������}&u��嚞���W<�ۛ""G;�[I:��g��;�^�1��Y��]��]�zƒ讀��(�W^(���9�y!O@�K^
E�kZ�?5E��J�:��9�	N�U~H�8Z���i8�lj����q�)L,�s:�,�P�h�Fl��X��W�rB x�i�w��&��q���,��l�Yn8j@�Om�?�K��kF^ (yʫ. vj+�:�r���'I�ߜ��	}ptP�l�E�H~�������-�0����@nab y�z���MT���^&I�l��� 0���i�A�=�&�Π��[�U������2~>
pw ��T/u��(�:��tk���sC {���J�($�d��Ai�n�ՉE�e-!�ꪓ+�X⌔b���ך�[3U����^/��wtY�v�4��͜��S�̇�y���Y#��4F/�=4F�oN/�=�s|e �u���R�\	����v:�^攲q<�h�yb�1;�C�E�lc���ʙ��QGi�w�24�I�.^C'��\�ʿ�xT�Ct[�Z���ga���f"1�3�u�KZح��o���Y8�v�:��pۍ�T�\9�!����Y���H㔪�MP�8|I�kW�䆪~��{��g�
�_,�.���V3�(I���U��M�y͒�M���m*ݔ�Z;&��#��m�0�c�6��D��
�AeO(	�e�m��wp�6]����T�+���	�S�i�u�^�}�� �;�"c��r��Y(TN�n��¸y�6���
�R�Z�R��+^f0>GU����E0�y���aӁb�h�R2��<xC��D��m��]��PB�4��F����t/�T�~�ܩ�s��3���f���1p(g3�ҝ��\�7ݾcfE�)+���&�a�������6�	�A�f�%��cQ��#_�瑂/2-�\�+���l6<��i̬!��P�D�� �oR8ъT
:CEU�C�G8f��P!�hc�i���j��Q�!?)�
��B ��������9K�%���"z�� ��{��6��/B�S J�]�J.�d��T�YW�r�1(WT�v���Pn]��ٮ5(u@�j��Q|P$��j ͛'��������B���Y(v��Kt�;(M?>��4>���bZh�OAf�/>R����÷D±�!��n_�a�@�e��� Yh���n�eV�j�įF��r�̵�+}�4�k�t+����ڥr����#��A��\����9�=�����7�p�>��ﳨ�- *JT���m�e�O
��7o6�[�uy� #��.�1�3BjVMp/���r��u�!���c!�-�";�J�E:���s�r��i���[t�p4G��J�..K]x�?� ��š��VB���[D.շ��>@�-o��ԸT�҆��C�2��b%袼)���-J��.7\wօ{Kߵ�S�z��Z��AU*�ڔkw�o )��7��r]g�T:0�G���ŎP=�־j���B�n�[�BĹS�`%��i[tA͞���8լ�������x���~5�� 泌�             x������ � �      �      x������ � �      �      x������ � �            x������ � �            x������ � �      �      x������ � �     