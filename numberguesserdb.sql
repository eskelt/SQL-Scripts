--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-23 01:52:48

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
-- TOC entry 217 (class 1259 OID 16433)
-- Name: GUESS_HISTORY; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GUESS_HISTORY" (
    "ID_GUESS_HISTORY" integer NOT NULL,
    "PLAYER" integer NOT NULL,
    "GUESS_NUMBER" bigint NOT NULL,
    "CORRECT_POSITIONS" integer DEFAULT 0 NOT NULL,
    "WRONG_POSITIONS" integer DEFAULT 0 NOT NULL,
    "ID_ROOM" bigint
);


ALTER TABLE public."GUESS_HISTORY" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16432)
-- Name: GUESS_HISTORY_ID_GUESS_HISTORY_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."GUESS_HISTORY_ID_GUESS_HISTORY_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GUESS_HISTORY_ID_GUESS_HISTORY_seq" OWNER TO postgres;

--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 216
-- Name: GUESS_HISTORY_ID_GUESS_HISTORY_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."GUESS_HISTORY_ID_GUESS_HISTORY_seq" OWNED BY public."GUESS_HISTORY"."ID_GUESS_HISTORY";


--
-- TOC entry 220 (class 1259 OID 16469)
-- Name: GUESTS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GUESTS" (
    "ID_SESSION" uuid NOT NULL,
    "NICKNAME" character varying(20) NOT NULL
);


ALTER TABLE public."GUESTS" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16426)
-- Name: ROOMS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ROOMS" (
    "ID" integer NOT NULL,
    "NAME" character varying(20) NOT NULL,
    "PLAYER_1" integer,
    "PLAYER_2" integer
);


ALTER TABLE public."ROOMS" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16425)
-- Name: ROOMS_ID_ROOM_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ROOMS_ID_ROOM_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ROOMS_ID_ROOM_seq" OWNER TO postgres;

--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 214
-- Name: ROOMS_ID_ROOM_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ROOMS_ID_ROOM_seq" OWNED BY public."ROOMS"."ID";


--
-- TOC entry 218 (class 1259 OID 16446)
-- Name: spring_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spring_session (
    primary_id character(36) NOT NULL,
    session_id character(36) NOT NULL,
    creation_time bigint NOT NULL,
    last_access_time bigint NOT NULL,
    max_inactive_interval integer NOT NULL,
    expiry_time bigint NOT NULL,
    principal_name character varying(100)
);


ALTER TABLE public.spring_session OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16454)
-- Name: spring_session_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spring_session_attributes (
    session_primary_id character(36) NOT NULL,
    attribute_name character varying(200) NOT NULL,
    attribute_bytes bytea NOT NULL
);


ALTER TABLE public.spring_session_attributes OWNER TO postgres;

--
-- TOC entry 3191 (class 2604 OID 16436)
-- Name: GUESS_HISTORY ID_GUESS_HISTORY; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GUESS_HISTORY" ALTER COLUMN "ID_GUESS_HISTORY" SET DEFAULT nextval('public."GUESS_HISTORY_ID_GUESS_HISTORY_seq"'::regclass);


--
-- TOC entry 3190 (class 2604 OID 16429)
-- Name: ROOMS ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ROOMS" ALTER COLUMN "ID" SET DEFAULT nextval('public."ROOMS_ID_ROOM_seq"'::regclass);


--
-- TOC entry 3197 (class 2606 OID 16440)
-- Name: GUESS_HISTORY GUESS_HISTORY_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GUESS_HISTORY"
    ADD CONSTRAINT "GUESS_HISTORY_pkey" PRIMARY KEY ("ID_GUESS_HISTORY");


--
-- TOC entry 3206 (class 2606 OID 16473)
-- Name: GUESTS GUESTS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GUESTS"
    ADD CONSTRAINT "GUESTS_pkey" PRIMARY KEY ("ID_SESSION");


--
-- TOC entry 3195 (class 2606 OID 16431)
-- Name: ROOMS ROOMS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ROOMS"
    ADD CONSTRAINT "ROOMS_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3204 (class 2606 OID 16460)
-- Name: spring_session_attributes spring_session_attributes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_pk PRIMARY KEY (session_primary_id, attribute_name);


--
-- TOC entry 3202 (class 2606 OID 16450)
-- Name: spring_session spring_session_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spring_session
    ADD CONSTRAINT spring_session_pk PRIMARY KEY (primary_id);


--
-- TOC entry 3198 (class 1259 OID 16451)
-- Name: spring_session_ix1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX spring_session_ix1 ON public.spring_session USING btree (session_id);


--
-- TOC entry 3199 (class 1259 OID 16452)
-- Name: spring_session_ix2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX spring_session_ix2 ON public.spring_session USING btree (expiry_time);


--
-- TOC entry 3200 (class 1259 OID 16453)
-- Name: spring_session_ix3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX spring_session_ix3 ON public.spring_session USING btree (principal_name);


--
-- TOC entry 3207 (class 2606 OID 16441)
-- Name: GUESS_HISTORY ID_ROOM; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GUESS_HISTORY"
    ADD CONSTRAINT "ID_ROOM" FOREIGN KEY ("ID_ROOM") REFERENCES public."ROOMS"("ID");


--
-- TOC entry 3208 (class 2606 OID 16461)
-- Name: spring_session_attributes spring_session_attributes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_fk FOREIGN KEY (session_primary_id) REFERENCES public.spring_session(primary_id) ON DELETE CASCADE;


-- Completed on 2023-05-23 01:52:48

--
-- PostgreSQL database dump complete
--

