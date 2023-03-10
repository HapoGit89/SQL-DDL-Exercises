

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE users
(

id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
pref_loc TEXT NOT NULL

);




CREATE TABLE categories
(

id SERIAL PRIMARY KEY,
cat_name TEXT NOT NULL
);

CREATE TABLE regions 
(

id SERIAL PRIMARY KEY,
reg_name TEXT NOT NULL

);

CREATE TABLE posts
(

id SERIAL PRIMARY KEY,
title TEXT NOT NULL,
post_text TEXT NOT NULL,
region_id INTEGER REFERENCES regions ON DELETE CASCADE,
user_id INTEGER REFERENCES users ON DELETE CASCADE,
post_location TEXT NOT NULL
);


CREATE TABLE post_categories
(

id SERIAL PRIMARY KEY,
post_id INTEGER REFERENCES posts ON DELETE CASCADE,
category_id INTEGER REFERENCES categories ON DELETE CASCADE

);





INSERT INTO users
(first_name, last_name, pref_loc)
VALUES                                                                                                                                                                                                                    
('Jimi', 'Hendrix',  'New York'),
('Felix', 'JAehn', 'Berlin');


INSERT INTO regions
(reg_name)
VALUES                                                                                                                                                                                                                      
('Germany'),
('USA');

INSERT INTO categories
(cat_name)
VALUES                                                                                                                                                                                                                   
('GUITARS'),
('SYNTHS');


INSERT INTO posts
(title, post_text, region_id, user_id, post_location)        
VALUES                                                     
('Fender Guitar', 'WRAAAANG', 1, 1, 'BERLIN'),
('Synthesizer', 'wiuuuu', 2, 2, 'BOSTON');


INSERT INTO post_categories
(post_id, category_id)
VALUES                                                                                                                                                                                                                  
(1,1),
(2,2);




