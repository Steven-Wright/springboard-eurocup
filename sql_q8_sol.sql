-- Write a SQL query to find the match number for the game with the highest number of penalty shots, and which countries played that match

SELECT m1.match_no, c1.country_name AS winner, c2.country_name AS loser FROM match_details AS m1 JOIN match_details AS m2 ON m1.match_no = m2.match_no AND m1.team_id != m2.team_id JOIN soccer_country AS c1 ON m1.team_id = c1.country_id JOIN soccer_country AS c2 ON m2.team_id = c2.country_id WHERE m1.penalty_score = (SELECT MAX(penalty_score) FROM match_details);

/*
+----------+---------+-------+
| match_no | winner  | loser |
+----------+---------+-------+
|       47 | Germany | Italy |
+----------+---------+-------+
*/
