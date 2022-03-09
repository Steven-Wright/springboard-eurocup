-- Write a SQL query to find the date EURO Cup 2016 started on
SELECT MIN(play_date) FROM match_mast;
/*
mysql> SELECT MIN(play_date) FROM match_mast;
+----------------+
| MIN(play_date) |
+----------------+
| 2016-06-11     |
+----------------+
1 row in set (0.00 sec)
*/ 