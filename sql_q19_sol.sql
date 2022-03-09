-- Write a SQL query to find the number of captains who were also goalkeepers.
SELECT COUNT(*)
FROM player_mast
WHERE posi_to_play = "GK"
AND player_id IN (
    SELECT player_captain
    FROM match_captain
);

/*
+----------+
| COUNT(*) |
+----------+
|        4 |
+----------+
*/