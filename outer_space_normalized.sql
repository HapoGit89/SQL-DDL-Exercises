

DROP DATABASE IF EXISTS outer_space_n;

CREATE DATABASE outer_space_n;

\c outer_space_n

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL
);


CREATE TABLE moons

(

  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL

);

CREATE TABLE planet_moons

(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets ON DELETE CASCADE,
  moon_id INTEGER REFERENCES moons ON DELETE CASCADE
);


INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way'),
  ('Mars', 1.88, 'The Sun', 'Milky Way'),
  ('Venus', 0.62, 'The Sun', 'Milky Way'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way');


  INSERT INTO moons
  (name)
  VALUES
  ('Phobos'),
  ('Deimos'),
  ('The Moon');

INSERT INTO planet_moons
(planet_id, moon_id)
VALUES
(1,3),
(2,1),
(2,2);

  