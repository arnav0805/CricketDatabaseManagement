show databases;
use cricket_world_cup_database;

/* 
This is Created by:
Shivansh Rajput (229310101)
Arnav Gupta (229310038) 
*/

CREATE TABLE TEAM(
 team_id VARCHAR(30) PRIMARY KEY,
 team_rank NUMERIC(3),
 team_name VARCHAR(20) NOT NULL,
 country_name VARCHAR(20),
 no_of_wins NUMERIC(3),
 no_of_loses NUMERIC(3),
 no_of_draws NUMERIC(3),
 no_of_bowlers NUMERIC(2),
 no_of_batsmans NUMERIC(2)
);
SELECT* FROM TEAM;
CREATE TABLE WICKET_KEEPER(
 team_id VARCHAR(30),
 wk_name VARCHAR(30)
);
alter table wicket_keeper add foreign key(team_id) references team(team_id); 
SELECT* FROM WICKET_KEEPER;

CREATE TABLE UMPIRE(
 umpire_id VARCHAR(30) PRIMARY KEY,
 umpire_name VARCHAR(30),
 no_of_matches NUMERIC(4),
 country VARCHAR(20)
);

CREATE TABLE PLAYER (
 player_id VARCHAR(30) PRIMARY KEY,
 team_id VARCHAR(30),
 no_of_matches NUMERIC(3),
 no_of_t20 NUMERIC(3),
 no_of_odi NUMERIC(3),
 no_of_test NUMERIC(3),
 no_of_wickets NUMERIC(2),
 type_of_bowler VARCHAR(30),
 economy NUMERIC(3,2)
);
alter table player add foreign key(team_id) references team(team_id); 
SELECT* FROM PLAYER;

CREATE TABLE MATCHES(
 match_id VARCHAR(20) PRIMARY KEY,
 match_date DATE,
 match_time TIME,
 team_1_name VARCHAR(30),
 team_2_name VARCHAR(30),
 loser VARCHAR(30),
 winner VARCHAR(30),
 stadium VARCHAR(30),
 umpire_id VARCHAR(30)
);
alter table matches add foreign key(umpire_id) references umpire(umpire_id); 
SELECT* FROM MATCHES;

CREATE TABLE COACH(
 coach_id VARCHAR(30) PRIMARY KEY,
 team_id VARCHAR(30),
 coach_name VARCHAR(30)
);
alter table coach add foreign key(team_id) references team(team_id);
SELECT* FROM COACH;

CREATE TABLE PLAYS(
 team_id VARCHAR(30),
 match_id VARCHAR(20)
);
alter table plays add foreign key(match_id) references matches(match_id);
alter table plays add foreign key(team_id) references team(team_id); 

CREATE TABLE CAPTAIN(
 captain_id VARCHAR(30) PRIMARY KEY,
 captain_name VARCHAR(30),
 team_id VARCHAR(30),
 player_id VARCHAR(30),
 year_of_captaincy DECIMAL(2),
 no_of_wins DECIMAL(4)
);
alter table captain add foreign key(team_id) references team(team_id);

CREATE TABLE UMPIRED_BY(
 match_id VARCHAR(30),
 umpire_id VARCHAR(30)
);
alter table umpired_by add foreign key(match_id) references matches(match_id);
alter table umpired_by add foreign key(umpire_id) references umpire(umpire_id); 



INSERT INTO TEAM VALUES('IND1221', 1, 'MEN IN BLUE','INDIA', 5, 1, 0, 6, 7);
INSERT INTO TEAM VALUES('AUS2174', 4, 'KANGAROO','AUSTRAILA', 3, 3, 0, 5, 6);
INSERT INTO TEAM VALUES('SA5412', 3, 'PROTEA','SOUTH AFRICA', 3, 2, 1, 8, 5);
INSERT INTO TEAM VALUES ('NZ5687', 2, 'BLACK CAPS','NEW ZEALAND', 4, 2, 0, 6,7);
INSERT INTO TEAM VALUES('BAN9852', 5, 'TIGERS','BANGLADESH', 2, 4 , 0, 7, 7);
SELECT * FROM TEAM;
UPDATE `cricket_world_cup_database`.`TEAM` SET `team_name` = 'YRAT' WHERE (`team_id` = 'IND1221');
UPDATE `cricket_world_cup_database`.`TEAM` SET `team_name` = 'African All-Stars' WHERE (`team_id` = 'SA5412');
SELECT * FROM TEAM;

INSERT INTO CAPTAIN VALUES('CAP11452', 'MS DHONI', 'IND1221','PLR44567',4,56);
INSERT INTO CAPTAIN VALUES('CAP21478', 'DALE STEYN', 'SA5412','PLR10235',7,74);
INSERT INTO CAPTAIN VALUES('CAP30214','MICHEAL CLARKE','AUS2174', 'PLR74138', 9,100);
INSERT INTO CAPTAIN VALUES('CAP14789','TAMIMIQBAL','BAN9852','PLR89562',2,20);
INSERT INTO CAPTAIN VALUES('CAP36957', 'ROSS TAYLOR', 'NZ5687','PLR957417',5,85);
SELECT * FROM CAPTAIN;


INSERT INTO COACH VALUES('CH417', 'IND1221', 'RAVI SHASTRI');
INSERT INTO COACH VALUES('CH140', 'AUS2174', 'JUSTIN LANGER');
INSERT INTO COACH VALUES('CH223', 'SA5412', 'OTTIS GIBSON');
INSERT INTO COACH VALUES('CH398', 'NZ5687', 'GARY STEAD');
INSERT INTO COACH VALUES('CH748', 'BAN9852', 'RUSSEL DOMINGO');
INSERT INTO COACH VALUES('CH596', 'IND1221', 'GARY KISTERN');
SELECT * FROM COACH;

INSERT INTO PLAYS VALUES('IND1221','MAT101');
INSERT INTO PLAYS VALUES('AUS2174','MAT201');
INSERT INTO PLAYS VALUES('BAN9852','MAT301');
INSERT INTO PLAYS VALUES('NZ5687','MAT401');
INSERT INTO PLAYS VALUES('IND1221','MAT501');

INSERT INTO PLAYER VALUES ('PLR17410', 'IND1221',13,74,120,20,1,'medium',3.2);
INSERT INTO PLAYER VALUES ('PLR74203', 'AUS2174',6,41,210,140 ,1,'slow',8.5);
INSERT INTO PLAYER VALUES ('PLR45987', 'SA5412', 4, 24,63,65,1,'mediumslow',11.2);
INSERT INTO PLAYER VALUES ('PLR20147', 'NZ5687',12,52 ,10,74,1,'legspin',18.3);
INSERT INTO PLAYER VALUES ('PLR65200', 'BAN9852',9,77, 30,2,1,'fast',17.3);
INSERT INTO PLAYER VALUES ('PLR75401', 'IND1221', 11,56, 23,5,7,'fast',17.3); 


INSERT INTO UMPIRE VALUES ('UMP41002', 'Kumar Dharmasena', 103, 'Sri Lanka');
INSERT INTO UMPIRE VALUES ('UMP74101', 'Aleem Dar', 207, 'Pakistan');
INSERT INTO UMPIRE VALUES ('Ump52410', 'Anil Chaudhary', 19, 'India');
INSERT INTO UMPIRE VALUES ('UMP85201', 'Ian Gould', 140, 'England');
INSERT INTO UMPIRE VALUES ('UMP55200', 'Tony Hill', 96, 'New Zealand'); 
SELECT * FROM UMPIRE;


INSERT INTO MATCHES VALUES ('MAT101','2023-11-1',
'15:30:00','India','Bangladesh','Bangladesh','India','Feroz Shah Kotla','UMP55200');
INSERT INTO MATCHES VALUES ('MAT201','2023-11-5'
,'09:30:00','England','Australia','England','Australia','Eden Gardens','UMP41002');
INSERT INTO MATCHES VALUES ('MAT301','2023-11-10','11:30:00','Sri
Lanka','Bangladesh','Bangladesh','Sri Lanka','M.A. Chidambaram','UMP74101');
INSERT INTO MATCHES VALUES ('MAT401','2023-11-15','15:30:00','New
Zealand','South Africa','South Africa','New Zealand','Sardar Patel','UMP85201');
INSERT INTO MATCHES VALUES('MAT501','2023-11-20'
,'08:30:00','England','India','England','India','Wankhede','Ump52410');
SELECT * FROM MATCHES;

INSERT INTO UMPIRED_BY VALUES('MAT501','UMP55200');
INSERT INTO UMPIRED_BY VALUES('MAT301','Ump52410');
INSERT INTO UMPIRED_BY VALUES('MAT101','UMP41002');
INSERT INTO UMPIRED_BY VALUES('MAT401','UMP74101');
INSERT INTO UMPIRED_BY VALUES('MAT201','Ump52410'); 


