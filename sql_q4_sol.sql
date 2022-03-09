-- Write a SQL query to compute a list showing the number of substitutions that happened in various stages of play for the entire tournament.
SELECT play_stage, COUNT(*)
FROM match_mast
JOIN player_in_out USING (match_no)
WHERE in_out = 'I'
GROUP BY play_stage;

/*
+------------+----------+
| play_stage | COUNT(*) |
+------------+----------+
| G          |      208 |
| R          |       45 |
| Q          |       22 |
| S          |       12 |
| F          |        6 |
+------------+----------+
*/
