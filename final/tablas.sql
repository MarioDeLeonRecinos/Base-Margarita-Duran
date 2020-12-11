--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2020-12-10 18:44:27

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
-- TOC entry 202 (class 1259 OID 44462)
-- Name: grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade (
    grade_id integer NOT NULL,
    grade_grade character varying(40) NOT NULL,
    "grade_instPercentage" numeric(3,2) NOT NULL,
    "grade_extPercentage" numeric(3,2) NOT NULL
);


ALTER TABLE public.grade OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 44465)
-- Name: grade_grade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grade_grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grade_grade_id_seq OWNER TO postgres;

--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 203
-- Name: grade_grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grade_grade_id_seq OWNED BY public.grade.grade_id;


--
-- TOC entry 204 (class 1259 OID 44467)
-- Name: modality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modality (
    modality_id integer NOT NULL,
    modality_type character varying(20) NOT NULL
);


ALTER TABLE public.modality OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 44470)
-- Name: modality_modality_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modality_modality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modality_modality_id_seq OWNER TO postgres;

--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 205
-- Name: modality_modality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modality_modality_id_seq OWNED BY public.modality.modality_id;


--
-- TOC entry 206 (class 1259 OID 44472)
-- Name: module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.module (
    module_id smallint NOT NULL,
    module_number numeric(4,0) NOT NULL
);


ALTER TABLE public.module OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 44475)
-- Name: module_module_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.module_module_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.module_module_id_seq OWNER TO postgres;

--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 207
-- Name: module_module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.module_module_id_seq OWNED BY public.module.module_id;


--
-- TOC entry 208 (class 1259 OID 44477)
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission (
    permission_id integer NOT NULL,
    permission_name character varying(50) NOT NULL
);


ALTER TABLE public.permission OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 44480)
-- Name: permission_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permission_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 209
-- Name: permission_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permission_permission_id_seq OWNED BY public.permission.permission_id;


--
-- TOC entry 210 (class 1259 OID 44482)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    person_id bigint NOT NULL,
    person_username character varying(30) NOT NULL,
    "person_firstName" character varying(40) NOT NULL,
    "person_lastName" character varying(40) NOT NULL,
    "person_phoneNumber" character varying(8),
    person_email character varying(60),
    "person_altPhoneNumber" character varying(8),
    person_status boolean DEFAULT true NOT NULL,
    sede_id integer
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 44486)
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_person_id_seq OWNER TO postgres;

--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 211
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_person_id_seq OWNED BY public.person.person_id;


--
-- TOC entry 212 (class 1259 OID 44488)
-- Name: qualification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qualification (
    qualification_id integer NOT NULL,
    qualification_note numeric(4,2) NOT NULL,
    qualification_approved boolean NOT NULL,
    "qualification_recoverLink" text NOT NULL,
    "qualification_recoverEnabled" boolean NOT NULL,
    "qualification_extTest" boolean NOT NULL,
    "qualification_updatedBy" text NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    module_id smallint,
    subject_student_id integer
);


ALTER TABLE public.qualification OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 44496)
-- Name: qualification_qualification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.qualification_qualification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qualification_qualification_id_seq OWNER TO postgres;

--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 213
-- Name: qualification_qualification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.qualification_qualification_id_seq OWNED BY public.qualification.qualification_id;


--
-- TOC entry 214 (class 1259 OID 44498)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    role_id integer NOT NULL,
    role_name character varying(20) NOT NULL,
    role_type character varying(20) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 44501)
-- Name: role_permissions_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permissions_permission (
    "roleRoleId" integer NOT NULL,
    "permissionPermissionId" integer NOT NULL
);


ALTER TABLE public.role_permissions_permission OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 44504)
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_role_id_seq OWNER TO postgres;

--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 216
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;


--
-- TOC entry 217 (class 1259 OID 44506)
-- Name: section; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.section (
    section_id integer NOT NULL,
    section_name character varying(20) NOT NULL
);


ALTER TABLE public.section OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 44509)
-- Name: section_section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.section_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.section_section_id_seq OWNER TO postgres;

--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 218
-- Name: section_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.section_section_id_seq OWNED BY public.section.section_id;


--
-- TOC entry 219 (class 1259 OID 44511)
-- Name: sede; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sede (
    sede_id integer NOT NULL,
    sede_name text NOT NULL,
    sede_logo text,
    sede_code text NOT NULL,
    sede_address text
);


ALTER TABLE public.sede OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 44517)
-- Name: sede_sede_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sede_sede_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sede_sede_id_seq OWNER TO postgres;

--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 220
-- Name: sede_sede_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sede_sede_id_seq OWNED BY public.sede.sede_id;


--
-- TOC entry 221 (class 1259 OID 44519)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    student_id integer NOT NULL,
    student_year smallint NOT NULL,
    student_report text NOT NULL,
    student_approved boolean NOT NULL,
    "student_finalAverage" numeric(4,2),
    "student_institutionalAverage" numeric(4,2),
    student_code character varying(15) NOT NULL,
    "student_firstTime" boolean DEFAULT true NOT NULL,
    person_id bigint,
    modality_id integer,
    section_id integer,
    grade_id integer
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 44526)
-- Name: student_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_student_id_seq OWNER TO postgres;

--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 222
-- Name: student_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_student_id_seq OWNED BY public.student.student_id;


--
-- TOC entry 223 (class 1259 OID 44528)
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    subject_id integer NOT NULL,
    subject_name character varying(30) NOT NULL,
    grade_id integer
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 44531)
-- Name: subject_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subject_subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_subject_id_seq OWNER TO postgres;

--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 224
-- Name: subject_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subject_subject_id_seq OWNED BY public.subject.subject_id;


--
-- TOC entry 225 (class 1259 OID 44533)
-- Name: subject_to_student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject_to_student (
    subject_student_id integer NOT NULL,
    student_code character varying(15) NOT NULL,
    student_id integer,
    "subject_id " integer
);


ALTER TABLE public.subject_to_student OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 44536)
-- Name: subject_to_student_subject_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subject_to_student_subject_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_to_student_subject_student_id_seq OWNER TO postgres;

--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 226
-- Name: subject_to_student_subject_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subject_to_student_subject_student_id_seq OWNED BY public.subject_to_student.subject_student_id;


--
-- TOC entry 227 (class 1259 OID 44538)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    user_password character varying(200) NOT NULL,
    person_id bigint,
    role_id integer,
    subject_id integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 44541)
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO postgres;

--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 228
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".user_id;


--
-- TOC entry 2766 (class 2604 OID 44543)
-- Name: grade grade_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade ALTER COLUMN grade_id SET DEFAULT nextval('public.grade_grade_id_seq'::regclass);


--
-- TOC entry 2767 (class 2604 OID 44544)
-- Name: modality modality_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modality ALTER COLUMN modality_id SET DEFAULT nextval('public.modality_modality_id_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 44545)
-- Name: module module_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.module ALTER COLUMN module_id SET DEFAULT nextval('public.module_module_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 44546)
-- Name: permission permission_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission ALTER COLUMN permission_id SET DEFAULT nextval('public.permission_permission_id_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 44547)
-- Name: person person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN person_id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- TOC entry 2774 (class 2604 OID 44548)
-- Name: qualification qualification_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qualification ALTER COLUMN qualification_id SET DEFAULT nextval('public.qualification_qualification_id_seq'::regclass);


--
-- TOC entry 2775 (class 2604 OID 44549)
-- Name: role role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN role_id SET DEFAULT nextval('public.role_role_id_seq'::regclass);


--
-- TOC entry 2776 (class 2604 OID 44550)
-- Name: section section_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section ALTER COLUMN section_id SET DEFAULT nextval('public.section_section_id_seq'::regclass);


--
-- TOC entry 2777 (class 2604 OID 44551)
-- Name: sede sede_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sede ALTER COLUMN sede_id SET DEFAULT nextval('public.sede_sede_id_seq'::regclass);


--
-- TOC entry 2779 (class 2604 OID 44552)
-- Name: student student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN student_id SET DEFAULT nextval('public.student_student_id_seq'::regclass);


--
-- TOC entry 2780 (class 2604 OID 44553)
-- Name: subject subject_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject ALTER COLUMN subject_id SET DEFAULT nextval('public.subject_subject_id_seq'::regclass);


--
-- TOC entry 2781 (class 2604 OID 44554)
-- Name: subject_to_student subject_student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject_to_student ALTER COLUMN subject_student_id SET DEFAULT nextval('public.subject_to_student_subject_student_id_seq'::regclass);


--
-- TOC entry 2782 (class 2604 OID 44555)
-- Name: user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- TOC entry 2796 (class 2606 OID 44557)
-- Name: qualification PK_1eb50cd787f180035ee73d703cf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qualification
    ADD CONSTRAINT "PK_1eb50cd787f180035ee73d703cf" PRIMARY KEY (qualification_id);


--
-- TOC entry 2814 (class 2606 OID 44559)
-- Name: subject_to_student PK_3f77e201570d449eb2d3f9d66cc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject_to_student
    ADD CONSTRAINT "PK_3f77e201570d449eb2d3f9d66cc" PRIMARY KEY (subject_student_id);


--
-- TOC entry 2792 (class 2606 OID 44561)
-- Name: person PK_403c951c5e9b776c16385a8940f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT "PK_403c951c5e9b776c16385a8940f" PRIMARY KEY (person_id);


--
-- TOC entry 2784 (class 2606 OID 44563)
-- Name: grade PK_4281d128f5f3f36539b83eb164a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT "PK_4281d128f5f3f36539b83eb164a" PRIMARY KEY (grade_id);


--
-- TOC entry 2804 (class 2606 OID 44565)
-- Name: section PK_64bb5bb8f6931759fee65510d8e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT "PK_64bb5bb8f6931759fee65510d8e" PRIMARY KEY (section_id);


--
-- TOC entry 2812 (class 2606 OID 44567)
-- Name: subject PK_70fbdd4144f3fc91373a93fe04a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT "PK_70fbdd4144f3fc91373a93fe04a" PRIMARY KEY (subject_id);


--
-- TOC entry 2816 (class 2606 OID 44569)
-- Name: user PK_758b8ce7c18b9d347461b30228d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_758b8ce7c18b9d347461b30228d" PRIMARY KEY (user_id);


--
-- TOC entry 2788 (class 2606 OID 44571)
-- Name: module PK_784b3d8dc3872808cbf8937b95a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.module
    ADD CONSTRAINT "PK_784b3d8dc3872808cbf8937b95a" PRIMARY KEY (module_id);


--
-- TOC entry 2790 (class 2606 OID 44573)
-- Name: permission PK_aaa6d61e22fb453965ae6157ce5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT "PK_aaa6d61e22fb453965ae6157ce5" PRIMARY KEY (permission_id);


--
-- TOC entry 2808 (class 2606 OID 44575)
-- Name: student PK_be3689991c2cc4b6f4cf39087fa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT "PK_be3689991c2cc4b6f4cf39087fa" PRIMARY KEY (student_id);


--
-- TOC entry 2786 (class 2606 OID 44577)
-- Name: modality PK_c6c2bb8aa23693605f3d531421b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modality
    ADD CONSTRAINT "PK_c6c2bb8aa23693605f3d531421b" PRIMARY KEY (modality_id);


--
-- TOC entry 2802 (class 2606 OID 44579)
-- Name: role_permissions_permission PK_dae0c8ab7202c311e458d6f6dfe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions_permission
    ADD CONSTRAINT "PK_dae0c8ab7202c311e458d6f6dfe" PRIMARY KEY ("roleRoleId", "permissionPermissionId");


--
-- TOC entry 2798 (class 2606 OID 44581)
-- Name: role PK_df46160e6aa79943b83c81e496e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "PK_df46160e6aa79943b83c81e496e" PRIMARY KEY (role_id);


--
-- TOC entry 2806 (class 2606 OID 44583)
-- Name: sede PK_f2440a3b691fb5600927eb9f4d5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sede
    ADD CONSTRAINT "PK_f2440a3b691fb5600927eb9f4d5" PRIMARY KEY (sede_id);


--
-- TOC entry 2818 (class 2606 OID 44585)
-- Name: user REL_a4cee7e601d219733b064431fb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "REL_a4cee7e601d219733b064431fb" UNIQUE (person_id);


--
-- TOC entry 2810 (class 2606 OID 44587)
-- Name: student REL_f68e92722db1a5e99b341a8cf9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT "REL_f68e92722db1a5e99b341a8cf9" UNIQUE (person_id);


--
-- TOC entry 2794 (class 2606 OID 44589)
-- Name: person UQ_95576b803e515b811c6dd9c9975; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT "UQ_95576b803e515b811c6dd9c9975" UNIQUE (person_username);


--
-- TOC entry 2799 (class 1259 OID 44590)
-- Name: IDX_841e12f32191ecf470a7a48279; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_841e12f32191ecf470a7a48279" ON public.role_permissions_permission USING btree ("permissionPermissionId");


--
-- TOC entry 2800 (class 1259 OID 44591)
-- Name: IDX_dc0d62be37f85731141d855bfd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_dc0d62be37f85731141d855bfd" ON public.role_permissions_permission USING btree ("roleRoleId");


--
-- TOC entry 2829 (class 2606 OID 44592)
-- Name: subject_to_student FK_084eedc7141796b4cdc75826aae; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject_to_student
    ADD CONSTRAINT "FK_084eedc7141796b4cdc75826aae" FOREIGN KEY (student_id) REFERENCES public.student(student_id);


--
-- TOC entry 2824 (class 2606 OID 44597)
-- Name: student FK_241487af7c8a29186b0d46c1223; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT "FK_241487af7c8a29186b0d46c1223" FOREIGN KEY (grade_id) REFERENCES public.grade(grade_id);


--
-- TOC entry 2828 (class 2606 OID 44602)
-- Name: subject FK_28d930d238627fc4b8eee121e0e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT "FK_28d930d238627fc4b8eee121e0e" FOREIGN KEY (grade_id) REFERENCES public.grade(grade_id);


--
-- TOC entry 2825 (class 2606 OID 44607)
-- Name: student FK_6375de2166bcb0a39596bf261de; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT "FK_6375de2166bcb0a39596bf261de" FOREIGN KEY (section_id) REFERENCES public.section(section_id);


--
-- TOC entry 2819 (class 2606 OID 44612)
-- Name: person FK_67d9de51508ed3b9912065582dc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT "FK_67d9de51508ed3b9912065582dc" FOREIGN KEY (sede_id) REFERENCES public.sede(sede_id);


--
-- TOC entry 2826 (class 2606 OID 44617)
-- Name: student FK_7777877d09dea2545e128ad3a8c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT "FK_7777877d09dea2545e128ad3a8c" FOREIGN KEY (modality_id) REFERENCES public.modality(modality_id);


--
-- TOC entry 2822 (class 2606 OID 44622)
-- Name: role_permissions_permission FK_841e12f32191ecf470a7a48279e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions_permission
    ADD CONSTRAINT "FK_841e12f32191ecf470a7a48279e" FOREIGN KEY ("permissionPermissionId") REFERENCES public.permission(permission_id) ON DELETE CASCADE;


--
-- TOC entry 2820 (class 2606 OID 44627)
-- Name: qualification FK_9a3aad84405e2455590b37e27c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qualification
    ADD CONSTRAINT "FK_9a3aad84405e2455590b37e27c7" FOREIGN KEY (module_id) REFERENCES public.module(module_id);


--
-- TOC entry 2831 (class 2606 OID 44632)
-- Name: user FK_9ef8e60021322f169ebf038f202; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "FK_9ef8e60021322f169ebf038f202" FOREIGN KEY (subject_id) REFERENCES public.subject(subject_id);


--
-- TOC entry 2832 (class 2606 OID 44637)
-- Name: user FK_a4cee7e601d219733b064431fba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "FK_a4cee7e601d219733b064431fba" FOREIGN KEY (person_id) REFERENCES public.person(person_id);


--
-- TOC entry 2830 (class 2606 OID 44642)
-- Name: subject_to_student FK_abe9f3ee18e03d8eaced412ff63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject_to_student
    ADD CONSTRAINT "FK_abe9f3ee18e03d8eaced412ff63" FOREIGN KEY ("subject_id ") REFERENCES public.subject(subject_id);


--
-- TOC entry 2823 (class 2606 OID 44647)
-- Name: role_permissions_permission FK_dc0d62be37f85731141d855bfd1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions_permission
    ADD CONSTRAINT "FK_dc0d62be37f85731141d855bfd1" FOREIGN KEY ("roleRoleId") REFERENCES public.role(role_id) ON DELETE CASCADE;


--
-- TOC entry 2821 (class 2606 OID 44652)
-- Name: qualification FK_ed5ce455307dfc33f6a120237b3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qualification
    ADD CONSTRAINT "FK_ed5ce455307dfc33f6a120237b3" FOREIGN KEY (subject_student_id) REFERENCES public.subject_to_student(subject_student_id);


--
-- TOC entry 2827 (class 2606 OID 44657)
-- Name: student FK_f68e92722db1a5e99b341a8cf9b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT "FK_f68e92722db1a5e99b341a8cf9b" FOREIGN KEY (person_id) REFERENCES public.person(person_id);


--
-- TOC entry 2833 (class 2606 OID 44662)
-- Name: user FK_fb2e442d14add3cefbdf33c4561; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "FK_fb2e442d14add3cefbdf33c4561" FOREIGN KEY (role_id) REFERENCES public.role(role_id);


-- Completed on 2020-12-10 18:44:27

--
-- PostgreSQL database dump complete
--

