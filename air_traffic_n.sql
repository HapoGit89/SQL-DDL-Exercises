-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic_n;

CREATE DATABASE air_traffic_n;

\c air_traffic_n

CREATE TABLE tickets
( id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);


CREATE TABLE passengers
(id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
  );


CREATE TABLE passengers_tickets
(id SERIAL PRIMARY KEY,
passenger_id INTEGER REFERENCES passengers ON DELETE CASCADE,
ticket_id INTEGER REFERENCES tickets ON DELETE CASCADE
);

INSERT INTO tickets
  (seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
 
  ('9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  ('1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States');
  


INSERT INTO passengers
(first_name, last_name)
VALUES
('Berkie', 'Wycliff'),
('Alvin', 'Leathes');

INSERT INTO passengers_tickets
(passenger_id, ticket_id)
VALUES
(1, 1),
(1,3),
(2,2);
