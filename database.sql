PGDMP      ;                 }         
   CoffeeShop    17.2    17.2 ,    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16387 
   CoffeeShop    DATABASE     �   CREATE DATABASE "CoffeeShop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Kazakhstan.1251';
    DROP DATABASE "CoffeeShop";
                     postgres    false            �            1259    16442    holidays    TABLE     z   CREATE TABLE public.holidays (
    id integer NOT NULL,
    date date NOT NULL,
    description character varying(255)
);
    DROP TABLE public.holidays;
       public         heap r       postgres    false            �            1259    16441    holidays_id_seq    SEQUENCE     �   CREATE SEQUENCE public.holidays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.holidays_id_seq;
       public               postgres    false    226            �           0    0    holidays_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.holidays_id_seq OWNED BY public.holidays.id;
          public               postgres    false    225            �            1259    16389    ingredients    TABLE     �   CREATE TABLE public.ingredients (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    quantity numeric(38,2) NOT NULL,
    CONSTRAINT ingredients_quantity_check CHECK ((quantity >= (0)::numeric))
);
    DROP TABLE public.ingredients;
       public         heap r       postgres    false            �            1259    16388    ingredients_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.ingredients_id_seq;
       public               postgres    false    218            �           0    0    ingredients_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;
          public               postgres    false    217            �            1259    16409    recipe_ingredients    TABLE     �   CREATE TABLE public.recipe_ingredients (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    ingredient_id bigint NOT NULL,
    amount numeric(38,2) NOT NULL,
    CONSTRAINT recipe_ingredients_amount_check CHECK ((amount > (0)::numeric))
);
 &   DROP TABLE public.recipe_ingredients;
       public         heap r       postgres    false            �            1259    16408    recipe_ingredients_id_seq    SEQUENCE     �   CREATE SEQUENCE public.recipe_ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.recipe_ingredients_id_seq;
       public               postgres    false    222            �           0    0    recipe_ingredients_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.recipe_ingredients_id_seq OWNED BY public.recipe_ingredients.id;
          public               postgres    false    221            �            1259    16399    recipes    TABLE     �   CREATE TABLE public.recipes (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.recipes;
       public         heap r       postgres    false            �            1259    16398    recipes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.recipes_id_seq;
       public               postgres    false    220            �           0    0    recipes_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;
          public               postgres    false    219            �            1259    16429    sales    TABLE     �   CREATE TABLE public.sales (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.sales;
       public         heap r       postgres    false            �            1259    16428    sales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sales_id_seq;
       public               postgres    false    224            �           0    0    sales_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;
          public               postgres    false    223            ;           2604    16445    holidays id    DEFAULT     j   ALTER TABLE ONLY public.holidays ALTER COLUMN id SET DEFAULT nextval('public.holidays_id_seq'::regclass);
 :   ALTER TABLE public.holidays ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    226    226            5           2604    16450    ingredients id    DEFAULT     p   ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);
 =   ALTER TABLE public.ingredients ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            8           2604    16469    recipe_ingredients id    DEFAULT     ~   ALTER TABLE ONLY public.recipe_ingredients ALTER COLUMN id SET DEFAULT nextval('public.recipe_ingredients_id_seq'::regclass);
 D   ALTER TABLE public.recipe_ingredients ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            6           2604    16501 
   recipes id    DEFAULT     h   ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);
 9   ALTER TABLE public.recipes ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            9           2604    16519    sales id    DEFAULT     d   ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);
 7   ALTER TABLE public.sales ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223    224            �          0    16442    holidays 
   TABLE DATA           9   COPY public.holidays (id, date, description) FROM stdin;
    public               postgres    false    226   2       �          0    16389    ingredients 
   TABLE DATA           9   COPY public.ingredients (id, name, quantity) FROM stdin;
    public               postgres    false    218   /2       �          0    16409    recipe_ingredients 
   TABLE DATA           R   COPY public.recipe_ingredients (id, recipe_id, ingredient_id, amount) FROM stdin;
    public               postgres    false    222   �2       �          0    16399    recipes 
   TABLE DATA           7   COPY public.recipes (id, name, created_at) FROM stdin;
    public               postgres    false    220   �2       �          0    16429    sales 
   TABLE DATA           ;   COPY public.sales (id, recipe_id, "timestamp") FROM stdin;
    public               postgres    false    224   k3       �           0    0    holidays_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.holidays_id_seq', 1, false);
          public               postgres    false    225            �           0    0    ingredients_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.ingredients_id_seq', 4, true);
          public               postgres    false    217            �           0    0    recipe_ingredients_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.recipe_ingredients_id_seq', 10, true);
          public               postgres    false    221            �           0    0    recipes_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.recipes_id_seq', 4, true);
          public               postgres    false    219            �           0    0    sales_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sales_id_seq', 4, true);
          public               postgres    false    223            I           2606    16449    holidays holidays_date_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_date_key UNIQUE (date);
 D   ALTER TABLE ONLY public.holidays DROP CONSTRAINT holidays_date_key;
       public                 postgres    false    226            K           2606    16447    holidays holidays_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.holidays DROP CONSTRAINT holidays_pkey;
       public                 postgres    false    226            ?           2606    16452    ingredients ingredients_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.ingredients DROP CONSTRAINT ingredients_pkey;
       public                 postgres    false    218            E           2606    16471 *   recipe_ingredients recipe_ingredients_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.recipe_ingredients DROP CONSTRAINT recipe_ingredients_pkey;
       public                 postgres    false    222            A           2606    16407    recipes recipes_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_name_key UNIQUE (name);
 B   ALTER TABLE ONLY public.recipes DROP CONSTRAINT recipes_name_key;
       public                 postgres    false    220            C           2606    16503    recipes recipes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.recipes DROP CONSTRAINT recipes_pkey;
       public                 postgres    false    220            G           2606    16521    sales sales_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public                 postgres    false    224            L           2606    16483 8   recipe_ingredients recipe_ingredients_ingredient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.recipe_ingredients DROP CONSTRAINT recipe_ingredients_ingredient_id_fkey;
       public               postgres    false    222    4671    218            M           2606    16509 4   recipe_ingredients recipe_ingredients_recipe_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipes(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.recipe_ingredients DROP CONSTRAINT recipe_ingredients_recipe_id_fkey;
       public               postgres    false    222    220    4675            N           2606    16526    sales sales_recipe_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipes(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_recipe_id_fkey;
       public               postgres    false    4675    224    220            �      x������ � �      �   L   x�3�0�¾�-�r��pq^�ta߅-6pB��9/�
��]���M8/,���b+7����qqq z�#>      �   E   x�=���0���0��$�.��
E*�C�t 8Ӈ�%)R�&�����a�����GZэVN�#�0��d      �   {   x�3估�b��.l��d��4202�50�50V00�"c=C#33#S.#�.��l���®.�ůޘ��,����/�uPm��Z����Y���������T�����̂+F��� �>a      �   F   x�}̱�0D���F�a�,���Mc�wO��9��r�W��k1���ĉ��j>�a�׬�m�����     