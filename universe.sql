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
    name character varying(30),
    galaxy_type character varying(30) NOT NULL,
    galaxy_info text,
    anzahl_star integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

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
    name character varying(30),
    moon_type character varying(30) NOT NULL,
    moon_info text,
    neigungswinkel numeric NOT NULL,
    dreht_sich boolean NOT NULL,
    planet_id integer
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
    name character varying(30),
    planet_type character varying(30) NOT NULL,
    planet_info text,
    anzahl_moon integer NOT NULL,
    anzahl_species integer NOT NULL,
    star_id integer,
    species_id integer
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
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(30),
    species_type character varying(30) NOT NULL,
    species_info text,
    kann_fliegen boolean NOT NULL
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    star_type character varying(30) NOT NULL,
    star_info text,
    anzahl_planet integer NOT NULL,
    galaxy_id integer
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
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'The Milky Way is the galaxy that contains our Solar System.', 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The Andromeda Galaxy is the nearest spiral galaxy to the Milky Way.', 250);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'The Triangulum Galaxy is a spiral galaxy approximately 3 million light-years from Earth.', 100);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'The Whirlpool Galaxy is an interacting grand-design spiral galaxy.', 150);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 'The Sombrero Galaxy is an unbarred spiral galaxy in the constellation Virgo.', 120);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 'Centaurus A is a galaxy in the constellation of Centaurus.', 80);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Terrestrial', 'Luna, commonly known as the Moon, is Earth''s only natural satellite.', 5.14, true, 3);
INSERT INTO public.moon VALUES (2, 'Europa', 'Ice-covered', 'Europa is the smallest of the four Galilean moons orbiting Jupiter.', 0.1, true, 5);
INSERT INTO public.moon VALUES (3, 'Ganymede', 'Ice-covered', 'Ganymede is the largest moon of Jupiter and in the Solar System.', 0.2, true, 5);
INSERT INTO public.moon VALUES (4, 'Titan', 'Thick atmosphere', 'Titan is the largest moon of Saturn and the second-largest natural satellite in the Solar System.', 0.33, true, 6);
INSERT INTO public.moon VALUES (5, 'Triton', 'Ice-covered', 'Triton is the largest natural satellite of the planet Neptune.', 156.8, true, 8);
INSERT INTO public.moon VALUES (6, 'Charon', 'Dwarf planet moon', 'Charon is the largest moon of the dwarf planet Pluto.', 0.04, true, 9);
INSERT INTO public.moon VALUES (7, 'Phobos', 'Deimos', 'Phobos is the innermost and larger of the two natural satellites of Mars.', 1.08, true, 4);
INSERT INTO public.moon VALUES (8, 'Deimos', 'Phobos', 'Deimos is the smaller and outer of Mars'' two moons.', 1.79, true, 4);
INSERT INTO public.moon VALUES (9, 'Callisto', 'Ice-covered', 'Callisto is the second-largest moon of Jupiter.', 0.19, true, 5);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Ice-covered', 'Enceladus is the sixth-largest moon of Saturn.', 0.02, true, 6);
INSERT INTO public.moon VALUES (11, 'Io', 'Volcanic', 'Io is the innermost of the four Galilean moons of Jupiter.', 0.04, true, 5);
INSERT INTO public.moon VALUES (12, 'Lapetus', 'Two-tone surface', 'Iapetus is the third-largest natural satellite of Saturn.', 0.24, true, 6);
INSERT INTO public.moon VALUES (13, 'Miranda', 'Ice-covered', 'Miranda is the smallest and innermost of Uranus'' five round satellites.', 4.34, true, 7);
INSERT INTO public.moon VALUES (14, 'Rhea', 'Ice-covered', 'Rhea is the second-largest moon of Saturn and the ninth-largest moon in the Solar System.', 0.35, true, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', 'Ice-covered', 'Tethys is a mid-sized moon of Saturn about 1,060 km across.', 1.12, true, 6);
INSERT INTO public.moon VALUES (16, 'Oberon', 'Ice-covered', 'Oberon is the outermost major moon of the planet Uranus.', 0.06, true, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 'Ice-covered', 'Titania is the largest of the moons of Uranus and the eighth largest moon in the Solar System.', 0.08, true, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'Ice-covered', 'Umbriel is a moon of Uranus discovered in 1851 by William Lassell.', 0.13, true, 7);
INSERT INTO public.moon VALUES (19, 'Nereid', 'Irregular', 'Nereid is the third-largest moon of Neptune.', 7.09, true, 8);
INSERT INTO public.moon VALUES (20, 'Proteus', 'Irregular', 'Proteus is the second-largest moon of Neptune.', 0.52, true, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 'Mercury is the smallest planet in the Solar System.', 0, 0, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 'Venus is the second planet from the Sun and the hottest planet in the Solar System.', 0, 0, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 'Earth is the third planet from the Sun and the only astronomical object known to harbor life.', 1, 1, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 'Mars is the fourth planet from the Sun and the second smallest planet in the Solar System.', 2, 0, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas giant', 'Jupiter is the largest planet in the Solar System.', 79, 3, 2, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant', 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System.', 82, 2, 2, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant', 'Uranus is the seventh planet from the Sun.', 27, 1, 3, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant', 'Neptune is the eighth and farthest-known Solar planet from the Sun.', 14, 1, 3, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet', 'Pluto is a dwarf planet in the Kuiper belt.', 5, 0, 4, NULL);
INSERT INTO public.planet VALUES (10, 'Proxima b', 'Exoplanet', 'Proxima b is an exoplanet orbiting within the habitable zone of the star Proxima Centauri.', 0, 0, 5, NULL);
INSERT INTO public.planet VALUES (11, 'Gliese 581 c', 'Exoplanet', 'Gliese 581 c is an extrasolar planet orbiting the red dwarf star Gliese 581.', 1, 0, 5, NULL);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Exoplanet', 'HD 209458 b is an exoplanet that orbits the solar analog HD 209458.', 0, 0, 6, NULL);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Hawk', 'Bird', 'Hawks are birds of prey known for their sharp vision and powerful talons.', true);
INSERT INTO public.species VALUES (2, 'Dolphin', 'Mammal', 'Dolphins are highly intelligent marine mammals known for their playful behavior and communication abilities.', false);
INSERT INTO public.species VALUES (3, 'Dragonfly', 'Insect', 'Dragonflies are insects with long bodies and two pairs of transparent wings.', true);
INSERT INTO public.species VALUES (4, 'Peregrine Falcon', 'Bird', 'Peregrine falcons are the fastest animals in the world, capable of reaching speeds over 240 mph while diving.', true);
INSERT INTO public.species VALUES (5, 'Chimpanzee', 'Mammal', 'Chimpanzees are intelligent primates known for their tool use and complex social behaviors.', false);
INSERT INTO public.species VALUES (6, 'Butterfly', 'Insect', 'Butterflies are insects with large, often brightly colored wings.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 'The Sun is the star at the center of the Solar System.', 8, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'A-type', 'Sirius is a binary star system and the brightest star in the night sky.', 3, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'G-type', 'Alpha Centauri A is the primary component of the Alpha Centauri binary star system.', 1, 6);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'K-type', 'Alpha Centauri B is the second brightest star in the Alpha Centauri system.', 0, 6);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'M-type', 'Proxima Centauri is a red dwarf star and the closest known star to the Sun.', 2, 6);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'Red supergiant', 'Betelgeuse is a red supergiant star in the constellation of Orion.', 0, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 6, true);


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
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


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
-- Name: planet planet_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.species(species_id);


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

