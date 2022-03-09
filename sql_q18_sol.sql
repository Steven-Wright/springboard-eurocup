-- Write a SQL query to find the highest number of foul cards given in one match.
SELECT MAX(fouls)
FROM (
    SELECT count(*) AS fouls
    FROM player_booked
    GROUP BY match_no
) AS fouls_by_match;

/*
+------------+
| MAX(fouls) |
+------------+
|         10 |
+------------+
*/