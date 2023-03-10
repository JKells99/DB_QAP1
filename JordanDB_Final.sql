PGDMP                         {            QAP1    15.1    15.1 %    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    16451    QAP1    DATABASE     h   CREATE DATABASE "QAP1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "QAP1";
                postgres    false            ?            1259    16528    aircraft    TABLE     ?   CREATE TABLE public.aircraft (
    id bigint NOT NULL,
    type character varying(200) NOT NULL,
    airline_name character varying(200) NOT NULL,
    passanger_capicity bigint NOT NULL,
    passenger_id bigint,
    can_use bigint
);
    DROP TABLE public.aircraft;
       public         heap    postgres    false            ?            1259    16667    aircraft_airport    TABLE     X   CREATE TABLE public.aircraft_airport (
    aircraft_id bigint,
    airport_id bigint
);
 $   DROP TABLE public.aircraft_airport;
       public         heap    postgres    false            ?            1259    16523    airports    TABLE     ?   CREATE TABLE public.airports (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    airport_code character varying(3) NOT NULL,
    passenger_used bigint
);
    DROP TABLE public.airports;
       public         heap    postgres    false            ?            1259    16513    cities    TABLE     ?   CREATE TABLE public.cities (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    province character varying(200) NOT NULL,
    population bigint NOT NULL
);
    DROP TABLE public.cities;
       public         heap    postgres    false            ?            1259    16654    city_airports    TABLE     Q   CREATE TABLE public.city_airports (
    airport_id bigint,
    city_id bigint
);
 !   DROP TABLE public.city_airports;
       public         heap    postgres    false            ?            1259    16680    passenger_airport    TABLE     Z   CREATE TABLE public.passenger_airport (
    passenger_id bigint,
    airport_id bigint
);
 %   DROP TABLE public.passenger_airport;
       public         heap    postgres    false            ?            1259    16693    passenger_plane    TABLE     Y   CREATE TABLE public.passenger_plane (
    passenger_id bigint,
    aircraft_id bigint
);
 #   DROP TABLE public.passenger_plane;
       public         heap    postgres    false            ?            1259    16518 
   passengers    TABLE     ?   CREATE TABLE public.passengers (
    id bigint NOT NULL,
    first_name character varying(200) NOT NULL,
    last_name character varying(200) NOT NULL,
    phone_number character varying(12) NOT NULL,
    city_id bigint
);
    DROP TABLE public.passengers;
       public         heap    postgres    false            2          0    16528    aircraft 
   TABLE DATA           e   COPY public.aircraft (id, type, airline_name, passanger_capicity, passenger_id, can_use) FROM stdin;
    public          postgres    false    217   +       4          0    16667    aircraft_airport 
   TABLE DATA           C   COPY public.aircraft_airport (aircraft_id, airport_id) FROM stdin;
    public          postgres    false    219   ?+       1          0    16523    airports 
   TABLE DATA           J   COPY public.airports (id, name, airport_code, passenger_used) FROM stdin;
    public          postgres    false    216   N,       /          0    16513    cities 
   TABLE DATA           @   COPY public.cities (id, name, province, population) FROM stdin;
    public          postgres    false    214   =-       3          0    16654    city_airports 
   TABLE DATA           <   COPY public.city_airports (airport_id, city_id) FROM stdin;
    public          postgres    false    218    .       5          0    16680    passenger_airport 
   TABLE DATA           E   COPY public.passenger_airport (passenger_id, airport_id) FROM stdin;
    public          postgres    false    220   G.       6          0    16693    passenger_plane 
   TABLE DATA           D   COPY public.passenger_plane (passenger_id, aircraft_id) FROM stdin;
    public          postgres    false    221   ?.       0          0    16518 
   passengers 
   TABLE DATA           V   COPY public.passengers (id, first_name, last_name, phone_number, city_id) FROM stdin;
    public          postgres    false    215   ?.       ?           2606    16517    cities Cities_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT "Cities_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cities DROP CONSTRAINT "Cities_pkey";
       public            postgres    false    214            ?           2606    16532    aircraft aircraft_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.aircraft
    ADD CONSTRAINT aircraft_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.aircraft DROP CONSTRAINT aircraft_pkey;
       public            postgres    false    217            ?           2606    16527    airports airports_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.airports DROP CONSTRAINT airports_pkey;
       public            postgres    false    216            ?           2606    16570    passengers city_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT city_unique UNIQUE (city_id) INCLUDE (city_id);
 @   ALTER TABLE ONLY public.passengers DROP CONSTRAINT city_unique;
       public            postgres    false    215            ?           2606    16568 	   cities id 
   CONSTRAINT     O   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT id UNIQUE (id) INCLUDE (id);
 3   ALTER TABLE ONLY public.cities DROP CONSTRAINT id;
       public            postgres    false    214            ?           2606    16522    passengers passengers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.passengers DROP CONSTRAINT passengers_pkey;
       public            postgres    false    215            ?           2606    16581    aircraft aircraft_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.aircraft
    ADD CONSTRAINT aircraft_fk FOREIGN KEY (can_use) REFERENCES public.airports(id) NOT VALID;
 >   ALTER TABLE ONLY public.aircraft DROP CONSTRAINT aircraft_fk;
       public          postgres    false    217    216    3475            ?           2606    16670    aircraft_airport aircraft_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.aircraft_airport
    ADD CONSTRAINT aircraft_fk FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id);
 F   ALTER TABLE ONLY public.aircraft_airport DROP CONSTRAINT aircraft_fk;
       public          postgres    false    219    217    3477            ?           2606    16696    passenger_plane aircraft_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.passenger_plane
    ADD CONSTRAINT aircraft_fk FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id);
 E   ALTER TABLE ONLY public.passenger_plane DROP CONSTRAINT aircraft_fk;
       public          postgres    false    3477    217    221            ?           2606    16662    city_airports airport_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.city_airports
    ADD CONSTRAINT airport_fk FOREIGN KEY (airport_id) REFERENCES public.airports(id) NOT VALID;
 B   ALTER TABLE ONLY public.city_airports DROP CONSTRAINT airport_fk;
       public          postgres    false    218    216    3475            ?           2606    16675    aircraft_airport airport_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.aircraft_airport
    ADD CONSTRAINT airport_fk FOREIGN KEY (airport_id) REFERENCES public.airports(id);
 E   ALTER TABLE ONLY public.aircraft_airport DROP CONSTRAINT airport_fk;
       public          postgres    false    3475    216    219            ?           2606    16688    passenger_airport airport_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.passenger_airport
    ADD CONSTRAINT airport_fk FOREIGN KEY (airport_id) REFERENCES public.airports(id);
 F   ALTER TABLE ONLY public.passenger_airport DROP CONSTRAINT airport_fk;
       public          postgres    false    3475    216    220            ?           2606    16657    city_airports city_fk    FK CONSTRAINT     u   ALTER TABLE ONLY public.city_airports
    ADD CONSTRAINT city_fk FOREIGN KEY (city_id) REFERENCES public.cities(id);
 ?   ALTER TABLE ONLY public.city_airports DROP CONSTRAINT city_fk;
       public          postgres    false    214    3467    218            ?           2606    16571    aircraft passenger_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.aircraft
    ADD CONSTRAINT passenger_fk FOREIGN KEY (passenger_id) REFERENCES public.passengers(id) NOT VALID;
 ?   ALTER TABLE ONLY public.aircraft DROP CONSTRAINT passenger_fk;
       public          postgres    false    215    3473    217            ?           2606    16576    airports passenger_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.airports
    ADD CONSTRAINT passenger_fk FOREIGN KEY (passenger_used) REFERENCES public.passengers(id) NOT VALID;
 ?   ALTER TABLE ONLY public.airports DROP CONSTRAINT passenger_fk;
       public          postgres    false    3473    215    216            ?           2606    16683    passenger_airport passenger_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.passenger_airport
    ADD CONSTRAINT passenger_fk FOREIGN KEY (passenger_id) REFERENCES public.passengers(id);
 H   ALTER TABLE ONLY public.passenger_airport DROP CONSTRAINT passenger_fk;
       public          postgres    false    3473    220    215            ?           2606    16701    passenger_plane passenger_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.passenger_plane
    ADD CONSTRAINT passenger_fk FOREIGN KEY (passenger_id) REFERENCES public.passengers(id);
 F   ALTER TABLE ONLY public.passenger_plane DROP CONSTRAINT passenger_fk;
       public          postgres    false    221    3473    215            2   ?   x?M??n?0???S?	P??B?l?2!? ?]ɪL%?ܖ????)V???o??s???ȃc(?r?q?}J'??n #??
˅֌a??MZ	%n?&n?S??:????_?
Ao??N?y??=?ҽ?|????z
J?jY(???*??ିR??R_n??c??a???8??v?$$??5h4?ܨ[2j?0??bI?<匷ס8?}H??????b?a~????^?      4   @   x??? 1?޸?U?ܽ??:v???L(??M?K???Y?q??b?tG:?5????????K
|      1   ?   x?e??N?0?ϳO?'@u??+??@B??e?lӨ?mR????ŗ???h=ޓ{?S?SLb?S???8&x??d?ͽ~???~v?gV?T?b?T?n/M??%2\??X?M?Wx???x???5????[??*?A???M*X?/?k?)9bI?D????+l??-??l\?ߒ??ϝitW??????G???='l?O?0???g???~ӠbK?@??????ڔ{?????}v      /   ?   x?]?M?0????????G??u2D???ce??t*?????9%<O?&????3????O??q6v?2%rІ?hxϳ??-?l?h?.E(??OO3?NF??????]oB???5??р??8?P?8BG?Pzm??&?g)\?yuR??F?%?pB?}o?Wu??f`3K?^??B??!??TdI      3   7   x??9?0 ?zL???\?G?
?Rm4S?n???`??N???[?ߴ??G? ???      5   O   x?˹?@??.?Ϟ???<??8???b??5t7wM-Om/??Vx???s??????tEWtE?^??],      6   @   x????P??0L??}?K?????BJ?
LX.???$n??j?u??˸!?u?????? ??
F      0   ?   x?]??n?@E????h0?>?Fi?M??LK?F?@#???`ճ=????!?k???{z???,"?x*p???~?VU
*񚾱?9?????@INq?l?GVuՍpe?"?[4?4?=?%?????8?7??F?v{ǵ??Γ??E????z5???N???ɂ?8?9?m}ɭ????K??9[???ي?3?}????TJ?     