CREATE SEQUENCE IF NOT EXISTS public.'ROOMS_ID_ROOM_seq'
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY 'ROOMS'.'ID';

ALTER SEQUENCE public.'ROOMS_ID_ROOM_seq'
    OWNER TO postgres;





-- Table: public.ROOMS

-- DROP TABLE IF EXISTS public."ROOMS";

CREATE TABLE IF NOT EXISTS public."ROOMS"
(
    "ID" integer NOT NULL DEFAULT nextval('"ROOMS_ID_ROOM_seq"'::regclass),
    "NAME" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "PLAYER_1" integer,
    "PLAYER_2" integer,
    CONSTRAINT "ROOMS_pkey" PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."ROOMS"
    OWNER to postgres;





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