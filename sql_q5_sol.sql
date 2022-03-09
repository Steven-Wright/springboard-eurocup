-- Write a SQL query to find the number of bookings that happened in stoppage time.
SELECT COUNT(*) FROM player_booked WHERE play_schedule = 'ST';
/*
+----------+
| count(*) |
+----------+
|       10 |
+----------+
1 row in set (0.00 sec)
*/
