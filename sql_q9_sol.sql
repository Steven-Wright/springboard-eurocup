-- Write a SQL query to find the goalkeeper’s name and jersey number, playing for Germany, who played in Germany’s group stage matches.

SELECT player_name, jersey_no
FROM player_mast
JOIN match_details ON player_mast.player_id = match_details.player_gk
JOIN soccer_country ON soccer_country.country_id = match_details.team_id
WHERE
  country_name = 'Germany' AND
  play_stage = 'G'
GROUP BY player_name, jersey_no; -- could have used limit 1...

/*
+--------------+-----------+
| player_name  | jersey_no |
+--------------+-----------+
| Manuel Neuer |         1 |
+--------------+-----------+
*/
