-- Write a SQL query to find the number of matches that were won by a single point, but do not include matches decided by penalty shootout.
SELECT COUNT(*) 
FROM match_details AS m1 
JOIN match_details AS m2 ON 
    m1.match_no = m2.match_no AND m1.team_id != m2.team_id 
WHERE 
    m1.goal_score = m2.goal_score + 1 AND m1.decided_by = 'N';
/*
+----------+
| COUNT(*) |
+----------+
|       22 |
+----------+
*/
