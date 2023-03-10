

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors 
(

id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
born DATE,
expertise TEXT

);


CREATE TABLE patients(

id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
born DATE
);


CREATE TABLE diseases(

id SERIAL PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE medical_centers (

id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
location TEXT NOT NULL


);


CREATE TABLE employment(

id SERIAL PRIMARY KEY,
doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
medical_center_id INTEGER REFERENCES medical_centers ON DELETE CASCADE

);

CREATE TABLE diagnoses(

id SERIAL PRIMARY KEY,
patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
disease_id INTEGER REFERENCES diseases ON DELETE CASCADE

);

CREATE TABLE visits(

id SERIAL PRIMARY KEY,
patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE

);




INSERT INTO diagnoses
(patient_id, disease_id)                                                                                                                                                           VALUES                                                              
(1, 1),
(1,2),
(3, 2);
