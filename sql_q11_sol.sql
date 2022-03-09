-- Write a SQL query to find the players, their jersey number, and playing club who were the goalkeepers for England in EURO Cup 2016.

SELECT player_name, jersey_no, playing_club
FROM player_mast 
JOIN soccer_country ON soccer_country.country_id = player_mast.team_id 
WHERE country_name = 'England' and  posi_to_play = 'GK';

/*
Instructions said Liverpool F.C. but playing_club is Liverpool
+----------------+-----------+--------------+
| player_name    | jersey_no | playing_club |
+----------------+-----------+--------------+
| Fraser Forster |        13 | Southampton  |
| Joe Hart       |         1 | Man. City    |
| Tom Heaton     |        23 | Burnley      |
+----------------+-----------+--------------+
*/
