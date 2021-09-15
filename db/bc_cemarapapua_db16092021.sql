--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 12.0

-- Started on 2021-09-16 01:33:01

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
-- TOC entry 10 (class 2615 OID 16596)
-- Name: master; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA master;


ALTER SCHEMA master OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 221 (class 1259 OID 16668)
-- Name: mastercategory; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.mastercategory (
    category_id integer DEFAULT nextval(('master.mastercategory_category_id_seq'::text)::regclass) NOT NULL,
    categorys character varying(100),
    category_status character(1)
);
ALTER TABLE ONLY master.mastercategory ALTER COLUMN category_id SET STATISTICS 0;
ALTER TABLE ONLY master.mastercategory ALTER COLUMN categorys SET STATISTICS 0;


ALTER TABLE master.mastercategory OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16849)
-- Name: mastercategory_category_id_seq; Type: SEQUENCE; Schema: master; Owner: postgres
--

CREATE SEQUENCE master.mastercategory_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE master.mastercategory_category_id_seq OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16747)
-- Name: mastermenu; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.mastermenu (
    menu_id integer DEFAULT nextval(('master.mastermenu_menu_id_seq'::text)::regclass) NOT NULL,
    menu character varying(100),
    parent_id integer,
    status character(5),
    level character(1),
    url character varying(50),
    icon character varying(100)
);
ALTER TABLE ONLY master.mastermenu ALTER COLUMN menu_id SET STATISTICS 0;
ALTER TABLE ONLY master.mastermenu ALTER COLUMN menu SET STATISTICS 0;


ALTER TABLE master.mastermenu OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16865)
-- Name: mastermenu_menu_id_seq; Type: SEQUENCE; Schema: master; Owner: postgres
--

CREATE SEQUENCE master.mastermenu_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE master.mastermenu_menu_id_seq OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16775)
-- Name: masteruser; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.masteruser (
    user_id integer DEFAULT nextval(('master.masteruser_user_id_seq'::text)::regclass) NOT NULL,
    username character varying(50),
    password text,
    full_name character varying(100),
    level_user character varying(20),
    user_status character(1)
);
ALTER TABLE ONLY master.masteruser ALTER COLUMN user_id SET STATISTICS 0;
ALTER TABLE ONLY master.masteruser ALTER COLUMN username SET STATISTICS 0;
ALTER TABLE ONLY master.masteruser ALTER COLUMN password SET STATISTICS 0;


ALTER TABLE master.masteruser OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16823)
-- Name: masteruser_user_id_seq; Type: SEQUENCE; Schema: master; Owner: postgres
--

CREATE SEQUENCE master.masteruser_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE master.masteruser_user_id_seq OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16800)
-- Name: setting_aplikasi; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.setting_aplikasi (
    setting_id integer NOT NULL,
    setting_nohp character varying(20),
    setting_addres character varying(100),
    setting_about_title character varying(100),
    setting_about_organisasi text,
    setting_email character varying(100),
    setting_desc_app text
);
ALTER TABLE ONLY master.setting_aplikasi ALTER COLUMN setting_id SET STATISTICS 0;
ALTER TABLE ONLY master.setting_aplikasi ALTER COLUMN setting_nohp SET STATISTICS 0;
ALTER TABLE ONLY master.setting_aplikasi ALTER COLUMN setting_addres SET STATISTICS 0;
ALTER TABLE ONLY master.setting_aplikasi ALTER COLUMN setting_about_title SET STATISTICS 0;
ALTER TABLE ONLY master.setting_aplikasi ALTER COLUMN setting_about_organisasi SET STATISTICS 0;


ALTER TABLE master.setting_aplikasi OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16422)
-- Name: album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album (
    album_id integer DEFAULT nextval(('public.album_album_id_seq'::text)::regclass) NOT NULL,
    album_name character varying(100),
    album_status character(1)
);
ALTER TABLE ONLY public.album ALTER COLUMN album_id SET STATISTICS 0;
ALTER TABLE ONLY public.album ALTER COLUMN album_name SET STATISTICS 0;


ALTER TABLE public.album OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16920)
-- Name: album_album_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.album_album_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.album_album_id_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16458)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16456)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 211 (class 1259 OID 16468)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16466)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 207 (class 1259 OID 16450)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16448)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 213 (class 1259 OID 16476)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16486)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16484)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 212 (class 1259 OID 16474)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 217 (class 1259 OID 16494)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16492)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 236 (class 1259 OID 16949)
-- Name: comentar_p; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentar_p (
    commentar_id integer NOT NULL,
    full_name character varying(50),
    email character varying(50),
    pesan text,
    posts_id integer NOT NULL,
    com_date timestamp(0) without time zone,
    com_status character(1)
);
ALTER TABLE ONLY public.comentar_p ALTER COLUMN commentar_id SET STATISTICS 0;
ALTER TABLE ONLY public.comentar_p ALTER COLUMN full_name SET STATISTICS 0;


ALTER TABLE public.comentar_p OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16945)
-- Name: comentar_p_commentar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comentar_p_commentar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentar_p_commentar_id_seq OWNER TO postgres;

--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 234
-- Name: comentar_p_commentar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentar_p_commentar_id_seq OWNED BY public.comentar_p.commentar_id;


--
-- TOC entry 235 (class 1259 OID 16947)
-- Name: comentar_p_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comentar_p_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentar_p_posts_id_seq OWNER TO postgres;

--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 235
-- Name: comentar_p_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentar_p_posts_id_seq OWNED BY public.comentar_p.posts_id;


--
-- TOC entry 219 (class 1259 OID 16554)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16552)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 205 (class 1259 OID 16440)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16438)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 203 (class 1259 OID 16429)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16427)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 220 (class 1259 OID 16585)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16807)
-- Name: firtu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firtu (
    firtu_id integer DEFAULT nextval(('public.firtu_firtu_id_seq'::text)::regclass) NOT NULL,
    firtu_title character varying(100),
    firtu_date timestamp(0) without time zone,
    firtu_desc text,
    firtu_img character varying(100),
    firtu_status character(1)
);
ALTER TABLE ONLY public.firtu ALTER COLUMN firtu_id SET STATISTICS 0;
ALTER TABLE ONLY public.firtu ALTER COLUMN firtu_title SET STATISTICS 0;
ALTER TABLE ONLY public.firtu ALTER COLUMN firtu_date SET STATISTICS 0;
ALTER TABLE ONLY public.firtu ALTER COLUMN firtu_desc SET STATISTICS 0;
ALTER TABLE ONLY public.firtu ALTER COLUMN firtu_img SET STATISTICS 0;


ALTER TABLE public.firtu OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16901)
-- Name: firtu_firtu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.firtu_firtu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.firtu_firtu_id_seq OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16906)
-- Name: firtu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.firtu_id_seq
    START WITH 7
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.firtu_id_seq OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16417)
-- Name: gallery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gallery (
    gallery_id integer DEFAULT nextval(('public.gallery_gallery_id_seq'::text)::regclass) NOT NULL,
    gallery_name character varying(100),
    gallery_img character varying(100),
    gallery_date timestamp(0) without time zone,
    user_id integer,
    gallery_status character(1),
    gallery_link character varying(200),
    album_id integer,
    gallery_log character(1)
);
ALTER TABLE ONLY public.gallery ALTER COLUMN gallery_id SET STATISTICS 0;
ALTER TABLE ONLY public.gallery ALTER COLUMN gallery_name SET STATISTICS 0;


ALTER TABLE public.gallery OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16915)
-- Name: gallery_gallery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gallery_gallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.gallery_gallery_id_seq OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16409)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    posts_id integer DEFAULT nextval(('public.posts_posts_id_seq'::text)::regclass) NOT NULL,
    posts_date timestamp(0) without time zone DEFAULT now(),
    user_id integer,
    posts_title character varying(100),
    posts_desc text,
    posts_img character varying(50),
    category_id integer,
    posts_status character(20),
    posts_page_view integer,
    posts_keyword text
);
ALTER TABLE ONLY public.posts ALTER COLUMN posts_id SET STATISTICS 0;
ALTER TABLE ONLY public.posts ALTER COLUMN posts_date SET STATISTICS 0;
ALTER TABLE ONLY public.posts ALTER COLUMN user_id SET STATISTICS 0;
ALTER TABLE ONLY public.posts ALTER COLUMN posts_title SET STATISTICS 0;
ALTER TABLE ONLY public.posts ALTER COLUMN posts_desc SET STATISTICS 0;
ALTER TABLE ONLY public.posts ALTER COLUMN posts_img SET STATISTICS 0;


ALTER TABLE public.posts OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16882)
-- Name: posts_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.posts_posts_id_seq OWNER TO postgres;

--
-- TOC entry 2797 (class 2604 OID 16461)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2798 (class 2604 OID 16471)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2796 (class 2604 OID 16453)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2799 (class 2604 OID 16479)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2800 (class 2604 OID 16489)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2801 (class 2604 OID 16497)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2808 (class 2604 OID 16952)
-- Name: comentar_p commentar_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentar_p ALTER COLUMN commentar_id SET DEFAULT nextval('public.comentar_p_commentar_id_seq'::regclass);


--
-- TOC entry 2809 (class 2604 OID 16953)
-- Name: comentar_p posts_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentar_p ALTER COLUMN posts_id SET DEFAULT nextval('public.comentar_p_posts_id_seq'::regclass);


--
-- TOC entry 2802 (class 2604 OID 16557)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2795 (class 2604 OID 16443)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2794 (class 2604 OID 16432)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3032 (class 0 OID 16668)
-- Dependencies: 221
-- Data for Name: mastercategory; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.mastercategory (category_id, categorys, category_status) FROM stdin;
5	Ekonomi	Y
6	Kesehatan	Y
8	Agama	Y
10	Hiburan	Y
2	Gereja	Y
4	Pendidikan	Y
9	Teknologi	Y
11	Pemerintah	Y
13	Sosial & BUdaya	Y
14	Opini	Y
12	Hukum & Politik	Y
3	Papua	Y
15	Kategori Tes1	N
16	Kategori Tes2	N
\.


--
-- TOC entry 3033 (class 0 OID 16747)
-- Dependencies: 222
-- Data for Name: mastermenu; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.mastermenu (menu_id, menu, parent_id, status, level, url, icon) FROM stdin;
21	Master	0	aktif	A	#	icon-Settings-2
22	Master User	21	aktif	A	/dashboardadmin/user/	\N
12	Tentang & Kontak	0	aktif	F	/frontenduser/contact/	\N
6	Kegiatan Gereja	11	aktif	F	/frontenduser/kegiatan_gereja/	\N
7	Firman Tuhan	11	aktif	F	/frontenduser/firtu/	\N
23	Master Kategori	21	aktif	A	/dashboardadmin/category/	\N
24	Master Menu	21	aktif	A	/dashboardadmin/mastermenu/	\N
9	Opini/Artikel	0	aktif	F	/frontenduser/opini/	\N
4	Foto	10	aktif	F	/frontenduser/gallery_foto/	\N
5	Video	10	aktif	F	/frontenduser/gallery_video/	\N
14	Pemerintah	3	aktif	F	/frontenduser/pemerintah/	\N
15	Hukum & Politik	3	aktif	F	/frontenduser/hukumpolitik/	\N
16	Sosial & Budaya	3	aktif	F	/frontenduser/sosialbudaya/	\N
17	Pendidikan	3	aktif	F	/frontenduser/pendidikan/	\N
18	Ekonomi	3	aktif	F	/frontenduser/ekonomi/	\N
19	Kesehatan	3	aktif	F	/frontenduser/kesehatan/	\N
25	Posting Berita	0	aktif	A	/dashboardadmin/postsnews/	icon-Write
3	Berita	0	aktif	F	none	\N
11	Gereja	0	aktif	F	non	\N
27	Kegiatan Gereja	0	aktif	A	/dashboardadmin/kegiatanGereja/	fa fa-institution
28	Firman Tuhan	0	aktif	A	/dashboardadmin/firtu/	fa fa-quote-left
13	Kategori	0	Tidak	F	non	\N
10	Galeri	0	aktif	F	gallery	\N
1	Home	0	aktif	F	/frontenduser/	\N
20	Dashboard	0	aktif	A	/dashboardadmin/	icon-Layout-4-blocks
32	tes menu 1	123	aktif	A	/tesmenu/tesbas/	fa fa-plus
29	Opini	0	Tidak	A	/dashboardadmin/opini/	icon-Chat
26	Galeri	0	aktif	A	/dashboardadmin/gallery/	icon-Book-open
31	Komentar Pengunjung	0	aktif	A	/dashboardadmin/komentarpengujung/	fa fa-comments
\.


--
-- TOC entry 3034 (class 0 OID 16775)
-- Dependencies: 223
-- Data for Name: masteruser; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.masteruser (user_id, username, password, full_name, level_user, user_status) FROM stdin;
12	client1	b'$2b$12$kCCHDEkELQXPj9Iw2AEzfOo7.k4ymMeLZHSbmnG8HuwfZ/ZQcd8xC'	client1	client	N
2	adminadmin1	3469	admin1	admin	N
13	ones	b'$2b$12$x0O2ynOUiTeGmy6uW5eG7ewHi/sBnN1aE0F/QB913h3MUQXnfuqA.'	ones yobe	admin	Y
14	bas yobe	b'$2b$12$XtAKJJ24oq1AfMMuhXrvfOgBnYK/da8gYepqFAA7nsJzE5E4B.MdS'	tes admin	client	N
15	vitalis	b'$2b$12$9e/jhS67nKLmi/sLNI8Ms.dNXhQTPMEGY.GEUFytYRDS92AOrRebG'	Vitalis Goo	client	Y
16	yudhi	$2b$12$GCGWp6Qfy2YovUlC2mEfNuR4016F6pHk9RFHA9YTybQaOjgdVulAW	aditya yudhi hanafi	superadmin	Y
1	admin	bastiar123	ahmad bastiar	superadmin	Y
17	bas	$2b$12$jLW5Cl8kc/NXNUC5iMohze.Vstl5eJCTIT6Np39/7/F9gbEYky/Rm	bas	superadmin	Y
\.


--
-- TOC entry 3035 (class 0 OID 16800)
-- Dependencies: 224
-- Data for Name: setting_aplikasi; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY master.setting_aplikasi (setting_id, setting_nohp, setting_addres, setting_about_title, setting_about_organisasi, setting_email, setting_desc_app) FROM stdin;
1	+62 852-2886-3507	Moenamani, Dogiyai.Papua, 98862	Cemara Papua	 <h3>Tim Redaksi</h3>\r\n                    <p>1. Penasehat\r\n                            <br>Pdt. Benny Giay\r\n                            <br>Pdt. Obeth Magai\r\n                            <br>Pdt. Mordekai Oilah\r\n                            <br>Medex Pakage\r\n                            <br>Yones Douw<br>\r\n                            \r\n                       <br>2. Penanggung jawab\r\n                           <br>Ones Yobee<br>\r\n                        <br>3. Pimpinan Redaksi\r\n                        <br>Agustinus Tebai<br>\r\n                        <br>Wakil Pimpinan \r\n                        <br>Nomen Douw<br>\r\n                        <br>5. Staff/Kontributor\r\n                        <br>Philemon Keiya\r\n                        <br>Vitalis Goo\r\n                        <br>Ones Yobee\r\n                        <br>Andri Yeimo\r\n                        <br>Yance Agapa\r\n                        <br>Daud Agapa<br>\r\n                        <br>6. Editor\r\n                        <br>Agustinus Tebai\r\n                        <br>Nomen Douw\r\n                        <br>Vitalis Goo<br>\r\n                       \r\n                    </p>	cemarapapuanews@gmail.com	 <p>\r\n                            Cerita Masyarakat Papua disingkat menjadi Cemara Papua adalah sebuah portal berita online yang menyajikan informasi berita dibidang Hukum, Politik, pendidikan, gereja, budaya , Pemerintahan dan Sosial.\r\n                        </p>\r\n                        <p>\r\n                            Media ini dikelolah oleh anak muda Papua melalui Yayasan Kasih Bapa Dogiyai ( Yakbado ). \r\n                        </p>\r\n                        <p>\r\n                            Kehadiran  media online ini hanya terlahir dari kepedulian tentang mengangkat cerita - cerita masyarakat.\r\n                        </p>\r\n                        <p>\r\n                            Harapan kami, cemarapapua.com akan membantu publik dalam mendapatkan informasi secara lengkap, jelas dan beretika karena cemarapapua.com adalah aspirasi rakyat.\r\n                        </p>\r\n                        <p>\r\n                            Redaksi .\r\n                        </p>\r\n\r\n                        <a href="#" class="btn post-btn ">Index Berita</a>
\.


--
-- TOC entry 3012 (class 0 OID 16422)
-- Dependencies: 201
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album (album_id, album_name, album_status) FROM stdin;
1	Kegiatan Gereja	Y
2	Kegiatan Yayasan	Y
3	Kegiatan HUT RI	Y
4	Kegiatan Bimtek	Y
5	Album Baru	N
6	Album Foto Testing	N
\.


--
-- TOC entry 3020 (class 0 OID 16458)
-- Dependencies: 209
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 16468)
-- Dependencies: 211
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 16450)
-- Dependencies: 207
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add mastercategory	7	add_mastercategory
26	Can change mastercategory	7	change_mastercategory
27	Can delete mastercategory	7	delete_mastercategory
28	Can view mastercategory	7	view_mastercategory
29	Can add m_user	8	add_m_user
30	Can change m_user	8	change_m_user
31	Can delete m_user	8	delete_m_user
32	Can view m_user	8	view_m_user
33	Can add mastermenu	9	add_mastermenu
34	Can change mastermenu	9	change_mastermenu
35	Can delete mastermenu	9	delete_mastermenu
36	Can view mastermenu	9	view_mastermenu
37	Can add masteruser	10	add_masteruser
38	Can change masteruser	10	change_masteruser
39	Can delete masteruser	10	delete_masteruser
40	Can view masteruser	10	view_masteruser
41	Can add postsberita	11	add_postsberita
42	Can change postsberita	11	change_postsberita
43	Can delete postsberita	11	delete_postsberita
44	Can view postsberita	11	view_postsberita
45	Can add postsfirmantuhan	12	add_postsfirmantuhan
46	Can change postsfirmantuhan	12	change_postsfirmantuhan
47	Can delete postsfirmantuhan	12	delete_postsfirmantuhan
48	Can view postsfirmantuhan	12	view_postsfirmantuhan
49	Can add setting_aplikasi	13	add_setting_aplikasi
50	Can change setting_aplikasi	13	change_setting_aplikasi
51	Can delete setting_aplikasi	13	delete_setting_aplikasi
52	Can view setting_aplikasi	13	view_setting_aplikasi
53	Can add album	14	add_album
54	Can change album	14	change_album
55	Can delete album	14	delete_album
56	Can view album	14	view_album
57	Can add firtu	15	add_firtu
58	Can change firtu	15	change_firtu
59	Can delete firtu	15	delete_firtu
60	Can view firtu	15	view_firtu
61	Can add gallery	16	add_gallery
62	Can change gallery	16	change_gallery
63	Can delete gallery	16	delete_gallery
64	Can view gallery	16	view_gallery
65	Can add mastercategory	17	add_mastercategory
66	Can change mastercategory	17	change_mastercategory
67	Can delete mastercategory	17	delete_mastercategory
68	Can view mastercategory	17	view_mastercategory
69	Can add mastermenu	18	add_mastermenu
70	Can change mastermenu	18	change_mastermenu
71	Can delete mastermenu	18	delete_mastermenu
72	Can view mastermenu	18	view_mastermenu
73	Can add masteruser	19	add_masteruser
74	Can change masteruser	19	change_masteruser
75	Can delete masteruser	19	delete_masteruser
76	Can view masteruser	19	view_masteruser
77	Can add postsberitaslider	20	add_postsberitaslider
78	Can change postsberitaslider	20	change_postsberitaslider
79	Can delete postsberitaslider	20	delete_postsberitaslider
80	Can view postsberitaslider	20	view_postsberitaslider
\.


--
-- TOC entry 3024 (class 0 OID 16476)
-- Dependencies: 213
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 16486)
-- Dependencies: 215
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 16494)
-- Dependencies: 217
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 16949)
-- Dependencies: 236
-- Data for Name: comentar_p; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentar_p (commentar_id, full_name, email, pesan, posts_id, com_date, com_status) FROM stdin;
1	Bastiar	bas@gmail.com	nice post	1	2021-09-15 21:43:57	N
\.


--
-- TOC entry 3030 (class 0 OID 16554)
-- Dependencies: 219
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 16440)
-- Dependencies: 205
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	cemarapapua_app	mastercategory
8	cemarapapua_app	m_user
9	cemarapapua_app	mastermenu
10	cemarapapua_app	masteruser
11	cemarapapua_app	postsberita
12	cemarapapua_app	postsfirmantuhan
13	cemarapapua_app	setting_aplikasi
14	cemarapapua_frontend	album
15	cemarapapua_frontend	firtu
16	cemarapapua_frontend	gallery
17	cemarapapua_frontend	mastercategory
18	cemarapapua_frontend	mastermenu
19	cemarapapua_frontend	masteruser
20	cemarapapua_frontend	postsberitaslider
\.


--
-- TOC entry 3014 (class 0 OID 16429)
-- Dependencies: 203
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-08-16 00:06:31.517819+09
2	auth	0001_initial	2021-08-16 00:06:31.563064+09
3	admin	0001_initial	2021-08-16 00:06:31.615445+09
4	admin	0002_logentry_remove_auto_add	2021-08-16 00:06:31.631114+09
5	admin	0003_logentry_add_action_flag_choices	2021-08-16 00:06:31.639079+09
6	contenttypes	0002_remove_content_type_name	2021-08-16 00:06:31.654474+09
7	auth	0002_alter_permission_name_max_length	2021-08-16 00:06:31.658459+09
8	auth	0003_alter_user_email_max_length	2021-08-16 00:06:31.674636+09
9	auth	0004_alter_user_username_opts	2021-08-16 00:06:31.681902+09
10	auth	0005_alter_user_last_login_null	2021-08-16 00:06:31.688892+09
11	auth	0006_require_contenttypes_0002	2021-08-16 00:06:31.689977+09
12	auth	0007_alter_validators_add_error_messages	2021-08-16 00:06:31.697322+09
13	auth	0008_alter_user_username_max_length	2021-08-16 00:06:31.708249+09
14	auth	0009_alter_user_last_name_max_length	2021-08-16 00:06:31.715698+09
15	auth	0010_alter_group_name_max_length	2021-08-16 00:06:31.722166+09
16	auth	0011_update_proxy_permissions	2021-08-16 00:06:31.730144+09
17	sessions	0001_initial	2021-08-16 00:06:31.737964+09
18	cemarapapua_app	0001_initial	2021-08-16 00:12:20.373914+09
19	cemarapapua_app	0002_auto_20210816_0013	2021-08-16 00:13:26.32698+09
20	cemarapapua_app	0002_auto_20210816_0018	2021-08-16 00:18:54.233458+09
21	cemarapapua_app	0003_auto_20210816_0031	2021-08-16 00:31:27.114447+09
22	cemarapapua_app	0004_auto_20210816_0033	2021-08-16 00:34:21.687095+09
23	cemarapapua_app	0005_m_user_user_level	2021-08-16 00:36:21.150249+09
26	cemarapapua_app	0006_delete_m_user	2021-08-16 10:31:38.049409+09
27	cemarapapua_app	0002_auto_20210816_1115	2021-08-16 11:15:55.705093+09
28	cemarapapua_app	0002_auto_20210816_1121	2021-08-16 11:21:12.482743+09
29	cemarapapua_app	0002_auto_20210907_0029	2021-09-07 00:29:58.338786+09
30	cemarapapua_frontend	0001_initial	2021-09-07 00:29:58.363549+09
31	cemarapapua_app	0002_auto_20210907_0031	2021-09-07 00:31:26.754462+09
32	cemarapapua_app	0003_auto_20210907_0034	2021-09-07 00:45:07.308784+09
33	cemarapapua_app	0002_auto_20210907_0045	2021-09-07 00:45:30.675047+09
34	cemarapapua_app	0002_auto_20210910_2357	2021-09-11 04:58:39.385474+09
35	cemarapapua_app	0003_auto_20210911_0258	2021-09-11 04:58:39.394324+09
\.


--
-- TOC entry 3031 (class 0 OID 16585)
-- Dependencies: 220
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
i93lucv5lhqbg35h4ot93th6epihl37x	ZjhmMjM1YjE0MzE3NDU5NWY3YTYyNWU5ZGFmODU0NmRkYjY5NmU0MDp7Im5leHRfYWRtaW4iOiJqYW5jdWsiLCJjZW1hcmFwYXB1YV9hZG1pbiI6Inl1ZGhpIiwiZnVsbG5hbWVfYWRtaW4iOiJhZGl0eWEgeXVkaGkgaGFuYWZpIiwidWlkX2NsaWVudCI6MTYsInVzZXJuYW1lX2ZpbmFsX2FkbWluIjoieXVkaGkifQ==	2021-09-24 23:58:52.024617+09
nek9zie545slw006tof52s6kk33gl8tb	OTgxOTk1ZTc2MTE0NGRkNDg1YmNhZGY1N2YzNTBhMDY2YmMxM2MyMjp7Im5leHRfYWRtaW4iOiJqYW5nYW5zYXJ1IiwiY2VtYXJhcGFwdWFfYWRtaW4iOiJiYXMiLCJ1bmFtZV9hZG1pbiI6ImJhcyIsImZ1bGxuYW1lX2FkbWluIjoiYmFzIiwic3RhdHVzX2FkbWluIjoiWSIsImxldmVsX2FkbWluIjoic3VwZXJhZG1pbiIsInVpZF9jbGllbnQiOjE3LCJ1c2VybmFtZV9maW5hbF9hZG1pbiI6ImJhcyJ9	2021-09-30 02:56:10.024667+09
ubthpuwdks9ydw3phbylw6wp5blw2u0a	NDgwZWExOTJmNDRlZDU1NTYyMjA3MzliNDFkNGNiMjJjODQyNGViZTp7Im5leHRfYWRtaW4iOiJqYW5jdWsiLCJjZW1hcmFwYXB1YV9hZG1pbiI6ImJhcyIsImZ1bGxuYW1lX2FkbWluIjoiYmFzIiwidWlkX2NsaWVudCI6MTcsInVzZXJuYW1lX2ZpbmFsX2FkbWluIjoiYmFzIn0=	2021-09-28 01:30:19.124115+09
\.


--
-- TOC entry 3036 (class 0 OID 16807)
-- Dependencies: 225
-- Data for Name: firtu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.firtu (firtu_id, firtu_title, firtu_date, firtu_desc, firtu_img, firtu_status) FROM stdin;
2	Tesalonika 5:18	2021-08-22 00:00:00	Aku senantiasa mengucap syukur kepada Allahku karena kamu atas kasih karunia Allah yang dianugerahkan-Nya kepada kamu dalam Kristus Yesus..	non-mg	Y
3	Korintus 1:4	2021-08-22 00:00:00	Aku bersyukur kepada-Mu oleh karena kejadianku dahsyat dan ajaib. Ajaib apa yang Kau buat dan jiwaku benar-benar menyadarinya..	non-mg	Y
4	Filipi 4:6	2021-08-22 00:00:00	Janganlah hendaknya kamu kuatir tentang apapun juga, tetapi nyatakanlah dalam segenap hal keinginanmu kepada Allah dengan doa dan permohonan dengan ucapan syukur.	non-mg	Y
5	Tawarikh 16:8	2021-08-22 00:00:00	Bersyukurlah kepada Tuhan, sebab Ia baik! Bahwasanya untuk selama-lamanya kasih setia-Nya..	non-mg	Y
1	Mazmur 139:14	2021-08-22 00:00:00	Aku bersyukur kepada-Mu oleh karena kejadianku dahsyat dan ajaib. Ajaib apa yang Kau buat dan jiwaku benar-benar menyadarinya.	non-mg	N
9	asdasdsadas	2021-09-13 03:06:04	<p>asdasdasdasd</p>	profile_b.jpg	N
11	coba coba firman tuhan lagi	2021-09-13 16:27:13	<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.<br />\r\nVel illum mollitia porro officiis beatae, maxime exercitationem a eligendi esse,<br />\r\n&nbsp;distinctio aliquid assumenda hic minima quod! Beatae excepturi pariatur dolorem illum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.<br />\r\nVel illum mollitia porro officiis beatae, maxime exercitationem a eligendi esse,<br />\r\n&nbsp;distinctio aliquid assumenda hic minima quod! Beatae excepturi pariatur dolorem illum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.<br />\r\nVel illum mollitia porro officiis beatae, maxime exercitationem a eligendi esse,<br />\r\n&nbsp;distinctio aliquid assumenda hic minima quod! Beatae excepturi pariatur dolorem illum.</p>\r\n\r\n<p>&nbsp;</p>	tutti-macbook-preview-1200x800.jpg	N
10	tes firman tuhan	2021-09-13 16:22:05	<p>asdsadasd</p>	1625760945.jpeg	N
\.


--
-- TOC entry 3011 (class 0 OID 16417)
-- Dependencies: 200
-- Data for Name: gallery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gallery (gallery_id, gallery_name, gallery_img, gallery_date, user_id, gallery_status, gallery_link, album_id, gallery_log) FROM stdin;
2	Foto Kegiatan gereja 02	berita2.jpg	2021-08-14 00:00:00	1	F	link	2	Y
3	Foto Kegiatan gereja 03	berita3.jpg	2021-08-14 00:00:00	1	F	link	3	Y
4	Foto Kegiatan gereja 04	berita4.jpeg	2021-08-14 00:00:00	1	F	link	1	Y
5	Foto Kegiatan gereja 05	berita5.jpeg	2021-08-14 00:00:00	1	V	https://www.youtube.com/embed/4PEM5Z2VoU8	1	Y
6	Foto Kegiatan Gereja 06	berita1.jpg	2021-08-22 00:00:00	1	F	link	2	Y
1	Foto Kegiatan gereja 01	berita1.jpg	2021-08-14 00:00:00	1	F	link	1	N
7	Foto Kegiatan gereja 07	berita3.jpg	2021-08-22 00:00:00	1	F	link	3	N
8	kegiatan bim tek	url.png	2021-09-14 10:59:25	1	F	-	2	N
\.


--
-- TOC entry 3010 (class 0 OID 16409)
-- Dependencies: 199
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (posts_id, posts_date, user_id, posts_title, posts_desc, posts_img, category_id, posts_status, posts_page_view, posts_keyword) FROM stdin;
2	2021-08-19 00:00:00	1	Aturan Lengkap Syarat Perjalanan Dalam-Luar Negeri saat PPKM	Jakarta, CNN Indonesia -- Pemberlakuan Pembatasan Kegiatan Masyarakat (PPKM) Level 1-4 kembali diperpanjang untuk penanganan pandemi covid-19. Selama penerapan kebijakan tersebut pemerintah menerapkan sejumlah aturan pembatasan mobilitas, termasuk aturan perjalanan.\r\nKetentuan terbaru mengenai perjalanan dalam negeri diatur melalui Surat Edaran Satuan Tugas Penanganan Covid-19 Nomor 17 Tahun 2021 tentang Ketentuan Perjalanan Dalam Negeri pada Masa Pandemi Covid-19. Edaran itu mulai berlaku hari ini, Rabu (11/8).\r\n\r\nDalam surat tersebut disebutkan setiap pelaku perjalanan harus melaksanakan protokol kesehatan dengan memakai masker kain tiga lapis atau masker medis, menjaga jarak, dan sering mencuci tangan.\r\nPelaku perjalanan tidak diperkenankan berbicara melalui telepon atau secara langsung sepanjang perjalanan dengan moda transportasi umum. Untuk moda transportasi udara kurang dari dua jam, penumpang tidak diperkenan makan selama kecuali untuk kondisi tertentu.\r\nBerikut syarat lengkap perjalanan dalam negeri terbaru selama masa pandemi covid-19:\r\n\r\n- Moda transportasi udara perjalanan dari dan ke Pulau Jawa dan Bali serta daerah yang menerapkan PPKM Level 4 dan 3 wajib menunjukkan kartu vaksin minimal dosis pertama dan hasil tes negatif PCR maksimal 2 x 24 jam.\r\n\r\n- Moda transportasi udara perjalanan antar kota atau kabupaten di Pulau Jawa dan Bali wajib menunjukkan kartu vaksin minimal dosis pertama, hasil negatif PCR maksimal 2 x 24 jam, atau rapidtest antigen maksimal 1 x 24 jam.\r\n\r\n- Moda transportasi laut, darat menggunakan kendaraan pribadi atau umum, penyebrangan dan kereta api antar kota dari dan ke Pulau Jawa dan Bali serta daerah PPKM Level 4 dan 3 wajib menunjukkan kartu vaksin, hasil negatif PCR maksimal 2 x 24 jam, atau rapidtest antigen maksimal 1 x 24 jam.\r\n\r\n- Moda transportasi udara, darat menggunakan kendaraan pribadi atau umum, penyebrangan dan kereta api antar kota di luar Pulau Jawa dan Bali serta daerah PPKM Level 1 dan 2 wajib menunjukkan hasil negatif PCR maksimal 2 x 24 jam dan rapidtest antigen 1 x 24 jam.	berita2.jpg	11	publish             	350	\N
1	2021-08-19 00:00:00	1	Sri Mulyani Klaim Ekonomi Tumbuh Berkat Kebijakan Pemerintah	Jakarta, CNN Indonesia -- Menteri Keuangan Sri Mulyani mengklaim pertumbuhan ekonomi Indonesia yang bangkit ke kisaran 7,07 persen pada kuartal II 2021 terjadi berkat kebijakan pemerintah. Khususnya melalui berbagai stimulus fiskal seperti bantuan sosial (bansos).\r\n"Saat kita hadapi tekanan luar biasa, pemerintah memberikan melalui kebijakan fiskal, bantuan sosial untuk meminimalkan dampak terhadap masyarakat, terutama kelompok masyarakat menengah ke bawah yang terpukul sangat dalam akibat pandemi," ungkap Ani, sapaan akrabnya, saat konferensi pers virtual, Kamis (5/8).\r\nAni mengatakan pemerintah sengaja memberikan bansos kepada masyarakat agar jumlah masyarakat yang jatuh ke jurang kemiskinan tidak terlalu banyak, meski\r\n"Dengan demikian bisa mempengaruhi dari sisi demand apabila pengangguran atau kemiskinan bisa diminimalkan atau ditahan kenaikannya," imbuhnya.\r\n\r\nTak cuma berupa bansos, bendahara negara mengklaim kebijakan pemerintah lainnya yang juga mendongkrak pertumbuhan ekonomi adalah relaksasi pajak penjualan atas barang mewah (PPnBM) kepada sektor otomotif.\r\n\r\nHal ini berdampak positif bagi industri manufaktur yang meningkat produksinya seiring naiknya permintaan kendaraan bermotor dari masyarakat.\r\n"Jadi terlihat sekali kenaikan dari konsumsi maupun dari manufaktur, itu didukung salah satunya komoditas otomotif yang dapat bantuan PPnBM. Jadi terlihat policy pemerintah memberikan dampak nyata dan positif," tuturnya.\r\n\r\nAni berharap pertumbuhan ekonomi yang sudah positif pada kuartal II bisa berlanjut ke kuartal III dengan peran pemulihan konsumsi dari masyarakat. Khususnya, masyarakat menengah atas sehingga bisa memperkuat pemulihan ekonomi Indonesia ke depan.\r\nDi sisi lain, ia memastikan APBN sebagai instrumen fiskal pemerintah akan terus digunakan untuk mendorong sisi permintaan dari masyarakat maupun penawaran dari dunia usaha. Hal ini dilakukan dengan memberikan tambahan bansos kepada masyarakat hingga insentif bagi dunia usaha\r\n	berita4.jpg	5	publish             	1	\N
5	2021-08-19 00:00:00	1	Erick Thohir Sebut Biaya Logistik RI Lebih Mahal dari Dunia	Jakarta, CNN Indonesia -- Menteri Badan Usaha Milik Negara (BUMN) Erick Thohir mengatakan biaya logistik Indonesia sebelas persen lebih mahal dari dunia.\r\nMenurutnya, porsi biaya logistik Indonesia 24 persen dari Produk Domestik Bruto (PDB). Angka ini lebih tinggi ketimbang rata-rata dunia yang sebesar 13 persen. Hal ini mengakibatkan biaya logistik Indonesia kurang bersaing dengan negara lain.\r\n\r\n"Biaya logistik Indonesia kurang lebih 24 persen, dunia rata-rata 13 persen. Jadi logistik kita jauh lebih mahal 11 persen, gimana mau compete (bersaing)?" ujarnya pada siaran live Chatroom CNN Indonesia, Rabu (11/8).\r\n\r\n\r\n\r\nErick menyebut mahalnya biaya logistik disebabkan oleh minimnya fasilitas infrastruktur dalam negeri. Karena itu, ia menyebut meski di tengah pandemi, infrastruktur BUMN tetap harus diperbaiki.\r\n\r\nIni termasuk penyuntikan Penanaman Modal Negara (PMN) kepada BUMN yang beberapa saat lalu sempat dikritik ekonom dan anggota DPR. Menurut Erick, infrastruktur tetap harus dibangun selama pandemi karena pembangunan ditujukan untuk jangka panjang.\r\n\r\n	berita2.jpg	5	publish             	3	\N
6	2021-08-19 00:00:00	1	Penerbangan dari dan ke Luar Jawa-Bali Tetap Wajib PCR	Jakarta, CNN Indonesia -- Penerbangan dari dan ke luar wilayah Jawa-Bali yang berstatus level 3 dan 4 masih mewajibkan penumpang untuk tes PCR dan kartu vaksin. Syarat antigen hanya berlaku antar wilayah Jawa Bali.\r\nHal diatur dalam Surat Edaran Nomor SE 62 Tahun 2021 tentang Petunjuk Pelaksanaan Perjalanan Orang dalam Negeri dengan Transportasi Udara pada Masa Pandemi Covid-19.\r\n\r\n"Untuk penerbangan dari atau ke bandar udara di Pulau Jawa dan Pulau Bali, serta daerah yang ditetapkan melalui Instruksi Menteri Dalam Negeri sebagai daerah dengan kategori PPKM Level 4 dan PPKM Level 3, wajib menunjukkan kartu vaksin (minimal vaksinasi dosis pertama) dan surat keterangan hasil negatif tes RT-PCR yang sampelnya diambil dalam kurun waktu maksimal 2x24 jam sebelum keberangkatan," demikian bunyi edaran tersebut.\r\n	berita6.jpg	11	publish             	4	\N
7	2021-08-19 00:00:00	1	Pesan Tiket Pesawat Wajib Sertakan NIK dan PeduliLindungi	Jakarta, CNN Indonesia -- Kementerian Perhubungan (Kemenhub) mewajibkan penggunaan Nomor Induk Kependudukan (NIK) bagi masyarakat yang memesan tiket pesawat.\r\nKeputusan tersebut termaktub dalam Surat Edaran (SE) Kemenhub No.62 Tahun 2021 tentang Petunjuk Pelaksanaan Perjalanan Orang Dalam Negeri dengan Transportasi Udara Pada Masa Pandemi Covid-19 dan SE Kemenhub No.63 tentang Petunjuk Pelaksanaan Perjalanan Internasional dengan Transportasi Udara Pada Masa Pandemi Covid-19.\r\n\r\n"Mewajibkan penumpang pesawat udara untuk mencantumkan Nomor Induk Kependudukan (NIK) pada saat reservasi tiket, baik reservasi yang dilakukan melalui kanal penjualan Badan Usaha Angkutan Udara maupun melalui kanal penjualan lainnya yang telah bekerjasama dengan Badan Usaha Angkutan Udara," demikian dalam keterangan siaran pers bersama Satgas Covid-19 dan Kemenhub, Rabu (11/8).\r\nJuru Bicara Satgas Kemenhub Adita Irawati mengatakan, pembaruan aturan ini sejalan dengan dengan Instruksi Mendagri Nomor 30,31, dan 32 Tahun 2021 dan SE Satgas Nomor 17 dan 18 tahun 2021 tentang ketentuan perjalanan orang pada masa pandemi Covid-19.\r\n\r\nAdita mengatakan, kebijakan baru tersebut nantinya hanya akan berlaku bagi pengguna transportasi udara saja. "Sama dengan SE Satgas, SE Kemenhub ini berlaku mulai 11 Agustus 2021.\r\n\r\nSementara untuk transportasi darat, laut, dan kereta api masih tetap menggunakan Surat Edaran yang berlaku saat ini karena tidak ada perubahan dalam syarat perjalanan," jelasnya dalam keterangan tertulis, Selasa (10/8).\r\n\r\nDalam SE Kemenhub juga diatur soal larangan memberikan makanan dan/atau minuman kepada penumpang pada penerbangan yang berdurasi di bawah dua jam kecuali untuk kepentingan medis.\r\n\r\n	berita1.jpg	5	publish             	100	\N
27	2021-07-11 04:28:43	1	aasd	<p>asd</p>	4808_99deigns.com-wongkampung-dotcom.JPG	16	publish             	0	ssdf
8	2021-08-22 00:00:00	1	Dapat Izin OJK, Fintech Ini Akan Salurkan Rp 700 M ke Petani-UMKM	<p>\r\n\tJakarta - TaniFund, platform peer-to-peer lending telah mengantongi izin dari Otoritas Jasa Keuangan (OJK) sebagai Penyelenggara Fintech P2P Lending Sektor Agrikultur. Keputusan OJK tersebut tertuang dalam Surat Tanda Berizin KEP-64/D.05/2021 yang diterbitkan pada tanggal 2 Agustus 2021.\r\nTaniFund adalah satu-satunya P2P lending yang bergerak di bidang agrikultur dengan izin OJK hingga siaran pers ini diterbitkan. TaniFund berkomitmen menyediakan akses permodalan bagi petani dan UMKM di seluruh negeri.\r\n</p>\r\n\r\n<p>\r\n\tChief Strategy Officer TaniHub Group mengatakan pihaknya menargetkan akan menyalurkan pendanaan baru sebesar Rp 700 miliar dalam beberapa tahun ke depan.\r\n\r\n</p>\r\n<p>\r\n\t"Harapan kami di TaniFund yaitu ingin lebih luas lagi menciptakan dampak sosial dengan memberikan akses inklusi keuangan dan permodalan bagi petani serta pengusaha UMKM lokal melalui ekosistem kami," ujarnya, dalam keterangannya, dikutip Sabtu (21/8/2021).\r\n</p>\r\n\r\n<p>\r\n\tTidak hanya itu, lanjut Ria, dengan lisensi OJK TaniFund meyakini dapat mengundang lebih banyak lagi lender baru dan mendorong lender lama untuk meningkatkan pendanaan mereka. Mereka juga akan mendapat edukasi mengenai pemahaman risiko, namun tetap rutin diberikan kepada lender sesuai dengan anjuran OJK dan Asosiasi Fintech Pendanaan Bersama Indonesia (AFPI).\r\n</p>\r\n\r\n<p>\r\n\t"Tujuan kami melalui lisensi ini adalah menjaga TKB90 kami di angka 100%. Perlu kami tekankan bahwa berdasarkan aturan OJK, para lender tetap harus menyadari bahwa tetap ada risiko pendanaan yang mereka akan tanggung, misalnya resiko telat bayar atau gagal bayar. Untuk memitigasi risiko tersebut, TaniFund memiliki advanced credit scoring system, agronomist yang handal, kontrak dengan credit insurance, dan memenuhi berbagai arahan dari pihak regulator," tambahnya.\r\n</p>\r\n\r\n<p>\r\n\tCEO TaniHub Group, Pamitra Wineka mengatakan, lisensi OJK menjadi bahan bakar bagi TaniFund agar terus bergerak menciptakan dampak sosial melalui penyediaan akses permodalan dan pembinaan kepada petani.\r\n</p>\r\n\r\n<p>\r\n\t"Sebagai bagian dari TaniHub Group, TaniFund ke depannya diharapkan semakin memperbesar kontribusinya terhadap bisnis, sesuai dengan strategi kami dalam beberapa tahun ke depan untuk memperkuat sisi hulu atau upstream agar semakin memberikan dampak kepada sektor pertanian Indonesia," ujar Pamitra.\r\n</p>\r\n\r\n<p>\r\n\tSejak didirikan pada 2017 hingga kini, TaniFund telah menyalurkan pendanaan dari masyarakat sebesar Rp 324,3 miliar kepada lebih dari 4.000 borrower. Seiring dengan bertumbuhnya kepercayaan masyarakat kepada TaniFund, hingga kini total lender telah mencapai lebih dari 10.000, terdiri dari lender individu maupun institusi.\r\n</p>	berita10.jpeg	5	publish             	120	ekonomi,umkm,petani
11	2021-08-22 00:00:00	1	Kemenkes Diminta Transparan soal Penetapan Harga Setiap Komponen Tes PCR	<p>\r\n\tJakarta - Indonesia Corruption Watch (ICW) menanggapi penetapan harga eceran tertinggi (HET) terkait tes PCR oleh Kementerian Kesehatan. Diketahui, HET tes PCR di Jawa-Bali saat ini adalah Rp 495 ribu, sedangkan untuk luar Jawa-Bali Rp 525 ribu.\r\nMenurut peneliti ICW, Wana Alamsyah, penetapan harga tersebut harus dibarengi dengan detail informasi dari masing-masing harga setiap komponen dalam pemeriksaan PCR. Pasalnya, ia merasa pemerintah kurang transparan dalam menyampaikan informasi terkait penanganan COVID-19, khususnya harga tes PCR.\r\n</p>\r\n\r\n<p>\r\n\tBerdasarkan data ICW, dari Oktober 2020 sampai 15 Agustus 2021, total ada 25.840.025 spesimen yang diperiksa di sejumlah lab di Indonesia. Dalam rentang waktu tersebut, HET tes PCR masih berada di harga Rp 900 ribu sesuai dengan SE Nomor HK.02.02/1/3713/2020.\r\n</p>\r\n\r\n<p>\r\n\t"Perhitungan secara kasar, jika kita menghitung atau mengkalkulasi jumlah spesimen yang diperiksa dikalikan dengan pemeriksaan paling tinggi 900.000. Setidaknya ada perputaran uang sebesar Rp 23,2 triliun," kata Wana dalam webinar Lapor COVID-19, Jumat (20/8/2021).\r\n\r\n</p>\r\n<p>\r\n\tKemudian saat ini HET tes PCR diturunkan menjadi Rp 495 ribu di Jawa-Bali, dan Rp 525 ribu di luar Jawa-Bali. Menurut Wana, penurunannya mencapai 45 persen dari harga yang ditetapkan pada tahun 2020.\r\n\r\n</p>\r\n<p>\r\n\t"Artinya, bisa jadi selisih harga ini merupakan sebagian keuntungan yang didapatkan oleh fasilitas kesehatan, atau laboratorium yang menyediakan pemeriksaan PCR," klaim Wana.\r\n\r\n</p>\r\n<p>\r\n\t"Apabila ini merupakan suatu profit yang didapatkan, ini tentunya sangat besar sekali. Dan rasanya dalam Surat Edaran tersebut pemerintah tidak pernah menyampaikan atau menetapkan berapa sebenarnya harga, atau persentase yang boleh didapat oleh penyedia jasa," lanjutnya.\r\n</p>\r\n\r\n<p>\r\n\tBaca juga: Pantauan Kemenkes: Belum Semua Laboratorium Terapkan Harga Baru PCR\r\nSelain itu, Wana menilai selama ini pihak Kemenkes selalu mengatakan mahalnya harga tes PCR disebabkan oleh beberapa komponen yang memang harganya cukup tinggi, seperti reagen.\r\n</p>\r\n\r\n<p>\r\n\t<b>Berikut daftar harga reagen pada tahun 2020, berdasarkan data yang diolah ICW.\r\n</b>\r\n</p>\r\n\r\n<ol>\r\n\t<li>April:</li>\r\n\t<li>Intron: Rp 200 ribu<li>\r\n\t<li>Toyobo: Rp 200 ribu<li>\r\n\t<li>Sansure: Rp 345 ribu.<li>\r\n</ol>\r\n<ol>\r\n\t<li>Mei:</li>\r\n\t<li>SD Biosensor: Rp 195 ribu.</li>\r\n</ol>\r\n<ol>\r\n\t<li>Juni:</li>\r\n\t<li>Intron: Rp 180-200 ribu.</li>\r\n</ol>\r\n<ol>\r\n\t<li>Agustus:</li>\r\n\t<li>Kogene: Rp 280 ribu.</li>\r\n</ol>\r\n<ol>\r\n\t<li>Oktober:</li>\r\n\t<li>Intron: Rp 180 ribu.</li>\r\n</ol>\r\n<p>\r\n"Ketika Kemenkes bilang reagen mahal, mahalnya seberapa? Dan apa mereknya, dan kapan pembelian tersebut dilakukan?" kata Wana.\r\n\t\r\n</p>\r\n<p>\r\n"Jika kita asumsikan bahwa di Oktober itu harga reagennya Rp 180 ribu, rasanya berdasarkan asumsi kami jangan-jangan di tahun 2021, harga reagen ini cenderung menyusut lagi, bukan hanya Rp 180 ribu. Ini yang menjadi tanggung jawab Kemenkes untuk menyampaikan informasinya," jelasnya/\r\n</p>\r\n<p>\r\nMemang apa saja komponen-komponen yang dihitung oleh Kemenkes dalam penetapan harga tes PCR? Klik halaman selanjutnya.\t\r\n</p>	berita13.jpeg	6	publish             	100	enetapan Harga, Komponen, Tes PCR
15	2021-08-22 00:00:00	1	Pendaftaran PPPK Guru di Papua dan Papua Barat Resmi Diperpanjang	<p>\r\n\tJAKARTA, KOMPAS.com – Badan Kepegawaian Negara resmi memperpanjang jadwal pendaftaran seleksi Pegawai Pemerintah dengan Perjanjian Kerja (PPPK) Guru khusus untuk wilayah Provinsi Papua dan Papua Barat. Perpanjangan pendaftaran seleksi PPPK Guru diumumkan BKN melalui sebuah unggahan di akun media sosialnya pada Selasa (27/7/2021) siang. “Bagi kalian yang ingin menjadi abdi negara khususnya sebagai tenaga pendidik di Provinsi Papua dan Papua Barat melalui formasi PPPK, Pemerintah memperpanjang masa pendaftaran hingga 31 Juli 2021 pukul 23.59 WIB,” tulis BKN.\r\n\r\n</p>\r\n\r\n<p>\r\n\tDalam unggahan tersebut, BKN juga mengunggah surat Kementerian Pendayagunaan Aparatur Negara dan Reformasi Birokrasi (Kemenpan RB) Nomor: B/1158/S.SM.01.00/2021. Pada surat tertanggal 26 Juli 2021 yang ditandatangani Sekretaris Kemenpan RB Dwi Wahyu Atmaji tersebut, dijelaskan sejumlah alasan yang melatarbelakangi perpanjangan pendaftaran PPPK Guru di Papua dan Papua Barat. Disebutkan, keputusan ini diambil merujuk surat Gubernur Papua Barat kepada Menteri PANRB nomor: 810/1437/GPB/2021 tanggal 23 Juli 2021.\r\n\r\n</p>\r\n\r\n<p>\r\n\tSurat tersebut mencantumkan perihal permohonan kebijakan terhadap pelaksanaan pengadaan PPPK Formasi Guru Tahun 2021 di Provinsi/Kabupaten/Kota se wilayah Provinsi Papua Barat. “Serta memperhatikan keterlambatan pembukaan pendaftaran guru PPPK di wilayah Provinsi Papua dan Papua Barat, jumlah pelamar yang masih sedikit, dan kendala akes jaringan dalam proses pendaftaran Guru PPPK,” tulis surat tersebut. “Sehubungan dengan hal tersebut dan berdasarkan rekomendasi rapat Panselnas tanggal 25 Juli 2021, bersama ini kami sampaikan agar Badan Kepegawaian Negara melakukan perpanjangan proses pendaftaran Guru PPPK di wilayah Provinsi Papua dan Papua Barat sampai tanggal 31 Juli 2021 dalam rangka mengoptimalkan pelamar bagi putra/putri Papua dan Papua Barat,” sambungnya.\r\n\r\n</p>\r\n\r\n<p>\r\n\tKini, bagi yang belum mendaftar dan berminat melakukan pendaftaran, bisa langsung melakukan registrasi di laman resmi SSCASN melalui link sscasn.bkn.go.id. Sebagaimana diketahui, sedianya jadwal pendaftaran CPNS dan PPPK, termasuk PPPK Guru ditutup pada 26 Juli 2021 pukul 23.59 WIB. Perlu diingat, perpanjangan pendaftaran PPPK Guru ini hanya berlaku bagi pelamar yang hendak memilih formasi di wilayah Papua dan Papua Barat. Adapun untuk pendaftaran formasi pada instansi di wilayah lainnya, tetap mengikuti jadwal yang berlaku sebelumnya.\r\n\r\n</p>\r\n\r\n<p>\r\n\tBerikut jadwal terbaru mengenai tahapan pendaftaran CPNS dan PPPK 2021 selengkapnya: Pengumuman Seleksi ASN: 30 Juni - 14 Juli 2021 Pendaftaran Seleksi ASN: 30 Juni - 26 Juli 2021 Pengumuman Seleksi Administrasi: 2 - 3 Agustus 2021 Masa Sanggah: 4 - 6 Agustus 2021 Jawab Sanggah: 4 - 13 Agustus 2021 Pengumuman Pasca Sanggah: 15 Agustus 2021\r\n\r\n</p>	berita17.png	11	publish             	75	Pendaftaran PPPK, Guru, di Papua,Papua Barat, Resmi Diperpanjang
21	2021-08-22 00:00:00	1	Otsus dan Percepatan Kesejahteraan Papua	\r\n<p>\r\n\tPANITIA khusus (Pansus) DPR Revisi UU Nomor 21/2001 tentang Otonomi Khusus Papua telah terbentuk dengan ketua pansus anggota Fraksi PDIP Komaruddin Watubun dari daerah pemilihan Papua. Terbentuknya Pansus Revisi Otsus Papua menunjukkan keseriusan Pemerintah dan DPR memulai proses perubahan terhadap UU Otsus Papua yang telah dilaksanakan selama 20 tahun (2001–2021).\r\n</p>\r\n\r\n\r\n<p>\r\n\tUU Otsus Papua adalah undang–undang politik bertujuan menyelesaikan masalah Papua yang tak tuntas diselesaikan, sekaligus juga mempercepat pembangunan dan pemberdayaan masyarakat Papua untuk mencapai kesejahteraan, keadilan dan kesetaraan dengan masyarakat Indonesia lainnya dalam bingkai NKRI.\r\n</p>\r\n\r\n\r\n<p>\r\n\tSelama 20 tahun penyelenggaraan Otsus (2001) dinilai bahwa Otsus belum dapat mewujudkan tujuannya. Akibatnya masyarakat Papua terutama orang asli Papua (OAP) masih hidup dalam situasi yang memprihatinkan seperti ditunjukkan dengan angka kemiskinan tertinggi, dan angka IPM yang terendah di seluruh Indonesia. Bahkan selama Otsus berlangsung intensitas terjadinya aksi kekerasan dan konflik antara aparat keamanan dan gerakan bersenjata OPM– yang berjuang melepaskan wilayah ini dari RI.\r\n\r\n</p>\r\n\r\n<p>\r\n\tKeprihatinan ini menjadi komitmen Presiden Joko Widodo setelah 15 kali lebih berkunjung ke tanah Papua, pada 29 September 2020 mengeluarkan sebuah keputusan yang dituangkan dalam Instruksi Presiden (Inpres) No 9/2020 tentang Percepatan Pembangunan Kesejahteraan di Provinsi Papua dan Papua Barat. Inpres ini merupakan langkah terobosan, terpadu, tepat, fokus dan sinergi antar kementerian/ lembaga dan pemerintah daerah untuk mewujudkan kesejahteraan, perdamaian, demokratis dan bermartabat bagi masyarakat di Papua dan Papua Barat, di dalam bingkai NKRI.\r\n\r\n</p>\r\n\r\n<p>\r\n\tInpres No 9/2020 bertujuan agar kementerian/lembaga yang selama ini kurang terkoordinasi, baik dalam pelaksanaan program pembangunan dan dananya untuk Papua dan Papua Barat, bisa memberikan nilai tambah kepada masyarakat. Selama ini masing–masing kementerian/lembaga tak jarang memperlihatkan arogansi sektoral di lapangan. Sehingga hal itu tidak memberikan nilai tambah terhadap kemajuan masyarakat Papua. \r\n\r\n</p>\r\n\r\n<p>\r\n\tBahkan pengalaman menunjukkan seringkali kita temui terdapat program fiktif, eksesnya terjadi mismanajemen keuangan. Realitas di lapangan menunjukkan karena tak mengetahui secara pasti aspirasi dan kebutuhan masyarakat, maka keliru dalam alokasi program dan anggaran. Akibatnya masyarakat hanya menjadi target dari program yang bukan menjadi aspirasi dan kebutuhan mereka. \r\n\r\n</p>\r\n<p>\r\n\t\r\nFenomena semacam itu sadar atau tidak mengakibatkan rakyat tidak percaya terhadap Pemerintah. Masyarakat beropini bahwa itu hanyalah program dan proyek tipu–tipu atau bohong–bohongan. Programnya dibuat dari kementerian/lembaga di Jakarta dengan tidak didukung data lapangan yang memadai. Rakyat hanya menjadi stempel di antara penyusun dan pembuat program dengan dana miliaran rupiah.\r\n\r\n</p>\r\n<p>\r\n\t\r\nTabloid lokal memberitakan baru-baru ini ada kasus bahwa kepala desa atau kepala kampung setelah cair dana desa, berkolaborasi dengan para pendamping membagi-bagi dana tersebut untuk pribadi setelah para pendamping membuat laporan pertanggungjawaban fiktif.  \r\n\r\n</p>\r\n<p>\r\n\t\r\nPraktik seperti itu masih sering kita temui hingga saat ini. Pengalaman semacam itu mungkin mendasari Presiden Joko Widodo yang turun langsung ke Papua dengan jaringan yang amat luas dan informasi yang dimiliki, melandasi beliau untuk mengeluarkan Inpres dengan menekankan pada dimensi kesejahteraan.  \r\n\r\n</p>\r\n	opini1.png	14	draft               	10	Otsus,Percepatan,Kesejahteraan,Papua
20	2021-08-22 00:00:00	1	Gotong Royong Pembangunan Gereja Jemaat Sion Wogeikebo Dogiyai	<p>\r\n\tDogiyai, Pembangunan gedung gereja Jemaat Sion Wogeikebo kabupaten Dogiyai diawali peletakan batu pertama tanggal 5 Januari 2021\r\n</p>\r\n<p>\r\n\tAcara peletakan batu pertama ini disertai dengan pesta jamuan kasih dengan pesta babi dan ayam.\r\n</p>\r\n\r\n<p>\r\n\tPekerjaan pada tahapan kedua adalah membuat bentuk badan rumah dan kepala rumah yang dilaksanakan dengan gotong royong.\r\n\r\n</p>\r\n	kegiatangereja2.jpg	2	publish             	10	Gotong Royong,Pembangunan,Gereja,Jemaat,Sion Wogeikebo,Dogiyai
19	2021-08-22 00:00:00	1	Bupati Resmikan Gereja Tertinggi di Dogiyai	<p>\r\n    RIBUAN warga dan umat Kristiani Kabupaten Dogiyai, Provinsi Papua, menghadiri prosesi peresmian Gereja Kemah Injil (Kingmi) di Tanah Papua Jemaat Eben-Haezer Mowanemani Klasis Kamuu di Mowanemani, Ibu Kota Kabupaten Dogiyai, Rabu (16/12).\r\n</p>\r\n\r\n\r\n<p>\r\n    Bupati Dogiyai Yakobus Dumupa, atas nama pemerintah dan masyarakat Dogiyai meresmikan gereja tertinggi bagi Jemaat Eben-Haezer Mowanemani. Proses pengresmian ditandai dengan pembukaan selubung papan nama, penandatanganan prasasti, pengguntingan pita, dan pembukaan pintu gereja. “Gedung gereja ini cukup megah dan paling tinggi di Dogiyai. Proses pengerjaan hingga penyelesaian gedung gereja ini menghabiskan dana Rp4 miliar lebih. Dana pembangunan berasal dari swadaya dan sumbangan jemaat serta bantuan Pemerintah Kabupaten Dogiyai,” kata Dumupa usai meresmikan Gereja Kingmi Jemaat Eben-Haezer Klasis Kamuu dalam keterangan tertulis, Kamis (17/12).\r\n</p>\r\n\r\n\r\n<p>\r\n    Pada kesempatan itu, Dumupa menyampaikan sejumlah hal penting di hadapan warga dan umat Kristiani. Pertama, gedung Gereja Eben-Haezer Mowanemani memecahkan dua rekor sekaligus, yaitu durasi pembangunan hingga penyelesaian yang paling cepat di Dogiyai dan merupakan gedung paling tinggi di Kota Mowanemani. Kedua, selama tiga tahun masa pemerintahan periode pertama memimpin Dogiyai daerah itu telah menggelontorkan anggaran sebesar hampir Rp40-an milyar untuk membangun rumah ibadah. Gereja Eben-Haezer merupakan salah satu gereja yang mendapat dana hibah pembangunan gedung gereja. Ketiga, pihaknya meminta warga Mowanemani dan sekitarnya untuk menjaga gedung Gereja Eben-Haezer yang baru diresmikan. Artinya, tidak boleh merusak gedung gereja ini agar digunakan sebagai tempat berdoa.\r\n    Keempat, ia juga meminta agar umat Kristiani di Mowanemani lebih berperan aktif dalam pembangunan bersama pemerintah. Hal ini penting mengingat urusan pembangunan merupakan tugas dan tanggungjawab semua warga, baik baik secara personal maupun kolektif. “Saya juga meminta warga, terutama umat Kristiani, ikut menjaga keamanan dan ketertiban menjelang, sesaat, dan setelah pelaksanaan Hari Raya Natal 2020 dan Tahun Baru 2021 agar dua momentum penting itu bisa dilaksanakan dengan aman dan damai,” lanjut Dumupa, mantan anggota Majelis Rakyat Papua (MRP). Dumupa melanjutkan, selama masa kepemimpinannya sebagai Bupati Dogiyai, dirinya memberikan perhatian serius pembangunan di bidang rohani dan sosial keagamaan bagi warga masyarakat. Misalnya, selama ini, Pemerintah Kabupaten Dogiyai memberi dana hibah untuk membangun ratusan rumah ibadah. Selain itu, lanjut Dumupa, Pemerintah Kabupaten Dogiyai juga membiayai berbagai kegiatan di bidang sosial dan keagamaan. Misalnya, memberi honor bulanan kepada 500 orang hamba Tuhan dan memfasilitasi kegiatan tur wisata rohani dan ibadah umrah ke Tanah Suci, dan lainnya. Pemerintah daerah juga memberikan perhatian serius pada aspek pembangunan sosial keagamaan. “Saya berpikir agama adalah sarana paling efektif menumbuhkan atau mengembangkan aspek rohani dan spiritual umat dan warga masyarakat,” kata Dumupa, bupati di tanah Papua yang sudah menerbitkan belasan buku. Usai prosesi pengresmian dilanjutkan dengan ibadah bagi umat Kristiani dan acara syukuran bersama warga masyarakat. (RO/OL-1)\r\n</p>\r\n	kegiatangereja1.jpg	2	draft               	10	Resmikan Gereja, Tertinggi, di Dogiyai
3	2021-08-19 00:00:00	1	Mal Buka, Pengunjung Wajib Scan Barcode dan Kartu Vaksin.	Kebijakan Kartu Vaksin Covid19	berita5.jpg	6	publish             	2	\N
4	2021-08-19 00:00:00	1	BLT Gaji Kemnaker Bakal Cair Besok	akarta, CNN Indonesia -- Kementerian Ketenagakerjaan (Kemnaker) menyatakan BLT subsidi gaji senilai Rp1 juta bakal masuk ke rekening 947.499 pekerja pada Kamis (12/8) besok.\r\nTarget tersebut dibuat setelah Kementerian Keuangan (Kemenkeu) mencairkan dana BLT subsidi upah senilai Rp947,499 miliar ke rekening Ditjen Pembinaan Hubungan Industrial dan Jaminan Sosial Tenaga Kerja (PHI Jamsostek) Kemnaker.\r\n\r\n"Mudah-mudahan Kamis (12/8) sudah di rekening penerima," ujar Sekretaris Jenderal Kemenaker Anwar Sanusi kepada CNNIndonesia.com, Selasa (10/8).\r\n\r\n\r\nIa menjelaskan bahwa dana yang masuk ke rekening Ditjen PHI Jamsostek selanjutnya akan ditransfer ke bank Himbara. Nantinya, bank Himbara akan mencairkan dana tersebut ke rekening masing-masing penerima.\r\n\r\n"Uang kemudian ditransfer ke bank-bank Himbara," imbuhnya.	berita3.jpg	11	publish             	100	\N
9	2021-08-22 00:00:00	1	judul berita : Genjot Akses Nelayan Dapat BBM, Erick Thohir Telepon Bos Pertamina	<p>\r\n\tJakarta - Menteri BUMN Erick Thohir bercerita bagaimana dia ingin nelayan bisa mengakses BBM. Ia mengatakan sistem logistik nelayan, 60% di antaranya berasal dari BBM, baik solar maupun premium.\r\nDia mengungkap dirinya sampai menghubungi langsung Bos PT Pertamina untuk membahas soal akses BBM bagi nelayan.\r\n</p>\r\n\r\n<p>\r\n\t"Tadi saya langsung telepon Dirut Pertamina langsung, sedang berpikir mungkin nggak Pertashop bisa juga hadir di tempat nelayan. Nanti jaraknya kita pikirkan," kata Erick dalam acara Jurus Erick Thohir Hadapi Pandemi di CNN Indonesia, Jumat (20/8/2021).\r\n</p>\r\n\r\n<p>\r\n\tErick juga tengah mencari cara agar ibu-ibu nelayan mendapat akses permodalan. Dalam kunjungannya ke tempat nelayan, Erick kaget belum ada ibu-ibu yang mengakses program Membina Ekonomi Keluarga Sejahtera (Mekaar).\r\n</p>\r\n\r\n<p>\r\n\t"Nah ini di banyak tempat sudah. Ini kan bagus bapak-bapaknya pulang bawa hasil, ibu-ibunya melakukan kegiatan produksi lebih baik tadi ada yang buat kerupuk, ada macam-macam turunannya. Ini akses permodalan bisa masuk," paparnya.\r\n</p>\r\n\r\n<p>\r\n\tSelain itu, Erick juga tengah mencari cara untuk membantu pemasaran produk-produk nelayan. Karena menurutnya pemasaran menjadi kunci terbesar.\r\n\r\n"Terakhir, pemasaran, ini yang memang jadi kunci terbesar. Makanya tadi untuk BBM saya akan selesaikan, untuk akses permodalan saya akan selesaikan. Akses pasar akan pelajari dulu," ujarnya.\r\n</p>	berita11.jpeg	5	publish             	100	BBM
28	2021-09-11 05:58:38	1	asd	<p>asd</p>	s.jpg	4	publish             	0	asd
12	2021-08-22 00:00:00	1	Dokter Ungkap Vaksin COVID-19 Paling Baik untuk Bumil	<p>\r\n\tJakarta - Ibu hamil kini boleh melakukan vaksinasi COVID-19. Hal itu sesuai dengan Surat Edaran Kementerian Kesehatan Nomor HK.02.01/1/2007/2021 tentang Vaksinasi COVID-19 Bagi Ibu Hamil dan Penyesuaian Skrining Dalam Pelaksanaan Vaksinasi COVID-19. Keputusan itu juga telah mendapat rekomendasi dari Komite Penasihat Ahli Imunisasi Nasional (ITAGI).\r\n\r\n</p>\r\n<p>\r\n\t\r\nMenanggapi hal tersebut, dokter spesialis penyakit dalam dr Andi Khomeini Takdir, mengatakan bahwa sekitar setahun ini banyak ditemukan ibu hamil yang terinfeksi virus Corona saat pra-bersalin.\r\n\r\n</p>\r\n\r\n<p>\r\n\t\r\n"Sebagian mereka mengalami infeksi di radang paru-parunya. Keluhan lain yang ditemukan seperti peradangan, ngilu, dan pengentalan darah," ungkapnya, dalam program e-Life detikcom, Jumat (20/8/2021).\r\n</p>\r\n\r\n<p>\r\n\tKondisi itu yang membuat ibu hamil mendapat rekomendasi untuk vaksinasi. Pria yang akrab disapa dr Koko itu menyebut bahwa jenis vaksin yang lazim diberikan untuk ibu hamil adalah Sinovac, Moderna, dan Pfizer.\r\n\r\n</p>\r\n\r\n<p>\r\n\t\r\n"Vaksin yang digunakan tentu vaksin yang tersedia," tuturnya.\r\n</p>\r\n\r\n<p>\r\n\tLebih lanjut, ia mengatakan bahwa waktu yang tidak tepat dilakukan untuk vaksin adalah pada trimester awal. Hal itu sesuai dengan rekomendasi dokter kandungan dan kebidanan.\r\n\r\n</p>\r\n<p>\r\n\t"Tapi agak lebih ke trimester 2 atau 3 itu lebih aman, karena kekebalan antibodinya diharapkan bisa terjaga sekitar 3-6 bulan pasca vaksinasi," kata dr Koko.\r\n\r\n</p>\r\n<p>\r\n\tSaat akan vaksinasi, ia juga menjelaskan bahwa ibu hamil harus memiliki rekomendasi dari dokter kandungan dan kebidanan serta dokter spesialis penyakit dalam.\r\n</p>	berita14.jpeg	6	publish             	100	vaksin
10	2021-08-22 00:00:00	1	Masih Ada Faskes Belum Turunkan Harga Tes PCR, Kemenkes Angkat Bicara	<p>\r\n\tJakarta - Beberapa layanan fasilitas kesehatan dan rumah sakit mengaku sudah menetapkan harga tes COVID-19 swab PCR sesuai aturan terbaru Kementerian Kesehatan RI, tetapi harga masih di atas tarif tertinggi karena alasan biaya administrasi. Seperti salah satunya di Klinik Kita, berlokasi di Cikupa, Tangerang.\r\n\r\n</p>\r\n<p>\r\n\tHarga tes swab PCR untuk 1x24 jam dikenakan Rp 550 ribu. Padahal, untuk wilayah Jawa Bali, harga tarif tertinggi PCR adalah Rp 495 ribu.\r\n\r\n</p>\r\n<p>\r\n\t"Itu harga minimal, untuk harga PCR di RS biasanya Rp 495 ribu di luar biaya administrasi. Tapi di kita 550 sudah termasuk biaya administrasi. Sudah sesuai (aturan) Kemenkes," demikian konfirmasi admin @klinikkita_cikupa kepada detikcom Sabtu (21/8/2021).\r\n</p>\r\n<p>\r\n\tSelain itu, RS Prikasih di Pondok Labu, Jakarta Selatan juga memiliki layanan tes PCR yang belum menurunkan harga sesuai ketetapan Kemenkes RI. Saat dikonfirmasi melalui direct message Instagram, admin faskes terkait membenarkan jika ada layanan PCR dengan harga belum sesuai aturan Kemenkes RI.\r\n</p>\r\n\r\n<p>\r\n\t"Belum," jelas admin @rsprikasih saat dikonfirmasi, dan tidak segera menjawab alasan mengapa belum menetapkan harga sesuai Kemenkes RI.\r\n\r\n</p>\r\n\r\n<p>\r\n\tDirektur Jenderal Pelayanan Kesehatan, Kementerian Kesehatan (Kemenkes), Abdul Kadir, menegaskan ketetapan tarif tertinggi PCR seharusnya sudah berlaku sejak 17 Agustus 2021. Tidak boleh ada alasan administrasi atau layanan tambahan yang ditetapkan faskes untuk memberikan harga lebih tinggi dari batas maksimal.\r\n</p>\r\n<p>\r\n\t\r\n"Sebenarnya sih sejak berlakunya tanggal 17 itu tentunya sudah harus mendapat sanksi kalau dia masih melakukan hal itu," tegas Prof Kadir.\r\n\r\n</p>\r\n<p>\r\n\t"Dalam aturan kita kan maksimal 1x24 jam. Jadi maksimal itu 1x24 jam," menegaskan tidak boleh ada alasan biaya tambahan karena layanan waktu PCR lebih cepat.\r\n\r\n</p>\r\n	berita12.jpeg	6	publish             	300	Tes PCR,Syarat PCR, Kemenkes, Faskes
17	2021-08-22 00:00:00	1	HUT RI ke-76, PLN Merdekakan Listrik Selama 24 Jam di Dogiyai, Deiyai dan Paniai Papua	\r\n<p>\r\n\tNabire (19/8), PLN berhasil meningkatkan jam nyala listrik Kabupaten Dogiyai, Deiyai dan Paniai dari 18 jam per hari menjadi 24 jam penuh. Peningkatan jam nyala ini merupakan kado istimewa untuk masyarakat tiga kabupaten tersebut saat HUT ke-76 Republik Indonesia.\r\n\r\n</p>\r\n<p>\r\n\tSelain fokus untuk melistriki daerah-daerah yang belum teraliri listrik di Papua dan Papua Barat, PLN juga terus berupaya untuk meningkatkan jam nyala di lokasi-lokasi yang telah berlistrik dan membutuhkan peningkatan jam nyala. Upaya peningkatan jam nyala ini dimulai oleh PLN pada bulan Februari 2021. Sebelumnya, sistem kelistrikan di 3 kabupaten masing-masing berdiri sendiri. Guna meningkatkan keandalan pasokan listrik, PLN memutuskan untuk menghubungkan jaringan listrik ketiga kabupaten dan memusatkan pembangkit listrik di Deiyai.\r\n\r\n</p>\r\n<p>\r\n\t“Puji Tuhan, saat ini pelanggan di Kabupaten Dogiyai, Deiyai dan Paniai sudah bisa merasakan listrik selama 24 jam penuh setiap harinya. Kami ucapkan terima kasih kepada pemerintah, masyarakat serta semua pihak atas dukungannya hingga PLN dapat menyelesaikan pekerjaan ini. Kami berkomitmen suplai listrik 24 jam penuh kami lakukan mulai hari ini dan seterusnya,” ucap Manager PLN Unit Pelaksana Pelayanan Pelanggan (UP3) Nabire, Manihar Hutajulu.\r\n\r\n</p>\r\n<p>\r\n\tSaat ini enam mesin pembangkit berkapasitas total 3,6 MW telah beroperasi untuk menyuplai listrik ke pelanggan di Kabupaten Deiyai, Dogiyai dan Paniai. Dengan 6.342 pelanggan yang ada dan beban puncak berkisar 2 MW, jumlah tersebut masih menyisakan surplus daya sebesar 1,6 MW. “Selanjutnya, kami akan berupaya agar pasokan listrik yang diberikan kepada pelanggan dapat terus andal,” ungkap Manihar.\r\n\r\n</p>\r\n<p>\r\n\tSementara itu, di sisi jaringan listrik, PLN telah menghubungkan sistem kelistrikan di 3 kabupaten dengan total panjang jaringan mencapai 200,02 kms. “Kami juga telah memperbaiki dan mengganti jaringan-jaringan yang sudah rusak. Ke depan PLN akan terus berupaya melakukan penguatan melalui perluasan jaringan, penambahan peralatan dan pemeliharaan secara berkala, sehingga suplai listrik dari pembangkit dapat disalurkan lebih maksimal,” tambahnya.\r\n\r\n</p>\r\n<p>\r\n\tManihar juga berharap agar masyarakat dapat mendukung PLN untuk sama-sama menjaga jaringan listrik yang ada, sehingga listrik untuk pelanggan tetap terjaga. “Kami mohon agar pelanggan dapat menggunakan listrik secara bijak dan bertanggungjawab sesuai aturan yang berlaku. Kami juga meminta dukungan serta kerelaan masyarakat apabila nantinya saat pemeliharaan jaringan mengharuskan kami untuk merabas/menebang pohon yang berdekatan dengan jaringan listrik 20 kV dan berpotensi mengenai jaringan. Hal ini dapat meminimalisir terjadinya padam,” jelasnya.\r\n\r\n</p>\r\n<p>\r\n\t“Semoga penambahan jam nyala listrik ini memberikan manfaat yang baik serta mendorong peningkatan pertumbuhan ekonomi, layanan kesehatan, pendidikan dan lain-lain bagi masyarakat di Dogiyai, Deiyai dan Paniai,” tutup Manihar.\r\n\r\n</p>\r\n	berita19.jpeg	12	publish             	110	HUT RI,ke-76, PLN, Merdekakan ,Listrik ,Selama 24 Jam di Dogiyai, Deiyai dan Paniai Papua
18	2021-08-22 00:00:00	1	Aparat Kampung di Nabire Pertanyakan Dana Desa yang Tak Kunjung Cair	<p>\r\n\tNabire, Hingga saat ini, Anggaran Dana Desa (ADD) Tahap II tahun 2020 dan ADD Tahap I tahun 2021, belum dicarikan. Hal ini dipertanyakan sejumlah aparat pemerintahan kampung.\r\n\r\n</p>\r\n\r\n<p>\r\n\t\r\nSalah seorang aparat pemerintahan kampung yang enggan disebutkan namanya, kepada Nabire.Net, jumat (20/08/21) menagatakan, hingga kini, ADD tahun 2021 belum diterima karena belum ditandatangani surat kuasa pemindah bukuannya.\r\n</p>\r\n\r\n<p>\r\n\tSesuai Perintah Presiden dan Menteri Keuangan bahwa secepatnya masyarakat penerima manfaat sudah harus menerimanya. BLT Dana Desa adalah bersumber dari APBN dan ditransferkan langsung dari rekening Kas Umum Negara ke rekening tiap-tiap kampung, menjadi syarat mutlak adalah surat kuasa pemindah bukuan oleh kepada daerah ke KPPN maka dana segera ditransfer ke rekening kampung.\r\n\r\n</p>\r\n<p>\r\n\t“Yang jadi hambatan, surat tersebut belum ditandatangani pejabat terkait dalam hal ini Penjabat Bupati Nabire. Pihak yang mengurus surat tersebut sudah berkali-kali bertemu Penjabat Bupati Nabire tetapi disampaikan bahwa nanti akan ditandatangani walaupun masih belum terealisasi hingga saat ini,” katanya.\r\n\r\n</p>\r\n<p>\r\n\tLanjutnya, dana tersebut seharusnya cair paling lambat pada bulan Maret 2021. Padahal semua dokumen sudah disiapkan dan sudah diverifikasi.\r\n\r\n</p>\r\n<p>\r\n\tTerkait hal itu, sejumlah pihak telah mempertanyakan hal ini ke Kantor Bupati Nabire, jumat siang (20/08/21), namun belum jelas kelanjutannya.\r\n\r\n</p>\r\n	berita20.jpeg	12	publish             	95	Aparat Kampung ,di Nabire, Dana Desa,Tidak Cair
16	2021-08-22 00:00:00	1	Catat Sejarah, E-sport Resmi Dipertandingkan dalam Cabor Ekshibisi PON XX Papua 2021	<p>\r\n\tKOMPAS.com - Olahraga e-sport resmi dipertandingkan dalam cabang olahraga (cabor) ekshibisi di Pekan Olahraga Nasional (PON) XX Papua 2021. Tentunya ini menjadi sejarah baru dalam perkembangan olahraga e-sport di Indonesia, karena untuk kali pertama akan dipertandingkan dalam multievent berskala nasional. E-sport tercatat sebagai salah satu dari 10 cabor yang dipertandingkan dalam Ekshibisi PON XX Papua 2021. \r\n\r\n</p>\r\n<p>Kepastian tersebut didapat setelah Pengurus Besar Esports Indonesia (PBESI) resmi menjadi anggota Komite Olahraga Nasional Indonesia (KONI). \r\n</p>\r\n<p>\r\n\tPenetapan e-sport sebagai cabang olahraga ekshibisi PON XX Papua 2021 beserta sembilan cabang olahraga lain berdasarkan SK KONI Pusat No 67 Tahun 2021. \r\n\r\n</p>\r\n<p>\r\n\tSekjen PBESI Frengky Ong mengatakan, rencananya ada tiga nomor atau gim yang dipertandingkan dalam Ekshibisi PON XX Papua 2021. Ketiga gim tersebut yaitu eFootball PES 2021, Mobile Legends, dan Free Fire. \r\n\r\n</p>\r\n<p>\r\n\t"Pada ekshibisi tersebut akan dipertandingkan tiga nomor pertandingan dengan genre battle royale, MOBA, dan sepak bola," kata Frengky dalam konferensi pers virtual yang berlangsung pada Rabu (18/8/2021). \r\n\r\n</p>\r\n<p>\r\n\t"Nomor pertandingan battle royale dan MOBA akan dilakukan dengan beregu atau tim pada platform MOBA. Sementara untuk sepak bola dilakukan secara perorangan maupun ganda pada platform konsol," sambung dia.\r\n\r\n</p>\r\n\r\n\r\n<p>\r\n\tBagi PBESI, Ekshibisi PON XX Papua 2021 menjadi semacam wabah penyaringan atlet-atlet potensial yang nantinya mewakili Indonesia dalam turnamen atau kompetisi internasional. Pasalnya, para atlet e-sport dengan performa terbaik di ekshibisi e-sport PON XX Papua 2021 akan mendapat kesempatan menjalani pemusatan latihan di Pelatnas dan dibina langsung oleh PBESI.\r\n\r\n</p>\r\n<p>\r\n\t "Mereka akan dipersiapkan untuk mengikuti turnamen-turnamen e-sports internasional dan mewakili Indonesia untuk mengikuti kejuaraan multi event, seperti SEA Games, Asian Games, dan lainnya," tutur Frengky.\r\n\r\n</p>\r\n<p>\r\n\t  Terkait tahapan pendaftaran, calon peserta harus mendaftarkan diri melalui platform Garudaku. Tahap pendaftaran akan dibuka sejak 18 Agustus 2021. Peserta yang ikut harus mewakili daerah masing-masing sesuai dengan daerah domisili di KTP atau KIA. Setelahnya, babak kualifikasi akan diselenggarakan dari 26 Agustus hingga 5 September 2021.\r\n\r\n</p>\r\n<p>\r\n\t  Khusus untuk eFootball PES 2021 akan dibagi menjadi enam grup. Babak kualifikasi provinsi ini bersifat terbuka dan digelar secara virtual. Pada babak ini, akan dicari satu atlet atau tim terbaik dari masing-masing kategori. \r\n\r\n</p>\r\n<p>\r\n\t  "Jadi, nanti akan didapat 34 perwakilan tim dari masing-masing cabang gim," ungkap Franky. Setelahnya, pada babak Pra-PON akan mempertemukan peserta dari 33 provinsi secara acak dan dilakukan secara daring. Mereka akan memperebutkan 11 tim terbaik Free Fire, lima tim terbaik Mobile Legends, dan lima orang terbaik eFootball PES 2021.\r\n\r\n</p>\r\n<p>\r\n\t   "Semua atlet dan tim terbaik itu akan diterbangkan ke Papua untuk mengikuti babak final di main event PON XX Papua 2021, yaitu pada 22 hingga 26 September 2021. Di babak final, mereka akan bertanding memperebutkan gelar juara di masing-masing gim," tutur Frengky. Frengky melanjutkan, PBESI bekerja sama dengan masing-masing game publisher dalam gelaran Ekshibisi Esports PON XX Papua 2021. \r\n\r\n</p>\r\n<p>\r\n\t   Selain soal teknis, mengenai pendanaan pun game dalam Ekshibisi Esports PON XX Papua 2021 dilakukan secara swadaya dari masing-masing game publisher. Dengan demikian, setiap game publisher bertanggung jawab terhadap produknya masing-masing. \r\n\r\n</p>\r\n<p>\r\n\t   "Masing-masing game publisher mendanai dan bertanggung jawab terhadap gim yang dipertandingkan, sementara PBESI sebagai regulator dan federasi e-sports resmi di bawah Pemerintah Indonesia bertanggung jawab terhadap keseluruhan rangkaian acara ekshibisi e-sports PON ini," ucap Frengky.\r\n\r\n</p>	berita18.jpg	4	publish             	100	E-sport,Resmi ,Dipertandingkan,Cabor Ekshibisi,PON XX ,Papua 2021
13	2021-08-22 00:00:00	1	Kegiatan Sosial Budaya Saat Perpanjangan PPKM Mikro Diperlonggar, Dibatasi 25 Persen	<p>\r\n\tJAKARTA, KOMPAS.com - Pemerintah melonggarkan aturan jumlah orang yang hadir dalam kegiatan sosial dan budaya dalam perpanjangan pelaksanaan pembatasan kegiatan masyarakat (PPKM) berskala mikro pada 23 Maret hingga 5 April 2021. \r\n\r\n</p>\r\n<p>\r\n\tSebelumnya, pemerintah tidak mengizinkan pelaksanaan kegiatan sosial dan budaya untuk mencegah penyebaran Covid-19. Hal itu diungkapkan oleh Direktur Jenderal Administrasi Wilayah Kementerian Dalam Negeri (Kemendagri) Syafrizal. \r\n\r\n</p>\r\n<p>\r\n\t"Pada prinsipnya (pelaksanaan PPKM Mikro) masih sama. Ditambah pembatasan pembatasan bidang sosial budaya hanya boleh paling banyak 25 persen. Dengan prokes (protokol kesehatan) yang ketat," kata Syafrizal kepada wartawan, Jumat (19/3/2021).\r\n\r\n</p>\r\n\r\n<p>\r\n\tAdapun dalam Instruksi Menteri Dalam Negeri (Inmendagri) Nomor 5 Tahun 2021 tentang Pemberlakuan Pembatasan Kegiatan Masyarakat Berbasis Mikro dan Mengoptimalkan Posko Penanganan Covid-19 dan Kelurahan untuk Pengendalian Penyebaran Covid-19 aturan mengenai kegiatan sosial budaya dibatasi sebanyak 50 persen pengunjung. \r\n\r\n</p>\r\n<p>\r\n\tSyafrizal mengatakan, pelonggaran ini dilakukan agar para pekerja seni bisa membiasakan diri dengan adaptasi kebiasaan baru.\r\n\r\n</p>\r\n<p>\r\n\tSelain memperlonggar ketentuan orang untuk kegiatan seni budaya, pemerintah juga memperluas daerah yang melaksanakan PPKM mikro sebanyak lima provinsi.\r\n\r\n</p>\r\n<p>\r\n\tAdapun lima provinsi tersebut adalah Kalimantan Tengah, Kalimantan Selatan, Sulawesi Utara, Nusa Tenggara Barat dan Nusa Tenggara Timur. Syafrizal mengatakan, lima daerah itu telah memasuki salah satu kriteria indikator pelaksanaan PPKM. "Akan diperluaskan kembali. Ditambah daerah lagi. Akan segera difinalkan evaluasinya," ujar dia.\r\n</p>\r\n	berita15.jpg	13	publish             	150	Sosial Budaya,Perpanjangan,PPKM,Mikro,Diperlonggar
14	2021-08-18 00:00:00	1	PON XX Papua 2021, Urusan Konsumsi Penting	<p>\r\n\tJAKARTA, KOMPAS.com - Menurut Sekretaris Daerah Kabupaten Mimika Michael Rooney Gommar, urusan konsumsi pada perhelatan Pekan Olahraga Nasional (PON) XX Papua 2021 adalah hal penting.\r\n</p>\r\n\r\n\r\n<p>\r\n\tKonsumsi, lanjut Michael, menjadi hal yang diperhatikan dengan baik. Konsumsi untuk para peserta, ujar Michael, adalah faktor yang sangat penting dalam mendukung kelancaran perhelatan PON XX Papua 2021.\r\n\r\n</p>\r\n\r\n<p>\r\n\t"Para peserta harus mendapatkan asupan yang tepat," Michael Rooney Gommar.\r\n\r\n</p>\r\n\r\n<p>\r\n\tSementara itu, kata Michael, pembangunan arena atletik di Kabupaten Mimika, Papua, sudah ada di tahapan akhir.\r\n\r\n</p>\r\n\r\n<p>\r\n\tPembangunan itu berkaitan dengan PON XX Papua 2021. Michael Rooney Gommar menjelaskan mengenai lokasi laga atletik. "Saat ini, sedang dilakukan rehabilitas atau pembangunan tempat warming up (pemanasan) cabang atletik," ucap Michael Rooney.\r\n\r\n</p>\r\n\r\n<p>\r\n\tKabupaten Mimika, salah satu penyelenggara PON XX Papua 2021 merampungkan pembangunan seluruh lokasi pertandingan olahraga (venue) hingga akhir Agustus 2021. "Akhir bulan ini sudah selesai untuk mencapai 100 persen," kata Michael. Michael menyampaikan informasi tersebut pada Diskusi Media Forum Merdeka Barat 9 (FMB9) bertajuk "Dukung Kontingenmu di PON XX Papua", Selasa kemarin.\r\n\r\n\r\n</p>\r\n<p>\r\n\tMichael menjelaskan mengenai lokasi laga atletik. "Saat ini, sedang dilakukan rehabilitas atau pembangunan tempat warming up (pemanasan) cabang atletik," ucap Michael Rooney. Ia menambahkan seluruh pembangunan akan selesai tepat waktu. Michael Rooney menerangkan Pemerintah Kabupaten Mimika juga sudah menyelesaikan pembangunan penginapan, wisma atlet, dan pengelolaan konsumsi menyambut PON XX Papua 2021.\r\n\r\n</p>\r\n\r\n<p>\r\n\t"Ada 16 penginapan yang sudah dibangun," ucap Michael menambahkan. Kabupaten Mimika akan menghelat 12 cabang olahraga PON XX Papua 2021. Sementara, PON XX Papua 2021 akan berlangsung mulai 2 Oktober 2021 sampai dengan 15 Oktober 2021.\r\n\r\n\r\n</p>	berita16.jpg	11	publish             	400	PON
29	2021-09-13 01:58:11	1	Sri Mulyani Klaim Ekonomi Tumbuh Berkat Kebijakan Pemerintah	<p>Jakarta, CNN Indonesia -- Menteri Keuangan Sri Mulyani mengklaim pertumbuhan ekonomi Indonesia yang bangkit ke kisaran 7,07 persen pada kuartal II 2021 terjadi berkat kebijakan pemerintah. Khususnya melalui berbagai stimulus fiskal seperti bantuan sosial (bansos). &quot;Saat kita hadapi tekanan luar biasa, pemerintah memberikan melalui kebijakan fiskal, bantuan sosial untuk meminimalkan dampak terhadap masyarakat, terutama kelompok masyarakat menengah ke bawah yang terpukul sangat dalam akibat pandemi,&quot; ungkap Ani, sapaan akrabnya, saat konferensi pers virtual, Kamis (5/8). Ani mengatakan pemerintah sengaja memberikan bansos kepada masyarakat agar jumlah masyarakat yang jatuh ke jurang kemiskinan tidak terlalu banyak, meski &quot;Dengan demikian bisa mempengaruhi dari sisi demand apabila pengangguran atau kemiskinan bisa diminimalkan atau ditahan kenaikannya,&quot; imbuhnya. Tak cuma berupa bansos, bendahara negara mengklaim kebijakan pemerintah lainnya yang juga mendongkrak pertumbuhan ekonomi adalah relaksasi pajak penjualan atas barang mewah (PPnBM) kepada sektor otomotif. Hal ini berdampak positif bagi industri manufaktur yang meningkat produksinya seiring naiknya permintaan kendaraan bermotor dari masyarakat. &quot;Jadi terlihat sekali kenaikan dari konsumsi maupun dari manufaktur, itu didukung salah satunya komoditas otomotif yang dapat bantuan PPnBM. Jadi terlihat policy pemerintah memberikan dampak nyata dan positif,&quot; tuturnya. Ani berharap pertumbuhan ekonomi yang sudah positif pada kuartal II bisa berlanjut ke kuartal III dengan peran pemulihan konsumsi dari masyarakat. Khususnya, masyarakat menengah atas sehingga bisa memperkuat pemulihan ekonomi Indonesia ke depan. Di sisi lain, ia memastikan APBN sebagai instrumen fiskal pemerintah akan terus digunakan untuk mendorong sisi permintaan dari masyarakat maupun penawaran dari dunia usaha. Hal ini dilakukan dengan memberikan tambahan bansos kepada masyarakat hingga insentif bagi dunia usaha</p>	Capture.JPG	5	publish             	0	asasdasd
26	2021-07-11 04:27:53	1	asd	<p>asd</p>	99deigns.com-wongkampung-dotcom.JPG	3	publish             	0	asdasd
\.


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 227
-- Name: mastercategory_category_id_seq; Type: SEQUENCE SET; Schema: master; Owner: postgres
--

SELECT pg_catalog.setval('master.mastercategory_category_id_seq', 18, true);


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 228
-- Name: mastermenu_menu_id_seq; Type: SEQUENCE SET; Schema: master; Owner: postgres
--

SELECT pg_catalog.setval('master.mastermenu_menu_id_seq', 32, true);


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 226
-- Name: masteruser_user_id_seq; Type: SEQUENCE SET; Schema: master; Owner: postgres
--

SELECT pg_catalog.setval('master.masteruser_user_id_seq', 17, true);


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 233
-- Name: album_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.album_album_id_seq', 6, true);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 234
-- Name: comentar_p_commentar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentar_p_commentar_id_seq', 1, true);


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 235
-- Name: comentar_p_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentar_p_posts_id_seq', 1, true);


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 230
-- Name: firtu_firtu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.firtu_firtu_id_seq', 11, true);


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 231
-- Name: firtu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.firtu_id_seq', 7, false);


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 232
-- Name: gallery_gallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gallery_gallery_id_seq', 8, true);


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 229
-- Name: posts_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_posts_id_seq', 29, true);


--
-- TOC entry 2864 (class 2606 OID 16852)
-- Name: mastercategory mastercategory_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.mastercategory
    ADD CONSTRAINT mastercategory_pkey PRIMARY KEY (category_id);


--
-- TOC entry 2866 (class 2606 OID 16868)
-- Name: mastermenu mastermenu_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.mastermenu
    ADD CONSTRAINT mastermenu_pkey PRIMARY KEY (menu_id);


--
-- TOC entry 2868 (class 2606 OID 16826)
-- Name: masteruser masteruser_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.masteruser
    ADD CONSTRAINT masteruser_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2870 (class 2606 OID 16804)
-- Name: setting_aplikasi setting_aplikasi_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.setting_aplikasi
    ADD CONSTRAINT setting_aplikasi_pkey PRIMARY KEY (setting_id);


--
-- TOC entry 2815 (class 2606 OID 16923)
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (album_id);


--
-- TOC entry 2829 (class 2606 OID 16583)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2834 (class 2606 OID 16520)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2837 (class 2606 OID 16473)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 16463)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 16506)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2826 (class 2606 OID 16455)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 16491)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 16535)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2839 (class 2606 OID 16481)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 16499)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 16549)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2842 (class 2606 OID 16577)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2874 (class 2606 OID 16958)
-- Name: comentar_p comentar_p_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentar_p
    ADD CONSTRAINT comentar_p_pkey PRIMARY KEY (commentar_id);


--
-- TOC entry 2857 (class 2606 OID 16563)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 16447)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2821 (class 2606 OID 16445)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 16437)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 16592)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2872 (class 2606 OID 16904)
-- Name: firtu firtu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firtu
    ADD CONSTRAINT firtu_pkey PRIMARY KEY (firtu_id);


--
-- TOC entry 2813 (class 2606 OID 16918)
-- Name: gallery gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT gallery_pkey PRIMARY KEY (gallery_id);


--
-- TOC entry 2811 (class 2606 OID 16885)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (posts_id);


--
-- TOC entry 2827 (class 1259 OID 16584)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2832 (class 1259 OID 16521)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2835 (class 1259 OID 16522)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2822 (class 1259 OID 16507)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2843 (class 1259 OID 16537)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2846 (class 1259 OID 16536)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2849 (class 1259 OID 16551)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2852 (class 1259 OID 16550)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2840 (class 1259 OID 16578)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2855 (class 1259 OID 16574)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2858 (class 1259 OID 16575)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2859 (class 1259 OID 16594)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2862 (class 1259 OID 16593)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2882 (class 2606 OID 16514)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2881 (class 2606 OID 16509)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2880 (class 2606 OID 16500)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2884 (class 2606 OID 16529)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2883 (class 2606 OID 16524)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2886 (class 2606 OID 16543)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2885 (class 2606 OID 16538)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2887 (class 2606 OID 16564)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2888 (class 2606 OID 16569)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2879 (class 2606 OID 16924)
-- Name: gallery gallery_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT gallery_fk FOREIGN KEY (album_id) REFERENCES public.album(album_id);


--
-- TOC entry 2878 (class 2606 OID 16827)
-- Name: gallery gallery_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT gallery_fk1 FOREIGN KEY (user_id) REFERENCES master.masteruser(user_id);


--
-- TOC entry 2876 (class 2606 OID 16853)
-- Name: posts posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_fk FOREIGN KEY (category_id) REFERENCES master.mastercategory(category_id);


--
-- TOC entry 2875 (class 2606 OID 16832)
-- Name: posts posts_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_fk1 FOREIGN KEY (user_id) REFERENCES master.masteruser(user_id);


--
-- TOC entry 2877 (class 2606 OID 16858)
-- Name: posts posts_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_fk2 FOREIGN KEY (category_id) REFERENCES master.mastercategory(category_id);


-- Completed on 2021-09-16 01:33:03

--
-- PostgreSQL database dump complete
--

