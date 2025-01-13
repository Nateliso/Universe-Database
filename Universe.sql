--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type text,
    num_of_stars bigint,
    distance_from_earth numeric(10,2),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: COLUMN galaxy.distance_from_earth; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.galaxy.distance_from_earth IS 'Distance from Earth in light-years';


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric(8,3),
    age_in_millions_of_years integer,
    is_colonized boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50),
    population bigint,
    has_life boolean,
    is_spherical boolean DEFAULT true
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planettype; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planettype (
    planettype_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.planettype OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planettype.planettype_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric(10,2),
    age_in_millions_of_years integer,
    is_visible boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planettype planettype_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planettype ALTER COLUMN planettype_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000000000, 0.00, 'The galaxy that contains our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 100000000000, 2.54, 'A neighboring galaxy on a collision course with the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 40000000, 3.00, 'A small spiral galaxy near Andromeda.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Barred Spiral', 100000000, 23.00, 'Famous for its well-defined spiral structure.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 80000000, 29.30, 'Known for its bright nucleus and large central bulge.');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 100000000000, 21.00, 'A face-on spiral galaxy with high star formation rates.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474.200, 4500, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.400, 4500, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.400, 4500, false);
INSERT INTO public.moon VALUES (4, 'Europa', 4, 3121.600, 4500, false);
INSERT INTO public.moon VALUES (5, 'Ganymede', 4, 5268.200, 4500, false);
INSERT INTO public.moon VALUES (6, 'Callisto', 4, 4820.600, 4500, false);
INSERT INTO public.moon VALUES (7, 'Io', 4, 3643.200, 4500, false);
INSERT INTO public.moon VALUES (8, 'Pandora', 5, 3000.000, 4500, false);
INSERT INTO public.moon VALUES (9, 'Titan', 5, 5149.500, 4500, false);
INSERT INTO public.moon VALUES (10, 'Triton', 6, 2707.000, 4500, false);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 1528.000, 4500, false);
INSERT INTO public.moon VALUES (12, 'Charon', 7, 1212.000, 4500, false);
INSERT INTO public.moon VALUES (13, 'Oberon', 8, 1523.400, 4500, false);
INSERT INTO public.moon VALUES (14, 'Umbriel', 8, 1190.800, 4500, false);
INSERT INTO public.moon VALUES (15, 'Ariel', 8, 1158.800, 4500, false);
INSERT INTO public.moon VALUES (16, 'Tethys', 9, 1062.000, 4500, false);
INSERT INTO public.moon VALUES (17, 'Dione', 9, 1122.000, 4500, false);
INSERT INTO public.moon VALUES (18, 'Enceladus', 9, 504.200, 4500, false);
INSERT INTO public.moon VALUES (19, 'Mimas', 10, 396.400, 4500, false);
INSERT INTO public.moon VALUES (20, 'Miranda', 11, 471.600, 4500, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 8000000000, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 0, false, true);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Terrestrial', 0, false, true);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 'Gas Giant', 0, false, true);
INSERT INTO public.planet VALUES (5, 'Kepler-22b', 2, 'Terrestrial', 0, false, true);
INSERT INTO public.planet VALUES (6, 'Kepler-452b', 2, 'Terrestrial', 0, false, true);
INSERT INTO public.planet VALUES (7, 'Gliese 581g', 3, 'Terrestrial', 0, false, true);
INSERT INTO public.planet VALUES (8, 'Pandora', 3, 'Terrestrial', 0, false, true);
INSERT INTO public.planet VALUES (9, 'Krypton', 4, 'Terrestrial', 1000000, true, true);
INSERT INTO public.planet VALUES (10, 'Gallifrey', 4, 'Terrestrial', 2000000, true, true);
INSERT INTO public.planet VALUES (11, 'Namek', 5, 'Terrestrial', 500000, true, true);
INSERT INTO public.planet VALUES (12, 'Dagobah', 6, 'Terrestrial', 0, false, true);


--
-- Data for Name: planettype; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planettype VALUES (1, 'Terrestrial', 'Planets with a rocky surface, similar to Earth.');
INSERT INTO public.planettype VALUES (2, 'Gas Giant', 'Massive planets made primarily of hydrogen and helium.');
INSERT INTO public.planettype VALUES (3, 'Ice Giant', 'Planets with a rocky core surrounded by icy materials.');
INSERT INTO public.planettype VALUES (4, 'Dwarf Planet', 'Celestial bodies that orbit the Sun but lack certain planetary characteristics.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.99, 4600, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 0.12, 4600, true);
INSERT INTO public.star VALUES (3, 'Sirius', 2, 2.02, 250, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3, 20.00, 8000, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 2.10, 450, true);
INSERT INTO public.star VALUES (6, 'Rigel', 4, 21.00, 8000, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planettype planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planettype
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planettype_id);


--
-- Name: planettype planet_types_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planettype
    ADD CONSTRAINT planet_types_type_name_key UNIQUE (name);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

