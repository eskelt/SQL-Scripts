CREATE DATABASE numbers
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
	

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
	
	



-- Table: public.ROOMS

-- DROP TABLE IF EXISTS public."ROOMS";

CREATE TABLE IF NOT EXISTS public."ROOMS"
(
    "ID" integer NOT NULL,
    "NAME" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "ID_PLAYER_1" uuid,
    "ID_PLAYER_2" uuid,
    CONSTRAINT "ROOMS_pkey" PRIMARY KEY ("ID"),
	CONSTRAINT "ID_PLAYER_1" FOREIGN KEY ("ID_PLAYER_1")
        REFERENCES public."GUESTS" ("ID_SESSION") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
	CONSTRAINT "ID_PLAYER_2" FOREIGN KEY ("ID_PLAYER_2")
        REFERENCES public."GUESTS" ("ID_SESSION") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."ROOMS"
    OWNER to postgres;
	
	
-- SEQUENCE: public.ROOMS_ID_ROOM_seq

-- DROP SEQUENCE IF EXISTS public."ROOMS_ID_ROOM_seq";

CREATE SEQUENCE IF NOT EXISTS public."ROOMS_ID_ROOM_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY "ROOMS"."ID";

ALTER SEQUENCE public."ROOMS_ID_ROOM_seq"
    OWNER TO postgres;	


	
-- Column: public."ROOMS"."ID"

-- ALTER TABLE IF EXISTS public."ROOMS" DROP COLUMN IF EXISTS "ID";

ALTER TABLE IF EXISTS public."ROOMS"
    ALTER COLUMN "ID" SET DEFAULT nextval('"ROOMS_ID_ROOM_seq"'::regclass);
	
	
	
	
	
	
	


-- Table: public.GUESS_HISTORY

-- DROP TABLE IF EXISTS public."GUESS_HISTORY";

CREATE TABLE IF NOT EXISTS public."GUESS_HISTORY"
(
    "ID_GUESS_HISTORY" integer NOT NULL,
    "ID_PLAYER" uuid NOT NULL,
    "GUESS_NUMBER" bigint NOT NULL,
    "CORRECT_POSITIONS" integer NOT NULL DEFAULT 0,
    "WRONG_POSITIONS" integer NOT NULL DEFAULT 0,
    "ID_ROOM" bigint,
    CONSTRAINT "GUESS_HISTORY_pkey" PRIMARY KEY ("ID_GUESS_HISTORY"),
    CONSTRAINT "ID_ROOM" FOREIGN KEY ("ID_ROOM")
        REFERENCES public."ROOMS" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
	CONSTRAINT "ID_PLAYER" FOREIGN KEY ("ID_PLAYER")
        REFERENCES public."GUESTS" ("ID_SESSION") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."GUESS_HISTORY"
    OWNER to postgres;
	
	


-- SEQUENCE: public.GUESS_HISTORY_ID_GUESS_HISTORY_seq

-- DROP SEQUENCE IF EXISTS public."GUESS_HISTORY_ID_GUESS_HISTORY_seq";

CREATE SEQUENCE IF NOT EXISTS public."GUESS_HISTORY_ID_GUESS_HISTORY_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY "GUESS_HISTORY"."ID_GUESS_HISTORY";

ALTER SEQUENCE public."GUESS_HISTORY_ID_GUESS_HISTORY_seq"
    OWNER TO postgres;


	

-- Column: public."GUESS_HISTORY"."ID_GUESS_HISTORY"

-- ALTER TABLE IF EXISTS public."GUESS_HISTORY" DROP COLUMN IF EXISTS "ID_GUESS_HISTORY";

ALTER TABLE IF EXISTS public."GUESS_HISTORY"
    ALTER COLUMN "ID_GUESS_HISTORY" SET DEFAULT nextval('"GUESS_HISTORY_ID_GUESS_HISTORY_seq"'::regclass);