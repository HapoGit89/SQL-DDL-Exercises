-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music_n;

CREATE DATABASE music_n;

\c music_n

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);



CREATE TABLE artists
( 
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
  );

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE albums
(
id SERIAL PRIMARY KEY,
album_name TEXT NOT NULL

);


CREATE TABLE artist_albums
(
id SERIAL PRIMARY KEY,
artist_id INTEGER REFERENCES artists ON DELETE CASCADE,
album_id INTEGER REFERENCES albums  ON DELETE CASCADE

);

CREATE TABLE producers_albums
(
id SERIAL PRIMARY KEY,
producer_id INTEGER REFERENCES producers ON DELETE CASCADE,
album_id INTEGER REFERENCES albums  ON DELETE CASCADE

);


CREATE TABLE songs_albums
(
id SERIAL PRIMARY KEY,
song_id INTEGER REFERENCES songs ON DELETE CASCADE,
album_id INTEGER REFERENCES albums  ON DELETE CASCADE

);





-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),


INSERT INTO songs
  (title, duration_in_seconds, release_date)
VALUES
  ('Dark Horse', 215, '12-17-2013');


INSERT INTO artists
(artist_name)
VALUES
('Katy Perry'),
('Juicy J');

INSERT INTO producers
(producer_name)
VALUES
('Max Martin'),
('Circkut');

INSERT INTO albums
(album_name)
VALUES
('PRISM');

INSERT INTO artist_albums
(artist_id, album_id)
VALUES
(1,1),
(2,1);


INSERT INTO producers_albums
(producer_id, album_id)
VALUES
(1,1),
(2,1);

INSERT INTO songs_albums
(song_id, album_id)
VALUES
(1,1);






SELECT title, artist_name, producer_name, album_name FROM songs s JOIN songs_albums sa ON sa.song_id = s.id JOIN albums a ON a.id = sa.album_id JOIN artist_albums aa ON aa.album_id = a.id JOIN artists at ON at.id = aa.artist_id JOIN producers_albums pa ON pa.album_id = a.id JOIN producers p ON p.id = pa.producer_id;