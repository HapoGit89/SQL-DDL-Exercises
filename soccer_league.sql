

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(

id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
location TEXT NOT NULL,
rank INTEGER NOT NULL

);




CREATE TABLE players
(

id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
position TEXT
);

CREATE TABLE referees
(

id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL

);



CREATE TABLE matches
(

id SERIAL PRIMARY KEY,
team1_id INTEGER REFERENCES teams ON DELETE CASCADE,
team2_id INTEGER REFERENCES teams ON DELETE CASCADE,
referee_id INTEGER REFERENCES referees ON DELETE CASCADE,
match_location TEXT NOT NULL

);


CREATE TABLE goals
(

id SERIAL PRIMARY KEY,
match_id INTEGER REFERENCES matches ON DELETE CASCADE,
player_id INTEGER REFERENCES players ON DELETE CASCADE

);


CREATE TABLE teams_players
(

id SERIAL PRIMARY KEY,
team_id INTEGER REFERENCES teams ON DELETE CASCADE,
player_id INTEGER REFERENCES players ON DELETE CASCADE

);


CREATE TABLE seasons
(

id SERIAL PRIMARY KEY,
season_start DATE NOT NULL,
season_end DATE NOT NULL

);





INSERT INTO teams
(name, location, rank)
VALUES                                                                                                                                                                                                                    
('FCB', 'Munich', 1),
('Hertha BSC', 'Berlin', 5);


INSERT INTO players
(first_name, last_name, position)
VALUES                                                                                                                                                                                                                      
('Thomas', 'Mueller', 'Offensive'),
('Bernd', 'Catta', 'Defensive');

INSERT INTO referees
(first_name, last_name)
VALUES                                                                                                                                                                                                                   
('Giacomo', 'Bertollini');


INSERT INTO matches
(team1_id, team2_id, referee_id, match_location)        
VALUES                                                     
(1,2,1, 'Berlin'),
(2,1,1, 'Frankfurt');


INSERT INTO goals
(match_id, player_id)
VALUES                                                                                                                                                                                                                  
(1,1),
(2,1);

INSERT INTO teams_players
(team_id, player_id)
VALUES                                                                                                                                                                                                                  
(1,1),
(2,2);





