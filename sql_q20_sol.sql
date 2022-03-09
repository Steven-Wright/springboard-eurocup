-- Write a SQL query to find the substitute players who came into the field in the first half of play, within a normal play schedule.
SELECT player_name
FROM player_in_out
JOIN player_mast USING (player_id)
WHERE in_out = 'I' AND play_schedule = 'NT' and play_half = 1;

/*
+------------------------+
| player_name            |
+------------------------+
| Erik Johansson         |
| Bastian Schweinsteiger |
| Ricardo Quaresma       |
+------------------------+
*/