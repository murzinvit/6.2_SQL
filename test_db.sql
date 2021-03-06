PGDMP             	    	        y            test_db    13.4 (Debian 13.4-1.pgdg100+1)    13.4 (Debian 13.4-1.pgdg100+1)     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16386    test_db    DATABASE     [   CREATE DATABASE test_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE test_db;
                user    false            ?           0    0    DATABASE test_db    ACL     2   GRANT ALL ON DATABASE test_db TO test_admin_user;
                   user    false    2957            ?            1259    16399    clients    TABLE     ?   CREATE TABLE public.clients (
    id integer NOT NULL,
    family_name character varying(80),
    country character varying(80),
    complite_order integer
);
    DROP TABLE public.clients;
       public         heap    user    false            ?           0    0    TABLE clients    ACL     O   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.clients TO test_simple_user;
          public          user    false    203            ?            1259    16397    clients_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.clients_id_seq;
       public          user    false    203            ?           0    0    clients_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;
          public          user    false    202            ?            1259    16390    orders    TABLE     v   CREATE TABLE public.orders (
    id integer NOT NULL,
    title character varying(80),
    price integer DEFAULT 0
);
    DROP TABLE public.orders;
       public         heap    user    false            ?           0    0    TABLE orders    ACL     N   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.orders TO test_simple_user;
          public          user    false    201            ?            1259    16388    orders_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          user    false    201            ?           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          user    false    200            ?
           2604    16402 
   clients id    DEFAULT     h   ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);
 9   ALTER TABLE public.clients ALTER COLUMN id DROP DEFAULT;
       public          user    false    202    203    203            ?
           2604    16393 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          user    false    200    201    201            ?          0    16399    clients 
   TABLE DATA           K   COPY public.clients (id, family_name, country, complite_order) FROM stdin;
    public          user    false    203   F       ?          0    16390    orders 
   TABLE DATA           2   COPY public.orders (id, title, price) FROM stdin;
    public          user    false    201   ?       ?           0    0    clients_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.clients_id_seq', 5, true);
          public          user    false    202            ?           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 5, true);
          public          user    false    200                        2606    16404    clients clients_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            user    false    203            ?
           2606    16396    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            user    false    201            ?
           1259    16410 	   title_idx    INDEX     D   CREATE UNIQUE INDEX title_idx ON public.orders USING btree (title);
    DROP INDEX public.title_idx;
       public            user    false    201                       2606    16405 #   clients clients_complite_order_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_complite_order_fkey FOREIGN KEY (complite_order) REFERENCES public.orders(id);
 M   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_complite_order_fkey;
       public          user    false    201    203    2813            ?   c   x?3??,K??/?????v????2?H-
?p:'?%?$?D?9?3?ʂ9??@B&?.??zAz.?A??ř`e??N9??ٹ?E?
AH?1z\\\ ?d(      ?   K   x?3?t??O??I,I?44?2?(?,I-?4600?2?t????42M8???RS?8?A??%?E?& ^? ?>?     