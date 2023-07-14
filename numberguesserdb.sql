-- Table: public.ROOMS

-- DROP TABLE IF EXISTS public."ROOMS";

--
-- TOC entry 215 (class 1259 OID 16426)
-- Name: ROOMS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ROOMS" (
    "ID" integer NOT NULL,
    "NAME" character varying(20) NOT NULL,
    "PLAYER_1" integer,
    "PLAYER_2" integer
	CONSTRAINT "ROOMS_pkey" PRIMARY KEY ("ID")
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


-- Table: public.GUESTS

-- DROP TABLE IF EXISTS public."GUESTS";
CREATE TABLE IF NOT EXISTS public."GUESTS"
(
    "ID_SESSION" uuid NOT NULL,
    "NICKNAME" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "GUESTS_pkey" PRIMARY KEY ("ID_SESSION")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."GUESTS"
    OWNER to postgres;






-- Table: public.GUESS_HISTORY

-- DROP TABLE IF EXISTS public."GUESS_HISTORY";

CREATE TABLE IF NOT EXISTS public."GUESS_HISTORY"
(
    "ID_GUESS_HISTORY" serial NOT NULL,
    "PLAYER" integer NOT NULL,
    "GUESS_NUMBER" bigint NOT NULL,
    "CORRECT_POSITIONS" integer NOT NULL DEFAULT 0,
    "WRONG_POSITIONS" integer NOT NULL DEFAULT 0,
    "ID_ROOM" bigint,
    CONSTRAINT "GUESS_HISTORY_pkey" PRIMARY KEY ("ID_GUESS_HISTORY"),
    CONSTRAINT "ID_ROOM" FOREIGN KEY ("ID_ROOM")
        REFERENCES public."ROOMS" ("ID_ROOM") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."GUESS_HISTORY"
    OWNER to postgres;