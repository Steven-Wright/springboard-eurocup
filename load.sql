DROP TABLE IF EXISTS `asst_referee_mast`;
DROP TABLE IF EXISTS `coach_mast`;
DROP TABLE IF EXISTS `goal_details`;
DROP TABLE IF EXISTS `match_captain`;
DROP TABLE IF EXISTS `match_details`;
DROP TABLE IF EXISTS `match_mast`;
DROP TABLE IF EXISTS `penalty_gk`;
DROP TABLE IF EXISTS `penalty_shootout`;
DROP TABLE IF EXISTS `player_booked`;
DROP TABLE IF EXISTS `player_in_out`;
DROP TABLE IF EXISTS `player_mast`;
DROP TABLE IF EXISTS `playing_position`;
DROP TABLE IF EXISTS `referee_mast`;
DROP TABLE IF EXISTS `soccer_city`;
DROP TABLE IF EXISTS `soccer_country`;
DROP TABLE IF EXISTS `soccer_team`;
DROP TABLE IF EXISTS `soccer_venue`;
DROP TABLE IF EXISTS `team_coaches`;

CREATE TABLE soccer_country (
    country_id NUMERIC,
    country_abbr VARCHAR(4),
    country_name VARCHAR(40),
    PRIMARY KEY (country_id)
);

LOAD DATA LOCAL INFILE 'soccer_country.csv'
INTO TABLE soccer_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE soccer_team (
    team_id NUMERIC,
    team_group CHARACTER(1),
    match_played NUMERIC,
    won NUMERIC,
    draw NUMERIC,
    lost NUMERIC,
    goal_for NUMERIC,
    goal_agnst NUMERIC,
    goal_diff NUMERIC,
    points NUMERIC,
    group_poision NUMERIC
);

LOAD DATA LOCAL INFILE 'soccer_team.csv'
INTO TABLE soccer_team
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


CREATE TABLE soccer_city (
    city_id NUMERIC,
    city VARCHAR(25),
    country_id NUMERIC,
    PRIMARY KEY (city_id)
);

LOAD DATA LOCAL INFILE 'soccer_city.csv'
INTO TABLE soccer_city
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE soccer_venue (
    venue_id NUMERIC,
    venue_name VARCHAR(30),
    city_id NUMERIC,
    aud_capacity NUMERIC,
    PRIMARY KEY (venue_id)
);

LOAD DATA LOCAL INFILE 'soccer_venue.csv'
INTO TABLE soccer_venue
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE referee_mast (
    referee_id NUMERIC,
    referee_name VARCHAR(40),
    country_id NUMERIC,
    PRIMARY KEY (referee_id)
);

LOAD DATA LOCAL INFILE 'referee_mast.csv'
INTO TABLE referee_mast
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE coach_mast (
    coach_id NUMERIC,
    coach_name VARCHAR(40),
    PRIMARY KEY (coach_id)
);

LOAD DATA LOCAL INFILE 'coach_mast.csv'
INTO TABLE coach_mast
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE team_coaches (
    team_id NUMERIC,
    coach_id NUMERIC
);

LOAD DATA LOCAL INFILE 'team_coaches.csv'
INTO TABLE team_coaches
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE playing_position (
    position_id VARCHAR(2),
    position_desc VARCHAR(15),
    PRIMARY KEY (position_id)
);

LOAD DATA LOCAL INFILE 'playing_position.csv'
INTO TABLE playing_position
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE player_mast (
    player_id NUMERIC,
    team_id NUMERIC,
    jersey_no NUMERIC,
    player_name VARCHAR(40),
    posi_to_play CHARACTER(2),
    dt_of_bir DATE,
    age NUMERIC,
    playing_club VARCHAR(40),
    PRIMARY KEY (player_id)
);

LOAD DATA LOCAL INFILE 'player_mast.csv'
INTO TABLE player_mast
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE match_mast (
    match_no NUMERIC,
    play_stage CHARACTER(1),
    play_date DATE,
    results CHARACTER(5),
    decided_by CHARACTER(1),
    goal_score CHARACTER(5),
    venue_id NUMERIC,
    referee_id NUMERIC,
    audence NUMERIC,
    plr_of_match NUMERIC,
    stop1_sec NUMERIC,
    stop2_sec NUMERIC,
    PRIMARY KEY (match_no)
);

LOAD DATA LOCAL INFILE 'match_mast.csv'
INTO TABLE match_mast
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE player_booked (
    match_no NUMERIC,
    team_id NUMERIC,
    player_id NUMERIC,
    booking_time VARCHAR(40),
    sent_off CHARACTER(1),
    play_schedule CHARACTER(2),
    play_half NUMERIC
);

LOAD DATA LOCAL INFILE 'player_booked.csv'
INTO TABLE player_booked
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE player_in_out (
    match_no NUMERIC,
    team_id NUMERIC,
    player_id NUMERIC,
    in_out CHARACTER(1),
    TIME_IN_OUT NUMERIC,
    play_schedule CHARACTER(2),
    play_half NUMERIC
);

LOAD DATA LOCAL INFILE 'player_in_out.csv'
INTO TABLE player_in_out
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE asst_referee_mast (
    ass_ref_id NUMERIC,
    ass_ref_name VARCHAR(40),
    country_id NUMERIC
);

LOAD DATA LOCAL INFILE 'asst_referee_mast.csv'
INTO TABLE asst_referee_mast
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE match_details (
    match_no NUMERIC,
    play_stage VARCHAR(1),
    team_id NUMERIC,
    win_loos VARCHAR(1),
    decided_by VARCHAR(1),
    goal_score NUMERIC,
    penalty_score NUMERIC,
    ass_ref NUMERIC,
    player_gk NUMERIC
);

LOAD DATA LOCAL INFILE 'match_details.csv'
INTO TABLE match_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


CREATE TABLE goal_details (
    goal_id NUMERIC,
    match_no NUMERIC,
    player_id NUMERIC,
    team_id NUMERIC,
    goal_time NUMERIC,
    goal_type CHARACTER(1),
    play_stage CHARACTER(1),
    goal_schedule CHARACTER(2),
    goal_half NUMERIC,
    PRIMARY KEY (goal_id)
);

LOAD DATA LOCAL INFILE 'goal_details.csv'
INTO TABLE goal_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE penalty_shootout (
    kick_id NUMERIC,
    match_no NUMERIC,
    team_id NUMERIC,
    player_id NUMERIC,
    score_goal VARCHAR(1),
    kick_no NUMERIC,
    PRIMARY KEY (kick_id)
);

LOAD DATA LOCAL INFILE 'penalty_shootout.csv'
INTO TABLE penalty_shootout
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE match_captain (
    match_no NUMERIC,
    team_id NUMERIC,
    player_captain NUMERIC
);

LOAD DATA LOCAL INFILE 'match_captain.csv'
INTO TABLE match_captain
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE penalty_gk (
    match_no NUMERIC,
    team_id NUMERIC,
    player_gk NUMERIC
);

LOAD DATA LOCAL INFILE 'penalty_gk.csv'
INTO TABLE penalty_gk
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

WITH fix as (
    SELECT
        d1.match_no,
        CASE
            WHEN CAST(LEFT(m.goal_score, 2) AS UNSIGNED) = d1.goal_score THEN
                CONCAT(d1.goal_score, '-', d2.goal_score)
            ELSE
                CONCAT(d2.goal_score, '-', d1.goal_score)
        END AS goal_score
    FROM match_details AS d1
    JOIN match_details AS d2
        ON d1.match_no = d2.match_no AND d1.team_id < d2.team_id
    JOIN match_mast AS m
        ON d1.match_no = m.match_no
    WHERE m.goal_score LIKE '%Ja' OR m.goal_score LIKE '%Fe' OR m.goal_score LIKE '%Ma')

UPDATE match_mast AS m
INNER JOIN fix on m.match_no = fix.match_no
SET m.goal_score = fix.goal_score;
